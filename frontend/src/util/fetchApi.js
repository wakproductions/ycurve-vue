import axios from "axios";
import { formatDateISO8601 } from "@/util/dateUtils";

const base_url = process.env.VUE_APP_API_SERVER_URL;
export const apiEndpoints = {
  TREASURIES_TIME_SERIES: "api/v1/treasuries_time_series",
  YIELD_CURVE_SNAPSHOT: "api/v1/yield_curve_snapshot"
};

export const fetchTreasuriesTimeSeries = (startDate, endDate, series) => {
  var query_url = new URL(apiEndpoints.TREASURIES_TIME_SERIES, base_url).toString();
  return axios.get(query_url, {
    params: {
      start_date: formatDateISO8601(startDate),
      end_date: formatDateISO8601(endDate),
      series: series
    }
  });
};

export const fetchYieldCurveSnapshot = (date, offset = 0) => {
  var query_url = new URL(apiEndpoints.YIELD_CURVE_SNAPSHOT, base_url).toString();
  // console.log('date ' + formatDateISO8601(date) + ' ' + offset)
  return axios.get(query_url, { params: { date: formatDateISO8601(date), offset: offset } });
};

export const fetchApi = (api_endpoint, params) => {
  return axios.get(api_endpoint, params);
};

export default fetchApi;
