defmodule FunInTheSun.Router do
  use FunInTheSun.Web, :router

  pipeline :browser do
    plug :accepts, ["html", "text"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", FunInTheSun do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/test", PageController, :test

    get "/images", ImageController, :index

    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show
  end

  scope "/admin", FunInTheSun.Admin, as: :admin do
    pipe_through :browser

    resources "/images",  ImageController
    resources "/reviews", ReviewController
    resources "/users",   UserController
  end
end
