<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Personalizacao;
// use Pedido
class Pedidos_Personalizacao extends Model
{
	protected $fillable =[ 'idPedido', 'idPersonalizacao'  ];
	protected $table = 'pedidos_personalizacoes';

	public $timestamps = false;
	function pedido()
	{
		$this->belongsTo('App\Pedido','idPedido');
	}

	function personalizacao()
	{
		$this->belongsTo('App\Personalizacao','idPersonalizacao');
	}
}
