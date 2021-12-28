// === MODAL ===
const modalBtns = document.querySelectorAll('.btn-modal'),
    modalOverlay = document.querySelector('.modal-overlay'),
    modals = document.querySelectorAll('.modal');

modalBtns.forEach((el) => {
    el.addEventListener('click', (e) => {
        let path = e.currentTarget.getAttribute('data-path');

        modals.forEach((el) => {
            modalOverlay.classList.remove('modal-overlay--visible');
            el.classList.remove('modal--visible');
            body.style.overflowY = '';
        });

        document.querySelector(`[data-target="${path}"]`).classList.add('modal--visible');
        modalOverlay.classList.add('modal-overlay--visible');
        body.style.overflowY = 'hidden';
    });
});
// === / MODAL ===


// === NAV DROPDOWN ===
const menuBtns = document.querySelectorAll('.nav__link'),
    drops = document.querySelectorAll('.nav-dropdown');

menuBtns.forEach(el => {
    el.addEventListener('click', (e) => {
        let currentBtn = e.currentTarget,
            drop = currentBtn.closest('.nav__item').querySelector('.nav-dropdown');

        menuBtns.forEach(el => {
            if (el !== currentBtn) {
                el.classList.remove('nav__link--active');
            }
        });

        drops.forEach(el => {
            if (el !== drop) {
                el.classList.remove('nav-dropdown--open');
            }
        });

        drop.classList.toggle('nav-dropdown--open');
        currentBtn.classList.toggle('nav__link--active');
    });
});

document.addEventListener('click', (e) => {
    if (!e.target.closest('.nav__list')) {
        menuBtns.forEach(el => {
            el.classList.remove('nav__link--active');
        });

        drops.forEach(el => {
            el.classList.remove('nav-dropdown--open');
        });
    }
});
// === / NAV DROPDOWN ===


// === BURGER ===
const buttonBurger = document.querySelector('.nav__btn-burger'),
    navList = document.querySelector('.nav__list'),
    body = document.querySelector('body');

buttonBurger.addEventListener('click', () => {
    buttonBurger.classList.toggle('nav__btn-burger--active');
    navList.classList.toggle('nav__list--visible');
    body.style.overflowY = (body.style.overflowY == 'hidden') ? '' : 'hidden';
});
// === / BURGER ===


// === HERO SLIDER ===
const swiperHeroSlider = new Swiper('.hero-slider', {
    direction: 'horizontal',
    loop: true,

    autoplay: {
        delay: 5000,
    },

    pagination: {
        el: '.hero-slider__pagi',
        type: 'bullets',
        clickable: true,
        bulletClass: 'hero-slider__pagi-item',
        bulletActiveClass: 'hero-slider__pagi-item--active',
    },
});
// === / HERO SLIDER ===


// === HERO BOX ===
const heroBox = document.querySelector('.hero-box'),
    buttonBox = document.querySelector('.hero-box__btn-arrow'),
    listBox = document.querySelector('.hero-box__list');

buttonBox.addEventListener('click', () => {
    heroBox.classList.toggle('hero-box--open');
    buttonBox.classList.toggle('hero-box__btn-arrow--active');
    listBox.classList.toggle('hero-box__list--visible');
});
// === / HERO BOX ===