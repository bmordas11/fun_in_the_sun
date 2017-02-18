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
    resources "/users", UserController
    resources "/posts", PostController, only: [:index, :show]
    resources "/comments", CommentController, except: [:delete]
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", FunInTheSun do
  #   pipe_through :api
  # end
end
