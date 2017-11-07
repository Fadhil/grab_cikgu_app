defmodule GrabCikgu.Tutorial.Subject do
  use GrabCikgu.Web, :model
  alias GrabCikgu.Repo

  schema "subjects" do
    field :name, :string
    field :grade, :string
    has_many :teaching_subjects, GrabCikgu.Tutorial.TeachingSubject, on_delete: :delete_all
    has_many :tutors, through: [:teaching_subjects, :user]
  end

  def all do
    Repo.all(__MODULE__)
  end
end
