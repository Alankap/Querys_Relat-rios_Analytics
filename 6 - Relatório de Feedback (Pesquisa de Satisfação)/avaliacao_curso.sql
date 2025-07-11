SELECT
    ROW_NUMBER() OVER () AS id,
    CONCAT(mu.firstname, ' ', mu.lastname) AS Nome, 
    mc.shortname AS Turma, 
    mq.name AS Pesquisa, 
    mu.email AS Email,  

    (
        SELECT mqqc.content 
        FROM s4px_questionnaire_resp_single mqrs
        JOIN s4px_questionnaire_quest_choice mqqc ON mqqc.id = mqrs.choice_id
        JOIN s4px_questionnaire_question mqq ON mqq.id = mqrs.question_id
        WHERE mqq.type_id = 4
          AND mqq.deleted = 'n'
          AND mqq.name = '1'
          AND mqrs.response_id = mqr.id
    ) AS "1_Em que medida os materiais foram relevantes para a sua atuação profissional?",
    
    (
        SELECT mqqc.content 
        FROM s4px_questionnaire_resp_single mqrs
        JOIN s4px_questionnaire_quest_choice mqqc ON mqqc.id = mqrs.choice_id
        JOIN s4px_questionnaire_question mqq ON mqq.id = mqrs.question_id
        WHERE mqq.type_id = 4
          AND mqq.deleted = 'n'
          AND mqq.name = '2'
          AND mqrs.response_id = mqr.id
    ) AS "2_O curso utilizou uma boa variedade de recursos?",
    
    (
        SELECT mqqc.content 
        FROM s4px_questionnaire_resp_single mqrs
        JOIN s4px_questionnaire_quest_choice mqqc ON mqqc.id = mqrs.choice_id
        JOIN s4px_questionnaire_question mqq ON mqq.id = mqrs.question_id
        WHERE mqq.type_id = 4 
          AND mqq.deleted = 'n'
          AND mqq.name = '3'
          AND mqrs.response_id = mqr.id
    ) AS "3_Os recursos apresentam interface gráfica de qualidade?",

    (
        SELECT mqqc.content 
        FROM s4px_questionnaire_resp_single mqrs
        JOIN s4px_questionnaire_quest_choice mqqc ON mqqc.id = mqrs.choice_id
        JOIN s4px_questionnaire_question mqq ON mqq.id = mqrs.question_id
        WHERE mqq.type_id = 4 
          AND mqq.deleted = 'n'
          AND mqq.name = '4'
          AND mqrs.response_id = mqr.id
    ) AS "4_A organização dos recursos no Ambiente Virtual de Aprendizagem facilitou seu acesso e uso?",
    
    (
        SELECT mqqc.content 
        FROM s4px_questionnaire_resp_single mqrs
        JOIN s4px_questionnaire_quest_choice mqqc ON mqqc.id = mqrs.choice_id
        JOIN s4px_questionnaire_question mqq ON mqq.id = mqrs.question_id
        WHERE mqq.type_id = 4 
          AND mqq.deleted = 'n'
          AND mqq.name = '5'
          AND mqrs.response_id = mqr.id
    ) AS "5_As estratégias de ensino ajudaram efetivamente seu aprendizado?",

    (
        SELECT mqqc.content 
        FROM s4px_questionnaire_resp_single mqrs
        JOIN s4px_questionnaire_quest_choice mqqc ON mqqc.id = mqrs.choice_id
        JOIN s4px_questionnaire_question mqq ON mqq.id = mqrs.question_id
        WHERE mqq.type_id = 4 
          AND mqq.deleted = 'n'
          AND mqq.name = '6'
          AND mqrs.response_id = mqr.id
    ) AS "6_O curso incentivou sua participação ativa nas atividades propostas?",

    (
        SELECT mqqc.content 
        FROM s4px_questionnaire_resp_single mqrs
        JOIN s4px_questionnaire_quest_choice mqqc ON mqqc.id = mqrs.choice_id
        JOIN s4px_questionnaire_question mqq ON mqq.id = mqrs.question_id
        WHERE mqq.type_id = 4 
          AND mqq.deleted = 'n'
          AND mqq.name = '7'
          AND mqrs.response_id = mqr.id
    ) AS "7_Houve um equilíbrio adequado entre teoria e prática?",

    (
        SELECT mqqc.content 
        FROM s4px_questionnaire_resp_single mqrs
        JOIN s4px_questionnaire_quest_choice mqqc ON mqqc.id = mqrs.choice_id
        JOIN s4px_questionnaire_question mqq ON mqq.id = mqrs.question_id
        WHERE mqq.type_id = 4 
          AND mqq.deleted = 'n'
          AND mqq.name = '8'
          AND mqrs.response_id = mqr.id
    ) AS "8_A carga horária foi adequada para a complexidade dos conteúdos abordados?",

    (
        SELECT mqqc.content 
        FROM s4px_questionnaire_resp_single mqrs
        JOIN s4px_questionnaire_quest_choice mqqc ON mqqc.id = mqrs.choice_id
        JOIN s4px_questionnaire_question mqq ON mqq.id = mqrs.question_id
        WHERE mqq.type_id = 4 
          AND mqq.deleted = 'n'
          AND mqq.name = '9'
          AND mqrs.response_id = mqr.id
    ) AS "9_O docente explicou os temas de forma clara e compreensível?",

    (
        SELECT mqqc.content 
        FROM s4px_questionnaire_resp_single mqrs
        JOIN s4px_questionnaire_quest_choice mqqc ON mqqc.id = mqrs.choice_id
        JOIN s4px_questionnaire_question mqq ON mqq.id = mqrs.question_id
        WHERE mqq.type_id = 4 
          AND mqq.deleted = 'n'
          AND mqq.name = '10'
          AND mqrs.response_id = mqr.id
    ) AS "10_O docente demonstrou domínio completo do conteúdo apresentado?",
    
    (
        SELECT mqqc.content 
        FROM s4px_questionnaire_resp_single mqrs
        JOIN s4px_questionnaire_quest_choice mqqc ON mqqc.id = mqrs.choice_id
        JOIN s4px_questionnaire_question mqq ON mqq.id = mqrs.question_id
        WHERE mqq.type_id = 4 
          AND mqq.deleted = 'n'
          AND mqq.name = '11'
          AND mqrs.response_id = mqr.id
    ) AS "11_O docente esteve disponível e foi eficaz ao esclarecer dúvidas e prestar apoio?",

    (
        SELECT mqqc.content 
        FROM s4px_questionnaire_resp_single mqrs
        JOIN s4px_questionnaire_quest_choice mqqc ON mqqc.id = mqrs.choice_id
        JOIN s4px_questionnaire_question mqq ON mqq.id = mqrs.question_id
        WHERE mqq.type_id = 4 
          AND mqq.deleted = 'n'
          AND mqq.name = '12'
          AND mqrs.response_id = mqr.id
    ) AS "12_O docente participou ativamente no Fórum de dúvidas e discussões?",

    (
        SELECT mqqc.content 
        FROM s4px_questionnaire_resp_single mqrs
        JOIN s4px_questionnaire_quest_choice mqqc ON mqqc.id = mqrs.choice_id
        JOIN s4px_questionnaire_question mqq ON mqq.id = mqrs.question_id
        WHERE mqq.type_id = 4 
          AND mqq.deleted = 'n'
          AND mqq.name = '13'
          AND mqrs.response_id = mqr.id
    ) AS "13_O docente apresentou exemplos práticos que ajudaram a compreender o conteúdo?",

    (
        SELECT mqqc.content 
        FROM s4px_questionnaire_resp_single mqrs
        JOIN s4px_questionnaire_quest_choice mqqc ON mqqc.id = mqrs.choice_id
        JOIN s4px_questionnaire_question mqq ON mqq.id = mqrs.question_id
        WHERE mqq.type_id = 4 
          AND mqq.deleted = 'n'
          AND mqq.name = '14'
          AND mqrs.response_id = mqr.id
    ) AS "14_O docente conseguiu engajar e motivar você durante o curso?",

    (
        SELECT mqqc.content 
        FROM s4px_questionnaire_resp_single mqrs
        JOIN s4px_questionnaire_quest_choice mqqc ON mqqc.id = mqrs.choice_id
        JOIN s4px_questionnaire_question mqq ON mqq.id = mqrs.question_id
        WHERE mqq.type_id = 4 
          AND mqq.deleted = 'n'
          AND mqq.name = '15'
          AND mqrs.response_id = mqr.id
    ) AS "15_O docente manteve postura ética e profissional em todas as interações?",

    (
        SELECT mqqc.content 
        FROM s4px_questionnaire_resp_single mqrs
        JOIN s4px_questionnaire_quest_choice mqqc ON mqqc.id = mqrs.choice_id
        JOIN s4px_questionnaire_question mqq ON mqq.id = mqrs.question_id
        WHERE mqq.type_id = 4 
          AND mqq.deleted = 'n'
          AND mqq.name = '16'
          AND mqrs.response_id = mqr.id
    ) AS "16_O acesso à plataforma foi fácil e sem dificuldades técnicas?",

    (
        SELECT mqqc.content 
        FROM s4px_questionnaire_resp_single mqrs
        JOIN s4px_questionnaire_quest_choice mqqc ON mqqc.id = mqrs.choice_id
        JOIN s4px_questionnaire_question mqq ON mqq.id = mqrs.question_id
        WHERE mqq.type_id = 4 
          AND mqq.deleted = 'n'
          AND mqq.name = '17'
          AND mqrs.response_id = mqr.id
    ) AS "17_Os recursos tecnológicos disponibilizados foram adequados e úteis para o seu aprendizado?",

    (
        SELECT mqqc.content 
        FROM s4px_questionnaire_resp_single mqrs
        JOIN s4px_questionnaire_quest_choice mqqc ON mqqc.id = mqrs.choice_id
        JOIN s4px_questionnaire_question mqq ON mqq.id = mqrs.question_id
        WHERE mqq.type_id = 4 
          AND mqq.deleted = 'n'
          AND mqq.name = '18'
          AND mqrs.response_id = mqr.id
    ) AS "18_A interface e navegação do ambiente virtual facilitaram sua experiência?",

    (
        SELECT mqqc.content 
        FROM s4px_questionnaire_resp_single mqrs
        JOIN s4px_questionnaire_quest_choice mqqc ON mqqc.id = mqrs.choice_id
        JOIN s4px_questionnaire_question mqq ON mqq.id = mqrs.question_id
        WHERE mqq.type_id = 4 
          AND mqq.deleted = 'n'
          AND mqq.name = '19'
          AND mqrs.response_id = mqr.id
    ) AS "19_Após concluir o curso, qual foi o nível de compreensão que você alcançou?",

    (
        SELECT mqqc.content 
        FROM s4px_questionnaire_resp_single mqrs
        JOIN s4px_questionnaire_quest_choice mqqc ON mqqc.id = mqrs.choice_id
        JOIN s4px_questionnaire_question mqq ON mqq.id = mqrs.question_id
        WHERE mqq.type_id = 4 
          AND mqq.deleted = 'n'
          AND mqq.name = '20'
          AND mqrs.response_id = mqr.id
    ) AS "20_Os conteúdos foram apresentados de forma clara e bem-organizada?",

    (
        SELECT mqqc.content 
        FROM s4px_questionnaire_resp_single mqrs
        JOIN s4px_questionnaire_quest_choice mqqc ON mqqc.id = mqrs.choice_id
        JOIN s4px_questionnaire_question mqq ON mqq.id = mqrs.question_id
        WHERE mqq.type_id = 4 
          AND mqq.deleted = 'n'
          AND mqq.name = '21'
          AND mqrs.response_id = mqr.id
    ) AS "21_O conteúdo apresenta exemplos do cotidiano profissional de TI?",

    (
        SELECT mqqc.content 
        FROM s4px_questionnaire_resp_single mqrs
        JOIN s4px_questionnaire_quest_choice mqqc ON mqqc.id = mqrs.choice_id
        JOIN s4px_questionnaire_question mqq ON mqq.id = mqrs.question_id
        WHERE mqq.type_id = 4 
          AND mqq.deleted = 'n'
          AND mqq.name = '22'
          AND mqrs.response_id = mqr.id
    ) AS "22_Os conhecimentos adquiridos são aplicáveis à sua realidade profissional?",

    (
        SELECT mqqc.content 
        FROM s4px_questionnaire_resp_single mqrs
        JOIN s4px_questionnaire_quest_choice mqqc ON mqqc.id = mqrs.choice_id
        JOIN s4px_questionnaire_question mqq ON mqq.id = mqrs.question_id
        WHERE mqq.type_id = 4 
          AND mqq.deleted = 'n'
          AND mqq.name = '23'
          AND mqrs.response_id = mqr.id
    ) AS "23_Seu progresso no curso atendeu ou superou suas expectativas iniciais?",

    (
        SELECT mqqc.content 
        FROM s4px_questionnaire_resp_single mqrs
        JOIN s4px_questionnaire_quest_choice mqqc ON mqqc.id = mqrs.choice_id
        JOIN s4px_questionnaire_question mqq ON mqq.id = mqrs.question_id
        WHERE mqq.type_id = 4 
          AND mqq.deleted = 'n'
          AND mqq.name = '24'
          AND mqrs.response_id = mqr.id
    ) AS "24_Como você avalia a sua satisfação geral com o processo de aprendizagem?",

    (
        SELECT mqqc.content 
        FROM s4px_questionnaire_resp_single mqrs
        JOIN s4px_questionnaire_quest_choice mqqc ON mqqc.id = mqrs.choice_id
        JOIN s4px_questionnaire_question mqq ON mqq.id = mqrs.question_id
        WHERE mqq.type_id = 4 
          AND mqq.deleted = 'n'
          AND mqq.name = '25'
          AND mqrs.response_id = mqr.id
    ) AS "25_Como você avalia a qualidade geral do curso?",

    (
        SELECT mqqc.content 
        FROM s4px_questionnaire_resp_single mqrs
        JOIN s4px_questionnaire_quest_choice mqqc ON mqqc.id = mqrs.choice_id
        JOIN s4px_questionnaire_question mqq ON mqq.id = mqrs.question_id
        WHERE mqq.type_id = 4 
          AND mqq.deleted = 'n'
          AND mqq.name = '26'
          AND mqrs.response_id = mqr.id
    ) AS "25_Você recomendaria este curso para outras pessoas?",

    (
        SELECT mqqc.content 
        FROM s4px_questionnaire_resp_single mqrs
        JOIN s4px_questionnaire_quest_choice mqqc ON mqqc.id = mqrs.choice_id
        JOIN s4px_questionnaire_question mqq ON mqq.id = mqrs.question_id
        WHERE mqq.type_id = 4 
          AND mqq.deleted = 'n'
          AND mqq.name = '27'
          AND mqrs.response_id = mqr.id
    ) AS "27_Você pretende participar de outros cursos online oferecidos por nossa instituição?",

    (
        SELECT mqrt.response 
        FROM s4px_questionnaire_response_text mqrt
        JOIN s4px_questionnaire_question mqq ON mqq.id = mqrt.question_id
        WHERE mqq.type_id = 3
          AND mqq.deleted = 'n'
          AND mqq.name = '27'
          AND mqrt.response_id = mqr.id
    ) AS "2_Por favor, deixe abaixo seus comentários, críticas, elogios ou sugestões para que possamos melhorar ainda mais:"

FROM 
    s4px_course mc
JOIN 
    s4px_enrol me ON me.courseid = mc.id
JOIN 
    s4px_context ctx ON mc.id = ctx.instanceid
JOIN 
    s4px_role_assignments AS ra ON ra.contextid = ctx.id
JOIN 
    s4px_user AS mu ON mu.id = ra.userid
JOIN 
    s4px_user_enrolments mue ON mue.userid = mu.id AND mue.enrolid = me.id
JOIN 
    s4px_questionnaire mq ON mq.course = mc.id
JOIN 
    s4px_questionnaire_response mqr ON mqr.questionnaireid = mq.id AND mqr.userid = mu.id
LEFT JOIN 
    s4px_groups_members gm ON gm.userid = mu.id
LEFT JOIN 
    s4px_groups g ON g.id = gm.groupid

WHERE
	ra.roleid = 5
    AND mue.status = 0
    AND mqr.complete = 'y';
