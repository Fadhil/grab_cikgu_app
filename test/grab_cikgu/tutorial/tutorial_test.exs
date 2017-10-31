defmodule GrabCikgu.TutorialTest do
  use GrabCikgu.DataCase

  alias GrabCikgu.Tutorial

  describe "requests" do
    alias GrabCikgu.Tutorial.Request

    @valid_attrs %{remark: "some remark"}
    @update_attrs %{remark: "some updated remark"}
    @invalid_attrs %{remark: nil}

    def request_fixture(attrs \\ %{}) do
      {:ok, request} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tutorial.create_request()

      request
    end

    test "list_requests/0 returns all requests" do
      request = request_fixture()
      assert Tutorial.list_requests() == [request]
    end

    test "get_request!/1 returns the request with given id" do
      request = request_fixture()
      assert Tutorial.get_request!(request.id) == request
    end

    test "create_request/1 with valid data creates a request" do
      assert {:ok, %Request{} = request} = Tutorial.create_request(@valid_attrs)
      assert request.remark == "some remark"
    end

    test "create_request/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tutorial.create_request(@invalid_attrs)
    end

    test "update_request/2 with valid data updates the request" do
      request = request_fixture()
      assert {:ok, request} = Tutorial.update_request(request, @update_attrs)
      assert %Request{} = request
      assert request.remark == "some updated remark"
    end

    test "update_request/2 with invalid data returns error changeset" do
      request = request_fixture()
      assert {:error, %Ecto.Changeset{}} = Tutorial.update_request(request, @invalid_attrs)
      assert request == Tutorial.get_request!(request.id)
    end

    test "delete_request/1 deletes the request" do
      request = request_fixture()
      assert {:ok, %Request{}} = Tutorial.delete_request(request)
      assert_raise Ecto.NoResultsError, fn -> Tutorial.get_request!(request.id) end
    end

    test "change_request/1 returns a request changeset" do
      request = request_fixture()
      assert %Ecto.Changeset{} = Tutorial.change_request(request)
    end
  end

  describe "classes" do
    alias GrabCikgu.Tutorial.Class

    @valid_attrs %{subject: "some subject"}
    @update_attrs %{subject: "some updated subject"}
    @invalid_attrs %{subject: nil}

    def class_fixture(attrs \\ %{}) do
      {:ok, class} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tutorial.create_class()

      class
    end

    test "list_classes/0 returns all classes" do
      class = class_fixture()
      assert Tutorial.list_classes() == [class]
    end

    test "get_class!/1 returns the class with given id" do
      class = class_fixture()
      assert Tutorial.get_class!(class.id) == class
    end

    test "create_class/1 with valid data creates a class" do
      assert {:ok, %Class{} = class} = Tutorial.create_class(@valid_attrs)
      assert class.subject == "some subject"
    end

    test "create_class/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tutorial.create_class(@invalid_attrs)
    end

    test "update_class/2 with valid data updates the class" do
      class = class_fixture()
      assert {:ok, class} = Tutorial.update_class(class, @update_attrs)
      assert %Class{} = class
      assert class.subject == "some updated subject"
    end

    test "update_class/2 with invalid data returns error changeset" do
      class = class_fixture()
      assert {:error, %Ecto.Changeset{}} = Tutorial.update_class(class, @invalid_attrs)
      assert class == Tutorial.get_class!(class.id)
    end

    test "delete_class/1 deletes the class" do
      class = class_fixture()
      assert {:ok, %Class{}} = Tutorial.delete_class(class)
      assert_raise Ecto.NoResultsError, fn -> Tutorial.get_class!(class.id) end
    end

    test "change_class/1 returns a class changeset" do
      class = class_fixture()
      assert %Ecto.Changeset{} = Tutorial.change_class(class)
    end
  end
end
