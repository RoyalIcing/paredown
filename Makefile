test_watch:
	watchexec -e ex,exs $(MAKE) test_watch_run

test_watch_run:
	clear
	mix test