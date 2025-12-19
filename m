Return-Path: <linux-next+bounces-9492-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA1DCD1B20
	for <lists+linux-next@lfdr.de>; Fri, 19 Dec 2025 20:55:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86AD2302AE3B
	for <lists+linux-next@lfdr.de>; Fri, 19 Dec 2025 19:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39B7622256B;
	Fri, 19 Dec 2025 19:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ozovpwJG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fwYCfkbp"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2357E0E8
	for <linux-next@vger.kernel.org>; Fri, 19 Dec 2025 19:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766174133; cv=none; b=c6pK5OZkJXPyxUkYEXGv4tH03pN3fx8/nJomFsa6cA+Fc1+r8guSBe9SzBuwq28sm5ij9i62+RoMkqrHsgqTq9to683T9zekPaXI1uX/l4JaEGVoKFZwx3CkqGrQbwOcmDkm4Cu5idl+TRUHp1Rm+of3uNbqqCJuwLu/bS2ARD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766174133; c=relaxed/simple;
	bh=ss1xnSaqbsRpAHZN6+oxWh2yskEWhkqzA9aufqiV/00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CXO2hfEC7A0PFrgd8TRDw2jZrWmP5ZF7zeswGWtfKyBvywubI7RBBevLgf3+H1oZeGDrP+iwjSPVCKHcCyQYZfo4TFvEE/EKsaHlcCZEtKBHmM6zN15k/CKxRNFuRCbZJWKvCw9n55qPsvZxBsbyX8AgtA9++IcGfGp4IqPozIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ozovpwJG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fwYCfkbp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJJCUdv2334343
	for <linux-next@vger.kernel.org>; Fri, 19 Dec 2025 19:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DR+goq48ncP0kyKUcb/V8WFR/h7VB4VgBz/yxTaq/Zc=; b=ozovpwJGtjNgYlnT
	F5ZK8NR3RAm6yUxl0Npjcxm2mVY36vXFchwZDwhsImffsI1nXO3PSDms7bJ6PQqL
	L716Y7mkm9ZO00K3o6eUrfa5uSDUbShUOkExK1x42xXAGCCxX+3Ilw2iQJgBJXFP
	QRsl3j0ghCmSTlvWjiMqzCX/26leTl1xqIf0/k/g0fpHQgNHKg43LdDvs9ioNxH3
	BRiI42nthz3Zq4WEDptKr7ZIsgVe041QZU/mwyIMN3l/qaMUXQUWPssjmpqcxq+O
	XTMBRl10ewAB3JV38wXOutXlIQAi5b4co4MAPRPo+J3Pq/iu2QJtCK33U4MF1z6q
	Q/35ZA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5cnq038x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Fri, 19 Dec 2025 19:55:30 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b630753cc38so3657452a12.1
        for <linux-next@vger.kernel.org>; Fri, 19 Dec 2025 11:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766174129; x=1766778929; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DR+goq48ncP0kyKUcb/V8WFR/h7VB4VgBz/yxTaq/Zc=;
        b=fwYCfkbp5DXXTGt+ZNNACx+rWfqDsUqYd+8xuigoL3zYrp7jzEDYWlTFnEZrOwa02g
         wIYk46mZTxzs5UuAi3ts8d7DVQQfh3Wxps+0DbKxAjt4WxGq8q49ePMXmJJJxzV3l0B0
         qPwqiTkLBvel2WSQuqTL32NSc1PuIAYnRdQ1em0kQrLv3s77Dht+dl0Pf/w18gLauR07
         XdrL+0KmJ0z3UtV+ogFZs1eorz/dah2dnNvCrN4soYGR0Qlu07djNO6MgQesFQPBNIvE
         7p3qbz6l9jDFx1x+Ml2kheiBqwsMKwdk7OMRs3erlvM5u61F+WJ2ceiWkZvMzIdgwlfG
         mEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766174129; x=1766778929;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DR+goq48ncP0kyKUcb/V8WFR/h7VB4VgBz/yxTaq/Zc=;
        b=s8Rd/CFUHoS9VgYzytTZfjCQlxOccq7lnshMXEbZ1yTErIW90QBMHugmgYH7WDVIw6
         clmueHuYW5b3bGNMGC+ctZZYQX5NrP+xJtMyeWPbq5bHtyhuzHpariV4xVWxks9W1bSo
         CsMnEjW25N7gsIRa0nfyGV3DCCPJ+Iz+7rbY/xq0DrMsMwIbqWrqA3DuyLN38d3lkaOA
         AuhzCAWOxeMCh2BjZEPn9kkYEu/h+IaeZLjHwM4+/1td0m286grNsyWnNNy0kNj45KO2
         Bt7+yRPlHeI55CW+cdxtDqNrP3W/S9ChleQ9OhwwwghuIQhGwNfKVY5eu+gdC7xDmcwY
         uVtg==
X-Forwarded-Encrypted: i=1; AJvYcCUv3aiKlLpNdR2GgmXxk2xxfl2utxNXhN2ajCMsHSVBJ7Hwtj3fLVh4hPPWs2Cah9259MJ5zCxjBQvb@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpd8L8z3h0Bg2Iney+vSt1H0m/XCf1y5c7zWghp/sEE63g1Okp
	lHncZvKq6fmkUZIP6wwmDNkFqMAo9sry3BMMxpBK85QLZDOyPQS/uV/y6I9raC7wErdnRuyXMeb
	2BzCTvOKaS9szqYHxmqaT/4LODLI23dwMXImIXcL9Lx1t5lPCOCKB6GYoOTaaplmF
