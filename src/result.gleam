pub type WeatherResultAtTime {
  WeatherResultAtTime(
    // first
    time: String,
    // TODO something richer
    temperature_c: Float,
    surface_temperature_c: #(Float, Float),
    // min/max
    feels_like_c: Float,
    dew_point_c: Float,
    // second
    rain_mm_h: Float,
    snow_mm_h: Float,
    humidity_percent: Int,
    // third
    pressure_hpa: Float,
    // fourth
    wind_speed_m_s: Float,
    wind_gusts_m_s: Float,
    wind_direction_degrees: Int,
    // 0-360
    // fifth
    cloud_cover_percent: Int,
    cloud_cover_high: Int,
    cloud_cover_mid: Int,
    cloud_cover_low: Int,
    fog_fraction: Int,
  )
}
