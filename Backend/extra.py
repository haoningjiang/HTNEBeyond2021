def get_bechdel_api_url(id : str)->str:
    '''Creates the full api url to call the Bechdel Test API for a specific movie given an imbd id'''
    base_url = "http://bechdeltest.com/api/v1/getMovieByImdbId?"
    search_parameters = [
        ('imbid', id)
    ]
    return base_url + urllib.parse.urlencode(search_parameters)
def get_rating(api_url: str)->int:
    '''Returns the Bechdel Tests' Rating for a given api_url that is corresponding to a movie'''
    url_feedback = None
    try:
        url_feedback = urllib.request.urlopen(api_url)
        json_file = url_feedback.read().decode(encoding = 'utf-8')
        return json.loads(json_file)['rating']
    finally:
        if url_feedback != None:
            url_feedback.close()