X-Gm-Gg: AY/fxX5UEwx8GpIte55nhWABH+F666cX8IANcH1bJwQNiO/sgYKrqzzrkYu67CmCKht
	PFHpIyZcIVr1zHA2pEMQZvmxFCBWPn++s99B/2eovcT7dUjA5dG0Ww+BlANq8glSkQjOwOCr6sk
	rm20DnYEJMZnhz1OfkZsqitDRbpdlEq7rUdceug8PO998iApZreNcKKZDsGxcrA/vK6vAEY5vcA
	jXw4mvNct327osxWSR1CYvRMIv1lHV3jp4t5l/vr2M5VUbCtAqpxuTCWsZxKSXx0EgmpzO5db5z
	SP3BFIcPWwi2OmUF3y/d7h3dkcDifSvQ7rPH65ecJYsJch4CBMXc/aE/SbUHNJz0v4hYcixPcRb
	EO8uDCLmYZy5YItHQppfXil3me15yHC5HO1+UkqV+v2gCYJ2DUhVqybMNT9KdO7A=
X-Received: by 2002:a05:7022:f107:b0:119:e56c:18a0 with SMTP id a92af1059eb24-121722a96b8mr2595110c88.8.1766174129068;
        Fri, 19 Dec 2025 11:55:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFIPQYMwvhLfBfiqZDnjFW/42wjmA+ru4F/v6rKUC4LDLauN5YSCGNPOEHvssAU3yQBw+wmzg==
X-Received: by 2002:a05:7022:f107:b0:119:e56c:18a0 with SMTP id a92af1059eb24-121722a96b8mr2595089c88.8.1766174128535;
        Fri, 19 Dec 2025 11:55:28 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b06a046e99sm4544806eec.6.2025.12.19.11.55.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 11:55:28 -0800 (PST)
Message-ID: <890d2434-5435-402b-aa96-7d782b70a6a2@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 12:55:26 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel: MAINTAINERS: Mark the subsystem as Odd Fixes
To: Alex Deucher <alexdeucher@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Mark Brown <broonie@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Lizhi Hou <lizhi.hou@amd.com>,
        Karol Wachowski <karol.wachowski@linux.intel.com>
References: <20251219120559.60710-2-krzysztof.kozlowski@oss.qualcomm.com>
 <CADnq5_ON_u-qZv_rFzOWX+Si=c=8fc1pU2J2fBGmeRd+knhFqg@mail.gmail.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <CADnq5_ON_u-qZv_rFzOWX+Si=c=8fc1pU2J2fBGmeRd+knhFqg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YsIChoYX c=1 sm=1 tr=0 ts=6945adb2 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6x6Zo01ZOMrCJx4ZA8oA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: mEpdnzoLn5TDMa7szuj8UrYkrfKoV1c7
X-Proofpoint-ORIG-GUID: mEpdnzoLn5TDMa7szuj8UrYkrfKoV1c7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDE2NiBTYWx0ZWRfX+ZLyigL+u/kz
 4uQfkiU3H452u05/EiiOpLIlI/ZOyRjm9LOSb8zq/HDoDoe2ETZkIZO4/RsrA86XOz8+FXTMvjI
 aJ4z3GjtGW1haAvbccIp9tCQRAycmleDD1kAva8iT+m2Fk9npaz8OXh2Mjp78WdNsuRNJQzTTE6
 U0UgYY/1QF5nUVlmSIdIjldT8dnifQOOquYZ0wIe4Jo7qibAcG/dwvEdtb0XlX+dLV3fsVyGPhH
 02+MV9Ld+LbGvJ1YmCLjG6tcr5C1DSDAwdzEs2gujnJ8o65EJYCcYl+XzHHJwuvTvN13QO4BSqe
 vhcuSBCewhxPq2VWkKLRyIOaSBtjn1FH1XHLfMlVwrGxOjUmqEcrFF1Kognnszw2PJ02adll274
 cGEadwKTExWAj7BoYiUTBXsDhtRZ4wr7Y57MBdvhpE755YKAM+/sUGGZigJh6uZCmjx159efd06
 2kuTUe7HF4OLaUuKx0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_07,2025-12-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 phishscore=0 clxscore=1011 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190166

On 12/19/2025 11:55 AM, Alex Deucher wrote:
> On Fri, Dec 19, 2025 at 7:16 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com> wrote:
>>
>> The git tree mentioned in MAINTAINERS entry for computer accelerators
>> was not updated for three years (last tag or branch pushed is v6.1-rc1)
>> and is being dropped from linux-next [1], thus should not be considered
>> official maintainer's tree anymore (patches appearing there would not be
>> visible in the linux-next).  Also, there were not so many reviews from
>> its maintainer [2], so it seems this subsystem could use another pair of
>> hands.  Mark it as "Odd Fixes" to indicate that subsystem could use help
>> or is just not that active anymore.
> 
> Would it be better to just fold this into the DRM subsystem entry?

I think in some form, yes. AMD, Intel, and Qualcomm are all long time 
active members of the Accel subsystem, and our updates flow through 
drm-misc. From the Qualcomm perspective, I would be happy working with 
the other members of the community to address the needs of the 
framework. I don't want to speak for my AMD/Intel counterparts, but I 
suspect they feel similarly.  I of course do not intend any offense to 
the newcomers (ARM/Rocket/etc) and welcome their participation as well.

Alternatively I guess I'm volunteering to take over the entry if there 
is a need. It would remain in "Supported" status. I envision using the 
drm-misc tree, assuming all the other stakeholders are in agreement.

-Jeff

