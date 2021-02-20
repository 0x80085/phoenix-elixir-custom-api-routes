defmodule Hiveweb.HTTPClient do
  @moduledoc """
  Authenticated client to interact with PassiveTotal
  """

  @adapter {
    Tesla.Adapter.Hackney,
    [pool: :passive_total]
  }

  @doc """
  Create a new client using specified credentials
      iex> new("my@email.com", "my_apikey")
      %Tesla.Client{...}
      iex> new("my@email.com", "my_apikey", adapter: {Tesla.Adapter.Hackney, [pool: :virustotal]})
      %Tesla.Client{...}
  """
  def new(opts \\ []) do
    # username = Application.get_env(:passive_total, :username)
    # api_key = Application.get_env(:passive_total, :api_key)

    middleware = [
      {Tesla.Middleware.BaseUrl, "http://worldtimeapi.org/api/timezone/Asia"},
      Tesla.Middleware.JSON,
      {Tesla.Middleware.Timeout, timeout: Keyword.get(opts, :timeout, 5_000)},
      {Tesla.Middleware.Retry,
       delay: Keyword.get(opts, :retry_delay, 500),
       max_retries: Keyword.get(opts, :max_retries, 5)}
    ]

    adapter = Keyword.get(opts, :adapter, @adapter)

    Tesla.client(middleware, adapter)
  end
end
