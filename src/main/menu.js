const { Menu } = require("electron");

const setMainMenu = (mainWindow) => {
  const template = [
    {
      label: "Themes",
      submenu: [
        {
          label: "Light",
          click: () => {
            mainWindow.webContents.send("change-theme", "light");
            console.log("Light theme selected");
          },
        },
        {
          label: "Dark",
          click: () => {
            mainWindow.webContents.send("change-theme", "dark");
            console.log("Dark theme selected");
          },
        },
      ],
    },
    {
      label: "File",
      submenu: [
        {
          label: "Exit",
          role: "quit",
        },
      ],
    },
    {
      label: "View",
      submenu: [
        { role: "reload" },
        { role: "forceReload" },
        { role: "toggleDevTools" },
        { type: "separator" },
        { role: "resetZoom" },
        { role: "zoomIn" },
        { role: "zoomOut" },
        { type: "separator" },
        { role: "togglefullscreen" },
      ],
    },
  ];
  const menu = Menu.buildFromTemplate(template);
  Menu.setApplicationMenu(menu);
};

module.exports = setMainMenu;
