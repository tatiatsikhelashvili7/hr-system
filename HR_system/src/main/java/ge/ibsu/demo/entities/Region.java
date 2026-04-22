package ge.ibsu.demo.entities;

import jakarta.persistence.*;

@Entity
@Table(name = "regions")
public class Region {

    @Id
    @Column(name = "region_id")
    private Long id;

    @Column(name = "region_name")
    private String name;

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }
}