// src/main/products/product-service.js
const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

// Obtener todos los productos
const obtenerProductos = async () => {
  try {
    const productos = await prisma.producto.findMany({
      select: {
        id: true,
        nombre: true,
        precio: true,
        imagen_url: true,
        categoria: true,
      },
    });
    return productos.map((p) => ({
      ...p,
      precio: p.precio.toFixed(2), // Convierte Decimal a string con 2 decimales
    }));
  } catch (error) {
    console.error("Error al obtener productos:", error);
    return error;
  }
};

module.exports = { obtenerProductos };
