defmodule GrabCikgu.Web.StudentProfileControllerTest do
  # use GrabCikgu.Web.ConnCase
  #
  # alias GrabCikgu.Account
  #
  # @create_attrs %{age: 42, gender: "some gender", grade: "some grade", ic_no: "some ic_no", name: "some name", school: "some school"}
  # @update_attrs %{age: 43, gender: "some updated gender", grade: "some updated grade", ic_no: "some updated ic_no", name: "some updated name", school: "some updated school"}
  # @invalid_attrs %{age: nil, gender: nil, grade: nil, ic_no: nil, name: nil, school: nil}
  #
  # def fixture(:student_profile) do
  #   {:ok, student_profile} = Account.create_student_profile(@create_attrs)
  #   student_profile
  # end
  #
  # test "lists all entries on index", %{conn: conn} do
  #   conn = get conn, student_profile_path(conn, :index)
  #   assert html_response(conn, 200) =~ "Listing Student profiles"
  # end
  #
  # test "renders form for new student_profiles", %{conn: conn} do
  #   conn = get conn, student_profile_path(conn, :new)
  #   assert html_response(conn, 200) =~ "New Student profile"
  # end
  #
  # test "creates student_profile and redirects to show when data is valid", %{conn: conn} do
  #   conn = post conn, student_profile_path(conn, :create), student_profile: @create_attrs
  #
  #   assert %{id: id} = redirected_params(conn)
  #   assert redirected_to(conn) == student_profile_path(conn, :show, id)
  #
  #   conn = get conn, student_profile_path(conn, :show, id)
  #   assert html_response(conn, 200) =~ "Show Student profile"
  # end
  #
  # test "does not create student_profile and renders errors when data is invalid", %{conn: conn} do
  #   conn = post conn, student_profile_path(conn, :create), student_profile: @invalid_attrs
  #   assert html_response(conn, 200) =~ "New Student profile"
  # end
  #
  # test "renders form for editing chosen student_profile", %{conn: conn} do
  #   student_profile = fixture(:student_profile)
  #   conn = get conn, student_profile_path(conn, :edit, student_profile)
  #   assert html_response(conn, 200) =~ "Edit Student profile"
  # end
  #
  # test "updates chosen student_profile and redirects when data is valid", %{conn: conn} do
  #   student_profile = fixture(:student_profile)
  #   conn = put conn, student_profile_path(conn, :update, student_profile), student_profile: @update_attrs
  #   assert redirected_to(conn) == student_profile_path(conn, :show, student_profile)
  #
  #   conn = get conn, student_profile_path(conn, :show, student_profile)
  #   assert html_response(conn, 200) =~ "some updated gender"
  # end
  #
  # test "does not update chosen student_profile and renders errors when data is invalid", %{conn: conn} do
  #   student_profile = fixture(:student_profile)
  #   conn = put conn, student_profile_path(conn, :update, student_profile), student_profile: @invalid_attrs
  #   assert html_response(conn, 200) =~ "Edit Student profile"
  # end
  #
  # test "deletes chosen student_profile", %{conn: conn} do
  #   student_profile = fixture(:student_profile)
  #   conn = delete conn, student_profile_path(conn, :delete, student_profile)
  #   assert redirected_to(conn) == student_profile_path(conn, :index)
  #   assert_error_sent 404, fn ->
  #     get conn, student_profile_path(conn, :show, student_profile)
  #   end
  # end
end
