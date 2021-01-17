
import urllib.parse
import urllib.request
import json
import csv
''' Created by Linda Fan and Haoning Jiang'''
'''
To-Do: 

each row represents a film
1. column 1: # named male characters in film
2. column 2: # named female characters in film
3. column 3: year movie came out
4. column 4: movie's box office amt
5. column 3: whether film passes bechdel test or not (1 = pass, 0 = no pass)

'''

'''
key: script id 
value: 
    0. # male characters
    1. # female characters
    2. imdb id
    3. year
    4. money
    5. rating
'''
def get_imbdid()->[dict]:
    with open('meta_data7.csv', mode = 'r') as csv_file:
        csv_reader = csv.DictReader(csv_file)
        results = dict()
        for row in csv_reader:
            script_id = row['script_id']
            #imbd id
            imb = row['imdb_id']
            results[script_id] = imb[2:]
            final_results = dict()
        for k,v in results.items():
            final_results[v] = [0, 0, 0, 0, -1]
    return [results, final_results]
        
       
def get_char_info(data: [dict]):
    results = data[0]
    final_results = data[1]
    with open('character_list5.csv', mode = 'r') as csv_file:
        csv_reader = csv.DictReader(csv_file)
        for row in csv_reader:
            script_id = row['script_id']
            imbd_id = results[script_id]   
            gender = row['gender']
            if gender == "f":
                # num female chars
                final_results[imbd_id][1] +=1
            else:
                # num male chars
                final_results[imbd_id][0] +=1
               
    return [results, final_results]

def get_meta_data(data: [dict]):
    results = data[0]
    final_results = data[1]
    with open('meta_data7.csv', mode = 'r') as csv_file:
        csv_reader = csv.DictReader(csv_file)
        for row in csv_reader:
            script_id = row['script_id']
            imb_id = results[script_id]
            #year
            final_results[imb_id][2] = row['year']
            #gross
            if row['gross'] == "":
                final_results[imb_id][3] = 0
            else:
                final_results[imb_id][3] = row['gross']
    return final_results


# expected: dictionary; key = imdb_id; value = [ # male chars, # female chars, year, gross, 0]
def get_bechdel_rating(results):
    with open('all_movies.csv', mode = 'r') as csv_file:
        csv_reader = csv.DictReader(csv_file)
        for row in csv_reader:
            imdb_id = row['imdb_id']
            rating = row['rating']
            if imdb_id in results.keys():
                if rating == '3':
                    results[imdb_id][4] = 1
                elif rating == '0' or rating == '1' or rating == '2':
                    results[imdb_id][4] = 0
    return results


# what to write into text file:
#   column 1: # male chars
#   column 2: # female chars
#   column 3: year
#   column 4: gross
#   column 5: rating


# expected: dictionary; key = imdb_id, valye = [# male chars, # female chars, year, gross, rating]
def write_movies_into_text(results):
    movie_data = open('movie_data.txt', 'w')
    for key in results.keys():
        if results[key][4] != -1:
            #imdb_id = str(key) + " "
            num_male = str(results[key][0]) + " "
            num_female = str(results[key][1]) + " "
            year = str(results[key][2]) + " "
            gross = str(results[key][3]) + " "
            rating = str(results[key][4]) + "\n"
            L = [num_male, num_female, year, gross, rating]
            movie_data.writelines(L)
    movie_data.close()
       


if __name__ == "__main__":
 
    write_movies_into_text(get_bechdel_rating(get_meta_data(get_char_info(get_imbdid()))))

