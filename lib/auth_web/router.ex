defmodule AuthWeb.Router do
  use AuthWeb, :router

  pipeline :api_tok do
    plug :accepts, ["json"]
    plug(AuthWeb.Plug.Auth, :api_token)
  end

  pipeline :api_basic do
    plug :accepts, ["json"]
    plug(AuthWeb.Plug.BasicAuth, :api_basic_auth)
  end

  scope "/api" do
    pipe_through :api_tok

    get("/token", AuthWeb.Controller.SomeModule, :some_func)
  end

  scope "/api" do
    pipe_through :api_basic

    get("/basic_auth", AuthWeb.Controller.SomeModule, :some_func)
  end
end
