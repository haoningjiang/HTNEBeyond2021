def import_all_movies():
    '''Returns the Bechdel Tests' API's Movies' data'''
    api_url = "http://bechdeltest.com/api/v1/getAllMovies?"
    url_feedback = None
    try:
        url_feedback = urllib.request.urlopen(api_url)
        json_file = url_feedback.read().decode(encoding = 'utf-8')
        return json.loads(json_file)
    finally:
        if url_feedback != None:
            url_feedback.close()

def write_all_movies():
    '''Writes the movies's imbid and Bechdel Rating into a csv_file'''
    with open('all_movies.csv', mode = 'w') as csv_file:
        fieldnames = ['imdb_id', 'rating']
        writer = csv.DictWriter(csv_file, fieldnames=fieldnames)
        writer.writeheader()
        all_movies = import_all_movies()
        for movie in all_movies:
            imdb_id = movie["imdbid"] 
            rating = movie["rating"]
            writer.writerow({'imdb_id': imdb_id, 'rating': rating})