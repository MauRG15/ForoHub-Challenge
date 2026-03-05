CREATE TABLE usuarios (
                          id BIGINT AUTO_INCREMENT PRIMARY KEY,
                          login VARCHAR(100) NOT NULL UNIQUE,
                          password VARCHAR(255) NOT NULL
);

CREATE TABLE curso (
                       id BIGINT AUTO_INCREMENT PRIMARY KEY,
                       nombre VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE topicos (
                        id BIGINT AUTO_INCREMENT PRIMARY KEY,
                        titulo VARCHAR(255) NOT NULL,
                        mensaje TEXT NOT NULL,
                        fecha_creacion DATETIME,
                        status VARCHAR(50),
                        autor_id BIGINT,
                        curso_id BIGINT,

                        CONSTRAINT fk_topico_autor
                            FOREIGN KEY (autor_id)
                                REFERENCES usuarios(id),

                        CONSTRAINT fk_topico_curso
                            FOREIGN KEY (curso_id)
                                REFERENCES curso(id)
);

INSERT INTO curso (nombre) VALUES
                               ('Java'),
                               ('Spring Boot'),
                               ('JPA'),
                               ('Hibernate');

INSERT INTO usuarios (login, password)
VALUES (
           'admin',
           '$2a$10$BX5Xazw12FFnpFG8QPvcxeWS5B2Z1iwWC8DDRaFyZ7NCIzgRSM1ee'
       );