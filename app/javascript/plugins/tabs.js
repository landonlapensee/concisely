const setActiveTab = () => { 
  const conversationTab = document.getElementById('conversation-id');
  const bookingTab = document.getElementById('booking-id');
  const reportTab = document.getElementById('report-id');
  const paymentTab = document.getElementById('payment-id');
  const path = window.location.pathname;

  if (path === "/my/conversations") {
    conversationTab.classList.add("active");
  } else if (path === "/my/bookings") {
    bookingTab.classList.add("active");
  } else if (path === "/my/reports") {
    reportTab.classList.add("active");
  } else if (path === "/my/payments") {
    paymentTab.classList.add("active");
  }
};

export { setActiveTab };
