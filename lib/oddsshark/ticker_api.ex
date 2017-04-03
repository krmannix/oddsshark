defmodule OddsShark.TickerAPI do
  @base_path "ticker"

  def get(league) do
    {_, res} =
      get_path(league)
      |> OddsShark.Request.get_request
    Map.get(res, "matchups")
  end

  def get_path(league) do
    Path.join(@base_path, league)
  end
end
