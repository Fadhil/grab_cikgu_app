defmodule GrabCikgu.Web.PeopleControllerTest do
  use GrabCikgu.Web.ConnCase

  alias GrabCikgu.Account

  @create_attrs %{icno: 42, name: "some name"}
  @update_attrs %{icno: 43, name: "some updated name"}
  @invalid_attrs %{icno: nil, name: nil}

  def fixture(:people) do
    {:ok, people} = Account.create_people(@create_attrs)
    people
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, people_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing Peoples"
  end

  test "renders form for new peoples", %{conn: conn} do
    conn = get conn, people_path(conn, :new)
    assert html_response(conn, 200) =~ "New People"
  end

  test "creates people and redirects to show when data is valid", %{conn: conn} do
    conn = post conn, people_path(conn, :create), people: @create_attrs

    assert %{id: id} = redirected_params(conn)
    assert redirected_to(conn) == people_path(conn, :show, id)

    conn = get conn, people_path(conn, :show, id)
    assert html_response(conn, 200) =~ "Show People"
  end

  test "does not create people and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, people_path(conn, :create), people: @invalid_attrs
    assert html_response(conn, 200) =~ "New People"
  end

  test "renders form for editing chosen people", %{conn: conn} do
    people = fixture(:people)
    conn = get conn, people_path(conn, :edit, people)
    assert html_response(conn, 200) =~ "Edit People"
  end

  test "updates chosen people and redirects when data is valid", %{conn: conn} do
    people = fixture(:people)
    conn = put conn, people_path(conn, :update, people), people: @update_attrs
    assert redirected_to(conn) == people_path(conn, :show, people)

    conn = get conn, people_path(conn, :show, people)
    assert html_response(conn, 200) =~ "some updated name"
  end

  test "does not update chosen people and renders errors when data is invalid", %{conn: conn} do
    people = fixture(:people)
    conn = put conn, people_path(conn, :update, people), people: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit People"
  end

  test "deletes chosen people", %{conn: conn} do
    people = fixture(:people)
    conn = delete conn, people_path(conn, :delete, people)
    assert redirected_to(conn) == people_path(conn, :index)
    assert_error_sent 404, fn ->
      get conn, people_path(conn, :show, people)
    end
  end
end
