package by.tc.web.service;

import by.tc.web.entity.Point;

import java.util.Random;

public class LocationHandler {

    public static double getRandomCoordinate() {
        double rangeMin = 0;
        double rangeMax = 100;
        Random random = new Random();
        double randomValue = rangeMin + (rangeMax - rangeMin) * random.nextDouble();
        return randomValue;
    }

    public static double getDistance(Point begin, Point end) {

        return Math.sqrt(Math.pow((end.getX() - begin.getX()), 2) + Math.pow((end.getY() - begin.getY()), 2));
    }

    public static String getTimeByDistance(double distance) {
        String time = null;

        if (distance < 5) time = "7";
        if (distance < 10) time = "14";
        if (distance < 15) time = "20";
        if (distance < 30) time = "25";
        if (distance > 40) time = "30";


        return time;

    }

    public static double getCost(double distance){
        double cost = distance * 1.2;
        return cost;
    }

}
