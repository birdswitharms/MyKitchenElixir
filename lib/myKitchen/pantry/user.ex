defmodule MyKitchen.Pantry.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "pantry_user" do
    field :email, :string
    field :name, :string
    field :token, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :token])
    |> validate_required([:name, :email, :token])
  end
end