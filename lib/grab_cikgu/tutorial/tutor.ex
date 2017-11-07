defmodule GrabCikgu.Tutorial.Tutor do
  use GrabCikgu.Web, :model

  schema "users" do
    field :name, :string
    field :username, :string
    has_one :profile, GrabCikgu.Account.Profile
    belongs_to :role, GrabCikgu.Account.Role, on_replace: :nilify
    has_many :teaching_subjects, GrabCikgu.Tutorial.TeachingSubject, foreign_key: :user_id
    has_many :subjects, through: [:teaching_subjects, :subject]
  end
end
