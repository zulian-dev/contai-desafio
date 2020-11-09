defmodule ContaiDesafioWeb.CalculoController do
  use ContaiDesafioWeb, :controller

  alias ContaiDesafio.Calculadora
  alias ContaiDesafio.Calculadora.Calculo

  action_fallback ContaiDesafioWeb.FallbackController

  def index(conn, _params) do
    calculos = Calculadora.list_calculos()
    render(conn, "index.json", calculos: calculos)
  end

  def create(conn, %{"calculo" => calculo_params}) do
    with {:ok, %Calculo{} = calculo} <- Calculadora.create_calculo(calculo_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.calculo_path(conn, :show, calculo))
      |> render("show.json", calculo: calculo)
    end
  end

  def soma(conn,
    calculo_params
  ) do
    save_parans = calculo_params
    |> Map.put("operacao", "+")
    create(conn, %{"calculo" => save_parans})
  end

  def subtracao(conn, calculo_params) do
    save_parans = calculo_params
    |> Map.put("operacao", "-")
    create(conn, %{"calculo" => save_parans})
  end

  def multiplicacao(conn, calculo_params) do
    save_parans = calculo_params
    |> Map.put("operacao", "*")
    create(conn, %{"calculo" => save_parans})
  end

  def divisao(conn, calculo_params) do
    save_parans = calculo_params
    |> Map.put("operacao", "/")
    create(conn, %{"calculo" => save_parans})
  end

  def show(conn, %{"id" => id}) do
    calculo = Calculadora.get_calculo!(id)
    render(conn, "show.json", calculo: calculo)
  end

  def update(conn, %{"id" => id, "calculo" => calculo_params}) do
    calculo = Calculadora.get_calculo!(id)

    with {:ok, %Calculo{} = calculo} <- Calculadora.update_calculo(calculo, calculo_params) do
      render(conn, "show.json", calculo: calculo)
    end
  end

  def delete(conn, %{"id" => id}) do
    calculo = Calculadora.get_calculo!(id)

    with {:ok, %Calculo{}} <- Calculadora.delete_calculo(calculo) do
      send_resp(conn, :no_content, "")
    end
  end
end
