package com.alura.forohub.controller;

import com.alura.forohub.dto.DatosAutenticacion;
import com.alura.forohub.entity.Usuario;
import com.alura.forohub.security.TokenService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/login")
public class AutenticacionController {

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private TokenService tokenService;

    @PostMapping
    public ResponseEntity<?> autenticar(
            @RequestBody @Valid DatosAutenticacion datos) {

        var authenticationToken =
                new UsernamePasswordAuthenticationToken(
                        datos.login(),
                        datos.password()
                );

        var authentication = authenticationManager.authenticate(authenticationToken);

        var usuario = (Usuario) authentication.getPrincipal();

        var token = tokenService.generarToken(usuario);

        return ResponseEntity.ok(token);
    }
}
