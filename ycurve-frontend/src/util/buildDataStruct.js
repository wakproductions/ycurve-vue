import { reformatISO8601DateToAmericanDate } from "@/util/dateUtils";

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
    label: reformatISO8601DateToAmericanDate(apiData[0].yield_curve_date)
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
  return '#4abaff'
}

export const resetDataset = (newData) => {
  return [newData];
};
