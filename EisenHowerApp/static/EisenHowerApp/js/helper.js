
let sideBar = document.querySelector(".sideBarM");
let app = document.querySelector(".App");
let sub_cards = document.querySelectorAll(".sub_cards");

window.addEventListener("resize", () => {
    if(window.innerWidth <= 700){
        app.classList.add('col-12');
        app.classList.remove('col-10');
        sideBar.classList.remove('col-2');
        sub_cards.forEach((item) => {
            item.classList.add("flex");
            item.classList.remove("row");
        })
    }
    else{
        app.classList.add('col-10');
        app.classList.remove('col-12');
        sideBar.classList.add('col-2');
        sub_cards.forEach((item) => {
            item.classList.add("row");
            item.classList.remove("flex");
        })
    }
});

window.addEventListener("load", () => {
    if(window.innerWidth <= 700){
        app.classList.add('col-12');
        app.classList.remove('col-10');
        sideBar.classList.remove('col-2');
        sub_cards.forEach((item) => {
            item.classList.add("flex");
            item.classList.remove("row");
        })
    }
    else{
        app.classList.add('col-10');
        app.classList.remove('col-12');
        sideBar.classList.add('col-2');
        sub_cards.forEach((item) => {
            item.classList.add("row");
            item.classList.remove("flex");
        })
    }
});

