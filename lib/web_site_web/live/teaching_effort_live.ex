defmodule WebSiteWeb.TeachingEffortLive do
  use WebSiteWeb, :live_view

  def mount(_params, _session, socket) do
    # students count = 52
    socket = assign(socket, students_count: 52, teaching_hours: 90)

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="teaching_effort">
      <h1>Teaching Effort Calculator 🧮</h1>
      <section>
        <div>
          {@students_count}
        </div>
        &times;
        <div>
          {@teaching_hours}
        </div>
        =
        <div>
          {@students_count * @teaching_hours}
        </div>
      </section>
    </div>
    """
  end
end
