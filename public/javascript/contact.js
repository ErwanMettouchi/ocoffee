emailjs.init("YaiIujxuXvB4LIyn2");

const form = document.getElementById('contact-form');

// 3. Gérer l'événement de soumission
form.addEventListener('submit', async (event) => {
    event.preventDefault(); // Empêche le rechargement de la page
    
    try {
        // 4. Envoyer le mail via EmailJS
        const response = await emailjs.sendForm(
            'service_5a9amz7', 
            'template_jgc2osg', 
            form
        );
        
        // 5. Afficher la confirmation
        alert('Message envoyé avec succès ! 🎉');
        form.reset(); // Vider les champs
        
    } catch (error) {
        // 6. Gérer les erreurs
        alert("Erreur lors de l'envoi ❌ : " + error.text);
    }
});