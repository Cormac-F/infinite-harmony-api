package org.kainos.ea.cli;

public class Band {
    private int bandID;
    private String bandName;
    private int bandLevel;

    public Band(int bandID, String bandName, int bandLevel) {
        this.bandID = bandID;
        this.bandName = bandName;
        this.bandLevel = bandLevel;
    }
    public Band() { }

    public Band(String bandName, int bandLevel) {
        this.bandName = bandName;
        this.bandLevel = bandLevel;
    }

    public int getBandID() {
        return bandID;
    }

    public void setBandID(int bandID) {
        this.bandID = bandID;
    }

    public String getBandName() {
        return bandName;
    }

    public void setBandName(String bandName) {
        this.bandName = bandName;
    }

    public int getBandLevel() {
        return bandLevel;
    }

    public void setBandLevel(int bandLevel) {
        this.bandLevel = bandLevel;
    }
}
