## HR System (Spring Boot)

This project is a Spring Boot REST API based on the HR sample database.

### Implemented features (homework)
- Entities: `Region`, `Country`, `Location`
- `Department` updated with:
  - relationship to `Location`
  - `manager` property linked to `Employee`
- Endpoint to retrieve departments with fields:
  - departmentName
  - managerFullName (firstName + lastName)
  - country
  - city
  - streetAddress
- Filtering support:
  - by `country`
  - by `city`

### API
- Get departments (with optional filters):
  - `GET /api/departments`
  - `GET /api/departments?country=Georgia`
  - `GET /api/departments?city=Seattle`
  - `GET /api/departments?country=United%20States%20of%20America&city=Seattle`

### Run with Docker
From the repository root:

```bash
docker compose up -d --build
