/*
  Warnings:

  - You are about to alter the column `precio_unitario` on the `DetallePedido` table. The data in that column could be lost. The data in that column will be cast from `Decimal` to `Float`.
  - You are about to alter the column `total` on the `Pedido` table. The data in that column could be lost. The data in that column will be cast from `Decimal` to `Float`.
  - You are about to alter the column `precio` on the `Producto` table. The data in that column could be lost. The data in that column will be cast from `Decimal` to `Float`.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_DetallePedido" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "pedido_id" INTEGER NOT NULL,
    "producto_id" INTEGER NOT NULL,
    "cantidad" INTEGER NOT NULL,
    "precio_unitario" REAL NOT NULL,
    CONSTRAINT "DetallePedido_pedido_id_fkey" FOREIGN KEY ("pedido_id") REFERENCES "Pedido" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "DetallePedido_producto_id_fkey" FOREIGN KEY ("producto_id") REFERENCES "Producto" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_DetallePedido" ("cantidad", "id", "pedido_id", "precio_unitario", "producto_id") SELECT "cantidad", "id", "pedido_id", "precio_unitario", "producto_id" FROM "DetallePedido";
DROP TABLE "DetallePedido";
ALTER TABLE "new_DetallePedido" RENAME TO "DetallePedido";
CREATE TABLE "new_Pedido" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "pedido_padre_id" INTEGER,
    "mesa_id" INTEGER,
    "mesera_id" INTEGER NOT NULL,
    "cajero_id" INTEGER NOT NULL,
    "estado" TEXT,
    "fecha_creacion" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "fecha_concluido" DATETIME,
    "total" REAL DEFAULT 0,
    CONSTRAINT "Pedido_pedido_padre_id_fkey" FOREIGN KEY ("pedido_padre_id") REFERENCES "Pedido" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Pedido_mesa_id_fkey" FOREIGN KEY ("mesa_id") REFERENCES "Mesa" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Pedido_mesera_id_fkey" FOREIGN KEY ("mesera_id") REFERENCES "Usuario" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Pedido_cajero_id_fkey" FOREIGN KEY ("cajero_id") REFERENCES "Usuario" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Pedido" ("cajero_id", "estado", "fecha_concluido", "fecha_creacion", "id", "mesa_id", "mesera_id", "pedido_padre_id", "total") SELECT "cajero_id", "estado", "fecha_concluido", "fecha_creacion", "id", "mesa_id", "mesera_id", "pedido_padre_id", "total" FROM "Pedido";
DROP TABLE "Pedido";
ALTER TABLE "new_Pedido" RENAME TO "Pedido";
CREATE TABLE "new_Producto" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nombre" TEXT NOT NULL,
    "precio" REAL NOT NULL,
    "imagen_url" TEXT,
    "categoria_id" INTEGER NOT NULL,
    "maneja_stock" BOOLEAN NOT NULL DEFAULT true,
    "stock" INTEGER NOT NULL DEFAULT 0,
    "fecha_creacion" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "Producto_categoria_id_fkey" FOREIGN KEY ("categoria_id") REFERENCES "CategoriaProducto" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Producto" ("categoria_id", "id", "imagen_url", "maneja_stock", "nombre", "precio", "stock") SELECT "categoria_id", "id", "imagen_url", "maneja_stock", "nombre", "precio", "stock" FROM "Producto";
DROP TABLE "Producto";
ALTER TABLE "new_Producto" RENAME TO "Producto";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
