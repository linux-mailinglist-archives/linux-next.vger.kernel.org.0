Return-Path: <linux-next+bounces-6681-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4D8AB2EBD
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 07:14:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 478863ABCB5
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 05:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E511C254AF7;
	Mon, 12 May 2025 05:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Z1M6KvTE"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9D318035;
	Mon, 12 May 2025 05:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747026862; cv=none; b=VFU59CriKdPEsdV3yvc/3I0gZqNEgcxHF4anzpjEeuLWMmvZPzE5hwzrhROn/yPWp2hcQS9QKoPAW84sKEMmLEOrnIZeldUq2y56VeY0Tq310oLoufiVhCndgrOe6zqcK6c95raMYK33dOnW6gZk953zZW/xyLWdssCtlJQvSJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747026862; c=relaxed/simple;
	bh=vBJaaJH2jLSc2gJt5q4WJmC2r5t3TVWO15xOqKdJDvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sxaKU3mJiJXxs4/Nswn+aZcD8HysXn3ecDBgGAK4IrSP5E6sSaR3ac4idht5leCrLjOEhR1cMursIDH7yevQMn5Y/vzE/bk80XO/evZCoVcovj7uGkuKPNv50UUAaQRsdskSRWPVtxyeeQCjYIq1M4655yZSghOH0aKofvdKhSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Z1M6KvTE; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54BLpiTi010600;
	Mon, 12 May 2025 05:13:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=wfHV5U
	FlVuQiRDOxZ/K5Wpk72NQtbLpQBpjGNgperF8=; b=Z1M6KvTEl0+6F9tWCqJ28g
	dXaVN7q6TNWh0GY3OwSa4XmfrbPnOh9MMtBGn2j3xp1+nnuTGvqaglXb9Huj2/x5
	0flF7GJe5xyqLNGOpNiyZmhRhCot6mf6DHlXwxQ8ACIHULApa6j0b4iXQpyaD/9B
	hedyJvDlsEBMl+LRAyYgmgyManTTnoV8r6yF+prgdiew1KF5i0HeNd4LvmYkoarV
	IU5yzfGExdGPL25YhjsqodIMBSKzKSLg8BquclkITTb5dDbDIYOdcQ7HnwagjYp5
	Sr5T933UYwRPvQolKU4aqoRQxibfhLe3BVlj8VwtViEFYf6ILrlgwXvBE6AwovrQ
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46jue6aa1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 05:13:53 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54C1ds1l011537;
	Mon, 12 May 2025 05:13:52 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 46jku244tx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 05:13:52 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54C5DoIY35652044
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 05:13:51 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C310958056;
	Mon, 12 May 2025 05:13:50 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5FBCD5805D;
	Mon, 12 May 2025 05:13:47 +0000 (GMT)
Received: from [9.61.250.60] (unknown [9.61.250.60])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 12 May 2025 05:13:47 +0000 (GMT)
Message-ID: <5a91f13b-4a9f-4c6f-b1aa-ebc362286686@linux.ibm.com>
Date: Mon, 12 May 2025 10:43:45 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2 PATCH] crypto: powerpc/poly1305 - Add poly1305_emit_arch
 wrapper
Content-Language: en-GB
To: Herbert Xu <herbert@gondor.apana.org.au>,
        Eric Biggers <ebiggers@kernel.org>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Danny Tsen <dtsen@linux.ibm.com>
References: <915c874caf5451d560bf26ff59f58177aa8b7c17.1745815528.git.herbert@gondor.apana.org.au>
 <242ebbf1-4ef0-41c3-83cb-a055c262ba4a@leemhuis.info>
 <aBtF2jVZQwxGiHVk@gondor.apana.org.au>
 <37cf099e-d5c2-40d8-bc31-77e1f9623b1c@linux.ibm.com>
 <aByX_Y64C6lVRR8M@gondor.apana.org.au>
 <f66620e2-77e3-4713-a946-ddb2c8a0bccb@linux.ibm.com>
 <aByiNZNxqyTerdYG@gondor.apana.org.au>
 <1d2c2fdc-5c36-4d4e-8b25-8289b865726d@linux.ibm.com>
 <aB31DI4QBBZuQObQ@gondor.apana.org.au> <20250510044450.GA505731@sol>
 <aB7fvi_FBdnmLUON@gondor.apana.org.au>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <aB7fvi_FBdnmLUON@gondor.apana.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: fOsKkmYk2YUlzEKQUousF2jHOEpDkDxv
X-Authority-Analysis: v=2.4 cv=TbmWtQQh c=1 sm=1 tr=0 ts=68218391 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=1XWaLZrsAAAA:8 a=FNyBlpCuAAAA:8 a=Gv0kvQbbh2rwukjrtwgA:9
 a=QEXdDO2ut3YA:10 a=RlW-AWeGUCXs_Nkyno-6:22
