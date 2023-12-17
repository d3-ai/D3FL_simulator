defmodule Flwr.Proto.CreateWorkloadRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Flwr.Proto.CreateWorkloadResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :workload_id, 1, type: :sint64, json_name: "workloadId"
end

defmodule Flwr.Proto.GetNodesRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :workload_id, 1, type: :sint64, json_name: "workloadId"
end

defmodule Flwr.Proto.GetNodesResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :nodes, 1, repeated: true, type: Flwr.Proto.Node
end

defmodule Flwr.Proto.PushTaskInsRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :task_ins_list, 1, repeated: true, type: Flwr.Proto.TaskIns, json_name: "taskInsList"
end

defmodule Flwr.Proto.PushTaskInsResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :task_ids, 2, repeated: true, type: :string, json_name: "taskIds"
end

defmodule Flwr.Proto.PullTaskResRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :node, 1, type: Flwr.Proto.Node
  field :task_ids, 2, repeated: true, type: :string, json_name: "taskIds"
end

defmodule Flwr.Proto.PullTaskResResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :task_res_list, 1, repeated: true, type: Flwr.Proto.TaskRes, json_name: "taskResList"
end