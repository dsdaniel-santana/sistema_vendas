<?php
    require_once("template/header.php");
    require_once 'dao/GrupoUsuarioDao.php';
    require_once 'entity/GrupoUsuario.php';

    $grupoUsuarioDao = new GrupoUsuarioDAO();
    //echo $grupoUsuarioDao->getByAll;
    print_r ($grupoUsuarioDao->getAll());

    //$novoUsuario = new Usuario(null, "Chaves do 8", "123456", "chaves@chaves.com.br", null);

    //$usuarioDao->create($novoUsuario);
    //$novoUsuario = new Usuario(2, "Chavo do oito", "123456", "chaves@chaves.com.br", null);
    //$usuarioDao->update($novoUsuario)

    //$usuarioDao->delete(2);
?>
    <h1>Olá Sistema Vendas Body</h1>
</body>

<?php
    require_once("template/footer.php");
?>