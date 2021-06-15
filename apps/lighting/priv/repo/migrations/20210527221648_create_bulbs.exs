defmodule Lighting.Repo.Migrations.CreateBulbs do
  use Ecto.Migration

  def change do
    create table(:bulbs) do
      add :label, :string

      timestamps()
    end

  end
end
