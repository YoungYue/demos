package com.demos.biz.domain;

public class DemosException extends RuntimeException {

	private static final long serialVersionUID = 6554118948333623491L;

	public DemosException() {
		super();
	}

	public DemosException(String message, Throwable cause) {
		super(message, cause);
	}

	public DemosException(String message) {
		super(message);
	}

	public DemosException(Throwable cause) {
		super(cause);
	}

}
