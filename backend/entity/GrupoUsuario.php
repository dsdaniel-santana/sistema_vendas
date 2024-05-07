<?php
class GrupoUsuario {

    private $id;
    private $nome;
    private $descricao;
    private $dataCriacao;
    private $dataAtualizacao;
    private $usuarioAtualizacao;
    private $ativo;


    public function __construct($id, $nome, $descricao, $dataCriacao = null, $dataAtualizacao = null, $usuarioAtualizacao, $ativo = 1, )
    {
        $this->id = $id;
        $this->nome = $nome;        
        $this->descricao = $descricao;
        $this->dataCriacao = $dataCriacao;         
        $this->dataAtualizacao = $dataAtualizacao;
        $this->usuarioAtualizacao = $usuarioAtualizacao;
        $this->ativo = $ativo;
    }

    public function  getId(){
        return $this->id;
    }

    public function getNome(){
        return $this->nome;
    }

    public function getdescricacao (){
        return $this->descricao;
    }

    public function getDataCriacao() {
        return $this->dataCriacao;
    }

    public function getDataAtualizacao() {
        return $this->dataAtualizacao;
    }

    public function getUsuarioAtualizacao(){
        return $this->usuarioAtualizacao;
    }

    public function getAtivo() {
        return $this->ativo;
    }



}


?>
