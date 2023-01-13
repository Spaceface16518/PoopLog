defmodule PoopLogWeb.PageController do
  use PoopLogWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
