Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D312684F1B
	for <lists+linux-next@lfdr.de>; Wed,  7 Aug 2019 16:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729938AbfHGOuM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Aug 2019 10:50:12 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:59730 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729887AbfHGOuM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Aug 2019 10:50:12 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x77EkpDM014482
        for <linux-next@vger.kernel.org>; Wed, 7 Aug 2019 10:50:11 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2u7xrvpf5t-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Wed, 07 Aug 2019 10:50:10 -0400
Received: from localhost
        by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <maier@linux.ibm.com>;
        Wed, 7 Aug 2019 15:50:08 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
        by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Wed, 7 Aug 2019 15:50:03 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
        by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x77EnhnL29163932
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 7 Aug 2019 14:49:43 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3F3FB11C073;
        Wed,  7 Aug 2019 14:50:01 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id AE6B511C064;
        Wed,  7 Aug 2019 14:50:00 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
        by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Wed,  7 Aug 2019 14:50:00 +0000 (GMT)
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
Subject: [PATCH 0/2] scsi: core: regression fixes for request batching
Date:   Wed,  7 Aug 2019 16:49:46 +0200
X-Mailer: git-send-email 2.17.1
X-TM-AS-GCONF: 00
x-cbid: 19080714-0028-0000-0000-0000038C9A2B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19080714-0029-0000-0000-0000244CFF51
Message-Id: <20190807144948.28265-1-maier@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-08-07_03:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=817 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908070158
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi James, Martin, Paolo, Ming,

multipathing with linux-next is broken since 20190723 in our CI.
The patches fix a memleak and a severe dh/multipath functional regression.
It would be nice if we could get them to 5.4/scsi-queue and also next.

I would have preferred if such a new feature had used its own
new copy scsi_mq_ops_batching instead of changing the use case and
semantics of the existing scsi_mq_ops, because this would likely
cause less regressions for all the other users not using the new feature.

Steffen Maier (2):
  scsi: core: fix missing .cleanup_rq for SCSI hosts without request
    batching
  scsi: core: fix dh and multipathing for SCSI hosts without request
    batching

 drivers/scsi/scsi_lib.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.17.1

