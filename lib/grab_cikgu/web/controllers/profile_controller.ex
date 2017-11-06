defmodule GrabCikgu.Web.ProfileController do
  use GrabCikgu.Web, :controller
  alias GrabCikgu.Account
  alias GrabCikgu.Account.User
  alias GrabCikgu.Repo
  alias GrabCikgu.Tutorial
  alias GrabCikgu.Tutorial.TeachingSubject

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
    case conn.assigns.current_user.role.name do
      "Tutor" ->
        render(conn, "show.html", profile: profile)
      "Student" ->
        render(conn, GrabCikgu.Web.StudentProfileView, "show.html", student_profile: profile)
    end
  end

  def edit(conn, %{"id" => id}) do
    user = Repo.get(User, id)
    profile = Account.get_user_profile(user)
              |> Repo.preload([:user])
    changeset = Account.change_profile(profile)
    render(conn, "edit.html", profile: profile, changeset: changeset)
  end

  def edit_profile(conn, _params) do
    user = conn.assigns.current_user |> Repo.preload([profile: [:user]])
    profile = user.profile |> Repo.preload([user: [:teaching_subjects]])
    changeset = Account.change_profile(profile)
    changeset = case profile.user.teaching_subjects do
      [] ->
        new_teaching_subject = Tutorial.change_teaching_subject(%TeachingSubject{rate: 0.00})
        user_changeset = 
          Account.change_user(profile.user) 
          |> Ecto.Changeset.put_assoc(:teaching_subjects, [new_teaching_subject])

        changeset
          |> Ecto.Changeset.put_assoc(:user, user_changeset)
      _ ->
        changeset
    end


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
    profile = 
      Account.get_user_profile(conn.assigns.current_user)
      |> Repo.preload([user: [:teaching_subjects]])
      
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
