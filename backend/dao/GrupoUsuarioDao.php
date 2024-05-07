<?php
require_once 'config/Database.php';
require_once 'entity/GrupoUsuario.php';
require_once 'BaseDao.php';

class GrupoUsuarioDao{
    private $db;

    public function __construct()
    {
        $this->db = Database::getInstance();
    }

    public function getById($id){
        try{
            $sql = "SELECT * FROM grupousuario WHERE Id = :id";

            $stmt = $this->db->prepare($sql);

            $stmt->bindParam(':id', $id);

            $stmt->execute();

            $grupousuario = $stmt->fetch(PDO::FETCH_ASSOC);

            return $grupousuario ?
                new GrupoUsuario (
                    $grupousuario['Id'],
                    $grupousuario ['Nome'],
                    $grupousuario ['Descricao'],
                    $grupousuario ['DataCriacao'],
                    $grupousuario ['DataAtualizacao'],
                    $grupousuario ['UsuarioAtualizacao'],
                    $grupousuario ['Ativo']

                )
                :null;
            
        } catch (PDOException $e){
            return null;
        }
    }

    public function getAll(){
        try {
            $sql = "SELECT * FROM grupousuario";

            $stmt = $this->db->prepare($sql);

            $stmt->execute();

            $grupousuarios = $stmt->fetchall(PDO::FETCH_ASSOC);

            return array_map(function($grupousuario){
                return new GrupoUsuario(
                    $grupousuario['Id'],
                    $grupousuario ['Nome'],
                    $grupousuario ['Descricao'],
                    $grupousuario ['DataCriacao'],
                    $grupousuario ['DataAtualizacao'],
                    $grupousuario ['UsuarioAtualizacao'],
                    $grupousuario ['Ativo']

                );
            }, $grupousuarios ); 
        
        } catch (PDOException $e) {
            return [];
        }
    }
    
    public function create ($grupo){
        try {
            $sql = "INSERT INTO grupousuario (null, nome, descricao, dataCriacao, dataAtualizacao, usuarioAtualizacao)
            VALUES (:null, nome, descricao, current_timestamp(),current_timestamp(),null)";

            
        }
    }

?>