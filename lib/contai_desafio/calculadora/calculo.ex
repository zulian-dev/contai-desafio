defmodule ContaiDesafio.Calculadora.Calculo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "calculos" do
    field :operacao, :string
    field :resultado, :integer
    field :valor1, :integer
    field :valor2, :integer

    timestamps()
  end

  @doc false
  def changeset(calculo, attrs) do
    calculo
    |> cast(attrs, [:valor1, :valor2, :operacao])
    |> validate_required([:valor1, :valor2, :operacao])
    |> get_resultado()
  end

  def get_resultado(
    %{
      valid?: true,
      changes: %{
        operacao: operacao, valor1: valor1, valor2: valor2
      }
    } = changeset
  ) do

    IO.inspect changeset
    change(changeset, %{resultado: (calcular operacao, valor1, valor2)})
  end
  def get_resultado(%{valid?: false} = changeset), do: changeset

  def calcular("+", valor1, valor2), do: valor1 + valor2
  def calcular("-", valor1, valor2), do: valor1 - valor2
  def calcular("/", valor1, valor2), do: Integer.floor_div(valor1, valor2)
  def calcular("*", valor1, valor2), do: valor1 * valor2

  # def calcular "/", _, 0 do
  #   # TODO: erro de divisao por Zeros
  # end
  # def calcular _, _, _ do
  #   # TODO: erro de opercao nao definida
  # end
end
