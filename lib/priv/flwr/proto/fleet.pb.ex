defmodule Flwr.Proto.CreateNodeRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Flwr.Proto.CreateNodeResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :node, 1, type: Flwr.Proto.Node
end

defmodule Flwr.Proto.DeleteNodeRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :node, 1, type: Flwr.Proto.Node
end

defmodule Flwr.Proto.DeleteNodeResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Flwr.Proto.PullTaskInsRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :node, 1, type: Flwr.Proto.Node
  field :task_ids, 2, repeated: true, type: :string, json_name: "taskIds"
end

defmodule Flwr.Proto.PullTaskInsResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :reconnect, 1, type: Flwr.Proto.Reconnect
  field :task_ins_list, 2, repeated: true, type: Flwr.Proto.TaskIns, json_name: "taskInsList"
end

defmodule Flwr.Proto.PushTaskResRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :task_res_list, 1, repeated: true, type: Flwr.Proto.TaskRes, json_name: "taskResList"
end

defmodule Flwr.Proto.PushTaskResResponse.ResultsEntry do
  @moduledoc false

  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: :uint32
end

defmodule Flwr.Proto.PushTaskResResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :reconnect, 1, type: Flwr.Proto.Reconnect
  field :results, 2, repeated: true, type: Flwr.Proto.PushTaskResResponse.ResultsEntry, map: true
end

defmodule Flwr.Proto.Reconnect do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :reconnect, 1, type: :uint64
end