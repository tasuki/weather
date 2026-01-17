> This was a test. I lost interest in it...

# Wonderful Weather Widgets 🌞⛅☔🌩️🌈

I want nice meteograms. Similar to the ones on meteo.pl and perhaps even slightly better.

## Setup

One needs [mise](https://mise.jdx.dev/). I used `2025.4.1`.

```
mise install
```

Create a `mise.local.toml` and define `SECRET_KEY_BASE`.

## Develop

```
mise run dev
```

```
gleam test
```

## Production

```
mise run prod
```
