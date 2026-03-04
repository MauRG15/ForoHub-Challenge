CREATE TABLE curso (
                       id BIGINT NOT NULL AUTO_INCREMENT,
                       nombre VARCHAR(255) NOT NULL,
                       categoria VARCHAR(255) NOT NULL,
                       PRIMARY KEY (id)
);

CREATE TABLE usuario (
                         id BIGINT NOT NULL AUTO_INCREMENT,
                         nombre VARCHAR(255) NOT NULL,
                         correo_electronico VARCHAR(255) NOT NULL UNIQUE,
                         contrasena VARCHAR(255) NOT NULL,
                         PRIMARY KEY (id)
);

CREATE TABLE perfil (
                        id BIGINT NOT NULL AUTO_INCREMENT,
                        nombre VARCHAR(255) NOT NULL,
                        PRIMARY KEY (id)
);

CREATE TABLE usuario_perfiles (
                                  usuario_id BIGINT NOT NULL,
                                  perfil_id BIGINT NOT NULL,
                                  PRIMARY KEY (usuario_id, perfil_id),
                                  FOREIGN KEY (usuario_id) REFERENCES usuario(id),
                                  FOREIGN KEY (perfil_id) REFERENCES perfil(id)
);

CREATE TABLE topico (
                        id BIGINT NOT NULL AUTO_INCREMENT,
                        titulo VARCHAR(255) NOT NULL,
                        mensaje TEXT NOT NULL,
                        fecha_creacion DATETIME NOT NULL,
                        status VARCHAR(100) NOT NULL,
                        autor_id BIGINT NOT NULL,
                        curso_id BIGINT NOT NULL,
                        PRIMARY KEY (id),
                        FOREIGN KEY (autor_id) REFERENCES usuario(id),
                        FOREIGN KEY (curso_id) REFERENCES curso(id)
);

CREATE TABLE respuesta (
                           id BIGINT NOT NULL AUTO_INCREMENT,
                           mensaje TEXT NOT NULL,
                           topico_id BIGINT NOT NULL,
                           fecha_creacion DATETIME NOT NULL,
                           autor_id BIGINT NOT NULL,
                           solucion BOOLEAN NOT NULL,
                           PRIMARY KEY (id),
                           FOREIGN KEY (topico_id) REFERENCES topico(id),
                           FOREIGN KEY (autor_id) REFERENCES usuario(id)
);