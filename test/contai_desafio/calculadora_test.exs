defmodule ContaiDesafio.CalculadoraTest do
  use ContaiDesafio.DataCase

  alias ContaiDesafio.Calculadora

  describe "calculos" do
    alias ContaiDesafio.Calculadora.Calculo

    @valid_attrs %{operacao: "some operacao", resultado: 42, valor1: 42, valor2: 42}
    @update_attrs %{operacao: "some updated operacao", resultado: 43, valor1: 43, valor2: 43}
    @invalid_attrs %{operacao: nil, resultado: nil, valor1: nil, valor2: nil}

    def calculo_fixture(attrs \\ %{}) do
      {:ok, calculo} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Calculadora.create_calculo()

      calculo
    end

    test "list_calculos/0 returns all calculos" do
      calculo = calculo_fixture()
      assert Calculadora.list_calculos() == [calculo]
    end

    test "get_calculo!/1 returns the calculo with given id" do
      calculo = calculo_fixture()
      assert Calculadora.get_calculo!(calculo.id) == calculo
    end

    test "create_calculo/1 with valid data creates a calculo" do
      assert {:ok, %Calculo{} = calculo} = Calculadora.create_calculo(@valid_attrs)
      assert calculo.operacao == "some operacao"
      assert calculo.resultado == 42
      assert calculo.valor1 == 42
      assert calculo.valor2 == 42
    end

    test "create_calculo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Calculadora.create_calculo(@invalid_attrs)
    end

    test "update_calculo/2 with valid data updates the calculo" do
      calculo = calculo_fixture()
      assert {:ok, %Calculo{} = calculo} = Calculadora.update_calculo(calculo, @update_attrs)
      assert calculo.operacao == "some updated operacao"
      assert calculo.resultado == 43
      assert calculo.valor1 == 43
      assert calculo.valor2 == 43
    end

    test "update_calculo/2 with invalid data returns error changeset" do
      calculo = calculo_fixture()
      assert {:error, %Ecto.Changeset{}} = Calculadora.update_calculo(calculo, @invalid_attrs)
      assert calculo == Calculadora.get_calculo!(calculo.id)
    end

    test "delete_calculo/1 deletes the calculo" do
      calculo = calculo_fixture()
      assert {:ok, %Calculo{}} = Calculadora.delete_calculo(calculo)
      assert_raise Ecto.NoResultsError, fn -> Calculadora.get_calculo!(calculo.id) end
    end

    test "change_calculo/1 returns a calculo changeset" do
      calculo = calculo_fixture()
      assert %Ecto.Changeset{} = Calculadora.change_calculo(calculo)
    end
  end
end
