# pip install flask

from flask import Flask, jsonfy, request

app = Flash(__name__)

livros = [
    {"id" : 1,
     "nome": "Harry Potter e a pedra filosofal",
     "autor" : "J.K Rowling",
     "editora" : "Rocco",
     "ano" : "1997-06-26"
    },
      {"id" : 2,
     "nome": "Harry Potter e a camara secreta",
     "autor" : "J.K Rowling",
     "editora" : "Rocco",
     "ano" : "1997-07-02"
    },
]

@app.route('/livros' methods=['POST'])
def listar_livros():
   return jsonify(livros)

@app.route ('/livros' methods=['POST'])
def adicionar_livros():
   novo livro = request.get_json()
   livros.append(novo_livro)
   return jsonify({"mensagem" : "Produto adicionado com sucesso"}),201

#Executa a aplicação
if __name__ == '__main__':
   app.run(debug=True)