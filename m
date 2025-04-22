Return-Path: <linux-next+bounces-6316-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE4DA9652E
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 11:57:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 642F7189786E
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 09:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 417231EB1A8;
	Tue, 22 Apr 2025 09:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="C6S1uH5O"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8923E1F12FC;
	Tue, 22 Apr 2025 09:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745315821; cv=none; b=lxMFeyQTxTUJWmfff8gBUqU7lbEPK39oUZW4jXjPzSHAesvYXyFzECmJmifgVMXnclBXVy2AykRxvtfR5Tu+eCni7rEm4HBQepVVguE6tHdLFPlS4WERHgJaWCxELKSy8jpAkhhAFwyJTPW+omiiUM4Rz9HShCgm8S1GQp+XUjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745315821; c=relaxed/simple;
	bh=Zztn9yufpD3kP2utW8PnprxttmHaUBZOSbSDjSbCFyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MSB65bvfcq33ZQEp9OonUxA5p8qn/fFYm8jWFPnBh9vOpFlarYe8Yc8dkVEstB8Ytvx1HeFm3vQpBcRV3RwRBKsKJkdA7q3/A6Kv3tTok0ai8vOu+/0zIDIlgjf82aZKpTgzIyXCj9BLCtogKXo+5ghKt/TXTk2y379IFovrG/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=C6S1uH5O; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M47VIs016494;
	Tue, 22 Apr 2025 09:56:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=C9cYA4
	4bRPVIsUCoErKERnZrSNRErJ0/7ck7tcw0IQQ=; b=C6S1uH5OzZqAHJAesv7KwS
	mIr/GMGFKMfM1m2ikVHUdMR/trIICyRkl1pJ2KX33QF7namtXRhwJ5sybXwpGUD9
	oLanm1D9aDbMbms+leNru2H5ByZQ0DmUJ9HIbM/x6DZxCMnH26UeAdj760YA1SLw
	EGzLYHwa2nDVYEzp7v3x9GmBTUb+P036Nh/18iwExTi4ftl8kSHKckOF632+1atq
	YmgWphFydluvtat4Ml01FVY5vHEsfgiesQtNq6b6qJAW2yrYcM6vFisyg4iTOx6D
	5xcGoGF6DiRW6FB6rS1ULq8hNs07HH5lyMlXgUaQII8zn8t6F47mbn8QX63uqR/w
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4663t61e4y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 09:56:44 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53M6CQVE012511;
	Tue, 22 Apr 2025 09:56:43 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 464p5t2guq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 09:56:43 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53M9ufYw33882512
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 09:56:41 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 739212004B;
	Tue, 22 Apr 2025 09:56:41 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EB8C020040;
	Tue, 22 Apr 2025 09:56:39 +0000 (GMT)
Received: from [9.39.25.76] (unknown [9.39.25.76])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 22 Apr 2025 09:56:39 +0000 (GMT)
Message-ID: <bb1f2928-617f-4943-bdd0-dfa74904ffb3@linux.ibm.com>
Date: Tue, 22 Apr 2025 15:26:39 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the tip tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Ingo Molnar <mingo@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
References: <20250415133518.2c8d4325@canb.auug.org.au>
 <20250417134959.37204d48@canb.auug.org.au>
 <20250422163502.02ceeb0d@canb.auug.org.au>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20250422163502.02ceeb0d@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1KQo-7-Qr7jRW6l78jyPcaS-yRJBnGJ1
X-Proofpoint-GUID: 1KQo-7-Qr7jRW6l78jyPcaS-yRJBnGJ1
X-Authority-Analysis: v=2.4 cv=GsRC+l1C c=1 sm=1 tr=0 ts=680767dc cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=rOUgymgbAAAA:8 a=tmFnoJMBK-0VPl4FSV0A:9 a=QEXdDO2ut3YA:10
 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxlogscore=962 suspectscore=0 bulkscore=0 adultscore=0
 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504220071



On 4/22/25 12:05, Stephen Rothwell wrote:
> Hi all,
> 

Hi Ingo, Stephen.

> On Thu, 17 Apr 2025 13:49:59 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> On Tue, 15 Apr 2025 13:35:18 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>
>>> After merging the tip tree, today's linux-next build (native perf)
>>> failed like this:
>>>
>>> diff: tools/arch/x86/include/asm/amd/ibs.h: No such file or directory
>>> In file included from util/amd-sample-raw.c:12:
>>> tools/include/../../arch/x86/include/asm/amd/ibs.h:10:10: fatal error: asm/msr-index.h: No such file or directory
>>>     10 | #include <asm/msr-index.h>
>>>        |          ^~~~~~~~~~~~~~~~~
>>> compilation terminated.
>>>
>>> Maybe caused by commit
>>>
>>>    3846389c03a8 ("x86/platform/amd: Move the <asm/amd-ibs.h> header to <asm/amd/ibs.h>")
>>> or associated commits?
>>>

Even i am running into this error when building tools/perf on ppc64le. perf build works in 6.15-rc3,
but failed with tip/master.

Did git bisect
good: [9c32cda43eb78f78c73aee4aa344b777714e259b] Linux 6.15-rc3
bad: [1a11b5b80f46e4dff0b21cb07efab43dee049d61] Merge branch into tip master: 'x86/sev'
...
# first bad commit: [3846389c03a8518884f09056611619bd1461ffc7] x86/platform/amd: Move the <asm/amd-ibs.h> header to <asm/amd/ibs.h>


It isn't able to find the file after rename. I did the below hack so that ibs.h finds the msr-index.h
Likely there is better way. for me, this helps to build tools/perf.

---

diff --git a/arch/x86/include/asm/amd/ibs.h b/arch/x86/include/asm/amd/ibs.h
index 3ee5903982c2..ac3a36fc08b1 100644
--- a/arch/x86/include/asm/amd/ibs.h
+++ b/arch/x86/include/asm/amd/ibs.h
@@ -7,7 +7,7 @@
   * 55898 Rev 0.35 - Feb 5, 2021
   */
  
-#include <asm/msr-index.h>
+#include "../../asm/msr-index.h"
  
  /* IBS_OP_DATA2 DataSrc */
  #define IBS_DATA_SRC_LOC_CACHE                  2



