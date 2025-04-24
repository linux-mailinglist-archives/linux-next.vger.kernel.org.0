Return-Path: <linux-next+bounces-6380-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1079A9B439
	for <lists+linux-next@lfdr.de>; Thu, 24 Apr 2025 18:37:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43E97927F78
	for <lists+linux-next@lfdr.de>; Thu, 24 Apr 2025 16:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50ACC1AB6D4;
	Thu, 24 Apr 2025 16:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="sfmQPev0"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD70129A78;
	Thu, 24 Apr 2025 16:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745512427; cv=none; b=AQ+ONxWorq+ddwUFa9ua0lH+BI6fUkiFOSF7k1f3apwHEMOc7/yqq7HOoG5okCbc1a0aKHzmcqUHr24dLkRh28HKGim0QqNK6AJ1zof2xtZH5xGy+cKKz+Xgl7Dn55u4GCipoDis/Wb3mL6daC9ACHdw97v1OlB8mbEWyOSdOig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745512427; c=relaxed/simple;
	bh=Cc1ATLCnb/pHo2K2A2o4Rx+P547SogdMvoQSABkDYho=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=EJJj7WWbuRIn3vVkxnL7pWOsc1meZuef+OzQlqhv1hwDs7S62FaeiY766HVS/TEdqMLnL70U5Uj8pVN9ErVI/hY5/n53OSQNmFkeyKs/5RakR+cUN6+2iMh4QA5MTbC7MFgOIcN7oKJmgFG89F4ojv/iaigD/aY4A5O+aGLLfCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=sfmQPev0; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OAf4in021206;
	Thu, 24 Apr 2025 16:33:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=gWtAZR
	/jnBq/VyPLwWAf4XcuOEpRIGhhrjkM4yqKPPY=; b=sfmQPev0Nw71z+l3F91iEl
	h6XjQ6/IrEHm1yrIvQMt2U9Bqliw/4VhjkscEQnrJ8anyl5riqGMOkdNEMBhVUhm
	MZM3BUyoQDX0FIwKQw4y0t7vLANhK2I8m5EmxacAtQNaoLDCHzVkqFTuNNsWRieT
	EoAqjZUIm477SEAn2V37SoKGgGeNRJWgWPlGM62saD1ztUrBPQOaBrnbA1fNC9Cb
	9CT5wl/KbWNqc5KIoBLF7E3V6HsIKavVhFew5zuNjY5K9pPKh7FGT3UVPP9R+wD2
	Vhz7CyDRLjHQRDaWaq5Baqa9K56KvFZIMo+tuKEOLaGWIoQGgK3+5s+yyyuGMDFg
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 467krssrge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 16:33:28 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53OFa8Ck005829;
	Thu, 24 Apr 2025 16:33:27 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 466jfxh1my-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 16:33:27 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53OGXNnZ28377660
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Apr 2025 16:33:23 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BC7F920040;
	Thu, 24 Apr 2025 16:33:23 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 506CE20043;
	Thu, 24 Apr 2025 16:33:19 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.255.99])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 24 Apr 2025 16:33:18 +0000 (GMT)
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
In-Reply-To: <D66D1529-714C-4700-BD74-AC6AFA7C97A8@linux.ibm.com>
Date: Thu, 24 Apr 2025 22:03:05 +0530
Cc: Ingo Molnar <mingo@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F5AD4FED-338E-4DC6-97BF-396F7EB73CA1@linux.ibm.com>
References: <20250415133518.2c8d4325@canb.auug.org.au>
 <20250417134959.37204d48@canb.auug.org.au>
 <20250422163502.02ceeb0d@canb.auug.org.au>
 <bb1f2928-617f-4943-bdd0-dfa74904ffb3@linux.ibm.com>
 <D66D1529-714C-4700-BD74-AC6AFA7C97A8@linux.ibm.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>
