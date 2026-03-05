# ForoHub API

API REST desarrollada con **Spring Boot** para gestionar un foro de discusión donde los usuarios pueden crear, consultar, actualizar y eliminar tópicos.

El sistema implementa **autenticación mediante JWT (JSON Web Token)** para proteger los endpoints.

Proyecto desarrollado como parte del **Challenge Back-End de Alura + Oracle Next Education (ONE)**.

---

# Tecnologías utilizadas

- Java 17
- Spring Boot
- Spring Security
- Spring Data JPA
- JWT (Auth0 Java JWT)
- MySQL
- Flyway
- Maven
- Lombok

---

# Estructura del proyecto

```
src
 ├── controller
 │     ├── AutenticacionController
 │     └── TopicoController
 │
 ├── dto
 │     ├── DatosAutenticacion
 │     └── DatosRegistroTopico
 │
 ├── entity
 │     ├── Usuario
 │     ├── Topico
 │     └── Curso
 │
 ├── repository
 │     ├── UsuarioRepository
 │     ├── TopicoRepository
 │     └── CursoRepository
 │
 └── security
       ├── SecurityConfigurations
       ├── SecurityFilter
       ├── TokenService
       └── AutenticacionService
```

---

# Autenticación

La API utiliza **JWT (JSON Web Token)**.

Para acceder a los endpoints protegidos:

1. Autenticarse en `/login`
2. Obtener el token
3. Enviar el token en el header:

```
Authorization: Bearer TU_TOKEN
```

---

# Endpoints de la API

## Autenticación

### POST /login

Genera un token JWT.

**Request**

```json
{
 "login": "admin",
 "password": "123456"
}
```

**Response**

```
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

---

# Tópicos

Todos los endpoints requieren **token JWT**.

---

## Crear tópico

### POST /topicos

```json
{
 "titulo": "Error con Spring Security",
 "mensaje": "Recibo error 403 al enviar el token",
 "autorId": 1,
 "curso": "Spring Boot"
}
```

---

## Listar tópicos

### GET /topicos

Retorna todos los tópicos registrados.

---

## Detallar tópico

### GET /topicos/{id}

Ejemplo:

```
GET /topicos/1
```

---

## Actualizar tópico

### PUT /topicos/{id}

```json
{
 "titulo": "Problema con JPA",
 "mensaje": "No puedo mapear una relación ManyToOne",
 "autorId": 1,
 "curso": "JPA"
}
```

---

## Eliminar tópico

### DELETE /topicos/{id}

Ejemplo:

```
DELETE /topicos/1
```

---

# Instalación y ejecución

## 1 Clonar repositorio

```
git clone https://github.com/TU_USUARIO/forohub.git
```

```
cd forohub
```

---

## 2 Crear base de datos

En MySQL ejecutar:

```
CREATE DATABASE forohub;
```

---

## 3 Configurar application.properties

```
spring.datasource.url=jdbc:mysql://localhost/forohub
spring.datasource.username=root
spring.datasource.password=tu_password

jwt.secret=123456
jwt.expiration=2
```

---

## 4 Ejecutar el proyecto

Con Maven:

```
mvn spring-boot:run
```

O ejecutando la clase principal:

```
ForohubApplication.java
```

---

# Pruebas de la API

Puedes probar la API con:

- Postman
- Insomnia
- Thunder Client

Flujo recomendado:

1. POST `/login`
2. Copiar token
3. Enviar token en `Authorization`
4. Consumir endpoints `/topicos`

---

# Funcionalidades

- Registro de tópicos
- Listado de tópicos
- Detalle de tópico
- Actualización de tópico
- Eliminación de tópico
- Autenticación con JWT
- Protección de endpoints con Spring Security

---

# Autor

Desarrollado por **Mau**

Proyecto realizado para el programa:

**Oracle Next Education + Alura Latam**

---

# Licencia

Proyecto de uso educativo.
