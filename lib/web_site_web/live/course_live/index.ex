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
        <div :for={course <- @courses} class="card">
          <img src={course.image_path} />
          <h2>{course.title}</h2>
          <div class="details">
            <div class="badge">
              {course.status}
            </div>
            <div class="eap">
              {course.eap} eap
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
