# GestionBibliotecaSQL
# 📚 GestionBibliotecaSQL

## 📘 Sistema de Gestión de Préstamos - Biblioteca Municipal

Este proyecto implementa una base de datos completa para la gestión de préstamos de libros en una biblioteca municipal. Incluye la gestión de usuarios, libros, préstamos, sanciones automáticas y control de bloqueos de usuarios morosos.

---

## ⚙️ Estructura del Proyecto

### Tablas principales:

- **USUARIOS**: almacena la información personal de los usuarios.
- **LIBROS**: catálogo de libros disponibles.
- **PRESTAMOS**: registro de préstamos realizados por los usuarios.
- **SANCIONADOS**: tabla auxiliar generada automáticamente que bloquea a usuarios con retrasos graves.

---

## 🛠 Procedimientos

### `INSERTAR_USUARIO`
Inserta un nuevo usuario con todos sus datos personales.

### `ALTA_LIBROS`
Da de alta un nuevo libro con su información bibliográfica.

### `INSERTAR_PRESTAMO`
Registra un nuevo préstamo, solo si el usuario no está sancionado. Añade automáticamente la fecha prevista de devolución y marca el estado como `ACTIVO`.

### `GESTOR`
Recorre todos los préstamos y:
- Calcula si están en situación de sanción (`GRAVE`, `MUY GRAVE`).
- Actualiza los campos `NIVEL_SANCION` y `MENSAJE`.
- Inserta en la tabla `SANCIONADOS` si aplica.

### `ACTUALIZAR_SANCIONADOS`
Elimina automáticamente a los usuarios de la tabla `SANCIONADOS` si han pasado más de 60 días desde su sanción.

---

## 🧠 Funciones

### `SANCION_USUARIO(FECHA_ENTREGA)`
Devuelve el estado del préstamo según los días de retraso:
- `ACTIVO` (≤ 7 días)
- `GRAVE` (entre 8 y 12 días)
- `MUY GRAVE` (>12 días)

### `MENSAJE_SANCION(CODIGO, NOMBRE, FECHA, DIAS, ESTADO)`
Devuelve un mensaje personalizado con los detalles de la sanción.

---

## 📋 Lógica de Negocio

- Un usuario puede tomar prestados múltiples libros.
- Un préstamo puede quedar sancionado automáticamente.
- Si la sanción es grave, el usuario no puede hacer nuevos préstamos durante **2 meses**.
- El bloqueo se gestiona a través de la tabla `SANCIONADOS`.

---

## 💡 Consideraciones

- La tabla `SANCIONADOS` se crea al iniciar la base de datos.
- Toda la lógica de sanciones es automática con el procedimiento `GESTOR`.
- Los préstamos pueden ser insertados manualmente o usando `INSERTAR_PRESTAMO`.

---

## 📌 Requisitos de Ejecución

- MySQL 8.0 o superior.

### Orden de ejecución recomendado:

1. `TABLES.sql`
2. Procedimientos:
   - `INSERTAR_USUARIO`
   - `ALTA_LIBROS`
   - `INSERTAR_PRESTAMO`
   - `GESTOR`
   - `ACTUALIZAR_SANCIONADOS`
3. Funciones:
   - `SANCION_USUARIO`
   - `MENSAJE_SANCION`
4. Insertar datos de prueba

---

