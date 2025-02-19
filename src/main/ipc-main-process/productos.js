const { ipcMain } = require("electron");
const { obtenerProductos } = require("../modules/productos/product-service");

module.exports = () => {
  ipcMain.handle("get-productos", async () => {
    return await obtenerProductos();
  });
};
