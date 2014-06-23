worker_processes 4
timeout 30

@app_path = '/home/rami/OctoHookNet'
listen "#{@app_path}/run/unicorn.sock", :backlog => 64
pid "#{@app_path}/run/unicorn.pid"
