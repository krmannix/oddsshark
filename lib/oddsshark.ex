defmodule OddsShark do

  def matchups() do
    {_, res} = OddsShark.Request.get_request("/upcoming/us/ncaab")
    Map.get(res, "data")
  end

  def matchups(%{league: league}) do
    endpoint = Path.join("/upcoming/us", league)
    {_, res} = OddsShark.Request.get_request(endpoint)
    Map.get(res, "data")
  end

end