X-Mailer: Apple Mail (2.3776.700.51)
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDExMCBTYWx0ZWRfX4KJZ7vxa0TZi lY95SNvrfU0x+7+AzMMZbVw17WNmGh/b8sMQbipbWipNdJvt/9NGFM1XWRwTlVte3XRH+K0x33z WE1oJMU3gCqqGkMv+y/ZR2jD/vG+9GL7LTD+ekZQd9MZacOCJL+v1oRdDmepaQaX9JJU0dUpsRa
 Ix0FIp2g9mQR0Gis3i47EyJtaptzNGGjH3v6yRYQ/uh01bhCwVVJw2d52oMKRa26EsHuSjJLLIk cyEbRaGEvlFQVEjahhxIV6MDF+tX7eY/HTnVompgTbXNRbEAjAy+Uj212vdKUSDC0bHlM5lgLJZ xlVhj8rQRAbO2GiS1/v8BU6PeBc47TVe8cGyOJHv+YJ1zEGacsoY1Snl8PobGebPH1HgKpm3Y+P
 iq10+PUVZgqlqyTSfnxU2P7OU5YQN2jLDEQp9dQOBixqPBv3OvPTjrT0L15lxeQ0UTOc5Wus
X-Proofpoint-GUID: B_LXCOA_Mm1YJE4pyVpY6p0Y0p_UXgG1
X-Authority-Analysis: v=2.4 cv=IciHWXqa c=1 sm=1 tr=0 ts=680a67d8 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=rOUgymgbAAAA:8 a=zd2uoN0lAAAA:8
 a=NJDCJ7G7kdQ2-YEoexwA:9 a=QEXdDO2ut3YA:10 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-ORIG-GUID: B_LXCOA_Mm1YJE4pyVpY6p0Y0p_UXgG1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_06,2025-04-24_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240110



