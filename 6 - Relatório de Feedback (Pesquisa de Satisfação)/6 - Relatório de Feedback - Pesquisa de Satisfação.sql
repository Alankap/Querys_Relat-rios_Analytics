SELECT 
    CONCAT(mu.firstname, ' ', mu.lastname) AS Nome,
    mc.shortname AS Curso,
    mq.name AS Pesquisa,
    mu.email AS Email,
    g.name AS Turma,
    
    -- Resposta para o perfil
    (
        SELECT mqqc.content 
        FROM g4s7_questionnaire_resp_single mqrs
        JOIN g4s7_questionnaire_quest_choice mqqc ON mqqc.id = mqrs.choice_id
        JOIN g4s7_questionnaire_question mqq ON mqq.id = mqrs.question_id
        WHERE mqq.type_id = 4 
        AND mqq.deleted = 'n'
        AND mqq.name = 'q1 perfil'
        AND mqrs.response_id = mqr.id
    ) AS "1_Perfil",

    -- Nome da instituição
    (
        SELECT mqrt.response 
        FROM g4s7_questionnaire_response_text mqrt
        JOIN g4s7_questionnaire_question mqq ON mqq.id = mqrt.question_id
        WHERE mqq.type_id = 2
        AND mqq.deleted = 'n'
        AND mqq.name = 'q2 Nome da instituição'
        AND mqrt.response_id = mqr.id
    ) AS "2_Nome_da_instituição",

    -- Formatos dos objetos educacionais
    (
        SELECT mqqc.content 
        FROM g4s7_questionnaire_resp_single mqrs
        JOIN g4s7_questionnaire_quest_choice mqqc ON mqqc.id = mqrs.choice_id
        JOIN g4s7_questionnaire_question mqq ON mqq.id = mqrs.question_id
        WHERE mqq.type_id = 4
        AND mqq.deleted = 'n'
        AND mqq.name = 'Os formatos dos objetos educac'
        AND mqrs.response_id = mqr.id
    ) AS "3_Formatos_dos_objetos_educacionais",

    -- Qualidade do conteúdo
    (
        SELECT mqqc.content 
        FROM g4s7_questionnaire_resp_single mqrs
        JOIN g4s7_questionnaire_quest_choice mqqc ON mqqc.id = mqrs.choice_id
        JOIN g4s7_questionnaire_question mqq ON mqq.id = mqrs.question_id
        WHERE mqq.type_id = 4
        AND mqq.deleted = 'n'
        AND mqq.name = 'A qualidade do conteúdo dos ma'
        AND mqrs.response_id = mqr.id
    ) AS "4_Qualidade_do_conteúdo",

    -- Comentários sobre os recursos didáticos
    (
        SELECT mqrt.response 
        FROM g4s7_questionnaire_response_text mqrt
        JOIN g4s7_questionnaire_question mqq ON mqq.id = mqrt.question_id
        WHERE mqq.type_id = 3
        AND mqq.deleted = 'n'
        AND mqq.name = 'Comentários sobre os recursos'
        AND mqrt.response_id = mqr.id
    ) AS "5_Comentários_sobre_os_recursos_didático_pedagógicos",

    -- Apresentação do tutor
    (
        SELECT mqqc.content 
        FROM g4s7_questionnaire_resp_single mqrs
        JOIN g4s7_questionnaire_quest_choice mqqc ON mqqc.id = mqrs.choice_id
        JOIN g4s7_questionnaire_question mqq ON mqq.id = mqrs.question_id
        WHERE mqq.type_id = 4
        AND mqq.deleted = 'n'
        AND mqq.name = 'O tutor apresentou o conteúdo'
        AND mqrs.response_id = mqr.id
    ) AS "6_O_tutor_apresentou_o_conteúdo_de_forma_segura?",

    -- Frequência do tutor
    (
        SELECT mqqc.content 
        FROM g4s7_questionnaire_resp_single mqrs
        JOIN g4s7_questionnaire_quest_choice mqqc ON mqqc.id = mqrs.choice_id
        JOIN g4s7_questionnaire_question mqq ON mqq.id = mqrs.question_id
        WHERE mqq.type_id = 4
        AND mqq.deleted = 'n'
        AND mqq.name = 'A frequência do tutor na plata'
        AND mqrs.response_id = mqr.id
    ) AS "7_A_frequência_do_tutor_foi_suficiente?",

    -- Outros campos semelhantes seguem o mesmo padrão...

FROM g4s7_course mc
JOIN g4s7_enrol me ON me.courseid = mc.id
JOIN g4s7_context ctx ON mc.id = ctx.instanceid
JOIN g4s7_role_assignments AS ra ON ra.contextid = ctx.id
JOIN g4s7_user AS mu ON mu.id = ra.userid
JOIN g4s7_user_enrolments mue ON mue.userid = mu.id AND mue.enrolid = me.id
JOIN g4s7_questionnaire mq ON mq.course = mc.id
JOIN g4s7_questionnaire_response mqr ON mqr.questionnaireid = mq.id AND mqr.userid = mu.id
LEFT JOIN g4s7_groups_members gm ON gm.userid = mu.id
LEFT JOIN g4s7_groups g ON g.id = gm.groupid

WHERE ra.roleid = 5
AND me.enrol = 'manual'
AND mue.status = 0
AND mqr.complete = 'y';
