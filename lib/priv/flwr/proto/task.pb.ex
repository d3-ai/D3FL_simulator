defmodule Flwr.Proto.Task do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :producer, 1, type: Flwr.Proto.Node
  field :consumer, 2, type: Flwr.Proto.Node
  field :created_at, 3, type: :string, json_name: "createdAt"
  field :delivered_at, 4, type: :string, json_name: "deliveredAt"
  field :ttl, 5, type: :string
  field :ancestry, 6, repeated: true, type: :string
  field :sa, 7, type: Flwr.Proto.SecureAggregation

  field :legacy_server_message, 101,
    type: Flwr.Proto.ServerMessage,
    json_name: "legacyServerMessage",
    deprecated: true

  field :legacy_client_message, 102,
    type: Flwr.Proto.ClientMessage,
    json_name: "legacyClientMessage",
    deprecated: true
end

defmodule Flwr.Proto.TaskIns do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :task_id, 1, type: :string, json_name: "taskId"
  field :group_id, 2, type: :string, json_name: "groupId"
  field :workload_id, 3, type: :sint64, json_name: "workloadId"
  field :task, 4, type: Flwr.Proto.Task
end

defmodule Flwr.Proto.TaskRes do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :task_id, 1, type: :string, json_name: "taskId"
  field :group_id, 2, type: :string, json_name: "groupId"
  field :workload_id, 3, type: :sint64, json_name: "workloadId"
  field :task, 4, type: Flwr.Proto.Task
end

defmodule Flwr.Proto.Value.DoubleList do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :vals, 1, repeated: true, type: :double
end

defmodule Flwr.Proto.Value.Sint64List do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :vals, 1, repeated: true, type: :sint64
end

defmodule Flwr.Proto.Value.BoolList do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :vals, 1, repeated: true, type: :bool
end

defmodule Flwr.Proto.Value.StringList do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :vals, 1, repeated: true, type: :string
end

defmodule Flwr.Proto.Value.BytesList do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :vals, 1, repeated: true, type: :bytes
end

defmodule Flwr.Proto.Value do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :value, 0

  field :double, 1, type: :double, oneof: 0
  field :sint64, 2, type: :sint64, oneof: 0
  field :bool, 3, type: :bool, oneof: 0
  field :string, 4, type: :string, oneof: 0
  field :bytes, 5, type: :bytes, oneof: 0
  field :double_list, 21, type: Flwr.Proto.Value.DoubleList, json_name: "doubleList", oneof: 0
  field :sint64_list, 22, type: Flwr.Proto.Value.Sint64List, json_name: "sint64List", oneof: 0
  field :bool_list, 23, type: Flwr.Proto.Value.BoolList, json_name: "boolList", oneof: 0
  field :string_list, 24, type: Flwr.Proto.Value.StringList, json_name: "stringList", oneof: 0
  field :bytes_list, 25, type: Flwr.Proto.Value.BytesList, json_name: "bytesList", oneof: 0
end

defmodule Flwr.Proto.SecureAggregation.NamedValuesEntry do
  @moduledoc false

  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: Flwr.Proto.Value
end

defmodule Flwr.Proto.SecureAggregation do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :named_values, 1,
    repeated: true,
    type: Flwr.Proto.SecureAggregation.NamedValuesEntry,
    json_name: "namedValues",
    map: true
end