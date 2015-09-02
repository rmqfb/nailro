package com.nailro.factory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class SizeCommand extends Command {
	private static final Logger Logger = LoggerFactory.getLogger(SizeCommand.class);
	
	@Override
	public void execute() {
		Logger.info("전체목록수");
	}
	@Override
	public void execute(int theme) {
		setTheme(theme);
		Logger.info("테마별 목록수");
	}
}
