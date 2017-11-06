defmodule GrabCikgu.Web.ClassControllerTest do
  # use GrabCikgu.Web.ConnCase
  #
  # alias GrabCikgu.Tutorial
  #
  # @create_attrs %{subject: "some subject"}
  # @update_attrs %{subject: "some updated subject"}
  # @invalid_attrs %{subject: nil}
  #
  # def fixture(:class) do
  #   {:ok, class} = Tutorial.create_class(@create_attrs)
  #   class
  # end
  #
  # test "lists all entries on index", %{conn: conn} do
  #   conn = get conn, class_path(conn, :index)
  #   assert html_response(conn, 200) =~ "Listing Classes"
  # end
  #
  # test "renders form for new classes", %{conn: conn} do
  #   conn = get conn, class_path(conn, :new)
  #   assert html_response(conn, 200) =~ "New Class"
  # end
  #
  # test "creates class and redirects to show when data is valid", %{conn: conn} do
  #   conn = post conn, class_path(conn, :create), class: @create_attrs
  #
  #   assert %{id: id} = redirected_params(conn)
  #   assert redirected_to(conn) == class_path(conn, :show, id)
  #
  #   conn = get conn, class_path(conn, :show, id)
  #   assert html_response(conn, 200) =~ "Show Class"
  # end
  #
  # test "does not create class and renders errors when data is invalid", %{conn: conn} do
  #   conn = post conn, class_path(conn, :create), class: @invalid_attrs
  #   assert html_response(conn, 200) =~ "New Class"
  # end
  #
  # test "renders form for editing chosen class", %{conn: conn} do
  #   class = fixture(:class)
  #   conn = get conn, class_path(conn, :edit, class)
  #   assert html_response(conn, 200) =~ "Edit Class"
  # end
  #
  # test "updates chosen class and redirects when data is valid", %{conn: conn} do
  #   class = fixture(:class)
  #   conn = put conn, class_path(conn, :update, class), class: @update_attrs
  #   assert redirected_to(conn) == class_path(conn, :show, class)
  #
  #   conn = get conn, class_path(conn, :show, class)
  #   assert html_response(conn, 200) =~ "some updated subject"
  # end
  #
  # test "does not update chosen class and renders errors when data is invalid", %{conn: conn} do
  #   class = fixture(:class)
  #   conn = put conn, class_path(conn, :update, class), class: @invalid_attrs
  #   assert html_response(conn, 200) =~ "Edit Class"
  # end
  #
  # test "deletes chosen class", %{conn: conn} do
  #   class = fixture(:class)
  #   conn = delete conn, class_path(conn, :delete, class)
  #   assert redirected_to(conn) == class_path(conn, :index)
  #   assert_error_sent 404, fn ->
  #     get conn, class_path(conn, :show, class)
  #   end
  # end
end
