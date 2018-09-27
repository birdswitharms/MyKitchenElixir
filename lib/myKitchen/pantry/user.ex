defmodule MyKitchen.Pantry.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias Comeonin.Bcrypt

  schema "pantry_user" do
    field :email, :string
    field :name, :string
    field :password, :string
    field :password_hash, :string

    timestamps()
  end

  @doc false
  def changeset(user_changeset, params \\ %{}) do
    user_changeset
    |> cast(params, [:name, :email, :password])
    |> unique_constraint(:email, downcase: true)
    |> validate_required([:name, :email, :password])
    |> IO.inspect()
    |> password_flow()
  end

  defp password_flow(user_changeset, params \\ %{}) do
    user_changeset
    |> cast(params, [:password])
    |> validate_required([:password])
    |> hash_password()
  end

  defp hash_password(user_changeset) do
    case user_changeset do
      %Ecto.Changeset{valid?: true} ->
        password = get_change(user_changeset, :password)
        user_changeset
        |> put_change(:password_hash, Bcrypt.hashpwsalt(password))
        |> put_change(:password, nil)
      _ ->
        user_changeset
    end
  end
end
