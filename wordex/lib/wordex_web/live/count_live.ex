defmodule WordexWeb.CountLive do
  use WordexWeb, :live_view
  alias Wordex.Counters.IntegerCounter

  def mount(%{"count" => count}, _session, socket) do
    {:ok, socket |> initialize(count)}
  end

  defp initialize(socket, count) do
    assign(socket, count: IntegerCounter.new(count))
  end

  def render(assigns) do
    ~H"""
      <.count_button event="dec">-</.count_button>
      <span class="py-2 px-4 text-2xl"><%= @count %></span>
      <.count_button event="inc">+</.count_button>
    """
  end

  def handle_event("inc", _, socket) do
    {:noreply, assign(socket, :count, IntegerCounter.inc(socket.assigns.count))}
  end

  def handle_event("dec", _, socket) do
    {:noreply, assign(socket, :count, IntegerCounter.dec(socket.assigns.count))}
  end

  def count_button(assigns) do
    ~H"""
      <button class="btn btn-blue" phx-click={@event}><%= render_slot @inner_block %></button>
    """
  end
end
