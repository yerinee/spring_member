package kr.or.ddit.member.model;
import java.util.Date;

import javax.xml.bind.annotation.XmlRootElement;

import org.hibernate.validator.constraints.NotEmpty;

@XmlRootElement(name ="memberVo")
public class MemberVO {
	private String userid;
	private String pass;
	
	// null 이면 안되고 , empty체크
	@NotEmpty
	private String usernm;
	private String alias;
	private Date reg_dt;
	private String addr1;
	private String addr2;
	private String zipcode;
	private String filename;
	private String realfilename;
	
	public MemberVO() {
		
	}
	

	public MemberVO(String userid, String pass, String usernm, String alias, String addr1, String addr2, String zipcode,
			String filename, String realfilename) {
		super();
		this.userid = userid;
		this.pass = pass;
		this.usernm = usernm;
		this.alias = alias;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.zipcode = zipcode;
		this.filename = filename;
		this.realfilename = realfilename;
	}



	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public String getPass() {
		return pass;
	}


	public void setPass(String pass) {
		this.pass = pass;
	}


	public String getUsernm() {
		return usernm;
	}


	public void setUsernm(String usernm) {
		this.usernm = usernm;
	}


	public String getAlias() {
		return alias;
	}


	public void setAlias(String alias) {
		this.alias = alias;
	}

	
	public Date getReg_dt() {
		return reg_dt;
	}	

	public void setReg_dt(Date reg_dt) {
		this.reg_dt = reg_dt;
	}


	public String getAddr1() {
		return addr1;
	}


	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}


	public String getAddr2() {
		return addr2;
	}


	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}


	public String getZipcode() {
		return zipcode;
	}


	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}


	public String getFilename() {
		return filename;
	}


	public void setFilename(String filename) {
		this.filename = filename;
	}


	public String getRealfilename() {
		return realfilename;
	}


	public void setRealfilename(String realfilename) {
		this.realfilename = realfilename;
	}


	@Override
	public String toString() {
		return "MemberVO [userid=" + userid + ", pass=" + pass + ", usernm=" + usernm + ", alias=" + alias + ", reg_dt="
				+ reg_dt + ", addr1=" + addr1 + ", addr2=" + addr2 + ", zipcode=" + zipcode + ", filename=" + filename
				+ ", realfilename=" + realfilename + "]";
	}

	
	
}
