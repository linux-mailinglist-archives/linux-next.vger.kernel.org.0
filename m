Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C6FB84F21
	for <lists+linux-next@lfdr.de>; Wed,  7 Aug 2019 16:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729968AbfHGOuU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Aug 2019 10:50:20 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:48968 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730003AbfHGOuU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Aug 2019 10:50:20 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x77Ekoh0068396
        for <linux-next@vger.kernel.org>; Wed, 7 Aug 2019 10:50:19 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2u7yp0kcx5-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Wed, 07 Aug 2019 10:50:19 -0400
Received: from localhost
        by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <maier@linux.ibm.com>;
        Wed, 7 Aug 2019 15:50:16 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
        by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Wed, 7 Aug 2019 15:50:13 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x77EoBLA27590880
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 7 Aug 2019 14:50:11 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 8850E11C054;
        Wed,  7 Aug 2019 14:50:10 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0D41011C066;
        Wed,  7 Aug 2019 14:50:10 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
        by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Wed,  7 Aug 2019 14:50:09 +0000 (GMT)
From:   Steffen Maier <maier@linux.ibm.com>
To:     "James E . J . Bottomley" <jejb@linux.ibm.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Ming Lei <ming.lei@redhat.com>
Cc:     linux-next@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-block@vger.kernel.org, dm-devel@redhat.com,
        linux-s390@vger.kernel.org, Benjamin Block <bblock@linux.ibm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Steffen Maier <maier@linux.ibm.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Hannes Reinecke <hare@suse.com>, Jens Axboe <axboe@kernel.dk>,
        "Ewan D . Milne" <emilne@redhat.com>,
        Christoph Hellwig <hch@lst.de>,
        Mike Snitzer <snitzer@redhat.com>
Subject: [PATCH 2/2] scsi: core: fix dh and multipathing for SCSI hosts without request batching
Date:   Wed,  7 Aug 2019 16:49:48 +0200
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190807144948.28265-1-maier@linux.ibm.com>
References: <20190807144948.28265-1-maier@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19080714-4275-0000-0000-000003564A67
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19080714-4276-0000-0000-000038684CDB
Message-Id: <20190807144948.28265-3-maier@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-08-07_03:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908070158
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This was missing from scsi_device_from_queue() due to the introduction
of another new scsi_mq_ops_no_commit of linux-next commit
8930a6c20791 ("scsi: core: add support for request batching")
from Martin's scsi/5.4/scsi-queue or James' scsi/misc.

Only devicehandler code seems to call scsi_device_from_queue():
*** drivers/scsi/scsi_dh.c:
scsi_dh_activate[255]          sdev = scsi_device_from_queue(q);
scsi_dh_set_params[302]        sdev = scsi_device_from_queue(q);
scsi_dh_attach[325]            sdev = scsi_device_from_queue(q);
scsi_dh_attached_handler_name[363] sdev = scsi_device_from_queue(q);

Fixes multipath tools follow-on errors:

$ multipath -v6
...
libdevmapper: ioctl/libdm-iface.c(1887): device-mapper: reload ioctl on mpatha  failed: No such device
...
mpatha: failed to load map, error 19
...

showing also as kernel messages:

device-mapper: table: 252:0: multipath: error attaching hardware handler
device-mapper: ioctl: error adding target to table

Signed-off-by: Steffen Maier <maier@linux.ibm.com>
Fixes: 8930a6c20791 ("scsi: core: add support for request batching")
Cc: Paolo Bonzini <pbonzini@redhat.com>
---
 drivers/scsi/scsi_lib.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
index 90c257622bb0..73e7d29fbd66 100644
--- a/drivers/scsi/scsi_lib.c
+++ b/drivers/scsi/scsi_lib.c
@@ -1922,7 +1922,8 @@ struct scsi_device *scsi_device_from_queue(struct request_queue *q)
 {
 	struct scsi_device *sdev = NULL;
 
-	if (q->mq_ops == &scsi_mq_ops)
+	if (q->mq_ops == &scsi_mq_ops_no_commit ||
+	    q->mq_ops == &scsi_mq_ops)
 		sdev = q->queuedata;
 	if (!sdev || !get_device(&sdev->sdev_gendev))
 		sdev = NULL;
-- 
2.17.1

