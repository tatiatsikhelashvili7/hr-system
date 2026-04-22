package ge.ibsu.demo.repositories;

import ge.ibsu.demo.dto.DepartmentDTO;
import ge.ibsu.demo.entities.Department;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DepartmentRepository extends JpaRepository<Department, Long> {

    @Query("""
        SELECT new ge.ibsu.demo.dto.DepartmentDTO(
            d.name,
            CASE WHEN e IS NULL THEN NULL ELSE CONCAT(e.firstName, ' ', e.lastName) END,
            c.name,
            l.city,
            l.streetAddress
        )
        FROM Department d
        LEFT JOIN d.manager e
        LEFT JOIN d.location l
        LEFT JOIN l.country c
        WHERE (:country IS NULL OR c.name = :country)
          AND (:city IS NULL OR l.city = :city)
    """)
    List<DepartmentDTO> findDepartments(
            @Param("country") String country,
            @Param("city") String city
    );
}