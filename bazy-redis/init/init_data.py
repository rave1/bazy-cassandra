import redis
import random

r = redis.Redis(host='localhost', port=6379)

users = [f"user:{i}" for i in range(1, 11)]
movies = [f"movie:{i}" for i in range(1, 51)]

for user in users:
    r.delete(f"{user}:history")
    for _ in range(5):
        r.lpush(f"{user}:history", random.choice(movies))

genres = ["Action", "Comedy", "Drama", "Sci-Fi", "Horror"]
for user in users:
    r.delete(f"{user}:genres")
    for _ in range(3):
        r.sadd(f"{user}:genres", random.choice(genres))

# Zbiory posortowane
for movie in movies:
    r.zadd("top_movies", {movie: random.uniform(1, 10)})

# Hash
for movie in movies:
    r.hset(movie, mapping={
        "title": f"Movie {movie.split(':')[1]}",
        "genre": random.choice(genres),
        "year": str(random.randint(1990, 2023))
    })

for user in users:
    for movie in random.sample(movies, 10):
        r.hset(f"{user}:ratings", movie, random.randint(1, 5))

print("Dane zostały zainicjalizowane.")
