package Survey;

public class SurveyDTO {
	
	int answer;
	String id;
	
	public SurveyDTO(String id, int answer)
	{
		this.id = id;
		this.answer = answer;
	}
	
	public int getAnswer() {
		return answer;
	}
	public void setAnswer(int answer) {
		this.answer = answer;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

}
