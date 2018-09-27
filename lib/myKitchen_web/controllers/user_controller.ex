defmodule MyKitchenWeb.UserController do
  use MyKitchenWeb, :controller

  alias MyKitchen.Pantry.User
  alias MyKitchen.Repo

  def new(conn, _params) do
    user_changeset = User.changeset(%User{}, %{})

    render conn, "signup.html", changeset: user_changeset
  end

  def create(conn, %{"user" => user}) do
    user_changeset = User.changeset(%User{}, %{"name" => user["name"], "email" => user["email"], "password" => user["password"]})

    case Repo.insert(user_changeset) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Account created!")
        |> redirect(to: kitchen_path(conn, :index))
      {:error, user_changeset} ->
        render conn, "signup.html", changeset: user_changeset
    end
  end
end
