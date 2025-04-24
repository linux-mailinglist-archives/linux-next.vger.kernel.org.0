Return-Path: <linux-next+bounces-6378-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FBFA9B122
	for <lists+linux-next@lfdr.de>; Thu, 24 Apr 2025 16:38:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A9C0194147B
	for <lists+linux-next@lfdr.de>; Thu, 24 Apr 2025 14:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EA6F85270;
	Thu, 24 Apr 2025 14:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="kfW0uE0g"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613E3142E86;
	Thu, 24 Apr 2025 14:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745505490; cv=none; b=fT2uf8qpJIeGsCEtoJATfMAHEBYoTxjpxOF6mTWV+nb7KEvioBdHP9I081W0ZiGnWVG8AHHB3Wzb7mSU+Y2eU9cYdG0/jgDLl7FkAQyPeKu6G+iUSH2Shl0lnzWcWd17PnLjGoO2YpPvwjlucqBBqK2NV8Ype8JBb8bYlDr3lBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745505490; c=relaxed/simple;
	bh=AnRDlp5kom6oTiGhX/PG6a7PF/KVK/ygHQYaGt5onKQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Q7mbwxO78yPAQ1wA/VqahgdeR3I3o6qBlNFlKrsWW+mX5efPHn2WRbmTtb4DaCszTFoPjbcJk/Yz+2m0R4Kc0PF9JIgahTUt94tvpv1HXWqBCEQGPGy+DoaC+s/zjpTWLaMuITPAbcxmKaHuUm/ku+NjveS2eEaMDX38hvyqSdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=kfW0uE0g; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O9EseU028733;
	Thu, 24 Apr 2025 14:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=gINj6k
	Hdp6yE61erOQe+wI33IqtxuCsZBUz42mylwxE=; b=kfW0uE0gruTJFs6yiUgsoJ
	vFpR4mRww7P8wkF4lsn09QwbeBmpuxs2sxfEpZZgWxX+oxRfvbAX39HX7fgiQaxu
	NSB9cB6de+JThwg7mntWCLF0bPT3e/8JL0alg90/zJhROvpWN6+7ipqZ/bfXHxUv
	hmRb8S56S4xoRKstoR8sd1ThXjAwwQ13rNWe5R79x4PlzuKZhCwDQubLaWto+TDs
	I2TNqfo/SCiYXT2BKbGiZrrOFFJSCfM0bA4+U5i573u/VXglMGYkpBKvRaEJF4wf
	R0O++Fmhdw/nouKIIWJzUwcilADi7j1gjz2WaY1op3LzY1EP26SRkX6EOs//752A
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4678aac5re-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 14:37:47 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53OBD5cA005861;
	Thu, 24 Apr 2025 14:37:46 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 466jfxgmem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 14:37:46 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53OEbgD923068980
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Apr 2025 14:37:42 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2F14120040;
	Thu, 24 Apr 2025 14:37:42 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 77CD420049;
	Thu, 24 Apr 2025 14:37:37 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.255.99])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 24 Apr 2025 14:37:37 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: linux-next: build failure after merge of the tip tree
From: Athira Rajeev <atrajeev@linux.ibm.com>
In-Reply-To: <bb1f2928-617f-4943-bdd0-dfa74904ffb3@linux.ibm.com>
Date: Thu, 24 Apr 2025 20:07:23 +0530
Cc: Ingo Molnar <mingo@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D66D1529-714C-4700-BD74-AC6AFA7C97A8@linux.ibm.com>
References: <20250415133518.2c8d4325@canb.auug.org.au>
 <20250417134959.37204d48@canb.auug.org.au>
 <20250422163502.02ceeb0d@canb.auug.org.au>
 <bb1f2928-617f-4943-bdd0-dfa74904ffb3@linux.ibm.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>
