defmodule OddsShark do
  use HTTPoison.Base

  @moduledoc """
  HTTP requests
  """

  @api_root "http://io.oddsshark.com/"

  def get_request(endpoint) do
    url = create_request_url(endpoint)
    HTTPoison.get(url, create_headers())
    |> handle_response
  end

  def handle_response({:ok, %{body: body, status_code: 200}}) do
    {:ok, process_response_body(body)}
  end

  def handle_response({:ok, %{}}) do
    {:error, "an error occurred"}
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
