defmodule GraphqlTest.Client do
  @callback send(url :: String.t(), query :: String.t(), args :: map()) :: {:ok, %{body: map()}}
end
