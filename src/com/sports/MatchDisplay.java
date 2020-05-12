package com.sports;

import java.sql.Date;

public class MatchDisplay {
	
	int srno;//serial number
	Date match_date;
	String category;
	String opponent;
	String tournament;
	String result;
	public int getSrno() {
		return srno;
	}
	public void setSrno(int srno) {
		this.srno = srno;
	}
	public Date getMatch_date() {
		return match_date;
	}
	public void setMatch_date(Date match_date) {
		this.match_date = match_date;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getOpponent() {
		return opponent;
	}
	public void setOpponent(String opponent) {
		this.opponent = opponent;
	}
	public String getTournament() {
		return tournament;
	}
	public void setTournament(String tournament) {
		this.tournament = tournament;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	
}