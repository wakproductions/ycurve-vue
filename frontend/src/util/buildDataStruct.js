import { reformatISO8601DateToAmericanDate } from "@/util/dateUtils";

export const COLORS = [
  "#1ea5ff",
  "#ff0016",
  "#ccca2e",
  "#3eff64",
  "#f339ff",
  "#ffb020",
  "#222222",
  "#1971ba",
  "#ba0011",
  "#84850a",
  "#3cbb5a",
  "#ae30ba",
  "#ba7d1b",
  "#343eba"
];

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
    backgroundColor: color,
    borderColor: color,
    data: ycurve_datapoints,
    date: reformatISO8601DateToAmericanDate(apiData[0].yield_curve_date),
    fill: false,
    label: "Interest Rate"
  };
};

export const buildTimeSeriesDataStruct = apiData => {
  return {
    datasets: Object.keys(apiData[0])
      .map((keyName, index) => {
        if (keyName == "time_series_date") return null;
        return {
          backgroundColor: COLORS[index],
          borderColor: COLORS[index],
          borderWidth: 1,
          data: apiData.map(d => d[keyName]),
          fill: false,
          label: keyName,
          lineTension: 0,
          pointRadius: 0
        };
      })
      .filter(dataPoint => {
        return dataPoint != null;
      }),
    labels: apiData.map(d => d["time_series_date"])
  };
};

export const addDatapoint = (currentFullDataset, newData) => {
  currentFullDataset.push(newData);
  return currentFullDataset;
};

export const changeTopDatapoint = (currentFullDataset, newData) => {
  currentFullDataset[0].data = newData.data;
  // console.log('setting top date to ' + newData.date)
  currentFullDataset[0].date = newData.date;
  return currentFullDataset;
};

export const nextColor = currentDataset => {
  return COLORS[currentDataset.length];
};

export const resetDataset = newData => {
  return [newData];
};
