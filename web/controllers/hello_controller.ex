defmodule FunInTheSun.HelloController do
  use FunInTheSun.Web, :controller

  plug :assign_welcome_message, "Hi!" when action in [:index, :show]

  def index(conn, _params) do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(201, "")
  end

  def show(conn, %{"messenger" => messenger}) do
    render conn, "show.html", messenger: messenger
  end

  defp assign_welcome_message(conn, msg) do
    assign(conn, :message, msg)
  end
end
