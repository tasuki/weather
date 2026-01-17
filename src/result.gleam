pub type TemperatureDetails {
  TemperatureDetails(
    temperature_c: Float,
    // min/max
    surface_temperature_c: #(Float, Float),
    feels_like_c: Float,
    dew_point_c: Float,
  )
}

pub type PrecipitationDetails {
  PrecipitationDetails(
    rain_mm_h: Float,
    snow_mm_h: Float,
    humidity_percent: Int,
  )
}

pub type WindDetails {
  WindDetails(
    speed_m_s: Float,
    gusts_m_s: Float,
    // 0-360
    direction_degrees: Int,
  )
}

pub type CloudDetails {
  CloudDetails(
    cover_percent: Int,
    cover_high: Int,
    cover_mid: Int,
    cover_log: Int,
    fog_area_fraction: Int,
  )
}

pub type WeatherResultAtTime {
  WeatherResultAtTime(
    // TODO something richer
    time: String,
    temp: TemperatureDetails,
    precip: PrecipitationDetails,
    pressure_hpa: Float,
    wind: WindDetails,
    clouds: CloudDetails,
  )
}
