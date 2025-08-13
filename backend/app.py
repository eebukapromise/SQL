from flask import Flask, jsonify
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

@app.route('/api/numbers')
def get_numbers():
    numbers = list(range(1, 101))
    return jsonify(numbers)

@app.route('/api/alphabet')
def get_alphabet():
    alphabet = [chr(i) for i in range(ord('A'), ord('Z') + 1)]
    return jsonify(alphabet)

@app.route('/api/current-affairs')
def get_current_affairs():
    affairs = [
        "A group of flamingos is called a flamboyance.",
        "The heart of a shrimp is located in its head.",
        "A snail can sleep for three years.",
        "Honey never spoils.",
        "Octopuses have three hearts."
    ]
    return jsonify(affairs)

if __name__ == '__main__':
    app.run(debug=True)