X-Mailer: Apple Mail (2.3776.700.51)
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA5OSBTYWx0ZWRfX3oTqGrmny7qn n3HfInxvFIMEbmHYoWUgtwMdnQCr2lR715jxvnJgo7lYd+3iJMZCIDv6Ye6u9CsICII9pKHSPNa BxYOZawr2j9t6SkbKjDS+T1JKhrw+B4qRB4og0c25MjdNGdtz9pCxsKxvEZQW4cmEv9KrtE2uox
 0NuxTwOofkJH78wuxlVFjij93OkIUpWXEHMyWbYpgAgtBppXH3oxCGH4qMgx4/rQ0bA2IvsmYxW Ym0AGbuP8GKvtCCdUteO8IV5RbC3QHhZ9gm1MIH+arsWfDy0Dg9bEmJFmAsD5Co0AnjaU3Jp1Gl 33DvmXXzQPHaVIUJNZLvvcB17ReQZW1+PvNtUC50OQ2KEi06mZHTTHXnngkrrcmv/T0iOMcCABC
 gkskLy+DwA/YRuhg1nzEdPXCFE9PZqdO1rHb2qZB2JOU/+bDwf8Hem/oRrFoGs+tKlZwsSqQ
X-Proofpoint-ORIG-GUID: KTnl_KnMBrb51iIS-ZgmgdhGEknSxwYT
X-Proofpoint-GUID: KTnl_KnMBrb51iIS-ZgmgdhGEknSxwYT
X-Authority-Analysis: v=2.4 cv=KejSsRYD c=1 sm=1 tr=0 ts=680a4cbb cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=rOUgymgbAAAA:8 a=zd2uoN0lAAAA:8 a=9GoLSl4O-BWiy-GYhlcA:9
 a=QEXdDO2ut3YA:10 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_06,2025-04-24_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 mlxscore=0 clxscore=1011
 mlxlogscore=999 phishscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240099



