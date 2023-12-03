defmodule D3flSimulator.SamplePythonCallFlower do
  use Export.Python

  def call_python_method do
    # path to our python files
    {:ok, py} = Python.start(python_path: Path.expand("lib/priv/python"))

    # call "upcase" method from "test" file with "hello" argument
    # py |> Python.call("my_module", "duplicate", ["hello"])

    # same as above but prettier
    val = py |> Python.call(sample(), from_file: "flower_sample")

    # close the Python process
    py |> Python.stop()

    val
  end
end
