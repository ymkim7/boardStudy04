package kr.co.vo;

import java.util.Date;

public class ReplyVO {
	
	private Integer replyNo;
	private Integer ArticleNo;
	private String replyText;
	private String replyWriter;
	private Date regDate;
	private Date updateDate;
	
	public ReplyVO() {}

	public Integer getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(Integer replyNo) {
		this.replyNo = replyNo;
	}

	public Integer getArticleNo() {
		return ArticleNo;
	}

	public void setArticleNo(Integer articleNo) {
		ArticleNo = articleNo;
	}

	public String getReplyText() {
		return replyText;
	}

	public void setReplyText(String replyText) {
		this.replyText = replyText;
	}

	public String getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public ReplyVO(Integer replyNo, Integer articleNo, String replyText, String replyWriter, Date regDate,
			Date updateDate) {
		super();
		this.replyNo = replyNo;
		ArticleNo = articleNo;
		this.replyText = replyText;
		this.replyWriter = replyWriter;
		this.regDate = regDate;
		this.updateDate = updateDate;
	}

	@Override
	public String toString() {
		return "ReplyVO [replyNo=" + replyNo + ", ArticleNo=" + ArticleNo + ", replyText=" + replyText
				+ ", replyWriter=" + replyWriter + ", regDate=" + regDate + ", updateDate=" + updateDate
				+ ", toString()=" + super.toString() + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((ArticleNo == null) ? 0 : ArticleNo.hashCode());
		result = prime * result + ((regDate == null) ? 0 : regDate.hashCode());
		result = prime * result + ((replyNo == null) ? 0 : replyNo.hashCode());
		result = prime * result + ((replyText == null) ? 0 : replyText.hashCode());
		result = prime * result + ((replyWriter == null) ? 0 : replyWriter.hashCode());
		result = prime * result + ((updateDate == null) ? 0 : updateDate.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ReplyVO other = (ReplyVO) obj;
		if (ArticleNo == null) {
			if (other.ArticleNo != null)
				return false;
		} else if (!ArticleNo.equals(other.ArticleNo))
			return false;
		if (regDate == null) {
			if (other.regDate != null)
				return false;
		} else if (!regDate.equals(other.regDate))
			return false;
		if (replyNo == null) {
			if (other.replyNo != null)
				return false;
		} else if (!replyNo.equals(other.replyNo))
			return false;
		if (replyText == null) {
			if (other.replyText != null)
				return false;
		} else if (!replyText.equals(other.replyText))
			return false;
		if (replyWriter == null) {
			if (other.replyWriter != null)
				return false;
		} else if (!replyWriter.equals(other.replyWriter))
			return false;
		if (updateDate == null) {
			if (other.updateDate != null)
				return false;
		} else if (!updateDate.equals(other.updateDate))
			return false;
		return true;
	}

}
