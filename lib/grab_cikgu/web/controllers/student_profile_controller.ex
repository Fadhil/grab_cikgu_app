defmodule GrabCikgu.Web.StudentProfileController do
  use GrabCikgu.Web, :controller

  alias GrabCikgu.Account

  def index(conn, _params) do
    student_profiles = Account.list_student_profiles()
    render(conn, "index.html", student_profiles: student_profiles)
  end

  def new(conn, _params) do
    changeset = Account.change_student_profile(%GrabCikgu.Account.StudentProfile{})
    render(conn, "new.html", changeset: changeset)
  end

  # def create(conn, %{"student_profile" => student_profile_params}) do
  #   case Account.create_student_profile(student_profile_params) do
  #     {:ok, student_profile} ->
  #       conn
  #       |> put_flash(:info, "Student profile created successfully.")
  #       |> redirect(to: student_profile_path(conn, :show, student_profile))
  #     {:error, %Ecto.Changeset{} = changeset} ->
  #       render(conn, "new.html", changeset: changeset)
  #   end
  # end

  def show(conn, %{"id" => id}) do
    student_profile = Account.get_student_profile!(id)
    render(conn, "show.html", student_profile: student_profile)
  end

  def edit(conn, %{"id" => id}) do
    student_profile = Account.get_user_profile(conn.assigns.current_user)
    changeset = Account.change_student_profile(student_profile)
    render(conn, "edit.html", student_profile: student_profile, changeset: changeset)
  end

  def edit_profile(conn, _) do
    student_profile = Account.get_user_profile(conn.assigns.current_user)
    changeset = Account.change_student_profile(student_profile)
    render(conn, "edit.html", student_profile: student_profile, changeset: changeset)

  end

  def update(conn, %{"id" => id, "student_profile" => student_profile_params}) do
    student_profile = Account.get_student_profile!(id)

    case Account.update_student_profile(student_profile, student_profile_params) do
      {:ok, student_profile} ->
        conn
        |> put_flash(:info, "Student profile updated successfully.")
        # |> redirect(to: student_profile_path(conn, :show, student_profile))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", student_profile: student_profile, changeset: changeset)
    end
  end

  def update_profile(conn, %{"student_profile" =>params}) do
    profile = Account.get_user_profile(conn.assigns.current_user)
    case Account.update_student_profile(profile, params) do
      {:ok, profile} ->
        conn
        |> put_flash(:info, "Profile updated successfully.")
        |> redirect(to: profile_path(conn, :show_profile))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    student_profile = Account.get_student_profile!(id)
    {:ok, _student_profile} = Account.delete_student_profile(student_profile)

    conn
    |> put_flash(:info, "Student profile deleted successfully.")
    # |> redirect(to: student_profile_path(conn, :index))
  end
end
