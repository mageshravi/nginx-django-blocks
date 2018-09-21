# test.py
def application(env, start_response):
	start_response('200_OK', [('Content-Type', 'text/html')])
	return [b"Hello world"]

