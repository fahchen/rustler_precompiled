defmodule RustlerPrecompiled.Config do
  @moduledoc false
  # This is an internal struct to represent valid config options.
  defstruct [
    :otp_app,
    :module,
    :base_url,
    :version,
    :crate,
    :base_cache_dir,
    :load_data,
    :force_build?
  ]

  def new(opts) do
    version = Keyword.fetch!(opts, :version)
    otp_app = opts |> Keyword.fetch!(:otp_app) |> validate_otp_app!()
    base_url = opts |> Keyword.fetch!(:base_url) |> validate_base_url!()

    %__MODULE__{
      otp_app: otp_app,
      base_url: base_url,
      module: Keyword.fetch!(opts, :module),
      version: version,
      force_build?: pre_release?(version) or Keyword.fetch!(opts, :force_build),
      crate: opts[:crate],
      # Default to `0` like `Rustler`.
      load_data: opts[:load_data] || 0,
      base_cache_dir: opts[:base_cache_dir]
    }
  end

  defp validate_otp_app!(nil), do: raise_for_nil_field_value(:otp_app)

  defp validate_otp_app!(otp_app) do
    if is_atom(otp_app) do
      otp_app
    else
      raise "`:otp_app` is required to be an atom for `RustlerPrecompiled` options"
    end
  end

  defp validate_base_url!(nil), do: raise_for_nil_field_value(:base_url)

  defp validate_base_url!(base_url) do
    case :uri_string.parse(base_url) do
      %{} ->
        base_url

      {:error, :invalid_uri, error} ->
        raise "`:base_url` for `RustlerPrecompiled` is invalid: #{inspect(to_string(error))}"
    end
  end

  defp raise_for_nil_field_value(field) do
    raise "`#{inspect(field)}` is required for `RustlerPrecompiled`"
  end

  defp pre_release?(version) do
    "dev" in Version.parse!(version).pre
  end
end
