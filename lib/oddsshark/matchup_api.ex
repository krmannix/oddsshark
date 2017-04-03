defmodule OddsShark.MatchupAPI do
  @base_path "upcoming/us"

  def get(league) do
    {_, res} =
      get_path(league)
      |> OddsShark.Request.get_request
    Map.get(res, "data")
  end

  defp get_path(league) do
    Path.join(@base_path, league)
  end

end
