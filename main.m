total_serve_times = zeros(100, 1);
total_wait = zeros(100, 1);
for day = 1: 100
    serve_times = 0;
    arrive = exprnd(10);
    begin = arrive;
    wait = 0;
    while begin <= 480
        arrive = arrive + exprnd(10);
        service = normrnd(10, 4);
        if service < 1
            service = 1;
        end
        if arrive > begin + service
            begin = arrive;
        else
            begin = begin + service;
            wait = wait + (begin - arrive);
        end
        serve_times = serve_times + 1;
    end
    wait = wait / serve_times;
    total_serve_times(day) = serve_times;
    total_wait(day) = wait;
end
disp(['100天平均服务人数：', num2str(mean(total_serve_times))]);
disp(['100天平均等待时间：', num2str(mean(total_wait))]);