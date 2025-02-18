const $ = (selector) => document.querySelector(selector);
const $count = $("#count");
const $button = $("button");

$button.addEventListener("click", () => {
  const count = parseInt($count.textContent, 10);
  $count.textContent = count + 1;
});

window.api.onUpdateTheme((event, theme) => {
  console.log("log: ", event, theme);
});

window.api.getProductos().then((productos) => {
  const tbody = document.getElementById("productos-body");
  productos.forEach((producto) => {
    const tr = document.createElement("tr");

    tr.innerHTML = `
      <td>${producto.id}</td>
      <td>${producto.nombre}</td>
      <td>${producto.descripcion}</td>
      <td>${producto.precio}</td>
    `;

    tbody.appendChild(tr);
  });
});
