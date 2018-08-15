<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Sabor extends Model
{
	protected $fillable = ['acrescimo','descricao'];
	protected $table ='sabor';
}
