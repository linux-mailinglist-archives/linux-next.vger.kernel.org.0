Return-Path: <linux-next+bounces-9597-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 77972D072AC
	for <lists+linux-next@lfdr.de>; Fri, 09 Jan 2026 05:47:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B27730161A7
	for <lists+linux-next@lfdr.de>; Fri,  9 Jan 2026 04:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87483226CFD;
	Fri,  9 Jan 2026 04:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="kzw1KC3S"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0396522F755;
	Fri,  9 Jan 2026 04:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767934068; cv=none; b=TX2DkJLu9QFk1TEoUKxMlhMAB8FNkJt+EYj3OA95tmdYEyQgaCuhMxJCuQwGcKP8noElecy/mgYHXhMe0IHFleekFHUY31Cxw0X27QB/PE0lEBeUXjchZeIwSiLh6wu5NUaSBsqmKkNRnJ1LVpgfgHVMpVRpPdBka4kuc5xRR6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767934068; c=relaxed/simple;
	bh=FeZOHsivYx3au2rHg4xXXxoAyePfJXbWyCfqQXMh6VY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XXpaJJ6/EItxwjQ9I8zxjgR7TNMWhwh2iP1zRmp080nP7s5ZyFzEmr9GC7Rp5GtIFGjZ0CkoVwBSPge+CXryKiKUdvonxr894RTk5/GaVDBJlGQHrs/FPlQrSSpxgVQvWe54ctd2FZnXq9ZdcScwHWf4O7C5+MqnWiIIwzTYwJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=kzw1KC3S; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 608LMa9l017255;
	Fri, 9 Jan 2026 04:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=n4kB0C
	+vXDph9FCmKVXoUaAA9hSnIdonRqxcJ7nXL0A=; b=kzw1KC3SMj6AK4ANxVt6sr
	PX3w2dV5MgsGP6WA4kjhXhaoPnx/75urEu0GlWcz7XZ7ILTqQ2n9QfvK5OeMl4dH
	RxQiM7+k+s8TulvkuzXvSGPFAJF3j8iCGcyzs5W498rObqbI33d4D1lOk50clUbk
	gOrIxQSTES09E9wvduCjaMogwyC1eDHJM4RZ5Jt8fyO8fwQ3yLzqtXIAcxhPNM5p
	B2zGtOoySapU/uAKj3RXFjUxv+AdYrBcMfXTkGHAtkoAehHbdq/V/jV+6hj6c5AS
	diAz12/iJxmFJVSp8Op2BFNwPiNpY4NKnh1pdLlyuBDu/YdUNP1yB4iuzGiaDD+A
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4betu6hjg6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Jan 2026 04:47:24 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60926sbF014523;
	Fri, 9 Jan 2026 04:47:23 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bfeenawr1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Jan 2026 04:47:23 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6094lMZS31982320
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 Jan 2026 04:47:22 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2494758055;
	Fri,  9 Jan 2026 04:47:22 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AC2565804E;
	Fri,  9 Jan 2026 04:47:19 +0000 (GMT)
