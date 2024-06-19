// Function to fetch and display banner list
function fetchBannerList() {
    fetch('/api/banners')
        .then(response => response.json())
        .then(banners => {
            const bannerList = document.getElementById('banner-list');
            bannerList.innerHTML = ''; // Clear previous list

            banners.forEach(banner => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${banner.banner_id}</td>
                    <td>${banner.banner_name}</td>
                    <td><img src="${banner.image}" alt="${banner.banner_name}" width="100"></td>
                    <td>${banner.content}</td>
                    <td>${banner.is_active ? 'Yes' : 'No'}</td>
                    <td>${new Date(banner.created_at).toLocaleString()}</td>
                    <td>
                        <button onclick="updateBanner(${banner.banner_id})">Update</button>
                        <button onclick="deleteBanner(${banner.banner_id})">Delete</button>
                    </td>
                `;
                bannerList.appendChild(row);
            });
        })
        .catch(error => console.error('Error fetching banners:', error));
}

// Function to update a banner (placeholder)
function updateBanner(bannerId) {
    console.log('Update banner:', bannerId);
    // Implement update functionality as needed
}

// Function to delete a banner
function deleteBanner(bannerId) {
    fetch(`/api/banners/${bannerId}`, {
        method: 'DELETE'
    })
    .then(response => response.json())
    .then(() => {
        console.log('Deleted banner:', bannerId);
        fetchBannerList(); // Refresh banner list after deletion
    })
    .catch(error => console.error('Error deleting banner:', error));
}

// Initial fetch of banner list when page loads
document.addEventListener('DOMContentLoaded', () => {
    fetchBannerList();
});
