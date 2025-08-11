const UserAdmin = document.querySelector("#user1");
const UserGerente = document.querySelector("#user2");
const UserFuncionário = document.querySelector("#user3");

const emailInput = document.querySelector("#email");
const passwordinput = document.querySelector("#password")

const loginButton = document.querySelector(".botton-login")

const users = [
    {
        nome: "Gabigol",
        cargo: "Gerente",
        email: "gabi@exemplo.com",
        password: "456"
    },
    {
        nome: "Allan",
        cargo: "Funcionário",
        email: "allan@exemplo.com",
        password: "789"
    },
    {
        nome: "Jorge Jesus",
        cargo: "Administrador",
        email: "jorgin123@exemplo.com",
        password: "168"
    }
];

loginButton.addEventListener("click", (Event) => {
    Event.preventDefault();

    c
});