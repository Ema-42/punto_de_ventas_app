const { contextBridge, ipcRenderer } = require("electron");

contextBridge.exposeInMainWorld("api", {
  onUpdateTheme: (callback) =>
    ipcRenderer.on("change-theme", (event, theme) => callback(event, theme)),
  getProductos: () => ipcRenderer.invoke("get-productos"),
});
