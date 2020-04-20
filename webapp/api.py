from flask import render_template, request, jsonify
from flask import Flask
import numpy as np
import traceback
import pickle
import pandas as pd
 
app = Flask(__name__)
 
@app.route('/', methods=['GET', 'POST'])
def main():
    return render_template("form.html")
 

@app.route('/result', methods = ['POST']) 
def result(): 
    return render_template("result.html") 


if __name__ == "__main__":
   app.run()



  
