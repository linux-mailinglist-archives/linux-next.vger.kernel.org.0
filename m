Return-Path: <linux-next+bounces-9514-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F1ECECD10
	for <lists+linux-next@lfdr.de>; Thu, 01 Jan 2026 06:20:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DEEAD30084E4
	for <lists+linux-next@lfdr.de>; Thu,  1 Jan 2026 05:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B491E5018;
	Thu,  1 Jan 2026 05:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Y+nMMuCo"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90392A1BA;
	Thu,  1 Jan 2026 05:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767244844; cv=none; b=buPIglNE8bucXDGLsquzUk3QPXzzil5syjeBZwDfOddMjZrsttzv7duUiYHGTTXUcLicq35IS8SrSmmUYYi+DagVJ7x8yAsb1qK+OMHCrTCmTdBatMuEdQPYoEMwJUWVWaXvxem0uhGBIB0Kw6dKVs1xmAPJ3a5LqtEl4PXngRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767244844; c=relaxed/simple;
	bh=sQt7pWitgF3wxvAgk6qDcZfoCRTLRw7l7GhBhW0rFHI=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=XVQUzbf9UxikGj1nefgEiNXY7Jj4Z/ECZI9WKafXTTk0PJwrYV+GhxbPjECZvtN0loYBTgxTtV6IHvJOiq2/W61EaRnHBWzW+CEjv9FgKeTXY1RXleXlQ/XcvB+WmJp4QIL8IWGzAG6XYZmLBpeNS9vLCfd//pw7n2BfPQ6UbP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Y+nMMuCo; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BVIdLUD024314;
	Thu, 1 Jan 2026 05:20:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=0SjfIVcoDD8wgg5bN+RborcvdwGW
	ClxZsBOnt7RSZkk=; b=Y+nMMuCoERFSA3UAEfu4yljYlZiqJwnhelTF83aOJZca
	BtkADFcYHkfEXTRFSB/TZ4H1fwERIEQGYxDhuc6AXE4jjbeRYp+9fFEOTNxEM72N
	YPNcfSpKilXPx4FkBlAv2zHW/4T5YGWHObspNKakJI5hS6aig6I9WlXMdeqVQp8p
	zKpc/Qc/eyRZR4Vgahyj10GQBJjaVM5sXHDOf8ntlwi5HQW/oiAf57p4MG5zXFQN
	Qx97ieDV1Kt2BzS1DQpTUpMjwQDrON5gs92d4cQWgzclUIaCnLjVBNV3rgqQaF7y
	sJY881mKVVayRsAcfazpe40z2qvgI3+aKW//W5kQPg==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba74uavcj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jan 2026 05:20:07 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6012BtZm008053;
	Thu, 1 Jan 2026 05:20:06 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bav0k19n4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jan 2026 05:20:06 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6015K6VJ64356704
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 Jan 2026 05:20:06 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6CED05803F;
	Thu,  1 Jan 2026 05:20:06 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4712C58060;
	Thu,  1 Jan 2026 05:20:04 +0000 (GMT)
Received: from [9.61.255.156] (unknown [9.61.255.156])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  1 Jan 2026 05:20:03 +0000 (GMT)
Message-ID: <193bd91f-d6d7-43e4-8d9b-308908717b68@linux.ibm.com>
Date: Thu, 1 Jan 2026 10:50:02 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Linux Next Mailing List <linux-next@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [next-20251219]Build Failure on IBM Power system
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kuoOx2TSRiIz5u9zg3bU6jdyOJ0QgNqh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAxMDA0NiBTYWx0ZWRfX/Ede+1yZ4rmi
 3se2Vp+7zlyBLZF0gIgHKDse6yABCrsYM1iPB57VuBnMu/e+afY2zUZbrkLCmGw7TJDQ8otnB1j
 c7II7sMbQVkyESMMbXCyewBszHirtUPcqSZ3XGkCw6PuLqdVUaaq+Cb0wuEKOkO7TB76rCYaiRK
 Q0uGON5BHnb5ZpuFaYwbyuRcPAvqMzNPVHY1Gn7j11p89MQOoJeipvRPtZO6Kv4iC3te4jsLX0s
 s5IH2SnbYuVQHs38W7itjEiFfe6axi1P8oIAvSrfI2JEjHe0+gIiqG8l0EaS4q7yosQWV1E23+3
 ZVO7Mu6OGPmJNBtZhPrdrwvs0H+dcWFXIdkves1vsKhbQexqTr8aYA2hSCHiMW9PJut9/GpgH3c
 likxDs6FS4CPjRLLAeZ4MhpSSHNWYc3+R0CsixkaqRHXe8dIHVoScezIIhPt/xWeq7W1OWcr9oQ
 KyS33N7iBe6m6sV+WHg==
