<!DOCTYPE html>
<html>
<head>
    <title>Update Spot</title>
</head>
<body>
    <h1>Update Spot Details</h1>
    <form action="/admin/updatespot" method="post">
        <input type="hidden" name="id" value="${spot.id}" />

        <label for="name">Spot Name:</label>
        <input type="text" id="name" name="name" value="${spot.name}" required /><br><br>

        <label for="location">Location:</label>
        <input type="text" id="location" name="location" value="${spot.location}" required /><br><br>

        <label for="description">Description:</label>
        <textarea id="description" name="description" required>${spot.description}</textarea><br><br>

        <label for="price">Price:</label>
        <input type="number" step="0.01" id="price" name="price" value="${spot.price}" required /><br><br>

        <button type="submit">Update Spot</button>
    </form>
    <a href="/admin/viewspots">Back to Spot List</a>
</body>
</html>
