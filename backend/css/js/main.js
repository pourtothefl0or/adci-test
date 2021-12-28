const swiper = new Swiper('.slider-list-wrapper', {
    direction: 'horizontal',
    loop: true,
    slidesPerView: 2,
    spaceBetween: 15,

    navigation: {
        nextEl: '.slider .btn-arrow--next',
        prevEl: '.slider .btn-arrow--prev',
    },

    pagination: {
        el: ".slider__header-pagination",
        type: "fraction",
    },
});