Received: from [9.61.242.45] (unknown [9.61.242.45])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  9 Jan 2026 04:47:19 +0000 (GMT)
Message-ID: <7d18f263-62a6-40b4-a623-0abda69b8a4b@linux.ibm.com>
Date: Fri, 9 Jan 2026 10:17:17 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [next-20251219]Build Failure on IBM Power system
Content-Language: en-GB
To: Shrikanth Hegde <sshegde@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Ingo Molnar <mingo@kernel.org>
References: <193bd91f-d6d7-43e4-8d9b-308908717b68@linux.ibm.com>
 <1bf48c07-6035-4527-841c-64114e1cd164@linux.ibm.com>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <1bf48c07-6035-4527-841c-64114e1cd164@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=QbNrf8bv c=1 sm=1 tr=0 ts=6960885c cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=WsHKUha7AAAA:8 a=JfrnYn6hAAAA:8
 a=VnNF1IyMAAAA:8 a=O8L-_KDFGmi8-4GouUwA:9 a=PRpDppDLrCsA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=Vxmtnl_E_bksehYqCbjh:22 a=H4LAKuo8djmI0KOkngUh:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: vjTXVwKEhKU2RDBP61pQHAt69ndSb6e2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDAzMCBTYWx0ZWRfX3OJVXYuyO+FC
 sQBT3bKESnPD7iQGZ8RPk55y4A+pO9qhFLS4xYW087WUhgYFCoDX+S5ZONsxBFGNwFwCdaFSBY9
 Nzblu0OKYh7VvEyX0/0UuUSAl5M5nWBvPm2UTQfNEjkTe/X4GCMcdAD5NSFo+ceqbItT2CRoCGL
 sIWfdNM+1x5hFS8FxjlETEGhf/zReXRPYKF0ZNZePt+A8q78JJcujWPoVI6cJe0dW6fvTkrPJl5
 rXJkA2iXMPFMgrJzMHLi1QdVxfScgHdJ4EvX9SIwW1ETOMZD6LkVyBJsitRqb9YQ9zIH0CmA8ho
 XU8HgtLGtf6Z36S8VYy7aGNI2zNOrZKqglzX7JXv0JR5b5Z6hkmYvB/GA/68eEmVQOE1pEeUHTa
 UNoD/LXqTKImm+OguUOb8CEJlN/mlJ30+hjb2RK9Lt3MYuBsztycSxY6Q08btch3e60mfCo3HIx
 A41IMI7N5kuaJ9VTPOg==
X-Proofpoint-GUID: vjTXVwKEhKU2RDBP61pQHAt69ndSb6e2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_01,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601090030

Hello Shrikanth,

On 07/01/26 10:21 am, Shrikanth Hegde wrote:
> Hi Venkat.
>
> On 1/1/26 10:50 AM, Venkat Rao Bagalkote wrote:
>> Greetings!!!
>>
>>
>> IBM CI has reported a build failure on next-20251219 build.
>>
>>
>> Build Failure:
>>
>> cc1: some warnings being treated as errors
>> make[4]: *** [scripts/Makefile.build:287: 
>> kernel/sched/build_policy.o] Error 1
>> make[4]: *** Waiting for unfinished jobs....
>> make[3]: *** [scripts/Makefile.build:556: kernel/sched] Error 2
>> make[3]: *** Waiting for unfinished jobs....
>> make[2]: *** [scripts/Makefile.build:556: kernel] Error 2
>> make[2]: *** Waiting for unfinished jobs....
>>
>
> Maddy had shared the failing log. Please share log like this in the 
> report.


Sure, Point taken.

