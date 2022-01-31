# GraphqlTest

Minimal test application for the [Neuron](https://github.com/uesteibar/neuron) GraphQL client.
Uses the public [StarWars API](https://graphql.org/swapi-graphql?query=%0A%7B%0A%20%20allFilms%20%7B%0A%20%20%20%20films%20%7B%0A%20%20%20%20%20%20title%0A%20%20%20%20%7D%0A%20%20%7D%0A%7D).

## Installation

Clone it; navigate to it.
```
$ git clone git@github.com:josef-bolt/elixir_graphql_test.git && cd elixir_graphql_test
```

Get dependencies.
```
$ mix deps.get
```

## Usage

This is a demo tool intended to be used via `iex`.
```
$ iex -S mix
iex> GraphqlTest.StarwarsApi.fetch_planets()
{:ok,
 %Neuron.Response{
   body: %{
     "data" => %{
       "allPlanets" => %{
         "planets" => [
           %{
             "climates" => ["arid"],
             "id" => "cGxhbmV0czox",
             "name" => "Tatooine",
             "population" => 200000,
             "terrains" => ["desert"]
           },
           ...
        ]
      }
    }
  },
  headers: [
       {"access-control-allow-origin", "*"},
       {"cache-control", "no-cache"},
       {"content-length", "7818"},
       {"content-type", "application/json; charset=utf-8"},
       {"date", "Mon, 31 Jan 2022 14:20:31 GMT"},
       {"etag", "W/\"1e8a-b+q1kp1whzJvD32BuvoS6GMjEvk\""},
       {"server", "Netlify"},
       {"x-nf-request-id", "01FTR84EDA6RTNB89NH0ZJK4MA"},
       {"age", "0"},
       {"x-powered-by", "Express"}
     ],
     status_code: 200
   }}

iex> GraphqlTest.StarwarsApi.fetch_planet("cGxhbmV0czox")
{:ok,
 %Neuron.Response{
   body: %{
     "data" => %{
       "planet" => %{
         "id" => "cGxhbmV0czox",
         "name" => "Tatooine",
         "population" => 200000
       }
     }
   },
   headers: [
     {"access-control-allow-origin", "*"},
     {"cache-control", "no-cache"},
     {"content-length", "79"},
     {"content-type", "application/json; charset=utf-8"},
     {"date", "Mon, 31 Jan 2022 14:25:55 GMT"},
     {"etag", "W/\"4f-EFDg6CNzNZhGLm+HShmcdE/8+l0\""},
     {"server", "Netlify"},
     {"x-nf-request-id", "01FTR8EAFTJQ9BFGE0ZH5G2TEE"},
     {"age", "0"},
     {"x-powered-by", "Express"}
   ],
   status_code: 200
 }

```

The magic is split between three modules.
1. [`GraphqlTest.Client`](https://github.com/josef-bolt/elixir_graphql_test/blob/master/lib/graphql_test/client.ex) defines a GraphQL client behaviour making it easier to swap out implementations and to test using a robust mocking library like [Mox](https://hexdocs.pm/mox/Mox.html) which allows for safe async mocking in tests.
2. [`GraphqlTest.Neuron`](https://github.com/josef-bolt/elixir_graphql_test/blob/master/lib/graphql_test/neuron.ex) implements `GraphqlTest.Client` using the [Neuron](https://github.com/uesteibar/neuron) library.
3. [`GraphqlTest.StarwarsApi`](https://github.com/josef-bolt/elixir_graphql_test/blob/master/lib/graphql_test/starwars_api.ex) implements the logic specific for hitting the StarWars API.

