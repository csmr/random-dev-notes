General LI OAuth2 Notes

* No IFrames -- just direct the user to the linkedin Url

* Flow:

	0. Make developer acc
	
	1. Your app with link click or redirect to LI acc auth url
			- with unique param 'state'
	
	2. LI auth ok ?
		* ok: code && state && state matches >> Your app return page with LI auth code
		* fail: error && description >> Your app return page with LI auth error
		* fail: state doesnt match >> CSRF alert!
	
	3. Get LI access token (POST auth code)
		* ok: json object with token and expiry date
		* fail: error?
		
	4. Access LI api
		* GET that data

Some Example Response Urls From linkedin.com

	LI ACC AUTH
	
  	In error case linkedin sends request (incorrect scope):                                                           
  	* http://www.localhost.com:8000/register-return-lii?error=invalid_scope&error_description=The+scope+of+%22r_email_address%22+is+unknown%2E+Please+check+that+it%27s+property+spelled+and+a+valid+value%2E

  	Authorization step ok:
  	* http://www.localhost.com:8000/register-return-lii?code=AQTSaaNQ7aR5a7z6kl8N1OadANSNO_lPPjFQZOaBwa3-95A_a7XSaaHXT5BaRDCf-aZBwWYNprBUVk1LQYkaG6aBRgwaqYa7avwaKddjafAaCUa2w-E&state=V0nksy
                                                                                                                   

