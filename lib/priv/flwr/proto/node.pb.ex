defmodule Flwr.Proto.Node do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :node_id, 1, type: :sint64, json_name: "nodeId"
  field :anonymous, 2, type: :bool
end