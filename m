Return-Path: <linux-next+bounces-6614-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C2CAAFEA5
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 17:13:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62CA518865F1
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 15:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B9A4286D64;
	Thu,  8 May 2025 15:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="o3pZSYpy"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C76A27AC3E;
	Thu,  8 May 2025 15:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716815; cv=none; b=tCykZ+lLUsPkq/2Wbu+zKEjTm4VKPxZYjqnVzyxt9+T/mZbIemChxA3//6XkIwUBMxAUgcDIj8eCiD3AfTBC72uWIsw3DD8JWvUndoN+zqUVq1ll+wscfZtnyzWR68TAZ+U1IVwdHEnIdZ14g175EtuT7xSByuev7ohH5CWN+WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716815; c=relaxed/simple;
	bh=hbTb4Ycr/d1ecNihiUJ856JR7dFexe12ufHLYP7hyIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VpHOScAio6IPrh61xK+KjX/TVDc2kbzoVubNkDBNRuVfujltHO1lOk0aJvvrbo9vNJ+FkFFQ8fXkmDCgNNYqMcQPiZfXkev3UDxkIZPpQh4XJ/+ncdXsOWUuq54qzmzVeapXZhREQdl35D2XPDjF9fhaNF3S/IFC8rqlfCLJFRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=o3pZSYpy; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548AfMCG013187;
	Thu, 8 May 2025 15:06:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=BSmgeN
	5HB91N9M1jV8w7LDYBEzoqBnjFqxH7vD60Jig=; b=o3pZSYpyppVLqGAAUptfXc
	bvJG4AHVxvooB+S7GP3sZxoyJyvNIZRSXhA9MFfULyvu7wIv/UiBiwvp32mP4T9i
	fWP1juZkev8fWrVPpkKJjC+PU8xjQxdXVzK3jLEAWDGzjncaphwrVWHGOsbibSfs
	/FWGM1y/BRa7oNJfQq9Uw8zsXniPxup2Yb7NQH/0s87A3uTkaoM4uCSQiJH8qOts
	zYRD2esuvznadVpOFfagXVL+z6/Yc2eyMcMec6oJCMURt+WZseJ9Dk/w4eWGI/MZ
	JI5hx4ArMFt3yHkr9ZHF+9dxAuWaPq2GNj+iVu/Cusy01ynwiPhxGNxHZ1vGz74Q
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46gu2t1a0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 15:06:10 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 548B03tu013880;
	Thu, 8 May 2025 15:05:52 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 46e062nyg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 15:05:52 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 548F5qlA27918960
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 May 2025 15:05:52 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0B47358055;
	Thu,  8 May 2025 15:05:52 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F37EA58043;
	Thu,  8 May 2025 15:05:49 +0000 (GMT)
Received: from [9.61.251.83] (unknown [9.61.251.83])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  8 May 2025 15:05:49 +0000 (GMT)
Message-ID: <1d2c2fdc-5c36-4d4e-8b25-8289b865726d@linux.ibm.com>
Date: Thu, 8 May 2025 20:35:48 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: powerpc/poly1305 - Restore crypto_simd_usable
 test
Content-Language: en-GB
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
References: <cover.1745815528.git.herbert@gondor.apana.org.au>
 <915c874caf5451d560bf26ff59f58177aa8b7c17.1745815528.git.herbert@gondor.apana.org.au>
 <242ebbf1-4ef0-41c3-83cb-a055c262ba4a@leemhuis.info>
 <aBtF2jVZQwxGiHVk@gondor.apana.org.au>
 <37cf099e-d5c2-40d8-bc31-77e1f9623b1c@linux.ibm.com>
 <aByX_Y64C6lVRR8M@gondor.apana.org.au>
 <f66620e2-77e3-4713-a946-ddb2c8a0bccb@linux.ibm.com>
 <aByiNZNxqyTerdYG@gondor.apana.org.au>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <aByiNZNxqyTerdYG@gondor.apana.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=NLnV+16g c=1 sm=1 tr=0 ts=681cc862 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=FNyBlpCuAAAA:8 a=48bIoUrBYIooDiy4U3IA:9 a=QEXdDO2ut3YA:10
 a=RlW-AWeGUCXs_Nkyno-6:22
X-Proofpoint-ORIG-GUID: FP_6_i-DOA52SaRGfd5Doiu48ydWtB-2
X-Proofpoint-GUID: FP_6_i-DOA52SaRGfd5Doiu48ydWtB-2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDEzMCBTYWx0ZWRfXz90klTix6jhx 4ku7tsJP+/6Ssabv4huefVsKUMqL+8l6vB6qri0KCBidPVx6gqu7f7tBsyI5nMBNvdpseExL5Yz tcmbxR/9gdwOtJgylYYTqOGcUZ/OwyC6Kf3oGi4u3ABRL2rt0Hny+CHnbTUtG8uFoFN/6Mt3cKD
 zke5EIrb7r8lX3jHSdl5rNYmVxucnfYb7JcKr7sqXc500enzJti9+6oWQVj0mR3I+ROyzyEOCAD NSWT204LLoJgH1Z9m8tBUQSPRBY2bWgQ9MhJ3kA4r1lR7sfTN57mm0K+fKGsH90QaCBCZ6MaTgq MXzI+j6+wzRYsvN1HanlCJ9X1/hH/mBUeCim/ZTLDkT2p6pUnFCQNrYKD9hD+GISBzW3ZvNMXCp
 CqrhKnQPYt5ndNmfFzbI+IhHViXLZfaNE4jwX5QFlxf9lohHV57EppSoH6TMX3bzckrX+9Bf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 mlxlogscore=909 phishscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080130


On 08/05/25 5:53 pm, Herbert Xu wrote:
> On Thu, May 08, 2025 at 05:27:13PM +0530, Venkat Rao Bagalkote wrote:
>> Yes, its was on the same machine, next-20250506 passed.
> OK I found one bug in my patches, I incorrectly removed the simd
> tests for powerpc.  Does this patch help?
>
> ---8<---
> Restore the crypto_simd_usable test as powerpc needs it.
>
> Fixes: 14d31979145d ("crypto: powerpc/poly1305 - Add block-only interface")
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
>
> diff --git a/arch/powerpc/lib/crypto/poly1305-p10-glue.c b/arch/powerpc/lib/crypto/poly1305-p10-glue.c
> index 7cea0ebcc6bc..154eced0bf9e 100644
> --- a/arch/powerpc/lib/crypto/poly1305-p10-glue.c
> +++ b/arch/powerpc/lib/crypto/poly1305-p10-glue.c
> @@ -6,6 +6,7 @@
>    */
>   #include <asm/switch_to.h>
>   #include <crypto/internal/poly1305.h>
> +#include <crypto/internal/simd.h>
>   #include <linux/cpufeature.h>
>   #include <linux/jump_label.h>
>   #include <linux/kernel.h>
> @@ -51,7 +52,7 @@ void poly1305_blocks_arch(struct poly1305_block_state *state, const u8 *src,
>   	if (!static_key_enabled(&have_p10))
>   		return poly1305_blocks_generic(state, src, len, padbit);
>   	vsx_begin();
> -	if (len >= POLY1305_BLOCK_SIZE * 4) {
> +	if (crypto_simd_usable() && len >= POLY1305_BLOCK_SIZE * 4) {
>   		poly1305_p10le_4blocks(state, src, len);
>   		src += len - (len % (POLY1305_BLOCK_SIZE * 4));
>   		len %= POLY1305_BLOCK_SIZE * 4;


Unfortunately, above patch dosent fix the boot warning.


Regards,

Venkat.


