<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Personalizacao extends Model
{
	protected $fillable = ['valor','acrescimo','descricao'];
	protected $table = ['personalizacao'];
}
