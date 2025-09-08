// Ensure DOM is ready before running any code
document.addEventListener("DOMContentLoaded", () => {
	/* -----------------------------
	 * SIDE NAVIGATION
	 * ----------------------------- */
	const sidenav = document.getElementById("mySidenav");
	const main = document.getElementById("main");

	window.openNav = function() {
		if (sidenav) sidenav.style.width = "250px";
		if (main) main.style.marginLeft = "250px";
	};

	window.closeNav = function() {
		if (sidenav) sidenav.style.width = "0";
		if (main) main.style.marginLeft = "0";
	};

	/* -----------------------------
	 * AUTH MODAL CLOSE (if exists)
	 * ----------------------------- */
	const closeBtn = document.querySelector(".close-btn");
	if (closeBtn) {
		closeBtn.addEventListener("click", () => {
			const modal = document.querySelector(".auth-modal");
			if (modal) modal.style.display = "none";
		});
	}

	/* -----------------------------
	 * EMAIL VALIDATION (Hire form)
	 * ----------------------------- */
	const emailInput = document.getElementById("email");
	const form = document.querySelector(".auth-form"); // if you have one
	const continueBtn = form ? form.querySelector("button") : null;

	function isValidEmail(email) {
		const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
		return emailPattern.test(email);
	}

	if (emailInput && continueBtn && form) {
		emailInput.addEventListener("input", () => {
			const email = emailInput.value.trim();
			if (isValidEmail(email)) {
				continueBtn.disabled = false;
				continueBtn.classList.add("active");
			} else {
				continueBtn.disabled = true;
				continueBtn.classList.remove("active");
			}
		});

		form.addEventListener("submit", (e) => {
			e.preventDefault();
			const email = emailInput.value.trim();

			if (isValidEmail(email)) {
				alert(`Form submitted successfully with email: ${email}`);
				form.reset();
				continueBtn.disabled = true;
				continueBtn.classList.remove("active");
			} else {
				alert("Please enter a valid email address.");
			}
		});
	}

	/* -----------------------------
	 * BOOKING FORM TAB SWITCHING
	 * ----------------------------- */
	const photoshootForm = document.getElementById("photoshootForm");
	const personalForm = document.getElementById("personalForm");
	const nextBtn = document.getElementById("nextToPersonal");
	const backBtn = document.getElementById("backToPhotoshoot");

	// Next button → go to personal details
	if (nextBtn) {
		nextBtn.addEventListener("click", () => {
			photoshootForm.classList.remove("active");
			personalForm.classList.add("active");

			document
				.querySelectorAll(".tab-title")
				.forEach((btn) => btn.classList.remove("active"));
			document.querySelector(".tab-title:nth-child(2)").classList.add("active");
		});
	}

	// Back button → go to photoshoot details
	if (backBtn) {
		backBtn.addEventListener("click", () => {
			personalForm.classList.remove("active");
			photoshootForm.classList.add("active");

			document
				.querySelectorAll(".tab-title")
				.forEach((btn) => btn.classList.remove("active"));
			document.querySelector(".tab-title:nth-child(1)").classList.add("active");
		});
	}

	// Tab switch function (kept global so your inline onclick still works)
	window.switchTab = function(tab) {
		document
			.querySelectorAll(".tab-title")
			.forEach((btn) => btn.classList.remove("active"));
		document
			.querySelectorAll(".form-page")
			.forEach((form) => form.classList.remove("active"));

		if (tab === "photoshoot") {
			photoshootForm.classList.add("active");
			document.querySelector(".tab-title:nth-child(1)").classList.add("active");
		} else {
			personalForm.classList.add("active");
			document.querySelector(".tab-title:nth-child(2)").classList.add("active");
		}
	};
});

// Multi-step form JS
const photoshootForm = document.getElementById('photoshootForm');
const personalForm = document.getElementById('personalForm');
const nextBtn = document.getElementById('nextToPersonal');
const backBtn = document.getElementById('backToPhotoshoot');

nextBtn.addEventListener('click', () => {
	photoshootForm.classList.remove('active');
	personalForm.classList.add('active');
});

backBtn.addEventListener('click', () => {
	personalForm.classList.remove('active');
	photoshootForm.classList.add('active');
});