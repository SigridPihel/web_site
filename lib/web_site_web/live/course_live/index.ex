defmodule WebSiteWeb.CourseLive.Index do
  use WebSiteWeb, :live_view

  alias WebSite.Courses

  def mount(_params, _session, socket) do
    socket =
      assign(socket,
        courses: Courses.list_courses()
      )

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="course-index">
      <div class="courses">
        <.course_card :for={course <- @courses} course={course} />
      </div>
    </div>
    """
  end

  attr :course, WebSite.Course, required: true

  def course_card(assigns) do
    ~H"""
    <div class="card">
      <img src={@course.image_path} />
      <h2>{@course.title}</h2>
      <div class="details">
        <.badge status={@course.status} />
        <div class="eap">
          {@course.eap} eap
        </div>
      </div>
    </div>
    """
  end

  attr :status, :string, values: ["in progress", "backlog", "done"], default: "backlog"

  def badge(assigns) do
    ~H"""
    <div class="rounded-md px-2 py-1 text-xs font-medium uppercase inline-block border text-lime-600 border-lime-600">
      {@status}
    </div>
    """
  end
end
