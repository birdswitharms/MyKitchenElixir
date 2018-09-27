defmodule MyKitchenWeb.Plugs.SetUser do
  import Plug.Conn

  alias MyKitchen.{Repo, Pantry.User}

  def init(_params) do
  end

  def call(conn, _params) do
    user_id = get_session(conn, :user_id)

    cond do
      user = user_id && Repo.get(User, user_id) ->
        assign(conn, :user, user)
      true ->
        assign(conn, :user, nil)
    end
  end

end

# # If a session is loaded the token/resource/claims will be put into the session and connection
# # If no session is loaded, the token/resource/claims only go onto the connection
# conn = MyKitchenWeb.Guardian.Plug.sign_in(conn, resource)

# # Optionally with claims and options
# conn = MyKitchenWeb.Guardian.Plug.sign_in(conn, resource, %{some: "claim"}, ttl: {1, :minute})

# # remove from session (if fetched) and revoke the token
# conn = MyKitchenWeb.Guardian.Plug.sign_out(conn)

# # Set a "refresh" token directly on a cookie.
# # Can be used in conjunction with `Guardian.Plug.VerifyCookie`
# conn = MyKitchenWeb.Guardian.Plug.remember_me(conn, resource)

# # Fetch the information from the current connection
# token = MyKitchenWeb.Guardian.Plug.current_token(conn)
# claims = MyKitchenWeb.Guardian.Plug.current_claims(conn)
# resource = MyKitchenWeb.Guardian.Plug.current_resource(conn)
