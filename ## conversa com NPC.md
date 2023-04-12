## conversa com NPC
Ao encontrar com um NPC (ou for uma sidequest) vai mostrar que o tipo da conversa é NPC `type: NPC` e a partir daí, vai receber o node (json) `newNodePath: 'asset/sdasd.json'` de conversa com o NPC para carregar essa nova conversa com ele. Ele terá sua própria linha narrativa, como se fosse mesmo um novo `narrative.json`
- O save (player_prefs) vai funcionar de outra maneira nesse caso, se for NPC (`state`) ele vai salvavr aquele id e procurar pelo npcNarrativeId (depdende do estado)
    - 
- escolhas: tipo da escolha e o seu text (amigavel, babaca, curioso...)