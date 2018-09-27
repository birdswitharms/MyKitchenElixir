defmodule MyKitchen.Repo.Migrations.CreatePantryUser do
  use Ecto.Migration

  def change do
    create table(:pantry_user) do
      add :name, :string
      add :email, :string
      add :password, :string, virtual: true
      add :password_hash, :string

      timestamps()
    end

  end
end
