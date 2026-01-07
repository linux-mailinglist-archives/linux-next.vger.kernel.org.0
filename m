Return-Path: <linux-next+bounces-9572-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11ABCCFC047
	for <lists+linux-next@lfdr.de>; Wed, 07 Jan 2026 05:52:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F017A303BFAD
	for <lists+linux-next@lfdr.de>; Wed,  7 Jan 2026 04:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AEA322A4FE;
	Wed,  7 Jan 2026 04:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="clZ8f73b"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1855178F29;
	Wed,  7 Jan 2026 04:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767761539; cv=none; b=TMd1CjPAZ2XOXBkGZO9pMOR7tkcRi01ByHZWDjXdJa5bUiYkSLv0gFgD2paPop2m9YbU1oHuxaPEaCfErqRvhZTsxiRZLzQvAPShGLbYIXUMTBgxmfC6N2LavdlHX9RuEKOl6EN0PBxMM9wXB/dOTUchUuFU3m4Xsgp96zYv3Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767761539; c=relaxed/simple;
	bh=j0GbckggaAbenmRVLMzwVORapeztiOLycU7cYcMc9RM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=jb0OsPdG51m2nt/ry+CzFCq5ebO4IlkHeWDFQvn2kosBFFF1LAoccHJ/XDNiSFDORDjNNMGUi+3OVKm1sNOkXAsVJhqxcjpxrnDgJEQvcxWS/dt8a+U0GpGX2XEGHC5OMXwZpXgU8m8XmATc5kfid8HMXne8XICrfwixRVBijCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=clZ8f73b; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 6074OICl010786;
	Wed, 7 Jan 2026 04:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=HTryIc
	sVgtfgPebCY4y9F3bv6I9GPa48qpsUvL+p6KI=; b=clZ8f73bOsgKMnZ1h5vKjF
	6x3sfd9Zu9z6qy+CWP0BzxU2qOw7vd8KEKptwXrmEZEyIvS0+vV+xJ/JXfUT7GTC
	G254nx1Mu+FfCbgwjNULBbP+D26veyRsO6S/lkFbCam0IrbvVOwCX0m8kep0X2pY
	LCHKHWWxKgFazdHBmYwMmhyKXlk2mGTxogiOB3ePHdtuE4mLBqjPjKFuJUiQRGn+
	yBMABBJxmLhjc36aUq9+1nYSV/QNteL8krZumLboa5ttGwadJOzF4U6lEiLGC2c1
	jZvcY3aaOOHLJXD+v1JMXf3lm0XvVtTfGEjDm6jUUNV9Z2NSYu3h4fr5lPI6blcA
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4berhk6b6n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jan 2026 04:52:01 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6072gLY7023528;
	Wed, 7 Jan 2026 04:52:00 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bg3rmbuht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jan 2026 04:52:00 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6074puXh49086754
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 Jan 2026 04:51:56 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4539820043;
	Wed,  7 Jan 2026 04:51:56 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 399E920040;
	Wed,  7 Jan 2026 04:51:54 +0000 (GMT)
Received: from [9.124.216.12] (unknown [9.124.216.12])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  7 Jan 2026 04:51:53 +0000 (GMT)
Message-ID: <1bf48c07-6035-4527-841c-64114e1cd164@linux.ibm.com>
Date: Wed, 7 Jan 2026 10:21:53 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [next-20251219]Build Failure on IBM Power system
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>
References: <193bd91f-d6d7-43e4-8d9b-308908717b68@linux.ibm.com>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Ingo Molnar <mingo@kernel.org>
In-Reply-To: <193bd91f-d6d7-43e4-8d9b-308908717b68@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=P4s3RyAu c=1 sm=1 tr=0 ts=695de671 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=JfrnYn6hAAAA:8 a=VnNF1IyMAAAA:8
 a=S90bURE-p-aBQpvveKQA:9 a=PRpDppDLrCsA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=Vxmtnl_E_bksehYqCbjh:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: MX7BXZX2EtYdmbx1HJibXzBH1vZZNwsr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDAzNiBTYWx0ZWRfX9A20zy8F1vAB
 PsiPfdEK6+chZCNkmeTiANpqMCAcX6f+LrJtKvHORHP/2mjALsUBpxEbzjJF3oXYD1YlWO2K+a/
 fazX7rqMLftNACV8iDbSRahpb4HPcEnONykTLXv3c7X1S48fyzBIW9fFZoBAWhOjQQAMXkFr+Y4
 fSqPXUT/p67d01voLPXF0JluqXSDKLnt+Bfc/V3pPhrjHEgXiXGqj0TnW0Ri+kCVC3bnjaQ07kP
 +EDW+7534W+eZmYNqacFzFel3KM54TKsbP8IDige5fl/fTxetGg5mEWkHKt+JQob+kKgUHzXLv+
 so76/jSNtgSl0phtKA4Xw4hC1BwNKiTpHa1so1RTuMu9VxFPARRyAVP/SMV2wxRu3pMwpmFVUG6
 rG2Jgf06DO6fWvrUaPLbG5HEz8stph3Wy7CWq2VLYOPhvk6vFwjioH64JojWXoWX/zprQ7wKpIW
 7eMvcAKUDVCwk4TlIrQ==
X-Proofpoint-GUID: MX7BXZX2EtYdmbx1HJibXzBH1vZZNwsr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 phishscore=0 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601070036

Hi Venkat.

