const wrap = document.getElementById("wrap");
wrap.classList.remove("img");
wrap.offsetWidth;
wrap.classList.add("img");

const wrap = document.getElementById("wrap");

// Add a class to the main container to set a max height
wrap.classList.add("max-height-container");

// Force a reflow
wrap.offsetWidth;

// Remove the class to allow normal flow
wrap.classList.remove("max-height-container");


