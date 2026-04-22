package ge.ibsu.demo.dto;

public class DepartmentDTO {

    private String departmentName;
    private String managerFullName;
    private String country;
    private String city;
    private String streetAddress;

    public DepartmentDTO(String departmentName, String managerFullName,
                         String country, String city, String streetAddress) {
        this.departmentName = departmentName;
        this.managerFullName = managerFullName;
        this.country = country;
        this.city = city;
        this.streetAddress = streetAddress;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public String getManagerFullName() {
        return managerFullName;
    }

    public String getCountry() {
        return country;
    }

    public String getCity() {
        return city;
    }

    public String getStreetAddress() {
        return streetAddress;
    }
}