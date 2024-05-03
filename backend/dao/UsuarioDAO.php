<?php
require_once '../config/Database.php';
require_once '../entity/Usuario.php';

class UsuarioDAO implements BaseDAO
{
    private $db;

    public function __construct()
    {
        $this->db = Database::getInstance();
    }

    public function getById($id)
    {
        try {
            //Preparando Consulta SQL
            $sql = "SELECT * FROM Usuario WHERE Id = :id";

            //Preparando a Instrução
            $stmt = $this->db->prepare($sql);

            // Vincular Parâmetro
            $stmt->bindParam(':id', $id);

            //Executa a instrução
            $stmt->execute();

            //Obtem o usuario encontrado
            $usuario = $stmt->fetch(PDO::FETCH_ASSOC);


            //Retorna o usuario encontradp
            return $usuario ?
                new Usuario(
                    $usuario['Id'],
                    $usuario['NomeUsuario'],
                    $usuario['Senha'],
                    $usuario['Email'],
                    $usuario['GrupoUsuarioID'],
                    $usuario['Ativo'],
                    $usuario['DataCriacao'],
                    $usuario['DataAtualizacao']
                )
                : null;
        } catch (PDOException $e) {
            return null;
            // framework.log($e, DateTime(), userID, $id)
        }
    }

    public function getAll()
    {
    }

    public function create($entity)
    {
    }

    public function update($entity)
    {
    }

    public function delete($id)
    {
    }
}
