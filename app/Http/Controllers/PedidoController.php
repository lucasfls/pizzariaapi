<?php

namespace App\Http\Controllers;



use Illuminate\Http\Request;
use App\Pedido;
use App\Pedidos_Personalizacao;
use App\Sabor;
use App\Tamanho;


class PedidoController extends Controller
{
	public function criar(Request $request)
	{

		if(empty($request->input('idTamanho')) || empty($request->input('idSabor')))
		{
			return response()->json([
				'success' => false,
				'message' => 'Selecione o Tamanho e o Sabor !',
			], 200);
		}

		$pedido = new Pedido();
		$pedido->fill($request->all());
		
		if($pedido->save())
		{
			return response()->json([
				'success' => true,
				'message' => 'Pedido Criado com Sucesso  !',
				'id_pedido'=> $pedido->id
			], 200);
		}
		
		return response()->json([
			'success' => false,
			'error' => [
				"message" => "Ocorreu um erro ao criar o pedido."
			],

		], 200);	
		
	}

	public function personalizar(Request $request)
	{
		if(!empty($request->input('idPedido')))
		{
			$personalizacoes = explode("|",$request->input('personalizacoes'));
			if(!empty($personalizacoes))
			{
				foreach($personalizacoes as $personalizacao)
				{
					$pedidos_personalizacao = Pedidos_Personalizacao::create(
						['idPedido'=>$request->input('idPedido'),
						'idPersonalizacao'=>$personalizacao]);
				}
				return response()->json([
					'success' => true,
					'message' => 'Personalizacoes salvas!',
				], 200);
			}
			
		}
	}

	public function finalizar($id)
	{
		$pedido = Pedido::find($id);
		
		if(empty($pedido))
		{
			return response()->json([
				'message' => 'Pedido não encontrado.',
			], 404);
		}

		$sabor = new Sabor();
		$sabor = $sabor->where("id",$pedido->idSabor)->get()->first();
		$tempo_total = 0;
		$valor_total = 0.00;
		$tempo_total = $tempo_total + $sabor->acrescimo ;
		$personalizacoes = new Pedidos_Personalizacao();
		$personalizacoes = $personalizacoes->where("idPedido",$id)->join('personalizacao','pedidos_personalizacoes.idPersonalizacao','personalizacao.id')->get();
		$descPersonalizacoes = [];
		foreach($personalizacoes as $personalizacao)
		{
			$tempo_total = $tempo_total + $personalizacao->acrescimo;
			$valor_total =  $valor_total + $personalizacao->valor;
			array_push($descPersonalizacoes,$personalizacao->descricao.', R$ '.number_format($personalizacao->acrescimo,2,",","."));
		}

		$tamanho = new Tamanho();
		$tamanho = $tamanho->where("id",$pedido->idTamanho)->get()->first();
		$tempo_total = $tempo_total + $tamanho->acrescimo;
		$valor_total =  $valor_total + $tamanho->valor;

		return response()->json([
			'success' => true,
			'message' => 'Detalhes do Pedido!',
			'pedido'=>[
				'sabor'=>$sabor->descricao,
				'tamanho'=>$tamanho->descricao,
				'personalizacoes'=>$descPersonalizacoes,
				'tempo_preparo'=>$tempo_total.' Minutos',
				'valor_total'=>'R$ '.number_format($valor_total,2,",",".")
			]
		], 200);



	}
}