X-Authority-Analysis: v=2.4 cv=AN8t5o3d c=1 sm=1 tr=0 ts=69560407 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=JfrnYn6hAAAA:8 a=VnNF1IyMAAAA:8
 a=CI-9MVhQOQwJVvpQJMkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Vxmtnl_E_bksehYqCbjh:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: kuoOx2TSRiIz5u9zg3bU6jdyOJ0QgNqh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601010046

Greetings!!!


IBM CI has reported a build failure on next-20251219 build.


Build Failure:

cc1: some warnings being treated as errors
make[4]: *** [scripts/Makefile.build:287: kernel/sched/build_policy.o] 
Error 1
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [scripts/Makefile.build:556: kernel/sched] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [scripts/Makefile.build:556: kernel] Error 2
make[2]: *** Waiting for unfinished jobs....


IBM CI has bisected this issue to below commit.


5d1f0b2f278eb55aebe29210fbc8f352c53497d6 is the first bad commit
commit 5d1f0b2f278eb55aebe29210fbc8f352c53497d6
Author: Peter Zijlstra <peterz@infradead.org>
Date:   Wed Dec 10 09:06:50 2025 +0100


Bisection Logs:

#git bisect log
git bisect log
git bisect start
# status: waiting for both good and bad commits
# good: [8f0b4cce4481fb22653697cced8d0d04027cb1e8] Linux 6.19-rc1
git bisect good 8f0b4cce4481fb22653697cced8d0d04027cb1e8
# status: waiting for bad commit, 1 good commit known
# bad: [cc3aa43b44bdb43dfbac0fcb51c56594a11338a8] Add linux-next 
specific files for 20251219
git bisect bad cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
# good: [600a692707acda49434d6c2c03dda20f46e09749] Merge branch 
'libcrypto-next' of 
https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git
git bisect good 600a692707acda49434d6c2c03dda20f46e09749
# good: [816a7181ac38fd22243edb557537b2aecb9eeb76] Merge branch 
'drm-xe-next' of https://gitlab.freedesktop.org/drm/xe/kernel.git
git bisect good 816a7181ac38fd22243edb557537b2aecb9eeb76
# good: [7157d55093613cf905cfd665772eae35d5c388f0] Merge branch 
'for-next' of 
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git
git bisect good 7157d55093613cf905cfd665772eae35d5c388f0
# bad: [52af2cfd69d264f1a370693966acf5d96943add8] Merge branch 
'extcon-next' of 
https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/extcon.git
git bisect bad 52af2cfd69d264f1a370693966acf5d96943add8
# bad: [502068d3b65cc8695f8da83a7f19c90805c958ca] next-20251217/tip
git bisect bad 502068d3b65cc8695f8da83a7f19c90805c958ca
# bad: [c06f166058309936567065e737f6f5d9609a1a87] Merge branch into 
tip/master: 'sched/core'
git bisect bad c06f166058309936567065e737f6f5d9609a1a87
# good: [e2292f5c21542354246687d8e3e48a58b046e27b] Merge branch into 
tip/master: 'irq/msi'
git bisect good e2292f5c21542354246687d8e3e48a58b046e27b
# good: [fb9a7458e508ef1beae8d80ee40c2cd1b5b45f3a] sched/fair: Clean up 
comments in 'struct cfs_rq'
git bisect good fb9a7458e508ef1beae8d80ee40c2cd1b5b45f3a
# good: [527a521029c3edd38fb9fc96cd58e3fd7393d28e] sched/fair: Sort out 
'blocked_load*' namespace noise
git bisect good 527a521029c3edd38fb9fc96cd58e3fd7393d28e
# good: [7ac422cf7b16ec524bcd8e017459e328a4103f63] 
perf/x86/intel/cstate: Add Diamond Rapids support
git bisect good 7ac422cf7b16ec524bcd8e017459e328a4103f63
# bad: [5d1f0b2f278eb55aebe29210fbc8f352c53497d6] sched/core: Rework 
sched_class::wakeup_preempt() and rq_modified_*()
git bisect bad 5d1f0b2f278eb55aebe29210fbc8f352c53497d6
# first bad commit: [5d1f0b2f278eb55aebe29210fbc8f352c53497d6] 
sched/core: Rework sched_class::wakeup_preempt() and rq_modified_*()



If you happen to fix this issue, please add below tag.


Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>



Regards,

Venkat.



