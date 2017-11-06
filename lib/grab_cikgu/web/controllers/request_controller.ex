defmodule GrabCikgu.Web.RequestController do
  use GrabCikgu.Web, :controller

  alias GrabCikgu.Tutorial
  alias GrabCikgu.Repo
  alias GrabCikgu.Account
  alias GrabCikgu.Account.Role
  alias GrabCikgu.Account.Profile
  alias GrabCikgu.Account.User

  def index(conn, _params) do
    requests = Tutorial.list_requests()
    render(conn, "index.html", requests: requests)
  end

  def new(conn, params=%{"tutor_id" => tutor_id}) do
    tutor = Tutorial.get_tutor!(tutor_id)
    changeset = Tutorial.change_request(%GrabCikgu.Tutorial.Request{tutor_id: tutor_id})
    render(conn, "new.html", changeset: changeset, tutor: tutor)
  end

  def create(conn, %{"request" => request_params}) do
    case Tutorial.create_request(request_params) do
      {:ok, request} ->
        conn
        |> put_flash(:info, "Request created successfully.")
        |> redirect(to: request_path(conn, :show, request))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    request = Tutorial.get_request!(id)
    render(conn, "show.html", request: request)
  end

  def edit(conn, %{"id" => id}) do
    request = Tutorial.get_request!(id)
    changeset = Tutorial.change_request(request)
    render(conn, "edit.html", request: request, changeset: changeset)
  end

  def update(conn, %{"id" => id, "request" => request_params}) do
    request = Tutorial.get_request!(id)

    case Tutorial.update_request(request, request_params) do
      {:ok, request} ->
        conn
        |> put_flash(:info, "Request updated successfully.")
        |> redirect(to: request_path(conn, :show, request))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", request: request, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    request = Tutorial.get_request!(id)
    {:ok, _request} = Tutorial.delete_request(request)

    conn
    |> put_flash(:info, "Request deleted successfully.")
    |> redirect(to: request_path(conn, :index))
  end
end
