defmodule GrabCikgu.Web.UserController do
	use GrabCikgu.Web, :controller
	alias GrabCikgu.Repo
	
	plug :authenticate_user when action in [:index, :show]
	

	def index(conn, _params) do
		users = Repo.all(GrabCikgu.User)
		render conn, "index.html", users: users
	end

	alias GrabCikgu.User
	def new(conn, _params) do
		changeset = User.changeset(%User{})
		render conn, "new.html", changeset: changeset
	end

	def create(conn, %{"user" => user_params}) do
		changeset = User.registration_changeset(%User{}, user_params)
		case Repo.insert(changeset) do
		{:ok, user} ->
			conn
			|> GrabCikgu.Web.Auth.login(user)
			|> put_flash(:info, "#{user.name} created!")
			|> redirect(to: user_path(conn, :index))
		{:error, changeset} ->
			render(conn, "new.html", changeset: changeset)
		end
	end

	def show(conn, %{"id" => id}) do
		user = Repo.get(GrabCikgu.User, id)
		render conn, "show.html", user: user
	end
	
	defp authenticate(conn, _opts) do
		if conn.assigns.current_user do
			conn
		else
			conn
			|> put_flash(:error, "You must logged in to access that page")
			|> redirect(to: page_path(conn, :index))
			|> halt()
		end
	end

end