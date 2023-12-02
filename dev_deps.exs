defmodule DevDeps do
  @moduledoc """
  Development and testing dependencies
  """
  def deps do
    [
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
    ]
  end
end
