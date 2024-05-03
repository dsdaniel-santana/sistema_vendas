<?php
require_once '../config/Database.php';
require_once '../entity/Pedido.php';

class PedidoDAO implements BaseDAO {
    private $db;

    public function __construct(){
        $this->db = Database::getInstance();
    }
    
    public function getById($id){
        //Implementação para obter pedido por ID
    }        
    public function getAll(){
        //Implementação para obter todos os Pedidos

    }        
    public function create($entity){
        //Implementação para criar um novo pedido 

    }        
    public function update($entity){
        //Implementação para atualizar um pedido
        //recebendo o id no corpo da requisição

    }
    public function delete($id){

    } 


}

?>