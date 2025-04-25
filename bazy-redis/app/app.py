import redis

r = redis.Redis(host='localhost', port=6379)

def recommend(user_id):
    preferred_genres = r.smembers(f"user:{user_id}:genres")
    rated = r.hkeys(f"user:{user_id}:ratings")

    recommendations = []

    for movie_key in r.zrevrange("top_movies", 0, -1):
        if movie_key in rated:
            continue

        genre = r.hget(movie_key, "genre")
        if genre in preferred_genres:
            recommendations.append(movie_key.decode())

        if len(recommendations) >= 5:
            break

    return recommendations

if __name__ == "__main__":
    user = 1
    print(f"Rekomendacje dla user:{user}:")
    for movie in recommend(user):
        title = r.hget(movie, "title").decode()
        print(f"- {title}")
