Return-Path: <linux-next+bounces-6596-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E3CAAF690
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 11:16:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44AB718880B6
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 09:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0749E1581E0;
	Thu,  8 May 2025 09:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="GKMx+nxs"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F571A42C4;
	Thu,  8 May 2025 09:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746695795; cv=none; b=HUMtn/HhJdpnfekIhvwDVk5NFECwDlqoxtR019tszWMghBsPdGXEBufw66cD3yg22YgT0YRz41+OWCGzDPpDqeimq8YKX8vFZBJ3Q/mvZ6fG8EM9GaKDMm9I4XgUnqei19OrawVVscegOWR9xyzyvuKh8tP6LHMGl2+E4JMllFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746695795; c=relaxed/simple;
	bh=IHBVqgqSDmB+55+UqaXdIH1khHeHtFN9JCHjpuEBUOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qWKYYWxdDB2OIdFSXynsvRmOzqxmvAGMnhMb8MfrUlOeL3+lk2OrrlCW5odeAmKrhrtvirp44ha0qhuKM/AwuDULTvPPaKweN3DKSkTNgkAsfuQtJWJwrPWw1y0/LRsBIYNt32eWDJZjl4KjcIb2BsyIt9NU/vpwf9qR6Pp+AOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=GKMx+nxs; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5487nvWM012196;
	Thu, 8 May 2025 09:16:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=OUQs9u
	FbnBcoWm8xxAZWEmoDdHesKZKr25oTwpFqAMw=; b=GKMx+nxszPGU29lsko7dYD
	hhGySEDlZp3nYfp+yU70Kowj8Ox37IqaBqNB/FjKiOsHXMGH7eVGvj0FbF5tALID
	rNNs4sGJZWsAUkSpycyr4oi5DaPcgm9tGd0FG4YRE294FSKB7CO8QtQtcUhuGwGy
	ko2lcq38EiJ9LkIyFJAEoFLPFQ+N2+vHehwQrQu+VFZduXAPbTFCF7j4kHIPdLEy
	yzw0Mv+j1jA2AMHWh6+GoO/kxoJzVJDUT/De99GElTk5AsYMfZfVIRigTgNgrYAM
	4tXeG1G1m/ZKeBBJfEtFLYtuMv14uBL0/k1sjUj8u6IiHCmiVtDOL9FksB+kQfeA
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46g5ejww6r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 09:16:11 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5488bjSj001313;
	Thu, 8 May 2025 09:16:10 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 46dwftn8pe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 09:16:10 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5489GAvD21496340
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 May 2025 09:16:10 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2B0E558055;
	Thu,  8 May 2025 09:16:10 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E0D0858059;
	Thu,  8 May 2025 09:16:07 +0000 (GMT)
Received: from [9.61.251.83] (unknown [9.61.251.83])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  8 May 2025 09:16:07 +0000 (GMT)
Message-ID: <37cf099e-d5c2-40d8-bc31-77e1f9623b1c@linux.ibm.com>
Date: Thu, 8 May 2025 14:46:06 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: powerpc/poly1305 - Add missing poly1305_emit_arch
To: Herbert Xu <herbert@gondor.apana.org.au>,
        Thorsten Leemhuis <linux@leemhuis.info>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
References: <cover.1745815528.git.herbert@gondor.apana.org.au>
 <915c874caf5451d560bf26ff59f58177aa8b7c17.1745815528.git.herbert@gondor.apana.org.au>
 <242ebbf1-4ef0-41c3-83cb-a055c262ba4a@leemhuis.info>
 <aBtF2jVZQwxGiHVk@gondor.apana.org.au>