> On 24 Apr 2025, at 8:07=E2=80=AFPM, Athira Rajeev =
<atrajeev@linux.ibm.com> wrote:
>=20
>=20
>=20
>> On 22 Apr 2025, at 3:26=E2=80=AFPM, Shrikanth Hegde =
<sshegde@linux.ibm.com> wrote:
>>=20
>>=20
>>=20
>> On 4/22/25 12:05, Stephen Rothwell wrote:
>>> Hi all,
>>=20
>> Hi Ingo, Stephen.
>>=20
>>> On Thu, 17 Apr 2025 13:49:59 +1000 Stephen Rothwell =
<sfr@canb.auug.org.au> wrote:
>>>>=20
>>>> On Tue, 15 Apr 2025 13:35:18 +1000 Stephen Rothwell =
<sfr@canb.auug.org.au> wrote:
>>>>>=20
>>>>> After merging the tip tree, today's linux-next build (native perf)
>>>>> failed like this:
>>>>>=20
>>>>> diff: tools/arch/x86/include/asm/amd/ibs.h: No such file or =
directory
>>>>> In file included from util/amd-sample-raw.c:12:
>>>>> tools/include/../../arch/x86/include/asm/amd/ibs.h:10:10: fatal =
error: asm/msr-index.h: No such file or directory
>>>>>   10 | #include <asm/msr-index.h>
>>>>>      |          ^~~~~~~~~~~~~~~~~
>>>>> compilation terminated.
>>>>>=20
>>>>> Maybe caused by commit
>>>>>=20
>>>>>  3846389c03a8 ("x86/platform/amd: Move the <asm/amd-ibs.h> header =
to <asm/amd/ibs.h>")
>>>>> or associated commits?
>>>>>=20
>>=20
>> Even i am running into this error when building tools/perf on =
ppc64le. perf build works in 6.15-rc3,
>> but failed with tip/master.
>>=20
>> Did git bisect
>> good: [9c32cda43eb78f78c73aee4aa344b777714e259b] Linux 6.15-rc3
>> bad: [1a11b5b80f46e4dff0b21cb07efab43dee049d61] Merge branch into tip =
master: 'x86/sev'
>> ...
>> # first bad commit: [3846389c03a8518884f09056611619bd1461ffc7] =
x86/platform/amd: Move the <asm/amd-ibs.h> header to <asm/amd/ibs.h>
>=20
> Before this commit, msr-index.h was present in =
tools/arch/x86/include/asm/msr-index.h
> amd-ibs.h was present in tools/arch/x86/include/asm/amd-ibs.h
>=20
> =46rom amd-ibs.h , it picks mss-index.h from :
>=20
> # grep msr-index tools/arch/x86/include/asm/amd-ibs.h
> #include "msr-index.h=E2=80=9D
>=20
> After the commit,=20
> make initial logs shows missing =
=E2=80=9Ctools/arch/x86/include/asm/amd/ibs.h=E2=80=9D
>=20
> # make
>  BUILD:   Doing 'make -j24' parallel build
> diff: tools/arch/x86/include/asm/amd/ibs.h: No such file or directory  =
                                =20
> Warning: Kernel ABI header differences:
>  diff -u tools/include/uapi/linux/bits.h include/uapi/linux/bits.h
>  diff -u tools/include/linux/bits.h include/linux/bits.h
>  diff -u tools/include/vdso/unaligned.h include/vdso/unaligned.h
>  diff -u tools/arch/x86/include/asm/cpufeatures.h =
arch/x86/include/asm/cpufeatures.h
>  diff -u tools/arch/x86/include/asm/msr-index.h =
arch/x86/include/asm/msr-index.h
>  diff -u tools/arch/x86/include/asm/amd/ibs.h =
arch/x86/include/asm/amd/ibs.h
>  diff -u tools/arch/arm64/include/asm/cputype.h =
arch/arm64/include/asm/cputype.h
>=20
> Build failure here is:
>=20
> In file included from util/amd-sample-raw.c:12:0:
> =
/root/bug/tip/tools/include/../../arch/x86/include/asm/amd/ibs.h:10:10: =
fatal error: asm/msr-index.h: No such file or directory
> #include <asm/msr-index.h>
>          ^~~~~~~~~~~~~~~~~
> compilation terminated.
Hi,

Posted the fix in mailing here: =
https://lore.kernel.org/linux-perf-users/20250424163033.6601-1-atrajeev@li=
nux.ibm.com/T/#u
Please share feedback if it fixes the compilation issue.

Thanks
Athira
>=20
>=20
> To fix, this needs change to add tools/arch/x86/include/asm/amd/ibs.h =
and also update the msr-index.h like below:
>=20
> diff --git a/tools/arch/x86/include/asm/amd/ibs.h =
b/tools/arch/x86/include/asm/amd/ibs.h
> index 3ee5903982c2..bcca5dcb9148 100644
> --- a/tools/arch/x86/include/asm/amd/ibs.h
> +++ b/tools/arch/x86/include/asm/amd/ibs.h
> @@ -7,7 +7,7 @@
>  * 55898 Rev 0.35 - Feb 5, 2021
>  */
>  -#include <asm/msr-index.h>
> +#include <../msr-index.h>
>   /* IBS_OP_DATA2 DataSrc */
> #define IBS_DATA_SRC_LOC_CACHE                  2
>=20
> Similar change was done for tools/arch/x86/include/asm/amd-ibs.h as =
well. Reference commit below:
>=20
> commit dde994dd54fbf84f8fd14230de3477d552e42470
> Author: Kim Phillips <kim.phillips@amd.com>
> Date:   Tue Aug 17 17:15:08 2021 -0500
>=20
>    perf report: Add tools/arch/x86/include/asm/amd-ibs.h
>         This is a tools/-side patch for the patch that adds the =
original copy
>    of the IBS header file, in arch/x86/include/asm/.
>         We also add an entry to check-headers.sh, so future changes =
continue
>    to be copied.
>         Committer notes:
>         Had to add this
>           -#include <asm/msr-index.h>
>      +#include "msr-index.h"
>         And change the check-headers.sh entry to ignore this line when =
diffing
>    with the original kernel header.
>=20
> Shirkanth, Stephen, Venkat
>=20
> I will be sending a separate fix patch for this.
>=20
> Thanks
> Athira
>=20
>>=20
>>=20
>> It isn't able to find the file after rename. I did the below hack so =
that ibs.h finds the msr-index.h
>> Likely there is better way. for me, this helps to build tools/perf.
>>=20
>> ---
>>=20
>> diff --git a/arch/x86/include/asm/amd/ibs.h =
b/arch/x86/include/asm/amd/ibs.h
>> index 3ee5903982c2..ac3a36fc08b1 100644
>> --- a/arch/x86/include/asm/amd/ibs.h
>> +++ b/arch/x86/include/asm/amd/ibs.h
>> @@ -7,7 +7,7 @@
>> * 55898 Rev 0.35 - Feb 5, 2021
>> */
>> -#include <asm/msr-index.h>
>> +#include "../../asm/msr-index.h"
>> /* IBS_OP_DATA2 DataSrc */
>> #define IBS_DATA_SRC_LOC_CACHE                  2



