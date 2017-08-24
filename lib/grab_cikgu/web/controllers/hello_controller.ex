defmodule GrabCikgu.Web.HelloController do
	use GrabCikgu.Web, :controller

	def world(conn, %{"name" => name}) do
		render conn, "world.html", name: name
	end
end