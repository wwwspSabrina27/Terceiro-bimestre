const
 
    const button = document.querySelector("#enviar");
 
function gerarcoraleatoria() {
    let cor = '#';
    let letras = '0123456789ABCDEF';
    for (let i = 0; i < 6; i++){
        cor += letras[Math.floor(Math.random() * 16)];
    return cor;
} 