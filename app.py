from flask import Flask, jsonify, render_template

app = Flask(__name__)

# --- API ---
@app.route("/api/hello")
def hello():
    return jsonify({"mensaje": "¡API funcionando correctamente en EC2!", "estado": "ok"})

@app.route("/api/info")
def info():
    data = {
        "autor": "JRodas 202200389",
        "proyecto": "API + Front en EC2",
        "stack": ["Python", "Flask", "HTML", "CSS", "JS"],
    }
    return jsonify(data)

# --- Frontend ---
@app.route("/")
def home():
    # Renderiza la interfaz (templates/index.html)
    return render_template("index.html")

if __name__ == "__main__":
    # host 0.0.0.0 para que sea accesible desde fuera de la instancia
    app.run(host="0.0.0.0", port=5000)
