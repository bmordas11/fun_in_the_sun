defmodule FunInTheSun.Router do
  use FunInTheSun.Web, :router

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

  scope "/", FunInTheSun do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController do
      resources "/posts", PostController, only: [:index, :show]
    end

    get "/images", ImageController, :index

    resources "/comments", CommentController, except: [:delete]
    resources "/reviews", ReviewController
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show
  end

  scope "/admin", FunInTheSun.Admin, as: :admin do
    pipe_through :browser

    resources "/images",  ImageController
    resources "/reviews", ReviewController
    resources "/users",   UserController
  end

  scope "/api", FunInTheSun.Api, as: :api do
    pipe_through :api

    scope "/v1", V1, as: :v1 do
      resources "/images", ImageController
      resources "/reviews", ReviewController
      resources "/users", UserController
    end
  end
end
