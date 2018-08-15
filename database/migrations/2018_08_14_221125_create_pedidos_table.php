<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePedidosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pedidos', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('idTamanho');
            $table->foreign('idTamanho')
            ->references('id')
            ->on('tamanho')
            ->onDelete('cascade');
            $table->integer('idSabor');
            $table->foreign('idSabor')
            ->references('id')
            ->on('sabor')
            ->onDelete('cascade');
            $table->double('valorTotal',5,2)->default(0);
            $table->integer('tempoTotal')->default(0);
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pedidos');
    }
}
