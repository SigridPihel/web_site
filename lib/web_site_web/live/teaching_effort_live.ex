defmodule WebSiteWeb.StudyingEffortLive do
  use WebSiteWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, eap_count: 1, studying_hours: 26, weeks: 1)

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="studying_effort">
      <h1>📚 Studying Effort Calculator 🧮</h1>
      <section>
        <button phx-click="add" phx-value-quantity="1">
          +
        </button>
        <div>
          ({@eap_count}
        </div>
        &times;
        <div>
          {@studying_hours})
        </div>
        /
        <div>
          {@weeks})
        </div>
        =
        <div>
          {@eap_count * @studying_hours / @weeks}
        </div>
      </section>
      <form phx-submit="set-studying-hrs-per-week">
        <label>Weeks:</label>
        <input type="number" name="weeks" value={@weeks} />
      </form>
    </div>
    """
  end

  def handle_event("add", %{"quantity" => quantity}, socket) do
    socket = update(socket, :eap_count, &(&1 + String.to_integer(quantity)))

    {:noreply, socket}
  end

  def handle_event("set-studying-hrs-per-week", %{"weeks" => weeks}, socket) do
    socket = assign(socket, :weeks, String.to_integer(weeks))
    {:noreply, socket}
  end
end
