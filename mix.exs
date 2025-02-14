defmodule RustlerPrecompiled.MixProject do
  use Mix.Project

  @version "0.2.0"
  @repo "https://github.com/philss/rustler_precompiled"

  def project do
    [
      app: :rustler_precompiled,
      version: @version,
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      description: "Make the usage of precompiled NIFs easier for projects using Rustler",
      package: package(),
      docs: docs(),
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger, :crypto, :inets, :public_key]
    ]
  end

  defp docs do
    [
      main: "RustlerPrecompiled",
      extras: ["PRECOMPILATION_GUIDE.md", "CHANGELOG.md"],
      source_url: @repo,
      source_ref: "v#{@version}"
    ]
  end

  defp deps do
    [
      {:rustler, "~> 0.23"},
      {:castore, "~> 0.1"},
      {:ex_doc, "~> 0.27", only: :dev},
      {:bypass, "~> 2.1", only: :test}
    ]
  end

  defp package do
    %{
      licenses: ["Apache-2.0"],
      maintainers: ["Philip Sampaio"],
      links: %{"GitHub" => @repo}
    }
  end
end
