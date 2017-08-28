defmodule GrabCikgu.AccountTest do
  use GrabCikgu.DataCase

  alias GrabCikgu.Account

  describe "videos" do
    alias GrabCikgu.Account.Video

    @valid_attrs %{" url": "some  url", description: "some description", title: "some title"}
    @update_attrs %{" url": "some updated  url", description: "some updated description", title: "some updated title"}
    @invalid_attrs %{" url": nil, description: nil, title: nil}

    def video_fixture(attrs \\ %{}) do
      {:ok, video} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_video()

      video
    end

    test "list_videos/0 returns all videos" do
      video = video_fixture()
      assert Account.list_videos() == [video]
    end

    test "get_video!/1 returns the video with given id" do
      video = video_fixture()
      assert Account.get_video!(video.id) == video
    end

    test "create_video/1 with valid data creates a video" do
      assert {:ok, %Video{} = video} = Account.create_video(@valid_attrs)
      assert video. url == "some  url"
      assert video.description == "some description"
      assert video.title == "some title"
    end

    test "create_video/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_video(@invalid_attrs)
    end

    test "update_video/2 with valid data updates the video" do
      video = video_fixture()
      assert {:ok, video} = Account.update_video(video, @update_attrs)
      assert %Video{} = video
      assert video. url == "some updated  url"
      assert video.description == "some updated description"
      assert video.title == "some updated title"
    end

    test "update_video/2 with invalid data returns error changeset" do
      video = video_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_video(video, @invalid_attrs)
      assert video == Account.get_video!(video.id)
    end

    test "delete_video/1 deletes the video" do
      video = video_fixture()
      assert {:ok, %Video{}} = Account.delete_video(video)
      assert_raise Ecto.NoResultsError, fn -> Account.get_video!(video.id) end
    end

    test "change_video/1 returns a video changeset" do
      video = video_fixture()
      assert %Ecto.Changeset{} = Account.change_video(video)
    end
  end

  describe "videos" do
    alias GrabCikgu.Account.Video

    @valid_attrs %{description: "some description", title: "some title", url: "some url"}
    @update_attrs %{description: "some updated description", title: "some updated title", url: "some updated url"}
    @invalid_attrs %{description: nil, title: nil, url: nil}

    def video_fixture(attrs \\ %{}) do
      {:ok, video} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_video()

      video
    end

    test "list_videos/0 returns all videos" do
      video = video_fixture()
      assert Account.list_videos() == [video]
    end

    test "get_video!/1 returns the video with given id" do
      video = video_fixture()
      assert Account.get_video!(video.id) == video
    end

    test "create_video/1 with valid data creates a video" do
      assert {:ok, %Video{} = video} = Account.create_video(@valid_attrs)
      assert video.description == "some description"
      assert video.title == "some title"
      assert video.url == "some url"
    end

    test "create_video/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_video(@invalid_attrs)
    end

    test "update_video/2 with valid data updates the video" do
      video = video_fixture()
      assert {:ok, video} = Account.update_video(video, @update_attrs)
      assert %Video{} = video
      assert video.description == "some updated description"
      assert video.title == "some updated title"
      assert video.url == "some updated url"
    end

    test "update_video/2 with invalid data returns error changeset" do
      video = video_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_video(video, @invalid_attrs)
      assert video == Account.get_video!(video.id)
    end

    test "delete_video/1 deletes the video" do
      video = video_fixture()
      assert {:ok, %Video{}} = Account.delete_video(video)
      assert_raise Ecto.NoResultsError, fn -> Account.get_video!(video.id) end
    end

    test "change_video/1 returns a video changeset" do
      video = video_fixture()
      assert %Ecto.Changeset{} = Account.change_video(video)
    end
  end
end
