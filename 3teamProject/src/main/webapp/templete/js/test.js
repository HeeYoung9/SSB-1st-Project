    
document.addEventListener('DOMContentLoaded', function() {
    const accordionBtns = document.querySelectorAll('.accordion-btn');

    accordionBtns.forEach(function(btn) {
        btn.addEventListener('click', function() {
            this.classList.toggle('active');
            const content = this.nextElementSibling;
            if (content.style.display === 'block') {
                content.style.display = 'none';
            } else {
                content.style.display = 'block';
            }
        });
    });
});

function toggleCategory() {
    var categoryContent = document.querySelector('.category-content');
    var brandContent = document.querySelector('.brand-content');

    categoryContent.style.display = 'block';
    brandContent.style.display = 'none';
}

function toggleBrand() {
    var categoryContent = document.querySelector('.category-content');
    var brandContent = document.querySelector('.brand-content');

    categoryContent.style.display = 'none';
    brandContent.style.display = 'block';
}

// document.addEventListener('DOMContentLoaded', function() {
//     const accordionBtns = document.querySelectorAll('.accordion-btn');

//     accordionBtns.forEach(function(btn) {
//         btn.addEventListener('click', function() {
//             this.classList.toggle('active');
//             const content = this.nextElementSibling;

//             if (content.style.maxHeight) {
//                 content.style.maxHeight = null;
//             } else {
//                 content.style.maxHeight = content.scrollHeight + 'px';
//             }
//         });
//     });
// });













