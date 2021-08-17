Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB2B03EEDB5
	for <lists+linux-next@lfdr.de>; Tue, 17 Aug 2021 15:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237586AbhHQNtC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Aug 2021 09:49:02 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:3656 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235092AbhHQNtC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Aug 2021 09:49:02 -0400
Received: from fraeml741-chm.china.huawei.com (unknown [172.18.147.201])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Gpsm96vDYz6BGWC;
        Tue, 17 Aug 2021 21:47:37 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml741-chm.china.huawei.com (10.206.15.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 17 Aug 2021 15:48:27 +0200
Received: from localhost.localdomain (10.69.192.58) by
 lhreml724-chm.china.huawei.com (10.201.108.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 17 Aug 2021 14:48:23 +0100
From:   John Garry <john.garry@huawei.com>
To:     <tyreld@linux.ibm.com>, <mpe@ellerman.id.au>,
        <benh@kernel.crashing.org>, <paulus@samba.org>,
        <jejb@linux.ibm.com>, <martin.petersen@oracle.com>
CC:     <linux-scsi@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
        <linux-kernel@vger.kernel.org>, <hare@suse.de>,
        <bvanassche@acm.org>, <hch@lst.de>, <linux-next@vger.kernel.org>,
        <sfr@canb.auug.org.au>, "John Garry" <john.garry@huawei.com>
Subject: [PATCH] scsi: ibmvfc: Stop using scsi_cmnd.tag
Date:   Tue, 17 Aug 2021 21:43:37 +0800
Message-ID: <1629207817-211936-1-git-send-email-john.garry@huawei.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.58]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Use scsi_cmd_to_rq(scsi_cmnd)->tag in preference to scsi_cmnd.tag.

Signed-off-by: John Garry <john.garry@huawei.com>
---
This patch was missed in a series to remove scsi_cmnd.tag, which caused
a build error on Martin's SCSI staging tree:
https://lore.kernel.org/linux-scsi/yq14kbppa42.fsf@ca-mkp.ca.oracle.com/T/#mb47909f38f35837686734369600051b278d124af

I note that scsi_cmnd.tag is/was an unsigned char, and I could not find
anywhere in the driver which limits scsi_host.can_queue to 255, so using
scsi_cmnd.tag looks odd to me.

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 7fa5e64e38c3..ba7150cb226a 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -1956,7 +1956,7 @@ static int ibmvfc_queuecommand(struct Scsi_Host *shost, struct scsi_cmnd *cmnd)
 	memcpy(iu->cdb, cmnd->cmnd, cmnd->cmd_len);
 
 	if (cmnd->flags & SCMD_TAGGED) {
-		vfc_cmd->task_tag = cpu_to_be64(cmnd->tag);
+		vfc_cmd->task_tag = cpu_to_be64(scsi_cmd_to_rq(cmnd)->tag);
 		iu->pri_task_attr = IBMVFC_SIMPLE_TASK;
 	}
 
-- 
2.17.1

