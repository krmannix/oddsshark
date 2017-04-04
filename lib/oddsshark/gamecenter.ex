defmodule OddsShark.Gamecenter do
  @base_path "gamecenter"

  def get(league, id) do
    make_request(league, id)
  end

  defp make_request(league, id) do
    get_path(league, id)
    |> OddsShark.get_request
  end

  defp get_path(league, id) do
    Path.join([@base_path, league, id])
  end

end
