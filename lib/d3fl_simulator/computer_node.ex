defmodule D3flSimulator.ComputerNode do
  require Logger
  use GenServer
  alias D3flSimulator.Utils
  alias D3flSimulator.Channel

  defmodule State do
    defstruct node_id: nil,
              model: nil,
              data: nil,
              comm_available: true,
              recv_model_queue: :queue.new
  end
  #TODO:  計算available, 測定などを足す

  def start_link({_, _, node_index} = args_tuple) do
    GenServer.start_link(
      __MODULE__,
      args_tuple,
      name: Utils.get_process_name(__MODULE__, node_index)
    )
  end

  def init({model, data, node_id}) do
    {:ok,
    %State{
      node_id: node_id,
      model: model,
      data: data
    }}
  end

  def check_comm_avail(recv_node_index) do
    comm_avail = GenServer.call(
      Utils.get_process_name(__MODULE__, recv_node_index),
      :check_comm_avail
    )
    comm_avail
  end

  def send_model(send_node_index, recv_node_index) do
    GenServer.call(
      Utils.get_process_name(__MODULE__, send_node_index),
      {:send_model, recv_node_index}
      )
  end

  @spec send_model_via_ch(integer(), integer()) :: :ok
  def send_model_via_ch(send_node_index, recv_node_index) do
    GenServer.cast(
      # Utils.get_process_name_from_to("Channel", send_node_index, recv_node_index),
      Utils.get_process_name(__MODULE__, send_node_index),
      {:send_model_via_ch, recv_node_index}
    )
  end

  def recv_model(to_node_index, from_node_index, model) do
    # GenServer.call(
    #   Utils.get_process_name(__MODULE__,to_node_index),
    #   {:recv_model, from_node_index, model}
    # )
    GenServer.cast(
      Utils.get_process_name(__MODULE__,to_node_index),
      {:recv_model, from_node_index, model}
    )
  end

  def get_info(node_index) do
    GenServer.call(
      Utils.get_process_name(__MODULE__, node_index),
      {:get_info})
  end

  def handle_call({:get_info}, _from, %State{recv_model_queue: _recv_queue} = state) do
    {:reply, state, state}
  end

  def handle_call(:check_comm_avail, _from, %State{comm_available: comm_avail} = state) do
    {:reply, comm_avail, state}
  end

  # def handle_call({:recv_model, _from_node_index, model}, _from, %State{recv_model_queue: queue} = state) do
  #   # TODO: from_node_index と model を一緒に保持させる
  #   IO.puts("queue in model")
  #   new_queue = :queue.in(model, queue)
  #   {:reply, :ok, %State{state | recv_model_queue: new_queue}}
  # end

  def handle_cast({:send_model, recv_node_index}, %State{model: sending_model, node_id: send_node_index} = state) do
    GenServer.cast(
      Utils.get_process_name(__MODULE__, recv_node_index),
      {:recv_model, send_node_index, sending_model}
      )
    {:noreply, state}
  end

  def handle_cast({:recv_model, _send_node_index, model}, %State{recv_model_queue: queue} = state) do
    # TODO: from_node_index と model を一緒に保持させる
    new_queue = :queue.in(model, queue)
    {:noreply, %State{state | recv_model_queue: new_queue}}
  end

  def handle_cast({:send_model_via_ch, recv_node_index}, %State{model: sending_model, node_id: send_node_index} = state) do
    Channel.transfer_model(send_node_index, recv_node_index, sending_model)
    {:noreply, state}
  end
end
