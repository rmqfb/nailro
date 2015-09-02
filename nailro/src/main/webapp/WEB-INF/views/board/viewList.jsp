<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<!-- 	
	@ Data : 15-06-16
	@ Author :  최영인
	@ Story : 메인 페이지에 게시물 작게 출력해주는 페이지
-->

		<h2 align="center">공지사항</h2>
		<table id="homeNoticeTable">
					<!-- 테이블 -->
					<tr>
						<th width="200px">제 목</th>
						<th width="50px">등 록 일</th>
					</tr>
					<%
						for (int i = 1; i < 6; i++) {
					%>
					<tr>
						<td><a
							href="${context }/detail.nr">웹
								개발</a></td>
						<td>sfsf</td>
					</tr>
					<%
						}
					%>
						<!-- 테이블 끝 -->
		</table>
	
