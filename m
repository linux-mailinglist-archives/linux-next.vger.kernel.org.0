Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A353143888E
	for <lists+linux-next@lfdr.de>; Sun, 24 Oct 2021 13:18:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231285AbhJXLVC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 24 Oct 2021 07:21:02 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:24644 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229867AbhJXLVC (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Sun, 24 Oct 2021 07:21:02 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19OAV3x7004570;
        Sun, 24 Oct 2021 07:18:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=4rji1ooIqeEW///gI5gv9Q3YhienQa8YwSeW7BkMM/w=;
 b=kXA1VWub0F7q8yLskh5z8YZQDrsepiAwQ+wnBkdq5z7Xd4TpJC8DhGDlfKVHJpBGl2Ma
 rpkoczQvNBp1QJUKnKOMuJ/SPBPvLBJ3GCF6ifN4Mk4adHhI2idlo4bhb6tl+wcazYrQ
 xrxFIadFeLl/O10AQ03ld6FIKQbCRFVKF1hQF+/XDoTE4WcRKi8BJY/+a5mRojkzQcpS
 ZXofpCege2I+CuqOk7TtlfzohjN17F7TR+IOEl2SMYwfhmLm9aR42gxZNx8V/IcWQhak
 rPxH62eDxBUGluXw4Xs5gZN96l3kGSY+RoPhv5Dp5TeudfBe5cQg9TfsgXuuOeFAL2/P KQ== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3bvyuycpmv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 24 Oct 2021 07:18:35 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
        by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19OBCgeT014318;
        Sun, 24 Oct 2021 11:18:33 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
        by ppma03fra.de.ibm.com with ESMTP id 3bva19db2k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 24 Oct 2021 11:18:33 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 19OBIUAF32178458
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sun, 24 Oct 2021 11:18:30 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 5630B4C05C;
        Sun, 24 Oct 2021 11:18:30 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 080494C05E;
        Sun, 24 Oct 2021 11:18:30 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
        by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Sun, 24 Oct 2021 11:18:29 +0000 (GMT)
From:   Steffen Maier <maier@linux.ibm.com>
To:     bvanassche@acm.org, martin.petersen@oracle.com, jejb@linux.ibm.com,
        linux-scsi@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, maier@linux.ibm.com,
        bblock@linux.ibm.com, linux-next@vger.kernel.org,
        linux-s390@vger.kernel.org
Subject: [PATCH] scsi: core: Fix early registration of sysfs attributes for scsi_device
Date:   Sun, 24 Oct 2021 13:18:15 +0200
Message-Id: <20211024111815.556995-1-maier@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <604fad4c-4003-b413-b3c8-00abcd65341e@linux.ibm.com>
References: <604fad4c-4003-b413-b3c8-00abcd65341e@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: t3ze3kTQy_JZA4rd-S-E5r2qFsO_s_bN
X-Proofpoint-ORIG-GUID: t3ze3kTQy_JZA4rd-S-E5r2qFsO_s_bN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-24_02,2021-10-22_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110240078
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
 drivers/scsi/scsi_sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/scsi_sysfs.c b/drivers/scsi/scsi_sysfs.c
index c26f0e29e8cd..a3e37d3728df 100644
--- a/drivers/scsi/scsi_sysfs.c
+++ b/drivers/scsi/scsi_sysfs.c
@@ -1583,7 +1583,7 @@ void scsi_sysfs_device_initialize(struct scsi_device *sdev)
 	scsi_enable_async_suspend(&sdev->sdev_gendev);
 	dev_set_name(&sdev->sdev_gendev, "%d:%d:%d:%llu",
 		     sdev->host->host_no, sdev->channel, sdev->id, sdev->lun);
-	sdev->gendev_attr_groups[j++] = &scsi_sdev_attr_group;
+	sdev->sdev_gendev.groups = sdev->gendev_attr_groups;
 	if (hostt->sdev_groups) {
 		for (i = 0; hostt->sdev_groups[i] &&
 			     j < ARRAY_SIZE(sdev->gendev_attr_groups);
-- 
2.25.1

