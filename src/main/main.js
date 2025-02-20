const { app, BrowserWindow } = require("electron");
const path = require("path");

const registerIpcProcess = require("./ipc-main-process"); // Importa todos los IPC

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

app.whenReady().then(() => {
  createWindow();
  registerIpcProcess(); // Registra todos los eventos IPC
});
