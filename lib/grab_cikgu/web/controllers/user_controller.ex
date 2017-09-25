defmodule GrabCikgu.Web.UserController do
	use GrabCikgu.Web, :controller
	alias GrabCikgu.Repo
	alias GrabCikgu.Account.Role
	alias GrabCikgu.Account.Profile
	require IEx
	plug :authenticate_user when action in [:index, :show]
	plug :load_roles when action in [:new, :create, :edit, :update]

	defp load_roles(conn, _) do
		query =
		  Role
		  |> Role.alphabetical
		  |> Role.names_and_ids
		roles = Repo.all query
		assign(conn, :roles, roles)
	end

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
		changeset_user = User.registration_changeset(%User{}, user_params)
		changeset_profile = Profile.changeset(%Profile{}, %{})
		changeset_user_profile = Ecto.Changeset.put_assoc(changeset_user, :profile, changeset_profile)
		role = Repo.get(Role, user_params["role_id"])
		changeset_role = Role.changeset(role, %{})
		changeset_user_profile_role = Ecto.Changeset.put_assoc(changeset_user_profile, :role, changeset_role)
		
		case Repo.insert(changeset_user_profile_role) do
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