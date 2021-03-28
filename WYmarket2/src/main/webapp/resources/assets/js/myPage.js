const products = document.getElementById("products1");
const comments = document.getElementById("comments");
const favorites = document.getElementById("favorites");
const reviews = document.getElementById("reviews");
const usernick = document.getElementById("usernick");

const productsAtag = document.getElementById("productsA");
const commentsAtag = document.getElementById("commentsA");
const favoritesAtag = document.getElementById("favoritesA");
const reviewsAtag = document.getElementById("reviewsA");

console.log(products.value);

if (products.value == 'products') {
	productsAtag.style.borderBottom = 'solid 1px white';
	console.log("야");
} else if (comments.value == 'comments') {
	productsAtag.style.borderBottom = 'solid 1px black';
	commentsAtag.style.borderBottom = 'solid 1px white';
	favoritesAtag.style.borderBottom = 'solid 1px black';
	reviewsAtag.style.borderBottom = 'solid 1px black';

	commentsAtag.style.borderTop = 'solid 1px black';
	commentsAtag.style.borderLeft = 'solid 1px black';
	commentsAtag.style.borderRight = 'solid 1px black';
	commentsAtag.style.backgroundColor = 'white';
	commentsAtag.style.color = 'black';
} else if (favorites.value == 'favorites') {
	productsAtag.style.borderBottom = 'solid 1px black';
	commentsAtag.style.borderBottom = 'solid 1px black';
	favoritesAtag.style.borderBottom = 'solid 1px white';
	reviewsAtag.style.borderBottom = 'solid 1px black';

	favoritesAtag.style.borderTop = 'solid 1px black';
	favoritesAtag.style.borderRight = 'solid 1px black';
	favoritesAtag.style.borderLeft = 'solid 1px black';
	favoritesAtag.style.backgroundColor = 'white';
	favoritesAtag.style.color = 'black';
} else if (reviews.value == 'reviews') {
	productsAtag.style.borderBottom = 'solid 1px black';
	commentsAtag.style.borderBottom = 'solid 1px black';
	favoritesAtag.style.borderBottom = 'solid 1px black';
	reviewsAtag.style.borderBottom = 'solid 1px white';

	reviewsAtag.style.borderTop = 'solid 1px black';
	reviewsAtag.style.borderRight = 'solid 1px black';
	reviewsAtag.style.borderLeft = 'solid 1px black';
	reviewsAtag.style.backgroundColor = 'white';
	reviewsAtag.style.color = 'black';
}

function modify() {
	var cal = document.getElementsByClassName("caUMBg");
	cal.style.display = 'block';
	var kc = document.getElementsByClassName("kQfCqL");
}