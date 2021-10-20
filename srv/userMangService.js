/* eslint-disable no-undef */
const cds = require ('@sap/cds'); //require('./workarounds')

class UserMangService extends cds.ApplicationService {
init() {

const { Users } = this.entities

this.before ('CREATE', 'Users', async req => {
    const { maxID } = await SELECT.one `max(seqID) as maxID` .from (Users)
    req.data.seqId = maxID + 1

  this.before ('SAVE', 'Users', async req => {
    const { userId } = req.data.userId;
    const { emailds } = await SELECT `userId` .from (Users);
    // eslint-disable-next-line no-undef
    alert(userId);
    alert(emailds);
    throw req.reject (400, emailds);
    // const { maxID } = await SELECT.one `max(BookingID) as maxID` .from (Booking.drafts) .where ({to_Travel_TravelUUID})
    // req.data.BookingID = maxID + 1
    // req.data.BookingStatus_code = 'N'
    // req.data.BookingDate = (new Date).toISOString().slice(0,10) // today
  })

 })

return super.init()
}}
module.exports = {UserMangService}