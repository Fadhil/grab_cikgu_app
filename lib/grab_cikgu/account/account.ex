defmodule GrabCikgu.Account do
  @moduledoc """
  The boundary for the Account system.
  """

  import Ecto.Query, warn: false
  alias GrabCikgu.Repo
  alias GrabCikgu.Account.Video
  alias GrabCikgu.Account.User

  @doc """
  Returns the list of videos.

  ## Examples

      iex> list_videos()
      [%Video{}, ...]

  """
  def list_videos do
    Repo.all(Video)
  end

  @doc """
  Gets a single video.

  Raises `Ecto.NoResultsError` if the Video does not exist.

  ## Examples

      iex> get_video!(123)
      %Video{}

      iex> get_video!(456)
      ** (Ecto.NoResultsError)

  """
  def get_video!(id), do: Repo.get!(Video, id)

  @doc """
  Creates a video.

  ## Examples

      iex> create_video(%{field: value})
      {:ok, %Video{}}

      iex> create_video(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_video(attrs \\ %{}) do
    %Video{}
    |> Video.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a video.

  ## Examples

      iex> update_video(video, %{field: new_value})
      {:ok, %Video{}}

      iex> update_video(video, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_video(%Video{} = video, attrs) do
    video
    |> Video.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Video.

  ## Examples

      iex> delete_video(video)
      {:ok, %Video{}}

      iex> delete_video(video)
      {:error, %Ecto.Changeset{}}

  """
  def delete_video(%Video{} = video) do
    Repo.delete(video)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking video changes.

  ## Examples

      iex> change_video(video)
      %Ecto.Changeset{source: %Video{}}

  """
  def change_video(%Video{} = video) do
    Video.changeset(video, %{})
  end


  alias GrabCikgu.Account.Profile

  @doc """
  Returns the list of profiles.

  ## Examples

      iex> list_profiles()
      [%Profile{}, ...]

  """
  def list_profiles do
    Repo.all(Profile)
  end

  @doc """
  Gets a single profile.

  Raises `Ecto.NoResultsError` if the Profile does not exist.

  ## Examples

      iex> get_profile!(123)
      %Profile{}

      iex> get_profile!(456)
      ** (Ecto.NoResultsError)

  """
  def get_profile!(id), do: Repo.get!(Profile, id)

  @doc """
  Creates a profile.

  ## Examples

      iex> create_profile(%{field: value})
      {:ok, %Profile{}}

      iex> create_profile(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_profile(attrs \\ %{}) do
    %Profile{}
    |> Profile.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a profile.

  ## Examples

      iex> update_profile(profile, %{field: new_value})
      {:ok, %Profile{}}

      iex> update_profile(profile, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_profile(%Profile{} = profile, attrs) do
    profile
    |> Profile.changeset(attrs)
    |> Repo.update()
  end


  @doc """
  Deletes a Profile.

  ## Examples

      iex> delete_profile(profile)
      {:ok, %Profile{}}

      iex> delete_profile(profile)
      {:error, %Ecto.Changeset{}}

  """
  def delete_profile(%Profile{} = profile) do
    Repo.delete(profile)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking profile changes.

  ## Examples

      iex> change_profile(profile)
      %Ecto.Changeset{source: %Profile{}}

  """
  def change_profile(%Profile{} = profile) do
    Profile.changeset(profile, %{})
  end

  def get_user_profile(user) do
    user = user |> Repo.preload([:profile, :student_profile, :role, :teaching_subjects])
    profile = case user.role.name do
      "Tutor" ->
        if user.profile == nil do
          Ecto.build_assoc(user, :profile)
        else
          user.profile
        end
      "Student" ->
        if user.student_profile == nil do
          Ecto.build_assoc(user, :student_profile)
        else
          user.student_profile
        end
    end
    profile
  end



  alias GrabCikgu.Account.Role

  def list_roles do
    Repo.all(Role)
  end

  def get_role!(id), do: Repo.get!(Role, id)

  alias GrabCikgu.Account.StudentProfile

  @doc """
  Returns the list of student_profiles.

  ## Examples

      iex> list_student_profiles()
      [%StudentProfile{}, ...]

  """
  def list_student_profiles do
    Repo.all(StudentProfile)
  end

  @doc """
  Gets a single student_profile.

  Raises `Ecto.NoResultsError` if the Student profile does not exist.

  ## Examples

      iex> get_student_profile!(123)
      %StudentProfile{}

      iex> get_student_profile!(456)
      ** (Ecto.NoResultsError)

  """
  def get_student_profile!(id), do: Repo.get!(StudentProfile, id)

  @doc """
  Creates a student_profile.

  ## Examples

      iex> create_student_profile(%{field: value})
      {:ok, %StudentProfile{}}

      iex> create_student_profile(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_student_profile(attrs \\ %{}) do
    %StudentProfile{}
    |> StudentProfile.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a student_profile.

  ## Examples

      iex> update_student_profile(student_profile, %{field: new_value})
      {:ok, %StudentProfile{}}

      iex> update_student_profile(student_profile, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_student_profile(%StudentProfile{} = student_profile, attrs) do
    student_profile
    |> StudentProfile.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a StudentProfile.

  ## Examples

      iex> delete_student_profile(student_profile)
      {:ok, %StudentProfile{}}

      iex> delete_student_profile(student_profile)
      {:error, %Ecto.Changeset{}}

  """
  def delete_student_profile(%StudentProfile{} = student_profile) do
    Repo.delete(student_profile)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking student_profile changes.

  ## Examples

      iex> change_student_profile(student_profile)
      %Ecto.Changeset{source: %StudentProfile{}}

  """
  def change_student_profile(%StudentProfile{} = student_profile) do
    StudentProfile.changeset(student_profile, %{})
  end

  def generate_blank_profile(changeset_user, role) do
    cup = case role.name do
      "Tutor" ->
        changeset_profile = Profile.changeset(%Profile{}, %{})
        changeset_user_profile = Ecto.Changeset.put_assoc(changeset_user, :profile, changeset_profile)
        changeset_user_profile
      "Student" ->
        changeset_profile = StudentProfile.changeset(%StudentProfile{}, %{})
        changeset_user_profile = Ecto.Changeset.put_assoc(changeset_user, :student_profile, changeset_profile)
        changeset_user_profile
    end
  end

  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end
end
