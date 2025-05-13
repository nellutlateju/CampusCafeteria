function addToCart(itemId) {
    fetch('CartServlet', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: `action=add&itemId=${itemId}`
    })
    .then(response => {
        if (response.ok) {
            alert('Item added to cart!');
        } else {
            alert('Failed to add item to cart.');
        }
    })
    .catch(error => {
        console.error('Error:', error);
    });
}