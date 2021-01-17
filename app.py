from flask import Flask, render_template, request
import bechdeltest


app = Flask(__name__)

@app.route('/', methods=['GET'])
def index():
    return render_template('index.html')
    

@app.route('/', methods=['POST'])
def post():
    DATA = request.form
    #print("data is: " + DATA) #data is: recived: ImmutableMultiDict([('title', 'Shrek'), ('male', '3'), ('female', '1'), ('year', '2005'), ('gross', '420')])
    rating = bechdeltest.pass_calc(int(DATA['male']), int(DATA['female']), int(DATA['year']), int(DATA['gross']))
    return render_template('result-page.html', rating = rating, title = DATA['title'])
    
# @app.route("/", methods=["GET", "POST"])
# def results():    

#     if request.method == "POST":

#         req = request.form

#         #return redirect(request.url)

#     return render_template("result-page") #remember to make changes



if __name__ == "__main__":
    app.run(debug=True)