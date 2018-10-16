export const reformatEuropeanDateToAmericanDate = (dateString) => {
  var asDate = new Date(Date.parse(dateString))
  return `${asDate.getMonth()+1}/${asDate.getDate()+1}/${asDate.getFullYear()}`
}

export const formatDateAmerican = (date) => {
  return `${date.getMonth()+1}/${date.getDate()}/${date.getFullYear()}`
}
export const formatDateISO8601 = (date) => {
  return `${date.getFullYear()}-${date.getMonth()+1}-${date.getDate()}`
}