>
> In file included from kernel/sched/build_policy.c:62:
> kernel/sched/ext.c: In function 'do_pick_task_scx':
> kernel/sched/ext.c:2470:27: error: implicit declaration of function 
> 'rq_modified_above' [-Wimplicit-function-declaration]
>  2470 |         if (!force_scx && rq_modified_above(rq, 
> &ext_sched_class))
>       |                           ^~~~~~~~~~~~~~~~~
> make[4]: *** [scripts/Makefile.build:287: kernel/sched/build_policy.o] 
> Error 1
>
>> IBM CI has bisected this issue to below commit.
>>
>>
>> 5d1f0b2f278eb55aebe29210fbc8f352c53497d6 is the first bad commit
>> commit 5d1f0b2f278eb55aebe29210fbc8f352c53497d6
>> Author: Peter Zijlstra <peterz@infradead.org>
>> Date:   Wed Dec 10 09:06:50 2025 +0100
>>
>>
>> Bisection Logs:
>>
>> #git bisect log
>> git bisect log
>> git bisect start
>> # status: waiting for both good and bad commits
>> # good: [8f0b4cce4481fb22653697cced8d0d04027cb1e8] Linux 6.19-rc1
>> git bisect good 8f0b4cce4481fb22653697cced8d0d04027cb1e8
>> # status: waiting for bad commit, 1 good commit known
>> # bad: [cc3aa43b44bdb43dfbac0fcb51c56594a11338a8] Add linux-next 
>> specific files for 20251219
>> git bisect bad cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
>> # good: [600a692707acda49434d6c2c03dda20f46e09749] Merge branch 
>> 'libcrypto-next' of https://git.kernel.org/pub/scm/linux/kernel/git/ 
>> ebiggers/linux.git
>> git bisect good 600a692707acda49434d6c2c03dda20f46e09749
>> # good: [816a7181ac38fd22243edb557537b2aecb9eeb76] Merge branch 
>> 'drm-xe- next' of https://gitlab.freedesktop.org/drm/xe/kernel.git
>> git bisect good 816a7181ac38fd22243edb557537b2aecb9eeb76
>> # good: [7157d55093613cf905cfd665772eae35d5c388f0] Merge branch 'for- 
>> next' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git
>> git bisect good 7157d55093613cf905cfd665772eae35d5c388f0
>> # bad: [52af2cfd69d264f1a370693966acf5d96943add8] Merge branch 
>> 'extcon- next' of 
>> https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/extcon.git
>> git bisect bad 52af2cfd69d264f1a370693966acf5d96943add8
>> # bad: [502068d3b65cc8695f8da83a7f19c90805c958ca] next-20251217/tip
>> git bisect bad 502068d3b65cc8695f8da83a7f19c90805c958ca
>> # bad: [c06f166058309936567065e737f6f5d9609a1a87] Merge branch into 
>> tip/ master: 'sched/core'
>> git bisect bad c06f166058309936567065e737f6f5d9609a1a87
>> # good: [e2292f5c21542354246687d8e3e48a58b046e27b] Merge branch into 
>> tip/master: 'irq/msi'
>> git bisect good e2292f5c21542354246687d8e3e48a58b046e27b
>> # good: [fb9a7458e508ef1beae8d80ee40c2cd1b5b45f3a] sched/fair: Clean 
>> up comments in 'struct cfs_rq'
>> git bisect good fb9a7458e508ef1beae8d80ee40c2cd1b5b45f3a
>> # good: [527a521029c3edd38fb9fc96cd58e3fd7393d28e] sched/fair: Sort 
>> out 'blocked_load*' namespace noise
>> git bisect good 527a521029c3edd38fb9fc96cd58e3fd7393d28e
>> # good: [7ac422cf7b16ec524bcd8e017459e328a4103f63] perf/x86/intel/ 
>> cstate: Add Diamond Rapids support
>> git bisect good 7ac422cf7b16ec524bcd8e017459e328a4103f63
>> # bad: [5d1f0b2f278eb55aebe29210fbc8f352c53497d6] sched/core: Rework 
>> sched_class::wakeup_preempt() and rq_modified_*()
>> git bisect bad 5d1f0b2f278eb55aebe29210fbc8f352c53497d6
>> # first bad commit: [5d1f0b2f278eb55aebe29210fbc8f352c53497d6] sched/ 
>> core: Rework sched_class::wakeup_preempt() and rq_modified_*()
>>
>>
>>
>> If you happen to fix this issue, please add below tag.
>>
>>
>> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
>>
>>
>>
>> Regards,
>>
>> Venkat.
>>
>>
>
> This seems like temporary some issue with merging.
>
> For example the problematic commit doesn't have the full patch as in 
> sched/core
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/kernel/sc[…]c?h=next-20251219&id=5d1f0b2f278eb55aebe29210fbc8f352c53497d6 
>
>
> I have checked the latest tag next-20260106. Full patch is there in that.
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/kernel/sched?h=next-20260106&id=704069649b5bfb7bf1fe32c0281fe9036806a59a 
>
>
> I have checked in tip/sched/core. There is no reference to 
> rq_modified_above.
>
> So, Fair to say we can ignore this report.


Thanks for the review and conforming. Looks like, this is fixed here.

https://lore.kernel.org/all/20251217095801.GC3708021@noisy.programming.kicks-ass.net/


Regards,

Venkat.


