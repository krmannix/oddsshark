defmodule OddsShark.Score do
  @base_path "scores"

  def get(league) do
    get(league, DateTime.utc_now())
  end

  def get(league, date) do
    make_request(league, date)
  end

  defp make_request(league, date) do
    get_path(league, date)
    |> OddsShark.get_request
  end

  defp get_path(league, date) do
    Path.join([@base_path, league, build_date_path(date)]);
  end

  defp build_date_path(date) do
    :io_lib.format("~4.B-~2..0B-~2..0B", [date.year, date.month, date.day])
  end

end
