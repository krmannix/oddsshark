defmodule OddsShark.Request do
  use HTTPoison.Base

  @moduledoc """
  Provies an API Wrapper around OddsShark
  """

  @api_root "http://io.oddsshark.com/"

  def get_request(endpoint) do
    url = create_request_url(endpoint)
    HTTPoison.get(url, create_headers())
    |> handle_response
  end

  def handle_response({:ok, %{ body: body, status_code: 200}}) do
    {:ok, process_response_body(body)}
  end

  defp create_request_url(endpoint) do
    Path.join(@api_root, endpoint)
  end

  defp create_headers do
    [{"Referer", "http://www.oddsshark.com"}]
  end

  defp process_response_body(body) do
    body
    |> Poison.decode!
  end
end
