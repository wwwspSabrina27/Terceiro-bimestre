function geraCorAleatoria() {
    let cor = '#';
    let letras = '0123456789ABCDEF';
    for (let i = 0; i < 6; i++) {
        cor += letras[Math.floor(Math.random() * 16)];
    }
    return cor;
}

function adicionarEventos() {
    const celulas = document.querySelectorAll('.celula');
    
    celulas.forEach(celula => {
        celula.addEventListener('click', () => {
            celula.style.backgroundColor = geraCorAleatoria();
        });
    });
}

window.onload = adicionarEventos;

