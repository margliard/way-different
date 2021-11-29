import "jquery-bar-rating";

const initStarRating = () => {
  $('#review_experience_rating').barrating({
    theme: 'css-stars',
    showSelectedRating: true
  });
};


export { initStarRating };
