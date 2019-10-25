Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D51A2E53CE
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2019 20:32:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726297AbfJYSbJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 25 Oct 2019 14:31:09 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43752 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726217AbfJYSat (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 25 Oct 2019 14:30:49 -0400
Received: by mail-wr1-f65.google.com with SMTP id c2so3415511wrr.10;
        Fri, 25 Oct 2019 11:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=dDp13ywgSupw9EcMrvuhw6Gs8e5NpNu6s01gDT2RHJQ=;
        b=ffgFRoEse6zd80IO5oL6sDbN87iVSBHyvjDvAfBWVg4OsaaV+/9mmmCeWtcKoUFGg+
         TpZpPYnjdXrhkhaCsF2U8KGFZa0zn94FPNC//BQcn2KpHio7BGNr9p6ERLDUyCH/WfTR
         mjv9vBMLsdFdGVctTIUJtQ2rhu4go0lkNNDH9T0dKvK2mL8IxKdsvzgax2gyYBiMwUgX
         kgd9siwWAzDa3AfoqFUQzwVdxsU0cH+C97aCwM+I2Mqjpn7z7Tua83M7CgtGTTJbR11m
         phBU26GjC1jU7oZH24YMT0W8kZVhr+HQ/8/aAGUoFE74gNpzKvV28/0RWSrchpmO6TqZ
         c0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=dDp13ywgSupw9EcMrvuhw6Gs8e5NpNu6s01gDT2RHJQ=;
        b=qVe4VxEhgeP9GbNhosZrG9CQQE3xXSf3NO/2SDHWVNvfSznouv7U/3MCjQ1bakTV8p
         M75/6Wqhu5DTxMYCUQ13bY2TG0FptoVAJV3lHst/IcG/dXk0e7OAldhA1VKwQ8DEr7S1
         SwV5uu1lkvTKyfzTGCKzDI9Afow5ZtFceQ1HivHSc90mGiop7S/Azct3U+ZhGXwzyxKJ
         s9+8CtD3lfb8nICzk0HpHmGUSPvAKJASVO8KxcwS3Q5/+hGDK5v4Ak2nmVBFqxtQdPle
         UnvK2tVcqmX6klRV7unqgsCE9UlahREMGmpCg1yvj/4vx3n9t/7rgACAyR8iOkk7MsMC
         8I1w==
X-Gm-Message-State: APjAAAVMByA1YsFLXD2/EtdUU//bZS6sEGS7AlnwD9gVqy26U3TnPWqt
        2AHzfdYPzeuIHvsGgRMAtgnfJKwi
X-Google-Smtp-Source: APXvYqw7t4wrui6HEJVjcoEX7qLOZzwyF8ZiQvvhQZ5NIy4n4wvNH+tMBkFxnSCLtrxET45E0OKAoQ==
X-Received: by 2002:adf:e903:: with SMTP id f3mr4503713wrm.121.1572027940280;
        Fri, 25 Oct 2019 11:25:40 -0700 (PDT)
Received: from pallmd1.broadcom.com ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id i1sm3274259wmb.19.2019.10.25.11.25.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 25 Oct 2019 11:25:39 -0700 (PDT)
From:   James Smart <jsmart2021@gmail.com>
To:     linux-scsi@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        martin.petersen@oracle.com, sfr@canb.auug.org.au,
        James Smart <jsmart2021@gmail.com>,
        Dick Kennedy <dick.kennedy@broadcom.com>
Subject: [PATCH] lpfc: fix build error of lpfc_debugfs.c for vfree/vmalloc
Date:   Fri, 25 Oct 2019 11:25:30 -0700
Message-Id: <20191025182530.26653-1-jsmart2021@gmail.com>
X-Mailer: git-send-email 2.13.7
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

lpfc_debufs.c was missing include of vmalloc.h when compiled on PPC.

Add missing header.

Signed-off-by: Dick Kennedy <dick.kennedy@broadcom.com>
Signed-off-by: James Smart <jsmart2021@gmail.com>
---
 drivers/scsi/lpfc/lpfc_debugfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/scsi/lpfc/lpfc_debugfs.c b/drivers/scsi/lpfc/lpfc_debugfs.c
index ab124f7d50d6..6c8effcfc8ae 100644
--- a/drivers/scsi/lpfc/lpfc_debugfs.c
+++ b/drivers/scsi/lpfc/lpfc_debugfs.c
@@ -31,6 +31,7 @@
 #include <linux/pci.h>
 #include <linux/spinlock.h>
 #include <linux/ctype.h>
+#include <linux/vmalloc.h>
 
 #include <scsi/scsi.h>
 #include <scsi/scsi_device.h>
-- 
2.13.7

