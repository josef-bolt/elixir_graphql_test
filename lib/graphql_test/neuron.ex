defmodule GraphqlTest.Neuron do
  @behaviour GraphqlTest.Client

  @impl
  def send(url, query, args \\ %{}) do
    Neuron.query(query, args, url: url)
  end
end
