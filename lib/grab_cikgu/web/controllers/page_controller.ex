defmodule GrabCikgu.Web.PageController do
  use GrabCikgu.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
