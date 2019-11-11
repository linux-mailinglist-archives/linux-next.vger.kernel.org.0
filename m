Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 061F3F8332
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 00:04:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726983AbfKKXEP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Nov 2019 18:04:15 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55835 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727208AbfKKXEP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Nov 2019 18:04:15 -0500
Received: by mail-wm1-f65.google.com with SMTP id b11so1048981wmb.5;
        Mon, 11 Nov 2019 15:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8rD/1wuy7n//RffmcU6PR0GtzvL0v8j7pMJHvgBPQiU=;
        b=QpatybUB4Nl7koDhYN1lFNLy8fZGHIIyK0uQwtbA94L5hhnhcWg+RzHVjwhDmFEUkU
         WaCuFW900wyYrOWjzEME8LhZlKDahX1M4JrgnT8jgwFy/C/256jCnpKhIJBNGsa0EFPL
         43DQxgXFSiLzkPerNmSIHnsPA/UuxOBAQ7DevVJ+R2hS82BDAP9qbEVKcSXNvdQwKVYs
         H3NksnrEAkPFsHd9TneMXbmeCsBlGSi69jyK2kst50pkHveZTPR/Og0yDgGmwQQR9pHU
         vUgZiPsirjeqCCD311l2kD/QaMjMBQdUwuxlsUVxAgMVnJTNQCeCfD4wZCqb/2fs6zMN
         MpKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8rD/1wuy7n//RffmcU6PR0GtzvL0v8j7pMJHvgBPQiU=;
        b=if6QoR37dbFCwQCDHrfmB78ajs6/3gjWYRPEIO7BIMczjC/8Q7KDH8k80tGioXg9V7
         KLHhxxVhL3/wuiR4kWcWkGLmECySsp+xQJQzl4AeZ6LsQxOgEN8pqrep4H6TIS+I4Qe4
         D52CFC+4B65cR42M7AbQZv1lfvql9ajo09chw0k7BsFFIqt3GOvM3auZtHRvMUD+jdRs
         4Ejt2TSquFDKnlsSLCXjOJqtI/HOpCB/1J91Ud7HHxU+yegeFqJukAYtV8G00aZiK708
         OCaCRVH4jw2Z3zOnBHUPdjkARWku9i1mtxSuvN7ZipTbbnNVMKPKaWaPqtHMgpQUPiXf
         qRSw==
X-Gm-Message-State: APjAAAXwqmJRxpqIevxNstGg3wZ1YZYl5Yb/unvvfADzJuZULaOZrY3q
        6SLZGmAeL1ffNZZfDm0Lsz8gfR4S
X-Google-Smtp-Source: APXvYqyTW5+jG63MkDXUPbTb19p8aINFv18zNS4+g7rESv4mxMK0vcq+u+mBXw2sLROK3ZwWTYF/Mg==
X-Received: by 2002:a05:600c:299:: with SMTP id 25mr1247733wmk.50.1573513452879;
        Mon, 11 Nov 2019 15:04:12 -0800 (PST)
Received: from pallmd1.broadcom.com ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id m25sm655146wmi.46.2019.11.11.15.04.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 11 Nov 2019 15:04:12 -0800 (PST)
From:   James Smart <jsmart2021@gmail.com>
To:     linux-scsi@vger.kernel.org
Cc:     James Smart <jsmart2021@gmail.com>,
        Dick Kennedy <dick.kennedy@broadcom.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: [PATCH 1/6] lpfc: fix: Coverity: lpfc_get_scsi_buf_s3(): Null pointer dereferences
Date:   Mon, 11 Nov 2019 15:03:56 -0800
Message-Id: <20191111230401.12958-2-jsmart2021@gmail.com>
X-Mailer: git-send-email 2.13.7
In-Reply-To: <20191111230401.12958-1-jsmart2021@gmail.com>
References: <20191111230401.12958-1-jsmart2021@gmail.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Coverity reported the following:

*** CID 1487391:  Null pointer dereferences  (FORWARD_NULL)
/drivers/scsi/lpfc/lpfc_scsi.c: 614 in lpfc_get_scsi_buf_s3()
608     		spin_unlock(&phba->scsi_buf_list_put_lock);
609     	}
610     	spin_unlock_irqrestore(&phba->scsi_buf_list_get_lock, iflag);
611
612     	if (lpfc_ndlp_check_qdepth(phba, ndlp)) {
613     		atomic_inc(&ndlp->cmd_pending);
vvv     CID 1487391:  Null pointer dereferences  (FORWARD_NULL)
vvv     Dereferencing null pointer "lpfc_cmd".
614     		lpfc_cmd->flags |= LPFC_SBUF_BUMP_QDEPTH;
615     	}
616     	return  lpfc_cmd;
617     }
618     /**
619      * lpfc_get_scsi_buf_s4 - Get a scsi buffer from io_buf_list of the HBA

Fix by checking lpfc_cmd to be non-NULL as part of line 612

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487391 ("Null pointer dereferences")
Fixes: 2a5b7d626ed2 ("scsi: lpfc: Limit tracking of tgt queue depth in fast path")

Signed-off-by: Dick Kennedy <dick.kennedy@broadcom.com>
Signed-off-by: James Smart <jsmart2021@gmail.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
CC: linux-next@vger.kernel.org
---
 drivers/scsi/lpfc/lpfc_scsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/lpfc/lpfc_scsi.c b/drivers/scsi/lpfc/lpfc_scsi.c
index 959ef471d758..ba26df90a36a 100644
--- a/drivers/scsi/lpfc/lpfc_scsi.c
+++ b/drivers/scsi/lpfc/lpfc_scsi.c
@@ -611,7 +611,7 @@ lpfc_get_scsi_buf_s3(struct lpfc_hba *phba, struct lpfc_nodelist *ndlp,
 	}
 	spin_unlock_irqrestore(&phba->scsi_buf_list_get_lock, iflag);
 
-	if (lpfc_ndlp_check_qdepth(phba, ndlp)) {
+	if (lpfc_ndlp_check_qdepth(phba, ndlp) && lpfc_cmd) {
 		atomic_inc(&ndlp->cmd_pending);
 		lpfc_cmd->flags |= LPFC_SBUF_BUMP_QDEPTH;
 	}
-- 
2.13.7

