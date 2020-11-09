defmodule ContaiDesafio.Repo.Migrations.CreateCalculos do
  use Ecto.Migration

  def change do
    create table(:calculos) do
      add :valor1, :integer
      add :valor2, :integer
      add :operacao, :string
      add :resultado, :integer

      timestamps()
    end

  end
end
