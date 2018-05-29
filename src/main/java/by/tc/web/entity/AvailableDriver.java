package by.tc.web.entity;

import java.io.Serializable;
import java.util.Objects;

public class AvailableDriver implements Serializable {
    private static final long serialVersionUID = -8240602909506003140L;
    private Driver driver;
    private double distance;
    private String arrival_time;
    private String cost;

    public Driver getDriver() {
        return driver;
    }

    public void setDriver(Driver driver) {
        this.driver = driver;
    }

    public double getDistance() {
        return distance;
    }

    public void setDistance(double distance) {
        this.distance = distance;
    }

    public String getArrival_time() {
        return arrival_time;
    }

    public void setArrival_time(String arrival_time) {
        this.arrival_time = arrival_time;
    }

    public String getCost() {
        return cost;
    }

    public void setCost(String cost) {
        this.cost = cost;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof AvailableDriver)) return false;
        AvailableDriver that = (AvailableDriver) o;
        return Double.compare(that.getDistance(), getDistance()) == 0 &&
                Objects.equals(getDriver(), that.getDriver()) &&
                Objects.equals(getArrival_time(), that.getArrival_time()) &&
                Objects.equals(getCost(), that.getCost());
    }

    @Override
    public int hashCode() {

        return Objects.hash(getDriver(), getDistance(), getArrival_time(), getCost());
    }

    @Override
    public String toString() {
        return "AvailableDriver{" +
                "driver=" + driver +
                ", distance=" + distance +
                ", arrival_time='" + arrival_time + '\'' +
                ", cost='" + cost + '\'' +
                '}';
    }
}
