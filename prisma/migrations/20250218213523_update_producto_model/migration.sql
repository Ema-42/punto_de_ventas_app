/*
  Warnings:

  - Made the column `descripcion` on table `Producto` required. This step will fail if there are existing NULL values in that column.
  - Made the column `nombre` on table `Producto` required. This step will fail if there are existing NULL values in that column.
  - Made the column `precio` on table `Producto` required. This step will fail if there are existing NULL values in that column.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Producto" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nombre" TEXT NOT NULL,
    "descripcion" TEXT NOT NULL,
    "precio" REAL NOT NULL,
    "fechaCreacion" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_Producto" ("descripcion", "fechaCreacion", "id", "nombre", "precio") SELECT "descripcion", "fechaCreacion", "id", "nombre", "precio" FROM "Producto";
DROP TABLE "Producto";
ALTER TABLE "new_Producto" RENAME TO "Producto";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
