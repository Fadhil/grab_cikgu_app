defmodule GrabCikgu.Web.RequestView do
  use GrabCikgu.Web, :view
  alias GrabCikgu.Repo
  alias GrabCikgu.Tutorial.Student

  def teaching_rate(tutor) do
    (tutor.teaching_subjects |> List.first).rate
  end

  def teaching_area(tutor) do
    tutor.profile.area
  end
  
  def subject_name(subjects) do
    teaching_subject = subjects |> List.last
    subject = teaching_subject.subject
    "#{subject.name} - #{subject.grade}"
  end

  def user_from(conn) do
    conn.assigns.current_user
  end

  def student_name(%{student_id: nil}), do: "Unknown"
  def student_name(%{student_id: student_id}=request) do
    student = Repo.get(Student, request.student_id)
    student.name
  end
end
