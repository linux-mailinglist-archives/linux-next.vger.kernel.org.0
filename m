Return-Path: <linux-next+bounces-6388-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06ACAA9DB94
	for <lists+linux-next@lfdr.de>; Sat, 26 Apr 2025 16:54:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A96C07ADABC
	for <lists+linux-next@lfdr.de>; Sat, 26 Apr 2025 14:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9791F22FE08;
	Sat, 26 Apr 2025 14:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="ocKA6jnW"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3739CA31;
	Sat, 26 Apr 2025 14:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745679256; cv=none; b=jq9OMBv8xrk6ajPRzeri8BoXwf5aEaproOCeXeQblMKWuenPYQrico0zSbh/jedKadLf4u0sFULr9MT4Kh9XJxL7G/q0UXDsgqLrU6QMpXMv9YOJL2naQSYYE+niLXA1iS9Y27CY5a6wzR9pzsXqjoah+S8mzsxfRMDiRCjJgwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745679256; c=relaxed/simple;
	bh=hfJSUaOue8jaJ1lUo2evihusiUNyV0JQ02DewVaWNeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rs2l6LV6Ch+AYF3Uwgui+TfK6U1+mt5AvgCyIlo97Mn/lTMO8mLJq0/T0ZsEfhbbMUhKF0+ksJ/Re273zDrV795g/CNBScC9ItirqX0rYVHDEeFNi0n58roYhvMaA/N+1PbBqXgI2EOVlf97iVHcDi27ylEcjtbqag64r0odpYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=ocKA6jnW; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q1XJRX004556;
	Sat, 26 Apr 2025 14:53:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=gZqL6S
	CFtZEsJqWtffztgLGfLxz9kqQadUrIxWSZSCo=; b=ocKA6jnWfPENKOUSHz6OFA
	oP6tIya0Sn8mrw3rjq4iA8667bxZTsdhNkBl4SFNZ2+dWBu+4q9NJx0wYgxzS07v
	Bs1lgWWF/h4KWrIbm4slUxuAdXTQSSNDKTwRohEluWgIfeO7Rt7HUh9UqAgEOUED
	oGqfyHV5e/r1N0A5923uJ69b7PRenI1XJBhDWUeDiIHZ9v1FfghMlNQyD+Wi9KUP
	qh6z37xGGCpQkR4Ef6WzrKgVJZmDnr2D6IvkI4eJ+dEksZhz1YLfaYJd9tbhAGnD
	o7EwrQCx96C5c/u+34tcgnpgQqta2kl9oRAXqNQbxRFy8HnnzCEQQgs0sAE0rFGw
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 468nwmhtxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Apr 2025 14:53:53 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53QB2cut008601;
	Sat, 26 Apr 2025 14:53:53 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 466jfy29mj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Apr 2025 14:53:53 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53QErq3g31916612
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 26 Apr 2025 14:53:52 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AE8F25805D;
	Sat, 26 Apr 2025 14:53:52 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8071458065;
	Sat, 26 Apr 2025 14:53:50 +0000 (GMT)
Received: from [9.61.248.121] (unknown [9.61.248.121])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 26 Apr 2025 14:53:50 +0000 (GMT)
Message-ID: <e8bf676e-7bf0-4896-b104-ac75e1b22d2e@linux.ibm.com>
Date: Sat, 26 Apr 2025 20:23:49 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next-20250422] Build failure: Wvla-larger-than=0 is
 meaningless
Content-Language: en-GB
To: Kees Cook <kees@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, nathan@kernel.org, hch@lst.de,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <7780883c-0ac8-4aaa-b850-469e33b50672@linux.ibm.com>
 <202504252249.6F09D31FD1@keescook>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <202504252249.6F09D31FD1@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDEwMiBTYWx0ZWRfXwQG/5hwB3MDq NUgHomRmpv5agiuIGuByTyFSFy/61ent4aMr0AuOqw/J90PER8+GR7DyhmACtxZwHCzIh4+NZG/ qlc/8T9E/lb3lnUIDje+qc1GUMb+XmkNw2AYIJSZUNE2ewxOXwChmNtsumqwXy5L7d7OPQ06+R5
 wXTe3pqofNfso0kUKbn9E/cMZcls2tcu8wmexjb8yumIlukL5SawrjmxMg/fA/tLrryYiqiTEw+ eE37AMDo+CUTdW+wg+mEVgK0IzusWRaPdMuLA0rfgqflrm8ytSHiOUrocJgEcgqm+hbdXtaZSkH hz4YaN0N9gZDp9/TMf1VSQx3QWfgUyUDgZi+PXdZ5T5DnArlypX4RJXe1llOoFYhNAZRIHnfczn
 bp+9H5DIxo/tC6UMkmmZ5+aQ72ZEFEIoPnQde9lpSetw3SNwCtvcd/Ex3qNHobRgnxQTk9OP
X-Authority-Analysis: v=2.4 cv=Yfq95xRf c=1 sm=1 tr=0 ts=680cf381 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=mDV3o1hIAAAA:8 a=VnNF1IyMAAAA:8
 a=wbOSOQyIEbtBsbREJHsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: g28sRGoavhM-5JAT-vqtPds04jO0le0U
X-Proofpoint-GUID: g28sRGoavhM-5JAT-vqtPds04jO0le0U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 mlxscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260102


On 26/04/25 11:20 am, Kees Cook wrote:
> On Wed, Apr 23, 2025 at 07:11:43PM +0530, Venkat Rao Bagalkote wrote:
>> I am observing linux-next build failure on IBM Power8 server.
>>
>>
>> Repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>>
>> Branch: master
>>
>> GCC: 8.5.0 20210514
>>
>> ldd (GNU libc) 2.28
>>
>> Attached is the .config file.
>>
>>
>> Build errors:
>>
>>
>> [[01m^[[Kcc1:^[[m^[[K ^[[01;36m^[[Knote: ^[[m^[[K-Wvla-larger-than=0 is
>> meaningless
> Weird that it doesn't get dropped by "cc-option". I reproduced the
> issue, and this patch seems to fix it:
>
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index 70ff932fd5ec..59d3d196fe4f 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -51,7 +51,7 @@ KBUILD_CFLAGS += $(call cc-disable-warning, dangling-pointer)
>   # types, so depend on GCC for now to keep stack VLAs out of the tree.
>   # https://github.com/llvm/llvm-project/issues/57098
>   # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98217
> -KBUILD_CFLAGS += $(call cc-option,-Wvla-larger-than=0)
> +KBUILD_CFLAGS += $(call cc-option,-Wvla-larger-than=1)
>   
>   # disable pointer signed / unsigned warnings in gcc 4.0
>   KBUILD_CFLAGS += -Wno-pointer-sign
>

Thanks for the fix. Applied the above patch on top of next-20250424 and 
it fixes the reported issue. Hence,


Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>


Regards,

Venkat.


