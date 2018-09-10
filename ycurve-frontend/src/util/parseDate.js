export function reformatEuropeanDateToAmericanDate(dateString) {
  var asDate = new Date(Date.parse(dateString))
  return `${asDate.getMonth()+1}/${asDate.getDate()+1}/${asDate.getFullYear()}`
}