# Rustler Precompiled

[![CI](https://github.com/philss/rustler_precompiled/actions/workflows/ci.yml/badge.svg)](https://github.com/philss/rustler_precompiled/actions/workflows/ci.yml)

This project aims to make the usage of precompiled NIFs easier
for Elixir projects using [Rustler](https://github.com/rusterlium/rustler).

Read the [blog post](https://dashbit.co/blog/rustler-precompiled) announcing Rustler precompiled, and
check the [documentation](https://hexdocs.pm/rustler_precompiled) for further details.

## Installation

The package can be installed by adding `rustler_precompiled` to your
list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:rustler_precompiled, "~> 0.2"}
  ]
end
```

## License

Copyright 2022 Philip Sampaio

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
