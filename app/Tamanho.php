<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Tamanho extends Model
{
	protected $fillable = ['valor','acrescimo','descricao'];
	protected $table ='tamanho';
}
