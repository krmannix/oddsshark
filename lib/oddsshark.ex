defmodule OddsShark do

  # matchups
  def matchups() do
    {_, res} = OddsShark.Request.get_request("/upcoming/us/ncaab")
    Map.get(res, "data")
  end

  def matchups(%{league: league}) do
    endpoint = Path.join("/upcoming/us", league)
    {_, res} = OddsShark.Request.get_request(endpoint)
    Map.get(res, "data")
  end

  # ticket
  def ticker(league) do
    endpoint = Path.join("/ticker", league)
    {_, res} = OddsShark.Request.get_request(endpoint)
    Map.get(res, "matchups")
  end

  # scores
  def scores() do
    now = DateTime.utc_now()
    url = Path.join("/scores/nba", :io_lib.format("~4.B-~2..0B-~2.B", [now.year, now.month, now.day]));
    {_, res} = OddsShark.Request.get_request(url)
    res
  end

  # gamecenter
  def gamecenter(league, id) do
    url =
      Path.join("/gamecenter", league)
      |> Path.join(id)
    {_, res} = OddsShark.Request.get_request(url)
    res
  end

  # play by play
  def play_by_play(league, id) do
    url =
      Path.join("/play_by_play/", league)
      |> Path.join(id)
    {_, res} = OddsShark.Request.get_request(url)
    res
  end

end
