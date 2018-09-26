defmodule MyKitchenWeb.Router do
  use MyKitchenWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MyKitchenWeb do
    pipe_through :browser # Use the default browser stack

    resources "/", KitchenController
  end

  scope "/user", MyKitchenWeb do
    pipe_through :browser # Use the default browser stack

    get "/login", UserController, :login
    get "/logout", UserController, :logout
    get "/signup", UserController, :signup
  end

  # Other scopes may use custom stacks.
  # scope "/api", MyKitchenWeb do
  #   pipe_through :api
  # end
end
