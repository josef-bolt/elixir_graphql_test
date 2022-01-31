defmodule GraphqlTest.StarwarsApi do
  alias GraphqlTest.Neuron

  @endpoint "https://swapi-graphql.netlify.app/.netlify/functions/index"

  def fetch_planets, do: fetch_planets_query() |> execute()

  def fetch_planet(id), do: fetch_planet_query() |> execute(%{id: id})

  defp execute(query), do: Neuron.send(@endpoint, query)
  defp execute(query, args), do: Neuron.send(@endpoint, query, args)

  defp fetch_planets_query do
    """
    {
      allPlanets {
        planets {
          id
          name
          terrains
          climates
          population
        }
      }
    }
    """
  end

  defp fetch_planet_query do
    """
    query planet($id: ID)
    {
      planet(id: $id) {
        name
        id
        population
      }
    }
    """
  end
end
