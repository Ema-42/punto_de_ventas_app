const { app, BrowserWindow } = require("electron");
const { ipcMain } = require("electron");
const path = require("path"); // ✅ Agregar esto antes de usar path.join
const { obtenerProductos } = require("./products/product-service");

const setMainMenu = require("./menu");
const createWindow = () => {
  const mainWindow = new BrowserWindow({
    width: 1000,
    height: 700,
    minWidth: 800,
    minHeight: 600,
    webPreferences: {
      preload: path.join(__dirname, "..", "preload", "preload.js"),
    },
  });

  mainWindow.loadFile("src/renderer/index.html");
  setMainMenu(mainWindow);
};

ipcMain.handle("get-productos", async () => {
  const productos = await obtenerProductos();
  console.log("productos enviados al renderer:", productos);
  return productos;
});
app.whenReady().then(() => {
  createWindow();
});