X-Proofpoint-GUID: fOsKkmYk2YUlzEKQUousF2jHOEpDkDxv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDA1MiBTYWx0ZWRfXzqxxh847KbcF M6h2Nh4d1rKwJh399BedpQYVC1nFEnQG2QXdbBlIZcg7rZbMNxXUqo5cxWl/KOkfWd3ltOMqWx2 lADWVWQOWbzpCI5vuHqZRmhgqhhgl7PWJ+9kNo8dfeneqP2XySIVJB9/ItQtnd6q2b4Ke80tgL7
 kDOMnsTpD42Ki6DErHbSsYctu89bvgG9wDsKvSQCeBPQCTZN7b9++0Xwu3mUvog7730pQBTTgxm neDXAmVgDSvLpt78GGchYIsRUHFm0xYfgM2yliwVOL5DMjUJB9FBEeyBuudXkKMzSnwXEBoPtXV ulC3wX+fHe2V8/N+eZtD+vBHEfafCmXEbCtchIaqMwCbacVwgnmmkfVTt9C7adIj64hYj4kpwst
 2Dkn/Mj6vstRuKt4OW9K10hr5s3Rk8+ZA9Ah4fL9WBCwPu1AMXoEdIh6lfRLtS6alAq//gYD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1011
 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120052


On 10/05/25 10:40 am, Herbert Xu wrote:
> On Fri, May 09, 2025 at 09:44:50PM -0700, Eric Biggers wrote:
>> This fixes "-cpu Power10", but older CPUs (e.g. "-cpu POWER9") are still
>> failing.
> You're right.  I'll revert this and apply the following patch
> instead.
>
> BTW this thing is still hopelessly broken if it's called from
> softirq context because there is no SIMD fallback.  Yes I removed
> the SIMD check but it was already broken before that as it simply
> switched from the 4-block version to the 1-block version if SIMD
> is not available rather than actually doing something that is
> safe in softirq context.
>
> Perhaps we should just remove this altogether until it's fixed.
>
> ---8<---
> Add poly1305_emit_arch with fallback instead of calling assembly
> directly.  This is because the state format differs between p10
> and that of the generic implementation.
>
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Reported-by: Eric Biggers <ebiggers@google.com>
> Fixes: 14d31979145d ("crypto: powerpc/poly1305 - Add block-only interface")
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
>
> diff --git a/arch/powerpc/lib/crypto/poly1305-p10-glue.c b/arch/powerpc/lib/crypto/poly1305-p10-glue.c
> index 7cea0ebcc6bc..3f1664a724b6 100644
> --- a/arch/powerpc/lib/crypto/poly1305-p10-glue.c
> +++ b/arch/powerpc/lib/crypto/poly1305-p10-glue.c
> @@ -14,10 +14,7 @@
>   
>   asmlinkage void poly1305_p10le_4blocks(struct poly1305_block_state *state, const u8 *m, u32 mlen);
>   asmlinkage void poly1305_64s(struct poly1305_block_state *state, const u8 *m, u32 mlen, int highbit);
> -asmlinkage void poly1305_emit_arch(const struct poly1305_state *state,
> -				   u8 digest[POLY1305_DIGEST_SIZE],
> -				   const u32 nonce[4]);
> -EXPORT_SYMBOL_GPL(poly1305_emit_arch);
> +asmlinkage void poly1305_emit_64(const struct poly1305_state *state, const u32 nonce[4], u8 digest[POLY1305_DIGEST_SIZE]);
>   
>   static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_p10);
>   
> @@ -65,6 +62,16 @@ void poly1305_blocks_arch(struct poly1305_block_state *state, const u8 *src,
>   }
>   EXPORT_SYMBOL_GPL(poly1305_blocks_arch);
>   
> +void poly1305_emit_arch(const struct poly1305_state *state,
> +			u8 digest[POLY1305_DIGEST_SIZE],
> +			const u32 nonce[4])
> +{
> +	if (!static_key_enabled(&have_p10))
> +		return poly1305_emit_generic(state, digest, nonce);
> +	poly1305_emit_64(state, nonce, digest);
> +}
> +EXPORT_SYMBOL_GPL(poly1305_emit_arch);
> +
>   bool poly1305_is_arch_optimized(void)
>   {
>   	return static_key_enabled(&have_p10);
> diff --git a/arch/powerpc/lib/crypto/poly1305-p10le_64.S b/arch/powerpc/lib/crypto/poly1305-p10le_64.S
> index 2ba2911b8038..a3c1987f1ecd 100644
> --- a/arch/powerpc/lib/crypto/poly1305-p10le_64.S
> +++ b/arch/powerpc/lib/crypto/poly1305-p10le_64.S
> @@ -1030,7 +1030,7 @@ SYM_FUNC_END(poly1305_64s)
>   # Input: r3 = h, r4 = s, r5 = mac
>   # mac = h + s
>   #
> -SYM_FUNC_START(poly1305_emit_arch)
> +SYM_FUNC_START(poly1305_emit_64)
>   	ld	10, 0(3)
>   	ld	11, 8(3)
>   	ld	12, 16(3)
> @@ -1060,7 +1060,7 @@ Skip_h64:
>   	std	10, 0(5)
>   	std	11, 8(5)
>   	blr
> -SYM_FUNC_END(poly1305_emit_arch)
> +SYM_FUNC_END(poly1305_emit_64)
>   
>   SYM_DATA_START_LOCAL(RMASK)
>   .align 5


Tested this patch, by applying on top of next-20250508 on IBM Power9 
system and it fixes the reported boot warnings. Hence,


Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>



Regards,

Venkat.


