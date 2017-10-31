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

  describe "peoples" do
    alias GrabCikgu.Account.People

    @valid_attrs %{icno: 42, name: "some name"}
    @update_attrs %{icno: 43, name: "some updated name"}
    @invalid_attrs %{icno: nil, name: nil}

    def people_fixture(attrs \\ %{}) do
      {:ok, people} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_people()

      people
    end

    test "list_peoples/0 returns all peoples" do
      people = people_fixture()
      assert Account.list_peoples() == [people]
    end

    test "get_people!/1 returns the people with given id" do
      people = people_fixture()
      assert Account.get_people!(people.id) == people
    end

    test "create_people/1 with valid data creates a people" do
      assert {:ok, %People{} = people} = Account.create_people(@valid_attrs)
      assert people.icno == 42
      assert people.name == "some name"
    end

    test "create_people/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_people(@invalid_attrs)
    end

    test "update_people/2 with valid data updates the people" do
      people = people_fixture()
      assert {:ok, people} = Account.update_people(people, @update_attrs)
      assert %People{} = people
      assert people.icno == 43
      assert people.name == "some updated name"
    end

    test "update_people/2 with invalid data returns error changeset" do
      people = people_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_people(people, @invalid_attrs)
      assert people == Account.get_people!(people.id)
    end

    test "delete_people/1 deletes the people" do
      people = people_fixture()
      assert {:ok, %People{}} = Account.delete_people(people)
      assert_raise Ecto.NoResultsError, fn -> Account.get_people!(people.id) end
    end

    test "change_people/1 returns a people changeset" do
      people = people_fixture()
      assert %Ecto.Changeset{} = Account.change_people(people)
    end
  end

  describe "profiles" do
    alias GrabCikgu.Account.Profile

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def profile_fixture(attrs \\ %{}) do
      {:ok, profile} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_profile()

      profile
    end

    test "list_profiles/0 returns all profiles" do
      profile = profile_fixture()
      assert Account.list_profiles() == [profile]
    end

    test "get_profile!/1 returns the profile with given id" do
      profile = profile_fixture()
      assert Account.get_profile!(profile.id) == profile
    end

    test "create_profile/1 with valid data creates a profile" do
      assert {:ok, %Profile{} = profile} = Account.create_profile(@valid_attrs)
      assert profile.name == "some name"
    end

    test "create_profile/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_profile(@invalid_attrs)
    end

    test "update_profile/2 with valid data updates the profile" do
      profile = profile_fixture()
      assert {:ok, profile} = Account.update_profile(profile, @update_attrs)
      assert %Profile{} = profile
      assert profile.name == "some updated name"
    end

    test "update_profile/2 with invalid data returns error changeset" do
      profile = profile_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_profile(profile, @invalid_attrs)
      assert profile == Account.get_profile!(profile.id)
    end

    test "delete_profile/1 deletes the profile" do
      profile = profile_fixture()
      assert {:ok, %Profile{}} = Account.delete_profile(profile)
      assert_raise Ecto.NoResultsError, fn -> Account.get_profile!(profile.id) end
    end

    test "change_profile/1 returns a profile changeset" do
      profile = profile_fixture()
      assert %Ecto.Changeset{} = Account.change_profile(profile)
    end
  end

  describe "profiles" do
    alias GrabCikgu.Account.Profile

    @valid_attrs %{icno: "some icno", name: "some name"}
    @update_attrs %{icno: "some updated icno", name: "some updated name"}
    @invalid_attrs %{icno: nil, name: nil}

    def profile_fixture(attrs \\ %{}) do
      {:ok, profile} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_profile()

      profile
    end

    test "list_profiles/0 returns all profiles" do
      profile = profile_fixture()
      assert Account.list_profiles() == [profile]
    end

    test "get_profile!/1 returns the profile with given id" do
      profile = profile_fixture()
      assert Account.get_profile!(profile.id) == profile
    end

    test "create_profile/1 with valid data creates a profile" do
      assert {:ok, %Profile{} = profile} = Account.create_profile(@valid_attrs)
      assert profile.icno == "some icno"
      assert profile.name == "some name"
    end

    test "create_profile/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_profile(@invalid_attrs)
    end

    test "update_profile/2 with valid data updates the profile" do
      profile = profile_fixture()
      assert {:ok, profile} = Account.update_profile(profile, @update_attrs)
      assert %Profile{} = profile
      assert profile.icno == "some updated icno"
      assert profile.name == "some updated name"
    end

    test "update_profile/2 with invalid data returns error changeset" do
      profile = profile_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_profile(profile, @invalid_attrs)
      assert profile == Account.get_profile!(profile.id)
    end

    test "delete_profile/1 deletes the profile" do
      profile = profile_fixture()
      assert {:ok, %Profile{}} = Account.delete_profile(profile)
      assert_raise Ecto.NoResultsError, fn -> Account.get_profile!(profile.id) end
    end

    test "change_profile/1 returns a profile changeset" do
      profile = profile_fixture()
      assert %Ecto.Changeset{} = Account.change_profile(profile)
    end
  end

  describe "student_profiles" do
    alias GrabCikgu.Account.StudentProfile

    @valid_attrs %{age: 42, gender: "some gender", grade: "some grade", ic_no: "some ic_no", name: "some name", school: "some school"}
    @update_attrs %{age: 43, gender: "some updated gender", grade: "some updated grade", ic_no: "some updated ic_no", name: "some updated name", school: "some updated school"}
    @invalid_attrs %{age: nil, gender: nil, grade: nil, ic_no: nil, name: nil, school: nil}

    def student_profile_fixture(attrs \\ %{}) do
      {:ok, student_profile} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_student_profile()

      student_profile
    end

    test "list_student_profiles/0 returns all student_profiles" do
      student_profile = student_profile_fixture()
      assert Account.list_student_profiles() == [student_profile]
    end

    test "get_student_profile!/1 returns the student_profile with given id" do
      student_profile = student_profile_fixture()
      assert Account.get_student_profile!(student_profile.id) == student_profile
    end

    test "create_student_profile/1 with valid data creates a student_profile" do
      assert {:ok, %StudentProfile{} = student_profile} = Account.create_student_profile(@valid_attrs)
      assert student_profile.age == 42
      assert student_profile.gender == "some gender"
      assert student_profile.grade == "some grade"
      assert student_profile.ic_no == "some ic_no"
      assert student_profile.name == "some name"
      assert student_profile.school == "some school"
    end

    test "create_student_profile/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_student_profile(@invalid_attrs)
    end

    test "update_student_profile/2 with valid data updates the student_profile" do
      student_profile = student_profile_fixture()
      assert {:ok, student_profile} = Account.update_student_profile(student_profile, @update_attrs)
      assert %StudentProfile{} = student_profile
      assert student_profile.age == 43
      assert student_profile.gender == "some updated gender"
      assert student_profile.grade == "some updated grade"
      assert student_profile.ic_no == "some updated ic_no"
      assert student_profile.name == "some updated name"
      assert student_profile.school == "some updated school"
    end

    test "update_student_profile/2 with invalid data returns error changeset" do
      student_profile = student_profile_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_student_profile(student_profile, @invalid_attrs)
      assert student_profile == Account.get_student_profile!(student_profile.id)
    end

    test "delete_student_profile/1 deletes the student_profile" do
      student_profile = student_profile_fixture()
      assert {:ok, %StudentProfile{}} = Account.delete_student_profile(student_profile)
      assert_raise Ecto.NoResultsError, fn -> Account.get_student_profile!(student_profile.id) end
    end

    test "change_student_profile/1 returns a student_profile changeset" do
      student_profile = student_profile_fixture()
      assert %Ecto.Changeset{} = Account.change_student_profile(student_profile)
    end
  end
end
