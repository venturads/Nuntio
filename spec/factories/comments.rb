comments = ["Cet expert est incroyable !", "Je suis abonné depuis quelques mois, je ne peux plus m'en passer.", "Une offre indispensable si vous souhaitez être à jour dans ce domaine.", "J'aurais aimé une autre fréquence de publication.", "Cet expert est vraiment la référence du domaine.", "Je vous recommande vivement de vous abonner. Vous ne serez pas déçu.", "Le prix de l'abonnement est un peu cher.", "J'adore !", "C'est pas mal mais sans plus", "J'ai hâte de découvrir la prochaine synthèse.", "J'apprécie beaucoup votre travail même si j'aimerais bien que les articles soient plus longs", "Du beau travail, j'aime !", "Si vous ne devez vous abonner qu'à un expert, c'est bien celui-ci.", "Les synthèses ne correspondent pas vraiment à l'offre, passez votre chemin.", "Rien à dire, c'est parfait !", "Vous ne manquerez plus aucune information grâce à cette offre.", "Je mets régulièrement la note de 5 aux contenus tellement ils sont bien écrits.", "R.A.S", "Bien mais sans plus.", "La meilleure offre présente sur Nuntio", "Merci Nuntio pour m'avoir fait découvrir cet expert", "Du contenu de qualité !", "J'en redemande !", "C'est assez moyen", "La meilleure des offres, tout simplement.", "Mon rendez-vous régulier immanquable, je ne peux plus m'en passer", "J'ai inscrit tous mes salariés à cette offre, je ne regrette pas du tout", "On est plusieurs dans mon entreprise à être abonné, on adore !", "Du contenu de qualité."]

FactoryGirl.define do
  factory :comment do
    association :commentable, factory: [:tower, :with_category]
    content { comments.sample }
    notation { rand(2..5) }
    user
  end
end
