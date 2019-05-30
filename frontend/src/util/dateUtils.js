export const AMERICAN_DATE_REGEX = /\d{1,2}\/\d{1,2}\/\d\d\d\d/;
// export const EUROPEAN_DATE_REGEX = //;

export const convertStringToDate = dateString => {
  // var americanDate = reformatISO8601DateToAmericanDate(dateString);
  // return new Date(americanDate);
  return new Date(dateString)
};

export const offsetDate = (startDate, offset) => {
  var dateObj = convertStringToDate(startDate);
  return new Date(dateObj.valueOf() + (60 * 60 * 24 * 1000 * offset))
}

// TODO Do this based on regex because the date interpreter has time zone issue
// new Date('2/1/2018')
// Thu Feb 01 2018 00:00:00 GMT-0500 (Eastern Standard Time)
// new Date('2018-02-01')
// Wed Jan 31 2018 19:00:00 GMT-0500 (Eastern Standard Time)
export const reformatISO8601DateToAmericanDate = dateString => {
  var asDate = new Date(Date.parse(dateString));
  return `${asDate.getUTCMonth() + 1}/${asDate.getUTCDate()}/${asDate.getUTCFullYear()}`;
};

export const formatDateAmerican = date => {
  return `${date.getUTCMonth() + 1}/${date.getUTCDate()}/${date.getUTCFullYear()}`;
};

export const formatDateISO8601 = date => {
  return `${date.getUTCFullYear()}-${date.getUTCMonth() + 1}-${date.getUTCDate()}`;
};