Content-Language: en-GB
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <aBtF2jVZQwxGiHVk@gondor.apana.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=SvuQ6OO0 c=1 sm=1 tr=0 ts=681c765b cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=lAgNKBcoAAAA:8 a=FNyBlpCuAAAA:8 a=VnNF1IyMAAAA:8 a=r7MKod_UI1lkIC2NXqAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=drE6d5tx1tjNRBs8zHOc:22 a=RlW-AWeGUCXs_Nkyno-6:22
X-Proofpoint-GUID: kJWh61mFWr0ADYxJozMTIY58WU1C0PNQ
X-Proofpoint-ORIG-GUID: kJWh61mFWr0ADYxJozMTIY58WU1C0PNQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDA4MiBTYWx0ZWRfX7iNdu0IiaF8d /UU6eo0IvCyMh3JVkhslGEfjp8MJkn7C97xr1wm6t0Ysf8PiVM06HR3BsPxuWoXELTDA+rdxoVc wlAjgOi5FixmlRA2JbhajKmxuJXxy9e2ompZJjacb33d/BY6E/BvazU38cUTTg92sgTaVtoe6HP
 pHdufPXhjLwgNxOgAOm00+lCZJmXnT4JBGlOpWVMfd9J11aXW+dUx/doHRatfv458vsh3VNUBWv OopPPEGKxhZCkxPsQJWkPVxEex7n7SFU2TObpljPicaBCFYFx5vHjYYDiGKwn029Hzh3mWYd7E5 257WUxkS95zd0QWlrDkldU9/DHxO4tl67YtY+PtWN9s9WzzVa53fCXuzZsHBJdgR6A5M6EzJQlm
 WxDBhhNLwr7r+l81KicPCD3K+4tFenV5cSSDVQQIHjKpMCr/0tCEnbcjjM//eHMZoNphOeb1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_03,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 mlxscore=0 suspectscore=0
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080082

Hello Herbert,

On 07/05/25 5:06 pm, Herbert Xu wrote:
> On Wed, May 07, 2025 at 01:03:06PM +0200, Thorsten Leemhuis wrote:
>> """
>> ld: warning: discarding dynamic section .glink
>> ld: warning: discarding dynamic section .plt
>> ld: linkage table error against `poly1305_emit_arch'
>> ld: stubs don't match calculated size
>> ld: can not build stubs: bad value
>> ld: lib/crypto/poly1305.o: in function `poly1305_final':
>> /builddir/build/BUILD/kernel-6.15.0-build/kernel-next-20250507/linux-6.15.0-0.0.next.20250507.443.vanilla.fc43.ppc64le/lib/crypto/poly1305.c:65:(.text+0x2dc): undefined reference to `poly1305_emit_arch'
>> ld: /builddir/build/BUILD/kernel-6.15.0-build/kernel-next-20250507/linux-6.15.0-0.0.next.20250507.443.vanilla.fc43.ppc64le/lib/crypto/poly1305.c:65:(.text+0x378): undefined reference to `poly1305_emit_arch'
>> make[2]: *** [scripts/Makefile.vmlinux:91: vmlinux] Error 1
>> make[1]: *** [/builddir/build/BUILD/kernel-6.15.0-build/kernel-next-20250507/linux-6.15.0-0.0.next.20250507.443.vanilla.fc43.ppc64le/Makefile:1250: vmlinux] Error 2
>> """
> Oops, the powerpc patch was missing the assembly part:
>
> ---8<---
> Rename poly1305_emit_64 to poly1305_emit_arch to conform with
> the expectation of the poly1305 library.
>
> Reported-by: Thorsten Leemhuis <linux@leemhuis.info>
> Fixes: 14d31979145d ("crypto: powerpc/poly1305 - Add block-only interface")
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
>
> diff --git a/arch/powerpc/lib/crypto/poly1305-p10-glue.c b/arch/powerpc/lib/crypto/poly1305-p10-glue.c
> index 16c2a8316696..7cea0ebcc6bc 100644
> --- a/arch/powerpc/lib/crypto/poly1305-p10-glue.c
> +++ b/arch/powerpc/lib/crypto/poly1305-p10-glue.c
> @@ -17,6 +17,7 @@ asmlinkage void poly1305_64s(struct poly1305_block_state *state, const u8 *m, u3
>   asmlinkage void poly1305_emit_arch(const struct poly1305_state *state,
>   				   u8 digest[POLY1305_DIGEST_SIZE],
>   				   const u32 nonce[4]);
> +EXPORT_SYMBOL_GPL(poly1305_emit_arch);
>   
>   static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_p10);
>   
> diff --git a/arch/powerpc/lib/crypto/poly1305-p10le_64.S b/arch/powerpc/lib/crypto/poly1305-p10le_64.S
> index a3c1987f1ecd..2ba2911b8038 100644
> --- a/arch/powerpc/lib/crypto/poly1305-p10le_64.S
> +++ b/arch/powerpc/lib/crypto/poly1305-p10le_64.S
> @@ -1030,7 +1030,7 @@ SYM_FUNC_END(poly1305_64s)
>   # Input: r3 = h, r4 = s, r5 = mac
>   # mac = h + s
>   #
> -SYM_FUNC_START(poly1305_emit_64)
> +SYM_FUNC_START(poly1305_emit_arch)
>   	ld	10, 0(3)
>   	ld	11, 8(3)
>   	ld	12, 16(3)
> @@ -1060,7 +1060,7 @@ Skip_h64:
>   	std	10, 0(5)
>   	std	11, 8(5)
>   	blr
> -SYM_FUNC_END(poly1305_emit_64)
> +SYM_FUNC_END(poly1305_emit_arch)
>   
>   SYM_DATA_START_LOCAL(RMASK)
>   .align 5


