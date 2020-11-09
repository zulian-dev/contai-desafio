defmodule ContaiDesafioWeb.CalculoControllerTest do
  use ContaiDesafioWeb.ConnCase

  alias ContaiDesafio.Calculadora
  alias ContaiDesafio.Calculadora.Calculo

  @create_attrs %{
    operacao: "some operacao",
    resultado: 42,
    valor1: 42,
    valor2: 42
  }
  @update_attrs %{
    operacao: "some updated operacao",
    resultado: 43,
    valor1: 43,
    valor2: 43
  }
  @invalid_attrs %{operacao: nil, resultado: nil, valor1: nil, valor2: nil}

  def fixture(:calculo) do
    {:ok, calculo} = Calculadora.create_calculo(@create_attrs)
    calculo
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all calculos", %{conn: conn} do
      conn = get(conn, Routes.calculo_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create calculo" do
    test "renders calculo when data is valid", %{conn: conn} do
      conn = post(conn, Routes.calculo_path(conn, :create), calculo: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.calculo_path(conn, :show, id))

      assert %{
               "id" => id,
               "operacao" => "some operacao",
               "resultado" => 42,
               "valor1" => 42,
               "valor2" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.calculo_path(conn, :create), calculo: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update calculo" do
    setup [:create_calculo]

    test "renders calculo when data is valid", %{conn: conn, calculo: %Calculo{id: id} = calculo} do
      conn = put(conn, Routes.calculo_path(conn, :update, calculo), calculo: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.calculo_path(conn, :show, id))

      assert %{
               "id" => id,
               "operacao" => "some updated operacao",
               "resultado" => 43,
               "valor1" => 43,
               "valor2" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, calculo: calculo} do
      conn = put(conn, Routes.calculo_path(conn, :update, calculo), calculo: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete calculo" do
    setup [:create_calculo]

    test "deletes chosen calculo", %{conn: conn, calculo: calculo} do
      conn = delete(conn, Routes.calculo_path(conn, :delete, calculo))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.calculo_path(conn, :show, calculo))
      end
    end
  end

  defp create_calculo(_) do
    calculo = fixture(:calculo)
    %{calculo: calculo}
  end
end
