import axios from "axios";
import { formatDateISO8601 } from "@/util/parseDate";

const base_url='http://localhost:3030/';
export const apiEndpoints = {
  YIELD_CURVE_SNAPSHOT: 'api/v1/yield_curve_snapshot'
}

export const fetchYieldCurveSnapshot = (date) => {
  var query_url = new URL(apiEndpoints.YIELD_CURVE_SNAPSHOT, base_url).toString()
  return axios.get(query_url, { date: formatDateISO8601(date) })
}

export const fetchApi = (api_endpoint, params) => {
  return axios.get(api_endpoint, params)
}

export default fetchApi;

