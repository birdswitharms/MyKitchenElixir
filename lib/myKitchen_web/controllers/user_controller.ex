defmodule MyKitchenWeb.UserController do
  use MyKitchenWeb, :controller

  alias MyKitchen.Pantry.User

  def signup(conn, _params) do
    user_changeset = User.changeset(%User{}, %{})

    render conn, "signup.html", changeset: user_changeset
  end
end
