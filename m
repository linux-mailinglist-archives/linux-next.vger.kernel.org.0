Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 245ABF8334
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 00:04:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727223AbfKKXER (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Nov 2019 18:04:17 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50306 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727211AbfKKXEQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Nov 2019 18:04:16 -0500
Received: by mail-wm1-f65.google.com with SMTP id l17so1087567wmh.0;
        Mon, 11 Nov 2019 15:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rsKOVlf4KCoyJA586IbpR/JcJ5NIZQ3tkRW+Ckd8PxQ=;
        b=UQCRO6Ta7eDFZBBdfIOny/gN7XWKny2YV7kKfCpPKJlCKxnzKl2F+R6ZmJhmz3E4tA
         l0hQRkpHoAYWPbws/BoiQl4A+tQcF22FgYkEZjq7RdDhsA2DEZ5S35Fiwup7b01Q2g4N
         nhqsFhd/6zc3y5Bo8zUSQMcHKWUxSqeEzzA7ZJajvCit5igvB6tr/MFvMIYzytXw3yBK
         mQXn6cqkELTFOf8XdJFHCkl5FWYC9OU71dMB+W3SIP0dYFbwYPDvNyH1hwhcPa7j2At2
         HuV2XGpcP/JM3WDh+Plpyj8V2w+/uebyp9T8IHMsjrGGxwCOSCG+I15Lb+u3Gv5Ahhro
         VtJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rsKOVlf4KCoyJA586IbpR/JcJ5NIZQ3tkRW+Ckd8PxQ=;
        b=LDt2/nX53QM4pMsXPq1nX/ET4L2DE9PqloHQeKOM9hHMx+ww6CR97aFn65krd1WL0x
         7nuPoHfWqK/kO/sexA3U2KH+FkvsuEhaF34LJfVk4ZDlX2HWX4jkD9F9nzjODDoaY6fq
         P4rj/RZbf+KfWvWbwD1b6L2xJT2ZGn2VcQKl3vivGrFMN8GFa8AgbfvbZ0H9QY2hhlXS
         VQd6arfU2Velh1/fiSbo4Q13g5eGmyRmAheJwEYMiUNCDphy6y9YHzQSgRsbLQ4hodGi
         wPNxA8wiZKPW/K2qCzC0FrQqvpl6wKxCtv7JHtyFss0ZPwXhZluuvjQXu4/AD+txcP20
         Iedg==
X-Gm-Message-State: APjAAAWiUycv2ExF8xKcpnWQbxG2qQPojsuN/V6Q5A0Gl5PenoFD6AMt
        v6/UHxMxziSfQRvW9PrryY5QrE5z
X-Google-Smtp-Source: APXvYqw0txKOwsDfeNGhu8WRY3CnnzSiDA5u/VUKrxjINs+4Xr0FHFQ1M/ZZJ8AWw0o+HieKFjD2gg==
X-Received: by 2002:a1c:dd45:: with SMTP id u66mr1135791wmg.12.1573513454777;
        Mon, 11 Nov 2019 15:04:14 -0800 (PST)
Received: from pallmd1.broadcom.com ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id m25sm655146wmi.46.2019.11.11.15.04.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 11 Nov 2019 15:04:14 -0800 (PST)
From:   James Smart <jsmart2021@gmail.com>
To:     linux-scsi@vger.kernel.org
Cc:     James Smart <jsmart2021@gmail.com>,
        Dick Kennedy <dick.kennedy@broadcom.com>,
        James Bottomley <James.Bottomley@SteelEye.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: [PATCH 2/6] lpfc: fix: Coverity: lpfc_cmpl_els_rsp(): Null pointer dereferences
Date:   Mon, 11 Nov 2019 15:03:57 -0800
Message-Id: <20191111230401.12958-3-jsmart2021@gmail.com>
X-Mailer: git-send-email 2.13.7
In-Reply-To: <20191111230401.12958-1-jsmart2021@gmail.com>
References: <20191111230401.12958-1-jsmart2021@gmail.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Coverity reported the following:

*** CID 101747:  Null pointer dereferences  (FORWARD_NULL)
/drivers/scsi/lpfc/lpfc_els.c: 4439 in lpfc_cmpl_els_rsp()
4433     			kfree(mp);
4434     		}
4435     		mempool_free(mbox, phba->mbox_mem_pool);
4436     	}
4437     out:
4438     	if (ndlp && NLP_CHK_NODE_ACT(ndlp)) {
vvv     CID 101747:  Null pointer dereferences  (FORWARD_NULL)
vvv     Dereferencing null pointer "shost".
4439     		spin_lock_irq(shost->host_lock);
4440     		ndlp->nlp_flag &= ~(NLP_ACC_REGLOGIN | NLP_RM_DFLT_RPI);
4441     		spin_unlock_irq(shost->host_lock);
4442
4443     		/* If the node is not being used by another discovery thread,
4444     		 * and we are sending a reject, we are done with it.

Fix by adding a check for non-null shost in line 4438.
The scenario when shost is set to null is when ndlp is null.
As such, the ndlp check present was sufficient. But better safe
than sorry so add the shost check.

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 101747 ("Null pointer dereferences")
Fixes: 2e0fef85e098 ("[SCSI] lpfc: NPIV: split ports")

Signed-off-by: Dick Kennedy <dick.kennedy@broadcom.com>
Signed-off-by: James Smart <jsmart2021@gmail.com>
CC: James Bottomley <James.Bottomley@SteelEye.com>
CC: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
CC: linux-next@vger.kernel.org
---
 drivers/scsi/lpfc/lpfc_els.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/lpfc/lpfc_els.c b/drivers/scsi/lpfc/lpfc_els.c
index 9a570c15b2a1..42a2bf38eaea 100644
--- a/drivers/scsi/lpfc/lpfc_els.c
+++ b/drivers/scsi/lpfc/lpfc_els.c
@@ -4445,7 +4445,7 @@ lpfc_cmpl_els_rsp(struct lpfc_hba *phba, struct lpfc_iocbq *cmdiocb,
 		mempool_free(mbox, phba->mbox_mem_pool);
 	}
 out:
-	if (ndlp && NLP_CHK_NODE_ACT(ndlp)) {
+	if (ndlp && NLP_CHK_NODE_ACT(ndlp) && shost) {
 		spin_lock_irq(shost->host_lock);
 		ndlp->nlp_flag &= ~(NLP_ACC_REGLOGIN | NLP_RM_DFLT_RPI);
 		spin_unlock_irq(shost->host_lock);
-- 
2.13.7

