<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Pedido extends Model
{
	protected $fillable = ['valorTotal','tempoTotal','idSabor','idTamanho'];
	protected $dates=['created_at','updated_at'];
	protected $table = 'pedidos';
	protected $primaryKey = 'id';
	
	function sabor()
	{
		return $this->hasOne('app\Sabor');
	}

	function tamanho()
	{
		return $this->hasOne('app\Tamanho');
	}
	function pedidos_personalizacao()
	{
		return $this->hasMany('app\Tamanho');	
	}

}
