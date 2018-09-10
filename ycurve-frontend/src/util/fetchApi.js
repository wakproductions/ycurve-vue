import axios from "axios";

const base_url='http://localhost:3030/';

export default (date) => {
  var query_url = new URL('api/v1/yield_curve_snapshot', base_url).toString()
  return axios.get(query_url, { date: '2017-12-29' })
}