defmodule GrabCikgu.Web.ClassController do
  use GrabCikgu.Web, :controller

  alias GrabCikgu.Tutorial
  alias GrabCikgu.Account
  alias GrabCikgu.Account.Profile
  alias GrabCikgu.Account.User
  alias GrabCikgu.Repo
  alias GrabCikgu.Account.Role

  def index(conn, _params) do
    classes = Tutorial.list_classes()
    render(conn, "index.html", classes: classes)
  end

  def new(conn, %{"request" => request_id}) do
    request = Tutorial.get_request(request_id) |> Repo.preload([:student, tutor: [:profile, teaching_subjects: [:subject]]])
    changeset = Tutorial.change_class(%GrabCikgu.Tutorial.Class{})
    render(conn, "new.html", changeset: changeset, tutor: request.tutor, request: request)
  end

  def create(conn, %{"class" => class_params}) do
    case Tutorial.create_class(class_params) do
      {:ok, class} ->
        conn
        |> put_flash(:info, "Class created successfully.")
        |> redirect(to: class_path(conn, :show, class))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    class = Tutorial.get_class!(id)
    render(conn, "show.html", class: class)
  end

  def edit(conn, %{"id" => id}) do
    class = Tutorial.get_class!(id)
    changeset = Tutorial.change_class(class)
    render(conn, "edit.html", class: class, changeset: changeset)
  end

  def update(conn, %{"id" => id, "class" => class_params}) do
    class = Tutorial.get_class!(id)

    case Tutorial.update_class(class, class_params) do
      {:ok, class} ->
        conn
        |> put_flash(:info, "Class updated successfully.")
        |> redirect(to: class_path(conn, :show, class))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", class: class, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    class = Tutorial.get_class!(id)
    {:ok, _class} = Tutorial.delete_class(class)

    conn
    |> put_flash(:info, "Class deleted successfully.")
    |> redirect(to: class_path(conn, :index))
  end
end
