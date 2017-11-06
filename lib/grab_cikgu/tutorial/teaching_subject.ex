defmodule GrabCikgu.Tutorial.TeachingSubject do
  use GrabCikgu.Web, :model

  alias GrabCikgu.Tutorial.TeachingSubject

  schema "teaching_subjects" do
    field :rate, :float
    field :rate_in_cents, :integer
    belongs_to :subject, GrabCikgu.Tutorial.Subject
    # belongs_to :tutor, GrabCikgu.Tutorial.Tutor, foreign_key: :user_id
    belongs_to :user, GrabCikgu.Account.User
  end

  @doc false
  def changeset(%TeachingSubject{} = teaching_subject, attrs) do
    teaching_subject
    |> cast(attrs, [:rate])
    |> validate_required([:rate])
  end
end
