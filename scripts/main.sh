#!/usr/bin/env bash

echo "creating python venv"
python3 -m venv env
source ./env/bin/activate
echo "installing libs"
pip install pygments



echo "adding filmoteka"
add_data=$(docker compose exec cassandra-1 /scripts/add_data.sh)

echo "adding kina"
add_cinema=$(docker compose exec cassandra-1 /scripts/add_cinema.sh)
echo "kina select"
select_cinema=$(docker compose exec cassandra-1 /scripts/select_cinema.sh)
echo "desc cinema before downing cluster node"
desc_cinema=$(docker compose exec cassandra-1 /scripts/desc_cinema.sh | grep replication_factor)

docker compose kill cassandra-2
echo "desc cinema after downing cluster node"
desc_cinema_down=$(docker compose exec cassandra-1 /scripts/desc_cinema.sh | grep replication_factor)
docker compose up -d

echo "creating pictures..."


high_add_data=$(echo "$add_data" | pygmentize -P style=default -l mysql -f html)
high_add_cinema=$(echo "$add_cinema" | pygmentize -P style=default -l mysql -f html)
high_select_cinema=$(echo "$select_cinema" | pygmentize -P style=default -l mysql -f html)
high_desc_cinema=$(echo "$desc_cinema" | pygmentize -P style=default -l mysql -f html)
high_desc_cinema_down=$(echo "$desc_cinema_down" | pygmentize -P style=default -l mysql -f html)
echo "$high_add_data" > add_data.html
echo "$high_select_cinema" > select_cinema.html
echo "$high_desc_cinema" > "desc_cinema.html"
echo "$high_desc_cinema_down" > "desc_down_cinema.html"

for file in ./*.html;
do
    echo "Processing $file file..."
    wkhtmltoimage $file $file.png
done

