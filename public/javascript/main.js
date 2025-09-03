const main = {
    menuBurger: document.querySelector('.menu-burger'),
    headerLinks: document.querySelector('.header-links'),
    navLinks: document.querySelectorAll('.header-links>ul>li>a'),
    seeMoreButton: document.querySelector('.see-more'),
    coffeeCards: document.querySelectorAll('.coffee-card'),
    seeLessButton: document.querySelector('.see-less'),
    seeMoreCards: function () {
        main.coffeeCards.forEach((card, index) => {
            if (index >= 3) {
                card.style.display = 'none';
            }
        })

        if(main.coffeeCards.length <= 3) {
            main.seeMoreButton.style.display = 'none';
        }

        main.seeMoreButton.addEventListener('click', (e) => {
            if (main.seeMoreButton.classList.contains('see-more')) {
                e.currentTarget.classList.remove('see-more');
                e.currentTarget.innerHTML = 'Voir moins';
                main.coffeeCards.forEach((card, index) => {
                    if (index >= 3) {
                        card.style.display = 'flex';
                    }
                })
            }else {
                e.currentTarget.classList.add('see-more');
                e.currentTarget.innerHTML = 'Voir plus';
                main.coffeeCards.forEach((card, index) => {
                    if (index >= 3) {
                        card.style.display = 'none';
                    }
                })
            }
        })
    },
    init: function () {
        const currentUrl = window.location.pathname;

        main.navLinks.forEach((link) => {
            const linkUrl = link.getAttribute('href');
            if (currentUrl === linkUrl) {
                link.classList.add('active');
            }
        })

        main.menuBurger.addEventListener('click', () => {
            main.headerLinks.classList.toggle('burger-active');
        });


        main.seeMoreCards();;
    }
}

main.init();