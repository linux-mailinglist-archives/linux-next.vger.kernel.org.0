Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C5CE438C4A
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 00:16:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbhJXWTC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 24 Oct 2021 18:19:02 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:18626 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229533AbhJXWS4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Sun, 24 Oct 2021 18:18:56 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19OGrBkg003082;
        Sun, 24 Oct 2021 18:16:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=GbwkcL9DOVSwp4uDiMhxaHO7SnZqKhMidk9aBx/cFKY=;
 b=SdcpNB4r0vku8yq73MIbIuj5qlVwJtvIKfC4wGbeSQCCH/YODx+WaQc8cHe0fvc0Ejnr
 uSnUhLabzRfRZLE8nz7G6b3sataczzBOGpFT/UUrS/T+NC+iVhGRO1hXvGbZIebPEdOA
 GOD8r63f0fhU3biGJjtl1nc6d/ogpMk/nKZai0mM0YgYu6r6uuBXSa8sLHJCTl8UXy5n
 FHAIY2R+8OKi3skXT5/Tk/y6F8/nsnI7nUYtaCSGqsOiDoCakBnM2gmPEWxFQMaDGzVp
 56JIoYdccmf0ElO3CXBii4w8GTM+BLidBlDC31Y8fPXELBqnTX8e5twDT0nK7EI9+5/d Pg== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
        by mx0b-001b2d01.pphosted.com with ESMTP id 3bvywc3dyc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 24 Oct 2021 18:16:28 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
        by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19OMDKNk018615;
        Sun, 24 Oct 2021 22:16:26 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
        by ppma01fra.de.ibm.com with ESMTP id 3bva18xvug-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 24 Oct 2021 22:16:26 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
        by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 19OMGMYM64225742
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sun, 24 Oct 2021 22:16:22 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 98C104C059;
        Sun, 24 Oct 2021 22:16:22 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 483904C044;
        Sun, 24 Oct 2021 22:16:22 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
        by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Sun, 24 Oct 2021 22:16:22 +0000 (GMT)
From:   Steffen Maier <maier@linux.ibm.com>
To:     bvanassche@acm.org, martin.petersen@oracle.com, jejb@linux.ibm.com,
        linux-scsi@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, maier@linux.ibm.com,
        bblock@linux.ibm.com, linux-next@vger.kernel.org,
        linux-s390@vger.kernel.org
Subject: [PATCH v2] scsi: core: Fix early registration of sysfs attributes for scsi_device
Date:   Mon, 25 Oct 2021 00:16:20 +0200
Message-Id: <20211024221620.760160-1-maier@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <b5e69621-e2ee-750a-e542-a27aaa9293e5@acm.org>
References: <b5e69621-e2ee-750a-e542-a27aaa9293e5@acm.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gWGxPWfnDqZPzJyp1dHGOwrB0obs4Ii5
X-Proofpoint-ORIG-GUID: gWGxPWfnDqZPzJyp1dHGOwrB0obs4Ii5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-24_06,2021-10-22_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0
 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110240153
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

Fix it by assigning the pointer of that new field to the groups
field of sdev_gendev so the driver core gets our LLDD groups.
Just like scsi_host_alloc() was changed by the same commit,
although scsi_host_alloc() already had assigned something to
shost_dev.groups so the necessary change was more obvious there.

We separate scsi core attibutes from LLDD specific attributes.
Hence, we keep the initializing assignment scsi_dev_type =
{ .groups = scsi_sdev_attr_groups, } as this takes care of core
attributes. Without the separation, it would cause attribute double
registration due to scsi_dev_type.groups and sdev_gendev.groups.

Since we now no longer have an index offset between left and right
hand side of the assignment in the loop, one counter variable suffices.

Alternative approaches ruled out:
Assigning gendev_attr_groups to sdev_dev has no visible effect.
Assigning sdev->gendev_attr_groups to scsi_dev_type.groups
caused scsi_device of all scsi host types to get LLDD specific
attributes of the LLDD for which the last sdev alloc happened to occur,
as that overwrote scsi_dev_type.groups,
e.g. scsi_debug had zfcp-specific scsi_device attributes.

Signed-off-by: Steffen Maier <maier@linux.ibm.com>
Fixes: 92c4b58b15c5 ("scsi: core: Register sysfs attributes earlier")
---

Changes in v2:
* integrated Bart's feedback of updating the comment for
  the gendev_attr_groups declaration to match the code change
* in that spirit also adapted the vector size of that field
* eliminated the now unnecessary second loop counter 'j'

 drivers/scsi/scsi_sysfs.c  | 12 ++++++------
 include/scsi/scsi_device.h |  7 +++----
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/scsi/scsi_sysfs.c b/drivers/scsi/scsi_sysfs.c
index c26f0e29e8cd..d73e84e1cb37 100644
--- a/drivers/scsi/scsi_sysfs.c
+++ b/drivers/scsi/scsi_sysfs.c
@@ -1571,7 +1571,7 @@ static struct device_type scsi_dev_type = {
 
 void scsi_sysfs_device_initialize(struct scsi_device *sdev)
 {
-	int i, j = 0;
+	int i = 0;
 	unsigned long flags;
 	struct Scsi_Host *shost = sdev->host;
 	struct scsi_host_template *hostt = shost->hostt;
@@ -1583,15 +1583,15 @@ void scsi_sysfs_device_initialize(struct scsi_device *sdev)
 	scsi_enable_async_suspend(&sdev->sdev_gendev);
 	dev_set_name(&sdev->sdev_gendev, "%d:%d:%d:%llu",
 		     sdev->host->host_no, sdev->channel, sdev->id, sdev->lun);
-	sdev->gendev_attr_groups[j++] = &scsi_sdev_attr_group;
+	sdev->sdev_gendev.groups = sdev->gendev_attr_groups;
 	if (hostt->sdev_groups) {
 		for (i = 0; hostt->sdev_groups[i] &&
-			     j < ARRAY_SIZE(sdev->gendev_attr_groups);
-		     i++, j++) {
-			sdev->gendev_attr_groups[j] = hostt->sdev_groups[i];
+			     i < ARRAY_SIZE(sdev->gendev_attr_groups);
+		     i++) {
+			sdev->gendev_attr_groups[i] = hostt->sdev_groups[i];
 		}
 	}
-	WARN_ON_ONCE(j >= ARRAY_SIZE(sdev->gendev_attr_groups));
+	WARN_ON_ONCE(i >= ARRAY_SIZE(sdev->gendev_attr_groups));
 
 	device_initialize(&sdev->sdev_dev);
 	sdev->sdev_dev.parent = get_device(&sdev->sdev_gendev);
diff --git a/include/scsi/scsi_device.h b/include/scsi/scsi_device.h
index b1e9b3bd3a60..b6f0d031217e 100644
--- a/include/scsi/scsi_device.h
+++ b/include/scsi/scsi_device.h
@@ -226,11 +226,10 @@ struct scsi_device {
 	struct device		sdev_gendev,
 				sdev_dev;
 	/*
-	 * The array size 6 provides space for one attribute group for the
-	 * SCSI core, four attribute groups defined by SCSI LLDs and one
-	 * terminating NULL pointer.
+	 * The array size 5 provides space for four attribute groups
+	 * defined by SCSI LLDs and one terminating NULL pointer.
 	 */
-	const struct attribute_group *gendev_attr_groups[6];
+	const struct attribute_group *gendev_attr_groups[5];
 
 	struct execute_work	ew; /* used to get process context on put */
 	struct work_struct	requeue_work;
-- 
2.25.1

