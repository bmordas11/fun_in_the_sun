defmodule FunInTheSun.HelloController do
  use FunInTheSun.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
