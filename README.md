## Punto de Venta para Local de Comida

Este proyecto es una aplicación de punto de venta (POS) para un local de comida, desarrollada con Electron.js y utilizando SQLite a través de Prisma.

### Características

- Gestión de productos
- Registro de ventas
- Generación de reportes
- Interfaz amigable y fácil de usar

### Tecnologías Utilizadas

- **Electron.js**: Para crear la aplicación de escritorio.
- **SQLite**: Base de datos ligera y eficiente.
- **Prisma**: ORM para manejar la base de datos.

### Instalación

1. Clona el repositorio:
   ```bash
   git clone https://github.com/tu_usuario/punto_de_ventas_app.git
   ```
2. Navega al directorio del proyecto:
   ```bash
   cd punto_de_ventas_app
   ```
3. Instala las dependencias:
   ```bash
   npm install
   ```
4. Inicializa Prisma y la base de datos:
   ```bash
   npx prisma init
   npx prisma migrate dev --name init
   npx prisma generate
   ```
5. Inicia la aplicación:
   ```bash
   npm start
   ```

### Contribución

Si deseas contribuir, por favor abre un issue o envía un pull request.

### Autores
### Autores

- **[Emanuel](https://github.com/Ema-42)** ![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white)
- **[Judith](https://github.com/Judith-Robles-Coraite)** ![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white)

### Licencia

Este proyecto está bajo la Licencia MIT.

### Licencia MIT

La Licencia MIT es una licencia de software permisiva que es simple y concisa. Permite a los usuarios utilizar, copiar, modificar, fusionar, publicar, distribuir, sublicenciar y/o vender copias del software, siempre que se incluya el aviso de derechos de autor y la declaración de permiso en todas las copias o partes sustanciales del software.

Para más detalles, puedes leer el texto completo de la [Licencia MIT](https://opensource.org/licenses/MIT).
