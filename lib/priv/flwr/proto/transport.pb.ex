defmodule Flwr.Proto.Code do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :OK, 0
  field :GET_PROPERTIES_NOT_IMPLEMENTED, 1
  field :GET_PARAMETERS_NOT_IMPLEMENTED, 2
  field :FIT_NOT_IMPLEMENTED, 3
  field :EVALUATE_NOT_IMPLEMENTED, 4
end

defmodule Flwr.Proto.Reason do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :UNKNOWN, 0
  field :RECONNECT, 1
  field :POWER_DISCONNECTED, 2
  field :WIFI_UNAVAILABLE, 3
  field :ACK, 4
end

defmodule Flwr.Proto.Status do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :code, 1, type: Flwr.Proto.Code, enum: true
  field :message, 2, type: :string
end

defmodule Flwr.Proto.Parameters do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :tensors, 1, repeated: true, type: :bytes
  field :tensor_type, 2, type: :string, json_name: "tensorType"
end

defmodule Flwr.Proto.ServerMessage.ReconnectIns do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :seconds, 1, type: :int64
end

defmodule Flwr.Proto.ServerMessage.GetPropertiesIns.ConfigEntry do
  @moduledoc false

  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: Flwr.Proto.Scalar
end

defmodule Flwr.Proto.ServerMessage.GetPropertiesIns do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :config, 1,
    repeated: true,
    type: Flwr.Proto.ServerMessage.GetPropertiesIns.ConfigEntry,
    map: true
end

defmodule Flwr.Proto.ServerMessage.GetParametersIns.ConfigEntry do
  @moduledoc false

  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: Flwr.Proto.Scalar
end

defmodule Flwr.Proto.ServerMessage.GetParametersIns do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :config, 1,
    repeated: true,
    type: Flwr.Proto.ServerMessage.GetParametersIns.ConfigEntry,
    map: true
end

defmodule Flwr.Proto.ServerMessage.FitIns.ConfigEntry do
  @moduledoc false

  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: Flwr.Proto.Scalar
end

defmodule Flwr.Proto.ServerMessage.FitIns do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :parameters, 1, type: Flwr.Proto.Parameters
  field :config, 2, repeated: true, type: Flwr.Proto.ServerMessage.FitIns.ConfigEntry, map: true
end

defmodule Flwr.Proto.ServerMessage.EvaluateIns.ConfigEntry do
  @moduledoc false

  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: Flwr.Proto.Scalar
end

defmodule Flwr.Proto.ServerMessage.EvaluateIns do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :parameters, 1, type: Flwr.Proto.Parameters

  field :config, 2,
    repeated: true,
    type: Flwr.Proto.ServerMessage.EvaluateIns.ConfigEntry,
    map: true
end

defmodule Flwr.Proto.ServerMessage do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :msg, 0

  field :reconnect_ins, 1,
    type: Flwr.Proto.ServerMessage.ReconnectIns,
    json_name: "reconnectIns",
    oneof: 0

  field :get_properties_ins, 2,
    type: Flwr.Proto.ServerMessage.GetPropertiesIns,
    json_name: "getPropertiesIns",
    oneof: 0

  field :get_parameters_ins, 3,
    type: Flwr.Proto.ServerMessage.GetParametersIns,
    json_name: "getParametersIns",
    oneof: 0

  field :fit_ins, 4, type: Flwr.Proto.ServerMessage.FitIns, json_name: "fitIns", oneof: 0

  field :evaluate_ins, 5,
    type: Flwr.Proto.ServerMessage.EvaluateIns,
    json_name: "evaluateIns",
    oneof: 0
end

defmodule Flwr.Proto.ClientMessage.DisconnectRes do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :reason, 1, type: Flwr.Proto.Reason, enum: true
end

defmodule Flwr.Proto.ClientMessage.GetPropertiesRes.PropertiesEntry do
  @moduledoc false

  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: Flwr.Proto.Scalar
end

defmodule Flwr.Proto.ClientMessage.GetPropertiesRes do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :status, 1, type: Flwr.Proto.Status

  field :properties, 2,
    repeated: true,
    type: Flwr.Proto.ClientMessage.GetPropertiesRes.PropertiesEntry,
    map: true
end

defmodule Flwr.Proto.ClientMessage.GetParametersRes do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :status, 1, type: Flwr.Proto.Status
  field :parameters, 2, type: Flwr.Proto.Parameters
end

defmodule Flwr.Proto.ClientMessage.FitRes.MetricsEntry do
  @moduledoc false

  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: Flwr.Proto.Scalar
end

defmodule Flwr.Proto.ClientMessage.FitRes do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :status, 1, type: Flwr.Proto.Status
  field :parameters, 2, type: Flwr.Proto.Parameters
  field :num_examples, 3, type: :int64, json_name: "numExamples"
  field :metrics, 4, repeated: true, type: Flwr.Proto.ClientMessage.FitRes.MetricsEntry, map: true
end

defmodule Flwr.Proto.ClientMessage.EvaluateRes.MetricsEntry do
  @moduledoc false

  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: Flwr.Proto.Scalar
end

defmodule Flwr.Proto.ClientMessage.EvaluateRes do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :status, 1, type: Flwr.Proto.Status
  field :loss, 2, type: :float
  field :num_examples, 3, type: :int64, json_name: "numExamples"

  field :metrics, 4,
    repeated: true,
    type: Flwr.Proto.ClientMessage.EvaluateRes.MetricsEntry,
    map: true
end

defmodule Flwr.Proto.ClientMessage do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :msg, 0

  field :disconnect_res, 1,
    type: Flwr.Proto.ClientMessage.DisconnectRes,
    json_name: "disconnectRes",
    oneof: 0

  field :get_properties_res, 2,
    type: Flwr.Proto.ClientMessage.GetPropertiesRes,
    json_name: "getPropertiesRes",
    oneof: 0

  field :get_parameters_res, 3,
    type: Flwr.Proto.ClientMessage.GetParametersRes,
    json_name: "getParametersRes",
    oneof: 0

  field :fit_res, 4, type: Flwr.Proto.ClientMessage.FitRes, json_name: "fitRes", oneof: 0

  field :evaluate_res, 5,
    type: Flwr.Proto.ClientMessage.EvaluateRes,
    json_name: "evaluateRes",
    oneof: 0
end

defmodule Flwr.Proto.Scalar do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :scalar, 0

  field :double, 1, type: :double, oneof: 0
  field :sint64, 8, type: :sint64, oneof: 0
  field :bool, 13, type: :bool, oneof: 0
  field :string, 14, type: :string, oneof: 0
  field :bytes, 15, type: :bytes, oneof: 0
end