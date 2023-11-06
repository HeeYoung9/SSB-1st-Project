public class ActionForward {
	private String path;
	private boolean isRedirect;

	public ActionForward() {
		System.out.println(" -------------------");
		System.out.println(" 티켓정보 생성 ");
		System.out.println(" 목적지-X, 방식-X ");
		System.out.println(" -------------------");
	}

	// alt shift s + r (get/set)
	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public boolean isRedirect() { // get메서드
		return isRedirect;
	}

	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}

	// alt+ shift s + s
	@Override
	public String toString() {
		return "ActionForward(티켓) [path(목적지)=" + path + ", isRedirect(방법)=" + isRedirect + "]";
	}
}
