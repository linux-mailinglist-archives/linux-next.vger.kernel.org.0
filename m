Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 079C02FED55
	for <lists+linux-next@lfdr.de>; Thu, 21 Jan 2021 15:49:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731284AbhAUOsr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Jan 2021 09:48:47 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:15222 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731693AbhAUOlL (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 21 Jan 2021 09:41:11 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 10LEXg4v164576;
        Thu, 21 Jan 2021 09:40:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=KxzX4+H7dWRzocQvrEDfoM7NVNn8RcwKOeZehL2gV0Q=;
 b=dI4kQjnydeihkwNXcL8sM8rKA+jMkfyx3mccV75qEYKv2dsOjk6Dlz/bUdaHzQdsilAu
 uotkJTKvifoChXiu5KdpbQiHCA9PTvWXTo08uTuK7iYXLSwCnszgPD7TDQJBn9YJrEeS
 ekQ/U5PxX88VhNYKw6FfbD15XUFcBBSw+ne26X6Kx0TSAdxEwTWtPSXLLgH5tjsriSat
 s9pv7BrC2dm/ZVn28XnYy8ylBeba9fI/VlawBn1shavsrkvmjlwy1DjYfzVLvIP6u6fK
 abMGf0aUzD4zRqi1WMTpRy+lkaEAWFqYRrkvqgZHo+4OQJ79FMH0puj+EYukh7B5ZzW2 Yw== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
        by mx0a-001b2d01.pphosted.com with ESMTP id 367b66ruwc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 21 Jan 2021 09:40:04 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
        by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10LEbhcu024394;
        Thu, 21 Jan 2021 14:39:49 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
        by ppma06fra.de.ibm.com with ESMTP id 3668p90wft-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 21 Jan 2021 14:39:49 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 10LEdkUR39256332
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 21 Jan 2021 14:39:46 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3CD36AE051;
        Thu, 21 Jan 2021 14:39:46 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 320D1AE04D;
        Thu, 21 Jan 2021 14:39:46 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
        by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Thu, 21 Jan 2021 14:39:46 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 55390)
        id E1FA8E1FBD; Thu, 21 Jan 2021 15:39:45 +0100 (CET)
From:   Sven Schnelle <svens@linux.ibm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        Sven Schnelle <svens@linux.ibm.com>
Subject: [PATCH] s390: allow reschedule on syscall restart
Date:   Thu, 21 Jan 2021 15:39:26 +0100
Message-Id: <20210121143926.21440-2-svens@linux.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210121143926.21440-1-svens@linux.ibm.com>
References: <20210121143926.21440-1-svens@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-21_06:2021-01-21,2021-01-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=903
 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101210078
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Commit 845f44e8ef28 ("sched: Report local wake up on resched blind zone
within idle loop") from next-20210121 causes a warning because s390
doesn't call sched_resched_local_allow() when restarting a syscall.

Signed-off-by: Sven Schnelle <svens@linux.ibm.com>
---
 arch/s390/kernel/syscall.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/s390/kernel/syscall.c b/arch/s390/kernel/syscall.c
index bc8e650e377d..2b39ac40f970 100644
--- a/arch/s390/kernel/syscall.c
+++ b/arch/s390/kernel/syscall.c
@@ -162,6 +162,7 @@ void noinstr __do_syscall(struct pt_regs *regs, int per_trap)
 		do_syscall(regs);
 		if (!test_pt_regs_flag(regs, PIF_SYSCALL_RESTART))
 			break;
+		sched_resched_local_allow();
 		local_irq_enable();
 	}
 	exit_to_user_mode();
-- 
2.17.1

