defmodule EthboxWeb.PageController do
  use EthboxWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