On 1/1/26 10:50 AM, Venkat Rao Bagalkote wrote:
> Greetings!!!
> 
> 
> IBM CI has reported a build failure on next-20251219 build.
> 
> 
> Build Failure:
> 
> cc1: some warnings being treated as errors
> make[4]: *** [scripts/Makefile.build:287: kernel/sched/build_policy.o] 
> Error 1
> make[4]: *** Waiting for unfinished jobs....
> make[3]: *** [scripts/Makefile.build:556: kernel/sched] Error 2
> make[3]: *** Waiting for unfinished jobs....
> make[2]: *** [scripts/Makefile.build:556: kernel] Error 2
> make[2]: *** Waiting for unfinished jobs....
>

Maddy had shared the failing log. Please share log like this in the report.

In file included from kernel/sched/build_policy.c:62:
kernel/sched/ext.c: In function 'do_pick_task_scx':
kernel/sched/ext.c:2470:27: error: implicit declaration of function 'rq_modified_above' [-Wimplicit-function-declaration]
  2470 |         if (!force_scx && rq_modified_above(rq, &ext_sched_class))
       |                           ^~~~~~~~~~~~~~~~~
make[4]: *** [scripts/Makefile.build:287: kernel/sched/build_policy.o] Error 1
  
> 
> IBM CI has bisected this issue to below commit.
> 
> 
> 5d1f0b2f278eb55aebe29210fbc8f352c53497d6 is the first bad commit
> commit 5d1f0b2f278eb55aebe29210fbc8f352c53497d6
> Author: Peter Zijlstra <peterz@infradead.org>
> Date:   Wed Dec 10 09:06:50 2025 +0100
> 
> 
> Bisection Logs:
> 
> #git bisect log
> git bisect log
> git bisect start
> # status: waiting for both good and bad commits
> # good: [8f0b4cce4481fb22653697cced8d0d04027cb1e8] Linux 6.19-rc1
> git bisect good 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> # status: waiting for bad commit, 1 good commit known
> # bad: [cc3aa43b44bdb43dfbac0fcb51c56594a11338a8] Add linux-next 
> specific files for 20251219
> git bisect bad cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
> # good: [600a692707acda49434d6c2c03dda20f46e09749] Merge branch 
> 'libcrypto-next' of https://git.kernel.org/pub/scm/linux/kernel/git/ 
> ebiggers/linux.git
> git bisect good 600a692707acda49434d6c2c03dda20f46e09749
> # good: [816a7181ac38fd22243edb557537b2aecb9eeb76] Merge branch 'drm-xe- 
> next' of https://gitlab.freedesktop.org/drm/xe/kernel.git
> git bisect good 816a7181ac38fd22243edb557537b2aecb9eeb76
> # good: [7157d55093613cf905cfd665772eae35d5c388f0] Merge branch 'for- 
> next' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git
> git bisect good 7157d55093613cf905cfd665772eae35d5c388f0
> # bad: [52af2cfd69d264f1a370693966acf5d96943add8] Merge branch 'extcon- 
> next' of https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/extcon.git
> git bisect bad 52af2cfd69d264f1a370693966acf5d96943add8
> # bad: [502068d3b65cc8695f8da83a7f19c90805c958ca] next-20251217/tip
> git bisect bad 502068d3b65cc8695f8da83a7f19c90805c958ca
> # bad: [c06f166058309936567065e737f6f5d9609a1a87] Merge branch into tip/ 
> master: 'sched/core'
> git bisect bad c06f166058309936567065e737f6f5d9609a1a87
> # good: [e2292f5c21542354246687d8e3e48a58b046e27b] Merge branch into 
> tip/master: 'irq/msi'
> git bisect good e2292f5c21542354246687d8e3e48a58b046e27b
> # good: [fb9a7458e508ef1beae8d80ee40c2cd1b5b45f3a] sched/fair: Clean up 
> comments in 'struct cfs_rq'
> git bisect good fb9a7458e508ef1beae8d80ee40c2cd1b5b45f3a
> # good: [527a521029c3edd38fb9fc96cd58e3fd7393d28e] sched/fair: Sort out 
> 'blocked_load*' namespace noise
> git bisect good 527a521029c3edd38fb9fc96cd58e3fd7393d28e
> # good: [7ac422cf7b16ec524bcd8e017459e328a4103f63] perf/x86/intel/ 
> cstate: Add Diamond Rapids support
> git bisect good 7ac422cf7b16ec524bcd8e017459e328a4103f63
> # bad: [5d1f0b2f278eb55aebe29210fbc8f352c53497d6] sched/core: Rework 
> sched_class::wakeup_preempt() and rq_modified_*()
> git bisect bad 5d1f0b2f278eb55aebe29210fbc8f352c53497d6
> # first bad commit: [5d1f0b2f278eb55aebe29210fbc8f352c53497d6] sched/ 
> core: Rework sched_class::wakeup_preempt() and rq_modified_*()
> 
> 
> 
> If you happen to fix this issue, please add below tag.
> 
> 
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> 
> 
> 
> Regards,
> 
> Venkat.
> 
> 

This seems like temporary some issue with merging.

For example the problematic commit doesn't have the full patch as in sched/core
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/kernel/sc[…]c?h=next-20251219&id=5d1f0b2f278eb55aebe29210fbc8f352c53497d6

I have checked the latest tag next-20260106. Full patch is there in that.
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/kernel/sched?h=next-20260106&id=704069649b5bfb7bf1fe32c0281fe9036806a59a

I have checked in tip/sched/core. There is no reference to rq_modified_above.

So, Fair to say we can ignore this report.

