package com.jiea.mustang.task;

import java.util.concurrent.TimeUnit;

public class TestTask implements Runnable{

    @Override
    public void run() {
        try {
            TimeUnit.SECONDS.sleep(5);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println("测试Spring线程池");
    }

}
