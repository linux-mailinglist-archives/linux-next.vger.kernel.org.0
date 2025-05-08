Return-Path: <linux-next+bounces-6608-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1529AAF93B
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 13:57:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03CB21BA2532
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 11:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B6E92236F0;
	Thu,  8 May 2025 11:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="UV+JjggY"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DBD35280;
	Thu,  8 May 2025 11:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746705462; cv=none; b=YjJf6GnxTkraKJ9j+HoWkKuDXJuVABDevKQIH5VXMGNGSEOQchhsU/+SbawxPicX5pacAdQO+T7sDiCVf0YEq8khuMBAvICPyrUzp4NjMF1X6XYCYzNO5FeZvBUJJR64sQ7DbRRv5dKnSbWUvhbdus9mOee8tz2nQ4v+sRHuixI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746705462; c=relaxed/simple;
	bh=us2gV6brlIylwIyp9XIq51u52aoqGw4/b7+f3IL0bwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a+OLL4aFdUMWQqcL2ABS899doBC54FP3vmlC3Ud+9dM38oM7f+wW02frQGaRK6lKl5m/kwQZjYfD2ur3dXftb07DY543BhKnTrwHSzzOyKUeX2OSlN0dOGdq+tQiIENgrIzOqdx7CEfKGFgDrGYNKP8I+XZtko8C3+j2yeQDjsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=UV+JjggY; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5489Ig2n023430;
	Thu, 8 May 2025 11:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=us2gV6
	brlIylwIyp9XIq51u52aoqGw4/b7+f3IL0bwg=; b=UV+JjggYo7CD5I80jP1Ug1
	D5IfgoYp4t2Z6CNHimg3INcdBI41yEeqrrZWuZ8zG7Abo68JTpFYhHEDQrhV5A2y
	vW/uL12ikYbgoQrU5T0GUJOPBK0lIO0C7JNpn0c6St2s58Y2mwd442XXb0sysLRp
	p701gduTzFzwD37OyelxmDYCMrfqe9PK+aXb8LNh4EQ2zrXtMKjwKEprDpP4tDbA
	UIpI6Q0JL7BI+NDcUIfPDB/LrHT30n+QITdkytg2pBStZmFa0amNk+VkThk7uJZJ
	6UHhnZZBpDlmi9dgkL4Dso5P0KzCwa7pMBaYSepIzFlDmZ9W4y7k1pLaSyXH657Q
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46gfm9b8x7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 11:57:19 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54896una004235;
	Thu, 8 May 2025 11:57:18 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46fjb2a9nc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 11:57:18 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 548BvHa422479460
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 May 2025 11:57:17 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8E26B58059;
	Thu,  8 May 2025 11:57:17 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6AF3458043;
	Thu,  8 May 2025 11:57:15 +0000 (GMT)
Received: from [9.61.251.83] (unknown [9.61.251.83])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  8 May 2025 11:57:15 +0000 (GMT)
Message-ID: <f66620e2-77e3-4713-a946-ddb2c8a0bccb@linux.ibm.com>
Date: Thu, 8 May 2025 17:27:13 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: powerpc/poly1305 - Add missing poly1305_emit_arch
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
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <aByX_Y64C6lVRR8M@gondor.apana.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDA5NiBTYWx0ZWRfX2UtZVN7bm0/i NEXgD74rX11RpsddzqyN4wUFHAsUYm3G4xcmpJ04gH81u4E5DNnwSwVrGGxpg88tS5oUp93JGlA I4cA8VHPB8RtvELDob5n1yp0JBMiNFGVZVjqKuGJH8GQS7ExCzumo9G+y2n5x5aa2Ik9ynbKK2Z
 7aSztB+NCVMlqf5Bz2U+JtuKoNeCC5fz8+l9SvfEttgyz/UF/EGoMdmjA6YVq1hWJ2PrUrlyhZQ QJ7OPrblNj6uhfaH64+T/1KjEeqty4JyHiN+pSeoVaf83wTL7+hi5NbHtVd52u98Te7a8CqEIrk ZWV26m0mT3ZC0iiiNuzWyeOl2DO8a5OVLo3TPt+W5u1DCR+9ApxfkqeUR77ZzBWq/E9JTxb2LgL
 gI4r8hGHZk+yXsYpeVtvlpc3oax9c89vs669yX5lCUHIR/wZgm2kTh8VJYU6eY14twusznhB
X-Authority-Analysis: v=2.4 cv=RIGzH5i+ c=1 sm=1 tr=0 ts=681c9c1f cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=El5dvJCKmSxESl22nb0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: yP_YmZhz1NZx9V1zUnY8AvDAx20FeeW0
X-Proofpoint-ORIG-GUID: yP_YmZhz1NZx9V1zUnY8AvDAx20FeeW0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_04,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 clxscore=1015 bulkscore=0 mlxscore=0 phishscore=0
 mlxlogscore=733 malwarescore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080096


On 08/05/25 5:09 pm, Herbert Xu wrote:
> On Thu, May 08, 2025 at 02:46:06PM +0530, Venkat Rao Bagalkote wrote:
>> I tested this patch by applying on next-20250507, though it fixes the build
>> issue, it has introduced a boot warning.
> What was the last next tree that's known to be good on this machine?
>
> Thanks,

Yes, its was on the same machine, next-20250506 passed.


Also, modporbe works fine.


]# modprobe chacha20poly1305
]#


Regards,

Venkat.


