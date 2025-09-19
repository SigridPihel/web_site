defmodule WebSiteWeb.TimeTrackerLive do
  use WebSiteWeb, :live_view

  def mount(_params, _session, socket) do
    if connected?(socket) do
      Process.send_after(self(), :add_second, 1000)
    end

    socket = assign(socket, seconds: 0)

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="time_tracker">
      <h1>⏰ Seconds spent on this page ⏳</h1>
      <div>
        {@seconds}
      </div>
    </div>
    """
  end

  def handle_info(:add_second, socket) do
    Process.send_after(self(), :add_second, 1000)
    {:noreply, update(socket, :seconds, &(&1 + 1))}
  end
end
