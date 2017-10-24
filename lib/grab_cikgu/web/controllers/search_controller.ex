defmodule GrabCikgu.Web.SearchController do
	use GrabCikgu.Web, :controller
	alias GrabCikgu.Repo
	alias GrabCikgu.Account
	alias GrabCikgu.Account.Role
	alias GrabCikgu.Account.Profile
	alias GrabCikgu.User

	def index(conn, %{"search" => %{"query" => query}}) do
		query_string = "%#{query}%"

		query = from u in User, join: p in assoc(u, :profile), 
			where: ilike(p.area, ^query_string)
 
		results = Repo.all(query) |> Repo.preload(:profile)
		render(conn, "index.html", results: results)
  	end

end