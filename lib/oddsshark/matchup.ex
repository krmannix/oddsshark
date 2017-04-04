defmodule OddsShark.Matchup do
  @base_path "upcoming/us"

  def get(league) do
    case make_request(league) do
      {:ok, res} -> {:ok, Map.get(res, "data")}
      {:error, reason} -> {:error, reason}
    end
  end

  defp make_request(league) do
    get_path(league)
    |> OddsShark.get_request
  end

  defp get_path(league) do
    Path.join(@base_path, league)
  end

end
