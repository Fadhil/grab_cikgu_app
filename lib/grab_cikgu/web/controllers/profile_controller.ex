defmodule GrabCikgu.Web.ProfileController do
  use GrabCikgu.Web, :controller
require IEx
  alias GrabCikgu.Account
  alias GrabCikgu.Account.Profile
  alias GrabCikgu.User
  alias GrabCikgu.Repo
  alias GrabCikgu.Account.Role

  def index(conn, _params) do
    profiles = Account.list_profiles()
    render(conn, "index.html", profiles: profiles)
  end

  def new(conn, _params) do
    changeset = Account.change_profile(%GrabCikgu.Account.Profile{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"profile" => profile_params}) do
    case Account.create_profile(profile_params) do
      {:ok, profile} ->
        conn
        |> put_flash(:info, "Profile created successfully.")
        |> redirect(to: profile_path(conn, :show, profile))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get(User, id)
    profile = Account.get_user_profile(user)
    render(conn, "show.html", profile: profile)
  end

  def show_profile(conn, _params) do
    profile = Account.get_user_profile(conn.assigns.current_user)
    render(conn, "show.html", profile: profile)
  end

  def edit(conn, %{"id" => id}) do
    user = Repo.get(User, id)
    profile = Account.get_user_profile(user)
    changeset = Account.change_profile(profile)
    render(conn, "edit.html", profile: profile, changeset: changeset)
  end

  def edit_profile(conn, _params) do
    profile = Account.get_user_profile(conn.assigns.current_user)
    changeset = Account.change_profile(profile)
    render(conn, "edit.html", profile: profile, changeset: changeset)
  end

  def update(conn, %{"id" => id, "profile" => profile_params}) do
    profile = Account.get_profile!(id)
    case Account.update_profile(profile, profile_params) do
      {:ok, profile} ->
        conn
        |> put_flash(:info, "Profile updated successfully.")
        |> redirect(to: profile_path(conn, :show, profile))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", profile: profile, changeset: changeset)
    end
  end

  def update_profile(conn, %{"profile" => profile_params}) do
    profile = Account.get_user_profile(conn.assigns.current_user)
    case Account.update_profile(profile, profile_params) do
      {:ok, profile} ->
        conn
        |> put_flash(:info, "Profile updated successfully.")
        |> redirect(to: profile_path(conn, :show_profile))    
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    profile = Account.get_profile!(id)
    {:ok, _profile} = Account.delete_profile(profile)

    conn
    |> put_flash(:info, "Profile deleted successfully.")
    |> redirect(to: profile_path(conn, :index))
  end
end
