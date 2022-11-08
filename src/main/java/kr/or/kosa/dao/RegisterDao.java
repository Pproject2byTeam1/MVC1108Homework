package kr.or.kosa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.or.kosa.dto.koreaMemberDto;
import kr.or.kosa.utils.ConnectionHelper;

/*
 1. DB 연결은 POOL
 2. insert 작업
 insert into mvcregister(id, pwd, email) values(?, ?, ?) 
 
 */

public class RegisterDao {

	// 전체 조회
	public List<koreaMemberDto> getMemberListAll() {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<koreaMemberDto> memberlist = new ArrayList<koreaMemberDto>();

		try {

			conn = ConnectionHelper.getConnection("oracle");

			String sql = "select * from koreaMember";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				do {
					koreaMemberDto member = new koreaMemberDto();
					member.setId(rs.getString("id"));
					member.setPwd(rs.getString("pwd"));
					member.setName(rs.getString("name"));
					member.setAge(rs.getInt("age"));
					member.setGender(rs.getString("gender"));
					member.setEmail(rs.getString("email"));
					member.setIp(rs.getString("ip"));

					memberlist.add(member);
				} while (rs.next());
			} else {
				System.out.println("조회 데이터 없음");
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}

		return memberlist;
	}

	// 조건 조회
	public koreaMemberDto getMemberById(String id) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		koreaMemberDto member = new koreaMemberDto();

		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "select * from koreaMember where id=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				member.setId(rs.getString("id"));
				member.setPwd(rs.getString("pwd"));
				member.setName(rs.getString("name"));
				member.setAge(rs.getInt("age"));
				member.setGender(rs.getString("gender"));
				member.setEmail(rs.getString("email"));
				member.setIp(rs.getString("ip"));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}

		return member;

	}

	// 삽입
	public int insertMember(koreaMemberDto member) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		int row = 0;

		try {

			conn = ConnectionHelper.getConnection("oracle");
			String sql = "insert into koreaMember(id, pwd, name, age, gender, email, ip) values(?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPwd());
			pstmt.setString(3, member.getName());
			pstmt.setInt(4, member.getAge());
			pstmt.setString(5, member.getGender());
			pstmt.setString(6, member.getEmail());
			pstmt.setString(7, member.getIp());

			row = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}

		return row;
	}

	// 데이터 수정
	public int updateOk(koreaMemberDto dto) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int row = 0;// ? parameter 값들만 전달
		Connection conn = null;

		try {
			String sql = "update koreaMember set name=?, age=?, gender=?, email=? where id=?";
			conn = ConnectionHelper.getConnection("oracle");
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(5, dto.getId());
			pstmt.setString(1, dto.getName());
			pstmt.setInt(2, dto.getAge());
			pstmt.setString(3, dto.getGender());
			pstmt.setString(4, dto.getEmail());

			row = pstmt.executeUpdate();

		} catch (Exception e) {

		} finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
		}
		return row;
	}

	// 멤버 삭제
	public int deleteOk(String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int row = 0;
		Connection conn = null;

		try {
			String sql = "delete from koreaMember where id=?";
			conn = ConnectionHelper.getConnection("oracle");
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);

			row = pstmt.executeUpdate();

		} catch (Exception e) {

		} finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			try {
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return row;
	}

	// 검색조회(LIKE)
	public List<koreaMemberDto> getMemberListBySearch(String name) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<koreaMemberDto> memberlist = new ArrayList<koreaMemberDto>();

		System.out.println(name);

		try {

			conn = ConnectionHelper.getConnection("oracle");

			String sql = "select * from koreaMember where name like ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, "%" + name + "%");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				do {
					koreaMemberDto member = new koreaMemberDto();
					member.setId(rs.getString("id"));
					member.setPwd(rs.getString("pwd"));
					member.setName(rs.getString("name"));
					member.setAge(rs.getInt("age"));
					member.setGender(rs.getString("gender"));
					member.setEmail(rs.getString("email"));
					member.setIp(rs.getString("ip"));

					memberlist.add(member);
				} while (rs.next());
			} else {
				System.out.println("조회 데이터 없음");
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}

		return memberlist;
	}

	public String isCheckById(String id) {

		Connection conn = null;
		String ismemoid = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select id from koreaMember where id=?";

		try {
			conn = ConnectionHelper.getConnection("oracle");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				ismemoid = "true";
			} else {
				ismemoid = "false";
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			try {
				ConnectionHelper.close(conn); // 반환하기
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}

		return ismemoid;

	}

}