I tested this patch by applying on next-20250507, though it fixes the 
build issue, it has introduced a boot warning.


Warning:


[    1.644487] ------------[ cut here ]------------
[    1.644490] WARNING: CPU: 3 PID: 1 at 
lib/crypto/chacha20poly1305.c:359 chacha20poly1305_init+0x28/0x50
[    1.644501] Modules linked in:
[    1.644507] CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Not tainted 
6.15.0-rc5-next-20250507-00002-g8be5012869c6-dirty #1 VOLUNTARY
[    1.644515] Hardware name: IBM,8375-42A POWER9 (architected) 0x4e0202 
0xf000005 of:IBM,FW950.80 (VL950_131) hv:phyp pSeries
[    1.644520] NIP:  c0000000020646c0 LR: c0000000020646b4 CTR: 
00000000007088ec
[    1.644525] REGS: c000000a03757960 TRAP: 0700   Not tainted 
(6.15.0-rc5-next-20250507-00002-g8be5012869c6-dirty)
[    1.644530] MSR:  8000000002029033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 
28000282  XER: 0000000f
[    1.644544] CFAR: c000000002064ec8 IRQMASK: 0
[    1.644544] GPR00: c0000000020646b4 c000000a03757c00 c000000001dc8100 
0000000000000001
[    1.644544] GPR04: 0000000000000961 c0000009e94dd5c0 c000000a0d348000 
0000000000000960
[    1.644544] GPR08: 00000009e7270000 0000000000000000 0000000000000000 
c0000013fb400000
[    1.644544] GPR12: c0000013fc9fffa8 c000000017ffcb00 c0000000000113d8 
0000000000000000
[    1.644544] GPR16: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[    1.644544] GPR20: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[    1.644544] GPR24: 0000000000000000 0000000000000000 c0000000020b19a8 
0000000000000006
[    1.644544] GPR28: 0000000000000000 c0000000020b1960 c000000a05490a00 
c000000002064698
[    1.644600] NIP [c0000000020646c0] chacha20poly1305_init+0x28/0x50
[    1.644607] LR [c0000000020646b4] chacha20poly1305_init+0x1c/0x50
[    1.644612] Call Trace:
[    1.644615] [c000000a03757c00] [c0000000020646b4] 
chacha20poly1305_init+0x1c/0x50 (unreliable)
[    1.644624] [c000000a03757c20] [c000000000010d1c] 
do_one_initcall+0x5c/0x37c
[    1.644631] [c000000a03757d00] [c000000002005394] 
do_initcalls+0x144/0x18c
[    1.644638] [c000000a03757d90] [c000000002005688] 
kernel_init_freeable+0x214/0x288
[    1.644645] [c000000a03757df0] [c0000000000113fc] kernel_init+0x2c/0x1b0
[    1.644651] [c000000a03757e50] [c00000000000df5c] 
ret_from_kernel_user_thread+0x14/0x1c
[    1.644657] ---- interrupt: 0 at 0x0
[    1.644661] Code: 7c0803a6 4e800020 3c4cffd6 38423a68 60000000 
7c0802a6 f8010010 f821ffe1 4800028d 60000000 68630001 5463063e 
<0b030000> 2c030000 4082000c 38600000
[    1.644681] ---[ end trace 0000000000000000 ]---


If you are planning to fix this in seperate patch, please add below tag.


Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>


Regards,

Venkat.