> On 22 Apr 2025, at 3:26=E2=80=AFPM, Shrikanth Hegde =
<sshegde@linux.ibm.com> wrote:
>=20
>=20
>=20
> On 4/22/25 12:05, Stephen Rothwell wrote:
>> Hi all,
>=20
> Hi Ingo, Stephen.
>=20
>> On Thu, 17 Apr 2025 13:49:59 +1000 Stephen Rothwell =
<sfr@canb.auug.org.au> wrote:
>>>=20
>>> On Tue, 15 Apr 2025 13:35:18 +1000 Stephen Rothwell =
<sfr@canb.auug.org.au> wrote:
>>>>=20
>>>> After merging the tip tree, today's linux-next build (native perf)
>>>> failed like this:
>>>>=20
>>>> diff: tools/arch/x86/include/asm/amd/ibs.h: No such file or =
directory
>>>> In file included from util/amd-sample-raw.c:12:
>>>> tools/include/../../arch/x86/include/asm/amd/ibs.h:10:10: fatal =
error: asm/msr-index.h: No such file or directory
>>>>    10 | #include <asm/msr-index.h>
>>>>       |          ^~~~~~~~~~~~~~~~~
>>>> compilation terminated.
>>>>=20
>>>> Maybe caused by commit
>>>>=20
>>>>   3846389c03a8 ("x86/platform/amd: Move the <asm/amd-ibs.h> header =
to <asm/amd/ibs.h>")
>>>> or associated commits?
>>>>=20
>=20
> Even i am running into this error when building tools/perf on ppc64le. =
perf build works in 6.15-rc3,
> but failed with tip/master.
>=20
> Did git bisect
> good: [9c32cda43eb78f78c73aee4aa344b777714e259b] Linux 6.15-rc3
> bad: [1a11b5b80f46e4dff0b21cb07efab43dee049d61] Merge branch into tip =
master: 'x86/sev'
> ...
> # first bad commit: [3846389c03a8518884f09056611619bd1461ffc7] =
x86/platform/amd: Move the <asm/amd-ibs.h> header to <asm/amd/ibs.h>

Before this commit, msr-index.h was present in =
tools/arch/x86/include/asm/msr-index.h
amd-ibs.h was present in tools/arch/x86/include/asm/amd-ibs.h

=46rom amd-ibs.h , it picks mss-index.h from :

# grep msr-index tools/arch/x86/include/asm/amd-ibs.h
#include "msr-index.h=E2=80=9D

After the commit,=20
make initial logs shows missing =
=E2=80=9Ctools/arch/x86/include/asm/amd/ibs.h=E2=80=9D

# make
  BUILD:   Doing 'make -j24' parallel build
diff: tools/arch/x86/include/asm/amd/ibs.h: No such file or directory    =
                              =20
Warning: Kernel ABI header differences:
  diff -u tools/include/uapi/linux/bits.h include/uapi/linux/bits.h
  diff -u tools/include/linux/bits.h include/linux/bits.h
  diff -u tools/include/vdso/unaligned.h include/vdso/unaligned.h
  diff -u tools/arch/x86/include/asm/cpufeatures.h =
arch/x86/include/asm/cpufeatures.h
  diff -u tools/arch/x86/include/asm/msr-index.h =
arch/x86/include/asm/msr-index.h
  diff -u tools/arch/x86/include/asm/amd/ibs.h =
arch/x86/include/asm/amd/ibs.h
  diff -u tools/arch/arm64/include/asm/cputype.h =
arch/arm64/include/asm/cputype.h

Build failure here is:

In file included from util/amd-sample-raw.c:12:0:
/root/bug/tip/tools/include/../../arch/x86/include/asm/amd/ibs.h:10:10: =
fatal error: asm/msr-index.h: No such file or directory
 #include <asm/msr-index.h>
          ^~~~~~~~~~~~~~~~~
compilation terminated.


To fix, this needs change to add tools/arch/x86/include/asm/amd/ibs.h =
and also update the msr-index.h like below:

diff --git a/tools/arch/x86/include/asm/amd/ibs.h =
b/tools/arch/x86/include/asm/amd/ibs.h
index 3ee5903982c2..bcca5dcb9148 100644
--- a/tools/arch/x86/include/asm/amd/ibs.h
+++ b/tools/arch/x86/include/asm/amd/ibs.h
@@ -7,7 +7,7 @@
  * 55898 Rev 0.35 - Feb 5, 2021
  */
  -#include <asm/msr-index.h>
+#include <../msr-index.h>
   /* IBS_OP_DATA2 DataSrc */
 #define IBS_DATA_SRC_LOC_CACHE                  2

Similar change was done for tools/arch/x86/include/asm/amd-ibs.h as =
well. Reference commit below:

commit dde994dd54fbf84f8fd14230de3477d552e42470
Author: Kim Phillips <kim.phillips@amd.com>
Date:   Tue Aug 17 17:15:08 2021 -0500

    perf report: Add tools/arch/x86/include/asm/amd-ibs.h
         This is a tools/-side patch for the patch that adds the =
original copy
    of the IBS header file, in arch/x86/include/asm/.
         We also add an entry to check-headers.sh, so future changes =
continue
    to be copied.
         Committer notes:
         Had to add this
           -#include <asm/msr-index.h>
      +#include "msr-index.h"
         And change the check-headers.sh entry to ignore this line when =
diffing
    with the original kernel header.

Shirkanth, Stephen, Venkat

I will be sending a separate fix patch for this.

Thanks
Athira

>=20
>=20
> It isn't able to find the file after rename. I did the below hack so =
that ibs.h finds the msr-index.h
> Likely there is better way. for me, this helps to build tools/perf.
>=20
> ---
>=20
> diff --git a/arch/x86/include/asm/amd/ibs.h =
b/arch/x86/include/asm/amd/ibs.h
> index 3ee5903982c2..ac3a36fc08b1 100644
> --- a/arch/x86/include/asm/amd/ibs.h
> +++ b/arch/x86/include/asm/amd/ibs.h
> @@ -7,7 +7,7 @@
>  * 55898 Rev 0.35 - Feb 5, 2021
>  */
> -#include <asm/msr-index.h>
> +#include "../../asm/msr-index.h"
>  /* IBS_OP_DATA2 DataSrc */
> #define IBS_DATA_SRC_LOC_CACHE                  2






