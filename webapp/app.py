import numpy as numpy
from pycaret.regression import *
import pandas as pd
from flask import Flask, request, jsonify, render_template
import pickle

app = Flask(__name__)
model = load_model("model/FinalRF")

@app.route('/')
def home():
    return render_template("index.html")

@app.route('/predict', methods=['POST'])
def predict():
    feats = pd.read_csv("featuresAPI.csv")

    features = [f for f in request.form.values()]

    feats['regions'] = features[2]
    feats['type_local'] = features[1]
    feats['nature_mutation'] = features[0]
    feats['nombre_pieces_principales'] = features[3]
    
    prediction = predict_model(model, data=feats)
    print(prediction)
    output = round(prediction['Label'][0], 2)

    return render_template("index.html", prediction_text = 'Le bien est estimé à {} €'.format(output))

if __name__ == "__main__":
    app.run(debug=True)