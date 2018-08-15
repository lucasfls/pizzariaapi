<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePedidosPersonalizacoesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pedidos_personalizacoes', function (Blueprint $table) {
            $table->integer('idPedido');
            $table->foreign('idPedido')
            ->references('id')
            ->on('pedidos')
            ->onDelete('cascade');
            $table->integer('idPersonalizacao');
            $table->foreign('idPersonalizacao')
            ->references('id')
            ->on('personalizacao')
            ->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pedidos_personalizacoes');
    }
}
