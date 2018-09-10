import { reformatEuropeanDateToAmericanDate } from '@/util/parseDate'

export default (api_data, date) => {
  var ycurve_datapoints = [
    api_data[0].yield_1m,
    api_data[0].yield_3m,
    api_data[0].yield_1y,
    api_data[0].yield_2y,
    api_data[0].yield_3y,
    api_data[0].yield_5y,
    api_data[0].yield_6m,
    api_data[0].yield_7y,
    api_data[0].yield_10y,
    api_data[0].yield_20y,
    api_data[0].yield_30y
  ]

  console.log(api_data[0].yield_curve_date)
  return {
    // borderColor: this.nextColor('#AAFF00'),
        borderColor: '#AAFF00',
        data: ycurve_datapoints,
        fill: false,
        label: reformatEuropeanDateToAmericanDate(api_data[0].yield_curve_date)
      }
}