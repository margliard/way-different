import swal from 'sweetalert';

const initSweetalert = (selector, options = {}) => {
  const swalButton = document.querySelector(selector);
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal(options);
    });
  }
};

export { initSweetalert };

// if we want to add callback -->

// import swal from 'sweetalert';

// const initSweetalert = (selector, options = {}, callback = () => {}) => {
//   const swalButton = document.querySelector(selector);
//   if (swalButton) { // protect other pages
//     swalButton.addEventListener('click', () => {
//       swal(options).then(callback); // <-- add the `.then(callback)`
//     });
//   }
// };

// export { initSweetalert };
