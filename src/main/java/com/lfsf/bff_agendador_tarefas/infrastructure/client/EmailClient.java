package com.lfsf.bff_agendador_tarefas.infrastructure.client;

import com.lfsf.bff_agendador_tarefas.business.dto.out.TarefasDTOResponse;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;

@FeignClient(name = "notificacao", url = "${notificacao.url}")
//Usar esse tipo de URL para aplicação que podem ter alteração de url, desse jeito está apontando pra uma variável dentro de apllication.properties
public interface EmailClient {

    void enviarEmail(@RequestBody TarefasDTOResponse dto);
}

