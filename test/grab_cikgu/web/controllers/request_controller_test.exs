defmodule GrabCikgu.Web.RequestControllerTest do
  use GrabCikgu.Web.ConnCase

  alias GrabCikgu.Tutorial

  @create_attrs %{remark: "some remark"}
  @update_attrs %{remark: "some updated remark"}
  @invalid_attrs %{remark: nil}

  def fixture(:request) do
    {:ok, request} = Tutorial.create_request(@create_attrs)
    request
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, request_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing Requests"
  end

  test "renders form for new requests", %{conn: conn} do
    conn = get conn, request_path(conn, :new)
    assert html_response(conn, 200) =~ "New Request"
  end

  test "creates request and redirects to show when data is valid", %{conn: conn} do
    conn = post conn, request_path(conn, :create), request: @create_attrs

    assert %{id: id} = redirected_params(conn)
    assert redirected_to(conn) == request_path(conn, :show, id)

    conn = get conn, request_path(conn, :show, id)
    assert html_response(conn, 200) =~ "Show Request"
  end

  test "does not create request and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, request_path(conn, :create), request: @invalid_attrs
    assert html_response(conn, 200) =~ "New Request"
  end

  test "renders form for editing chosen request", %{conn: conn} do
    request = fixture(:request)
    conn = get conn, request_path(conn, :edit, request)
    assert html_response(conn, 200) =~ "Edit Request"
  end

  test "updates chosen request and redirects when data is valid", %{conn: conn} do
    request = fixture(:request)
    conn = put conn, request_path(conn, :update, request), request: @update_attrs
    assert redirected_to(conn) == request_path(conn, :show, request)

    conn = get conn, request_path(conn, :show, request)
    assert html_response(conn, 200) =~ "some updated remark"
  end

  test "does not update chosen request and renders errors when data is invalid", %{conn: conn} do
    request = fixture(:request)
    conn = put conn, request_path(conn, :update, request), request: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit Request"
  end

  test "deletes chosen request", %{conn: conn} do
    request = fixture(:request)
    conn = delete conn, request_path(conn, :delete, request)
    assert redirected_to(conn) == request_path(conn, :index)
    assert_error_sent 404, fn ->
      get conn, request_path(conn, :show, request)
    end
  end
end
