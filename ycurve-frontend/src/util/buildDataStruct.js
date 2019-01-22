import { reformatISO8601DateToAmericanDate } from "@/util/dateUtils";

export const COLORS = [
  '#1ea5ff',
  '#ff0016',
  '#feff1c',
  '#3eff64',
  '#f339ff',
  '#ffb020',
  '#10fff5',
  '#1971ba',
  '#ba0011',
  '#b9ba11',
  '#3cbb5a',
  '#ae30ba',
  '#ba7d1b',
  '#0dbab1',
]

export const buildDataStruct = (apiData, color) => {
  var ycurve_datapoints = [
    apiData[0].yield_1m,
    apiData[0].yield_3m,
    apiData[0].yield_6m,
    apiData[0].yield_1y,
    apiData[0].yield_2y,
    apiData[0].yield_3y,
    apiData[0].yield_5y,
    apiData[0].yield_7y,
    apiData[0].yield_10y,
    apiData[0].yield_20y,
    apiData[0].yield_30y
  ];

  return {
    borderColor: color,
    data: ycurve_datapoints,
    fill: false,
    label: reformatISO8601DateToAmericanDate(apiData[0].yield_curve_date),
    date: reformatISO8601DateToAmericanDate(apiData[0].yield_curve_date)
  };
};

export const addDataPoint = (apiData, currentDataset) => {
  var newDataset = currentDataset.unshift(buildDataStruct(apiData, nextColor()))
  return newDataset
}

export const changeTopDatapoint = (currentFullDataset, newData) => {
  var modifiedDataset = currentFullDataset
  modifiedDataset.shift()
  modifiedDataset.unshift(newData)
  return modifiedDataset
}

export const nextColor = (currentDataset) => {
  return COLORS[currentDataset.length]
}

export const resetDataset = (newData) => {
  return [newData];
};
