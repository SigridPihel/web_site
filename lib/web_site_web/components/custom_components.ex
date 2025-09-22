defmodule WebSiteWeb.CustomComponents do
  use Phoenix.Component

  attr :status, :string, values: ["in progress", "backlog", "done"], default: "backlog"

  def badge(assigns) do
    ~H"""
    <div class={[
      "rounded-md px-2 py-1 text-xs font-medium uppercase inline-block border",
      @status == "done" && "text-lime-600 border-lime-600 bg-lime-100",
      @status == "in progress" && "text-amber-600 border-amber-600 bg-amber-100",
      @status == "backlog" && "text-gray-600 border-gray-600 bg-gray-100"
    ]}>
      {@status}
    </div>
    """
  end
end
