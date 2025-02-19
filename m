Return-Path: <linux-next+bounces-5498-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A48DDA3B2F8
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2025 09:00:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6F9B188A7E2
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2025 08:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46A4D1B87F4;
	Wed, 19 Feb 2025 08:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="sdJT9w06"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C47817A2FE;
	Wed, 19 Feb 2025 08:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739952031; cv=none; b=nhkzJa1KdROZZEK6zMv0m4aU+AyCTmUvDJImYbaJu4z8xzx+murgfPQutfOoSMvf5KffJd7FEhwE3NhWyepkj21uAjY09IqNNsKkbFF1AhVZ4qgOp8BQVfEj1/FDn4LlJyGT5gPGsiBYF7nBL4fK5RipwKGPBEG+2YJWYMzO1cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739952031; c=relaxed/simple;
	bh=8eWqJHU2LbrFX/m2Y0cx1pG2wLnCHCevlsWu3c1RYvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FWrqKc0e4tdUo1TZ6sf0Wq+4KL0EisEr6nw0Uw1MpQkbXntRt8c7BwKqFpjs3NO7oh52omDh7XeCuqKS8dSihAWvT536pOYnBWe/5BBcmTD/ZIPJ+sA7i402hDH3nDYNcTNT7iVy9N999lYR+cAP44tlWuUJ0LAFIb2CahZ4m/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=sdJT9w06; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51J75B8a005303;
	Wed, 19 Feb 2025 08:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ejfOtp
	j+exSth/ZFyiK/cHQMe5GVKIP/KuhULowI8is=; b=sdJT9w06RiKt4fmZ42IqQA
	WxfdIf4gqVL0gj5JRjOmOpR4+Wi/cqRqEL1E6s94BR1nv+jckIUYngTEDQXpB7te
	geIpMoTdPpe7hcQSkeY0MbsnU0QUGCUDA6rpdemO+JxdnhrXbJ97E/KSDN5Q2C3X
	m55ThXuS+QFWcEKi4hCBUgITcwaNGejGVFwYCyqBrO4eJVsbFqcJNi5rlkqjKx+l
	4Pso89RclLPbiPzcDEu2L7o2UNdX0lzJ6DWv7gcIEH/GP9Y2S0/vaqYomjXXAy6Z
	wK0jYc7VbuzsgT/KbAZKg+JtvN9onOhWmVi2NIZgrss2mrilTIncw95BLSATV7YQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44w65097yk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 08:00:14 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51J7xE3b006847;
	Wed, 19 Feb 2025 08:00:14 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44w65097ye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 08:00:14 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51J704B3005826;
	Wed, 19 Feb 2025 08:00:13 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44w02xawrg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 08:00:13 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51J80CuQ64029038
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Feb 2025 08:00:12 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AEFD95806F;
	Wed, 19 Feb 2025 08:00:11 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 51F3358056;
	Wed, 19 Feb 2025 08:00:05 +0000 (GMT)
Received: from [9.43.108.86] (unknown [9.43.108.86])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Feb 2025 08:00:04 +0000 (GMT)
Message-ID: <d5734fe3-813f-4c8b-9ead-3089d3af6274@linux.ibm.com>
Date: Wed, 19 Feb 2025 13:30:01 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cxl: Fix cross-reference in documentation and add
 deprecation warning
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: fbarrat@linux.ibm.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org,
        mchehab+huawei@kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>
References: <20250219064807.175107-1-ajd@linux.ibm.com>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <20250219064807.175107-1-ajd@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ZpWv9r_k4_BcWUijIIygROr8keycnyVP
X-Proofpoint-GUID: 9iddCGeetMERc6TtA9Qm1KYvDJrgEslg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_03,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=695 spamscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 clxscore=1011 bulkscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190062



On 2/19/25 12:18 PM, Andrew Donnellan wrote:
> commit 5731d41af924 ("cxl: Deprecate driver") labelled the cxl driver as
> deprecated and moved the ABI documentation to the obsolete/ subdirectory,
> but didn't update cxl.rst, causing a warning once ff7ff6eb4f809 ("docs:
> media: Allow creating cross-references for RC ABI") was merged.
> 
> Fix the cross-reference, and also add a deprecation warning.
> 
> Fixes: 5731d41af924 ("cxl: Deprecate driver")
> Reported-by: Bagas Sanjaya <bagasdotme@gmail.com>
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> 
> ---
> 
> Maddy: can we take this by powerpc-fixes?

Yes. Will take this via powerpc-fixes

Maddy

> ---
>  Documentation/arch/powerpc/cxl.rst | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/arch/powerpc/cxl.rst b/Documentation/arch/powerpc/cxl.rst
> index d2d77057610e..778adda740d2 100644
> --- a/Documentation/arch/powerpc/cxl.rst
> +++ b/Documentation/arch/powerpc/cxl.rst
> @@ -18,6 +18,7 @@ Introduction
>      both access system memory directly and with the same effective
>      addresses.
>  
> +    **This driver is deprecated and will be removed in a future release.**
>  
>  Hardware overview
>  =================
> @@ -453,7 +454,7 @@ Sysfs Class
>  
>      A cxl sysfs class is added under /sys/class/cxl to facilitate
>      enumeration and tuning of the accelerators. Its layout is
> -    described in Documentation/ABI/testing/sysfs-class-cxl
> +    described in Documentation/ABI/obsolete/sysfs-class-cxl
>  
>  
>  Udev rules


