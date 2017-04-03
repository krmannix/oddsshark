defmodule OddsShark.PlayByPlayAPI do
  @base_path "play_by_play"

  def get(league, id) do
    {_, res} =
      get_path(league, id)
      |> OddsShark.Request.get_request
    res
  end

  defp get_path(league, id) do
    Path.join([@base_path, league, id])
  end

end
