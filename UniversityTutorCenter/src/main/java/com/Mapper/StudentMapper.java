package com.Mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pojo.Student;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface StudentMapper extends BaseMapper<Student> {

//    @Select("select id,email, password, salt from user where email=#{email}") //this is use for when the UserMapper.xml is not working
//    List<Student> selectStudentByEmail(String email);
//
//    @Insert("insert into students(id,email,password,salt)values(#{id},#{email},#{password},#{salt})")
//    Student insertStudent(Student student);

    @Insert("INSERT INTO students (id, first_name, last_name, email, password, student_id) VALUES (#{id}, #{firstName},#{lastName}, #{email},#{password}, #{studentId})")
//    Student insertStudent(QueryWrapper<Student> queryWrapper);
    int insertStudent(Student student);
    @Select("select id,email, password from students where email=#{email}")
    List<Student> selectStudentByEmail(@Param("email") String email);


}
