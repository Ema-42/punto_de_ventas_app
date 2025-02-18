// src/main/products/product-service.js
const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

// Crear un nuevo producto
const crearProducto = async (nombre, descripcion, precio) => {
  const producto = await prisma.producto.create({
    data: {
      nombre,
      descripcion,
      precio,
    },
  });
  return producto;
};

// Obtener todos los productos
const obtenerProductos = async () => {
    try {
      const productos = await prisma.producto.findMany();
      console.log("productos:", productos);
      return productos;
    } catch (error) {
      console.error("Error al obtener productos:", error);
      if (error instanceof Prisma.PrismaClientKnownRequestError) {
        console.error("Detalles del error:", error.meta);
      }
      return [];
    }
  };

module.exports = { crearProducto, obtenerProductos };
