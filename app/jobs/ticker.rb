ticker_items = [
  "Staff meeting today in the cafeteria today at 10am.  &nbsp;&nbsp; Don't forget to give yourself 20 minutes to walk over there.",
	"The Dashing Widget Challenge deadline has been moved to September 26th.  &nbsp;&nbsp;  Don't delay in getting your awesome widget submitted!"
]
 
Dashing.scheduler.every '5m', first_in: 1.second.since, allow_overlapping: false do
	Dashing.send_event( 'ticker_lax', { :items => ticker_items } )
end