defmodule OddsShark do
  @moduledoc """
  OddsShark implements wrapper functions around the OddsShark service
  """

  @doc """
  Returns current days matchups for the league
  """
  def matchups(league) do
    OddsShark.MatchupAPI.get(league)
  end

  @doc """
  Returns current days matchups for the league
  """
  def ticker(league) do
    OddsShark.TickerAPI.get(league)
  end

  @doc """
  Returns current days scores for the league
  """
  def scores(league) do
    OddsShark.ScoreAPI.get(league)
  end

  @doc """
  Returns scores for the league and date
  """
  def scores(league, date) do
    OddsShark.ScoreAPI.get(league, date)
  end

  @doc """
  Returns gamecenters for the matchup
  """
  def gamecenter(league, id) do
    OddsShark.GamecenterAPI.get(league, id)
  end

  @doc """
  Returns play by plays for the matchup
  """
  def play_by_play(league, id) do
    OddsShark.PlayByPlayAPI.get(league, id)
  end

end
