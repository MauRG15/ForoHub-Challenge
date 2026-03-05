package com.alura.forohub.repository;
import org.springframework.security.core.userdetails.UserDetails;
import com.alura.forohub.entity.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UsuarioRepository extends JpaRepository<Usuario, Long> {

    UserDetails findByLogin(String login);
}