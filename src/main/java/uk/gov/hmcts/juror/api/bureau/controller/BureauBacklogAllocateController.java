package uk.gov.hmcts.juror.api.bureau.controller;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.Assert;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import uk.gov.hmcts.juror.api.bureau.controller.request.BureauBacklogAllocateRequestDto;
import uk.gov.hmcts.juror.api.bureau.service.BureauBacklogAllocateService;
import uk.gov.hmcts.juror.api.config.bureau.BureauJwtAuthentication;
import uk.gov.hmcts.juror.api.moj.utils.SecurityUtil;

@Slf4j
@RestController
@RequestMapping(value = "/api/v1/bureau/backlogAllocate", produces = MediaType.APPLICATION_JSON_VALUE)
public class BureauBacklogAllocateController {

    private final BureauBacklogAllocateService bureauBacklogAllocateService;

    @Autowired
    public BureauBacklogAllocateController(
        final BureauBacklogAllocateService bureauBacklogAllocateService) {
        Assert.notNull(bureauBacklogAllocateService, "BureauBacklogAllocateService cannot be null!");
        this.bureauBacklogAllocateService = bureauBacklogAllocateService;
    }

    @PostMapping(path = "/replies")
    @Operation(summary = "Allocate Backlog replies to selected staff")
    public ResponseEntity<Void> allocateBacklogReplies(
        @Parameter(hidden = true) BureauJwtAuthentication auth,
        @Validated @RequestBody BureauBacklogAllocateRequestDto bureauBacklogAllocateRequestDto) {
        if (!SecurityUtil.isBureauManager()) {
            log.error("Allocate replies endpoint called by non-team leader");
            return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
        }
        try {
            bureauBacklogAllocateService.allocateBacklogReplies(
                bureauBacklogAllocateRequestDto,
                SecurityUtil.getUsername()
            );
            return ResponseEntity.ok().build();
        } catch (RuntimeException e) {
            log.error("Failed to allocate replies:", e);
            throw e;
        }
    }

}
