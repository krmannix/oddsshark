defmodule OddsShark.Ticker do
  @base_path "ticker"

  def get(league) do
    case make_request(league) do
      {:ok, res} -> {:ok, Map.get(res, "matchups")}
      {:error, reason} -> {:error, reason}
    end
  end

  defp make_request(league) do
    get_path(league)
    |> OddsShark.get_request
  end

  def get_path(league) do
    Path.join(@base_path, league)
  end
end
