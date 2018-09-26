defmodule MyKitchen.Repo.Migrations.CreatePantryUser do
  use Ecto.Migration

  def change do
    create table(:pantry_user) do
      add :name, :string
      add :email, :string
      add :token, :string

      timestamps()
    end

  end
end
