defmodule D3flSimulator.SamplePythonCallServClient do
  use Export.Python

  def call_python_flower_server do
    # path to our python files
    {:ok, py} = Python.start(python_path: Path.expand("lib/priv/python"))

    _val_server = py |> Python.call(main(), from_file: "server")

    # close the Python process
    py |> Python.stop()
  end

  def call_python_flower_client(cid) do
    # path to our python files
    {:ok, py} = Python.start(python_path: Path.expand("lib/priv/python"))

    _val_client = py |> Python.call(main(cid), from_file: "client_pytorch")

    # close the Python process
    py |> Python.stop()
  end
end
