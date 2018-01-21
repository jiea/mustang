package com.jiea.mustang.common.exercise;


public class Count {
    public static void main(String[] args) {
        Calc calc = new Calc();
        new Thread(new Add(calc), "+").start();
        new Thread(new Sub(calc), "-").start();
    }

}


class Calc{
    private int num = 10;

    public void add(){
        for(int i =0; i<5; i++){
           /* try {
                Thread.sleep(2000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }*/
            num++;
            System.out.println(Thread.currentThread().getName() + " == " + num);
        }
    }

    public void sub(){
        for(int i =0; i<5; i++){
            /*try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }*/
            num--;
            System.out.println(Thread.currentThread().getName() + " == " + num);
        }
    }
}

class Add implements Runnable{

    private Calc calc;

    public Add(Calc calc){
        this.calc = calc;
    }

    @Override
    public void run() {
        calc.add();
    }
}

class Sub implements Runnable{
    private Calc calc;

    public Sub(Calc calc){
        this.calc = calc;
    }

    public void run(){
        calc.sub();
    }
}