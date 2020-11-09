defmodule ContaiDesafioWeb.CalculoView do
  use ContaiDesafioWeb, :view
  alias ContaiDesafioWeb.CalculoView

  def render("index.json", %{calculos: calculos}) do
    %{data: render_many(calculos, CalculoView, "calculo.json")}
  end

  def render("show.json", %{calculo: calculo}) do
    %{data: render_one(calculo, CalculoView, "calculo.json")}
  end

  def render("calculo.json", %{calculo: calculo}) do
    %{id: calculo.id,
      valor1: calculo.valor1,
      operacao: calculo.operacao,
      valor2: calculo.valor2,
      resultado: calculo.resultado}
  end
end
