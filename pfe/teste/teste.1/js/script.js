const catFactElement = document.getElementById('cat-fact');
const newFactButton = document.getElementById('new-fact-btn');

const fetchCatFact = async () => {
    try {
        const response = await fetch('https://catfact.ninja/fact');
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        const data = await response.json();
        catFactElement.textContent = data.fact;
    } catch (error) {
        console.error("Erro ao buscar fato sobre gatos:", error);
        catFactElement.textContent = "Desculpe, não foi possível carregar um fato no momento. Tente novamente mais tarde.";
    }
};


newFactButton.addEventListener('click', fetchCatFact);

fetchCatFact();
