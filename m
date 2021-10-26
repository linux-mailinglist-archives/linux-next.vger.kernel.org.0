Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 826DF43A9D0
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 03:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231246AbhJZBpU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Oct 2021 21:45:20 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51536 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230183AbhJZBpU (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 25 Oct 2021 21:45:20 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19PMJ7sX007783;
        Tue, 26 Oct 2021 01:42:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=gmrTaMPNxQ4/kZOEQtH0uydfComeq4SJRWJOX0p0aJc=;
 b=hvz9KeKpAndzpihpAbPzU1gaaqEUzW9AFfJLTeQ7ykdyuSvDqn0fSP2YszvWOJcPwNqS
 16fT50LwtWgJfrBKtCRk4MNREW9gQqsa50B0oHhOnB726CMYl1qQRficA1ID4y7jILiA
 4CVpJ8EWAxD0fXdjBlbIHsFpcEb67R8ZD3TUKqyv02799MtOxuLSRx5EEX9cBdMHZoln
 fc9P2fDQz6JWNS83/7tPx80tvAuvk29gp8HwbQxuPaTy5Qla8vbiUNhYYUrqYYQ3UQW7
 SZwVAij2kC1GnrS9Y6vVY/psisZESfuhLJMYO6ynDUJ8QWR9E8lZFESYaSWycyxjIz0B Kg== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
        by mx0b-001b2d01.pphosted.com with ESMTP id 3bx596bst3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Oct 2021 01:42:50 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
        by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19Q1cOrb019026;
        Tue, 26 Oct 2021 01:42:48 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
        by ppma05fra.de.ibm.com with ESMTP id 3bx4er8ts1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Oct 2021 01:42:48 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 19Q1gjmT56820084
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 26 Oct 2021 01:42:45 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 44BFCA4053;
        Tue, 26 Oct 2021 01:42:45 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E379FA404D;
        Tue, 26 Oct 2021 01:42:44 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Tue, 26 Oct 2021 01:42:44 +0000 (GMT)
From:   Steffen Maier <maier@linux.ibm.com>
To:     jwi@linux.ibm.com, bvanassche@acm.org, martin.petersen@oracle.com,
        jejb@linux.ibm.com, linux-scsi@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, maier@linux.ibm.com,
        bblock@linux.ibm.com, linux-next@vger.kernel.org,
        linux-s390@vger.kernel.org
Subject: [PATCH v3] scsi: core: Fix early registration of sysfs attributes for scsi_device
Date:   Tue, 26 Oct 2021 03:42:40 +0200
Message-Id: <20211026014240.4098365-1-maier@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2f5e5d18-7ba9-10f6-1855-84546172b473@linux.ibm.com>
References: <2f5e5d18-7ba9-10f6-1855-84546172b473@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: AaUGkOiNI1MDrbg3K94kAjpYM8uaOoQW
X-Proofpoint-GUID: AaUGkOiNI1MDrbg3K94kAjpYM8uaOoQW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-25_08,2021-10-25_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110260006
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

v4.17 commit 86b87cde0b55 ("scsi: core: host template attribute groups")
introduced explicit sysfs_create_groups() in scsi_sysfs_add_sdev()
and sysfs_remove_groups() in __scsi_remove_device(), both for sdev_gendev,
based on a new field const struct attribute_group **sdev_groups
of struct scsi_host_template.

Commit 92c4b58b15c5 ("scsi: core: Register sysfs attributes earlier")
removed above explicit (de)registration of scsi_device attribute groups.
It also converted all scsi_device attributes and attribute_groups to
end up in a new field const struct attribute_group *gendev_attr_groups[6]
of struct scsi_device. However, that new field was not used anywhere.

Surprisingly, this only caused missing LLDD specific scsi_device sysfs
attributes. Whereas, scsi core attributes from scsi_sdev_attr_groups
did continue to exist because of scsi_dev_type.groups.

We separate scsi core attibutes from LLDD specific attributes.
Hence, we keep the initializing assignment scsi_dev_type =
{ .groups = scsi_sdev_attr_groups, } as this takes care of core
attributes. Without the separation, it would cause attribute double
registration due to scsi_dev_type.groups and sdev_gendev.groups.

Julian suggested to assign the sdev_groups pointer of the
scsi_host_template directly to the groups pointer of sdev_gendev.
This way we can delete the container scsi_device.gendev_attr_groups
and the loop copying each entry from hostt->sdev_groups to
sdev->gendev_attr_groups.

Alternative approaches ruled out:
Assigning gendev_attr_groups to sdev_dev has no visible effect.
Assigning sdev->gendev_attr_groups to scsi_dev_type.groups
caused scsi_device of all scsi host types to get LLDD specific
attributes of the LLDD for which the last sdev alloc happened to occur,
as that overwrote scsi_dev_type.groups,
e.g. scsi_debug had zfcp-specific scsi_device attributes.

Signed-off-by: Steffen Maier <maier@linux.ibm.com>
Fixes: 92c4b58b15c5 ("scsi: core: Register sysfs attributes earlier")
Suggested-by: Julian Wiedmann <jwi@linux.ibm.com>
---

Notes:
    Changes in v3:
    * integrated Julian's feedback of dropping detour through
      gendev_attr_groups
    
    Changes in v2:
    * integrated Bart's feedback of updating the comment for
      the gendev_attr_groups declaration to match the code change
    * in that spirit also adapted the vector size of that field
    * eliminated the now unnecessary second loop counter 'j'

 drivers/scsi/scsi_sysfs.c  | 11 +----------
 include/scsi/scsi_device.h |  6 ------
 2 files changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/scsi/scsi_sysfs.c b/drivers/scsi/scsi_sysfs.c
index c26f0e29e8cd..fa064bf9a55c 100644
--- a/drivers/scsi/scsi_sysfs.c
+++ b/drivers/scsi/scsi_sysfs.c
@@ -1571,7 +1571,6 @@ static struct device_type scsi_dev_type = {
 
 void scsi_sysfs_device_initialize(struct scsi_device *sdev)
 {
-	int i, j = 0;
 	unsigned long flags;
 	struct Scsi_Host *shost = sdev->host;
 	struct scsi_host_template *hostt = shost->hostt;
@@ -1583,15 +1582,7 @@ void scsi_sysfs_device_initialize(struct scsi_device *sdev)
 	scsi_enable_async_suspend(&sdev->sdev_gendev);
 	dev_set_name(&sdev->sdev_gendev, "%d:%d:%d:%llu",
 		     sdev->host->host_no, sdev->channel, sdev->id, sdev->lun);
-	sdev->gendev_attr_groups[j++] = &scsi_sdev_attr_group;
-	if (hostt->sdev_groups) {
-		for (i = 0; hostt->sdev_groups[i] &&
-			     j < ARRAY_SIZE(sdev->gendev_attr_groups);
-		     i++, j++) {
-			sdev->gendev_attr_groups[j] = hostt->sdev_groups[i];
-		}
-	}
-	WARN_ON_ONCE(j >= ARRAY_SIZE(sdev->gendev_attr_groups));
+	sdev->sdev_gendev.groups = hostt->sdev_groups;
 
 	device_initialize(&sdev->sdev_dev);
 	sdev->sdev_dev.parent = get_device(&sdev->sdev_gendev);
diff --git a/include/scsi/scsi_device.h b/include/scsi/scsi_device.h
index b1e9b3bd3a60..b97e142a7ca9 100644
--- a/include/scsi/scsi_device.h
+++ b/include/scsi/scsi_device.h
@@ -225,12 +225,6 @@ struct scsi_device {
 
 	struct device		sdev_gendev,
 				sdev_dev;
-	/*
-	 * The array size 6 provides space for one attribute group for the
-	 * SCSI core, four attribute groups defined by SCSI LLDs and one
-	 * terminating NULL pointer.
-	 */
-	const struct attribute_group *gendev_attr_groups[6];
 
 	struct execute_work	ew; /* used to get process context on put */
 	struct work_struct	requeue_work;
-- 
2.25.1

