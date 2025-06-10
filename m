Return-Path: <linux-next+bounces-7127-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 42729AD3D34
	for <lists+linux-next@lfdr.de>; Tue, 10 Jun 2025 17:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7EE9176DE2
	for <lists+linux-next@lfdr.de>; Tue, 10 Jun 2025 15:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AE5A2475E8;
	Tue, 10 Jun 2025 15:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E7/7CAy/"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FA2247298
	for <linux-next@vger.kernel.org>; Tue, 10 Jun 2025 15:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749568980; cv=none; b=HtO0p7fblohr/irKWCtSPCbY3WusKv/Hly3vjsFwgWD0XtgLggaoAd9IOvE7IWpHXSnz9OIZ9sCaFPON862gnegE9pAIgUb1BVq5qVW7UF5TuRHPZwADldmNZVCNq3CQvIKbRRs0xftAgj9BJqutqCbjAJ2XNbVn1K22n+xyfbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749568980; c=relaxed/simple;
	bh=ZgS9YhjNsHBJl3Lvr4F9rM8TY19/yblIcAWcsduVrow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NZk9ZmPRPu405fwVMfEJMG/DBfveMnpoChELV1kP8DogsGEKA3e37TckoCdMQtBlMfya4QVfDwuraR6Ihne8izNe4cjF5tmEy+lZqRFmxE2JRYqSUFAje2kZkndGAwvv5jSm+132AVyIHrIsZ46RpoVuJNYU0mDTxIWkKEnVJ0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E7/7CAy/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A9PoLk027404
	for <linux-next@vger.kernel.org>; Tue, 10 Jun 2025 15:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e114YZ488PyX5H8bdxjDah+KG/E0gP9d9huL6plo+H8=; b=E7/7CAy/wq7H5+zD
	WnX8GlFw5fc5XZz1GaHLYnYgQYBlw9d7t/vvCNU7Ata6F2W7hZH0G0VEIhquY2FU
	emqXoMl/Neq2Y2P20jr6UP58GPTSGEQTRyVhBaY40i64cCTKaKjFrJHksSQKQ/nh
	xmeey4Z9nUX7NnAxMu5mXnjcmyyWyz8a6KvpNTZEkc2y4kLsbhsNfJenKcheklFV
	Cct2stKsbtxIFebaJiPoNLcJ/samSt32ueGQbzbctSgy1KWp1/cUVNlu6Gq282+a
	rAE/hFxC+WZtaIK/orhKBpYxaK/7zm1dGI6A6AZsVLuLSV5qt12sqNh8Cjh6ewCF
	0wyToA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d1221dn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Tue, 10 Jun 2025 15:22:57 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7429fc0bfc8so5400555b3a.1
        for <linux-next@vger.kernel.org>; Tue, 10 Jun 2025 08:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749568976; x=1750173776;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e114YZ488PyX5H8bdxjDah+KG/E0gP9d9huL6plo+H8=;
        b=ITRT5Kvtbh7EUMG0+ShJjqcV8iYgKDSqjb87uPHUCOchoPyY5dSvT0gtHvnFSMSJcq
         jy62q1FPs2YD9+sq2lBKclLSJXxxOrZqgvMxyEkFwYB81Pi10vI10bzsnVDp5HfdFZF7
         zY4e4UQdR3AiutFoj8vtwmw8yJtXncrcnrfZN2QQehD3buJlpTDdL3p9UsxJ09gpC+79
         Wwu6Lis7nsr7P5OGldiml4dCwDnkXth3qivuV+q6LNYvMMHPPi1Zr6VKrXnwMVClDtfm
         tIKRZxCuswu9IQlv560B18awAVCBBa3JsaKyRerNNwoQL5yj0wPRGnmgf3a6FuF94uUk
         56Gw==
X-Forwarded-Encrypted: i=1; AJvYcCVkcPiolmvyrq25aoFpJn08Z2umbGpQim4J0vRjeFVfz75HKs9MmbCa5L11Nb/jozJJ6qXQw+o8qd+f@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm9TpoNl9xCQFc+eAf6l5D4yVSbgDJpLZoxkdFbwuxORps2CTg
	tnoEl/iU9DJfhzw/j8mpafm20G+v+FA8IZeM8KXyn/z+zIXskTN0dijp1ax1xeWUiwtokAd+hYP
	aJprg4AirErscsyZLpGrzSls/KpqmQvlXMcGKwCVAQE5S403yoKif6RAe/DRuwF5n2EJ8SS/m
X-Gm-Gg: ASbGncusrobrHeAmcvHPQZ185+f8caeHz95dbm4KHnkBBhCRUdS7uQKUgAi7lgk0aKn
	gQrilg7t0rwLsp53ol7oqg8q0FbEDZb4HtjnD2h1apOw7ecoqFZkxr+LeGq7z0NSryqFZW3V3cM
	GAHMrps96RpceCBVuZQio3YbZKIo4QhgUpsEJJgFR0MpRj9AR5gxB6sUhChIVCag+wUcQEb8Wqp
	CnIe8NUxBaiCblzIipcXHDJ5Wq6BCrsc+NASki8C6AJKUxT7wKpCwpOisKO6RCBjkbg/n12Re2q
	dgKcmLK7IUwKiWbzI1roFbiSjg1pzhH5sB1WTe8x7ToGfwakq8CNweNMOZIaaW4ieteKlpii
X-Received: by 2002:a05:6a20:6a05:b0:21a:cc71:2894 with SMTP id adf61e73a8af0-21f7696b725mr5956499637.17.1749568975817;
        Tue, 10 Jun 2025 08:22:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRW9TAgrPxwCJk/o8eP9DoS0GIWBXXYaSbfoHboYL0uaKLdt5ZmSeDkSVqNYVQEjp5EHKv7w==
X-Received: by 2002:a05:6a20:6a05:b0:21a:cc71:2894 with SMTP id adf61e73a8af0-21f7696b725mr5956462637.17.1749568975426;
        Tue, 10 Jun 2025 08:22:55 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af7aa6esm7780346b3a.59.2025.06.10.08.22.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 08:22:55 -0700 (PDT)
Message-ID: <c0bea584-10d1-4afa-a80d-594179f3a734@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 09:22:53 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: semantic conflict between the drm-misc tree and
 Linus' tree
To: Lukas Wunner <lukas@wunner.de>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
        Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Krzysztof Wilczy??ski <kwilczynski@kernel.org>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250610124809.1e1ff0cd@canb.auug.org.au>
 <aEeqkw670ZcuDdZO@wunner.de>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <aEeqkw670ZcuDdZO@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uEXkIHqtA3yb2CHiVMukQ0OXD9oN4IXJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDEyMyBTYWx0ZWRfX9DjL8XNT/scQ
 pXuZiVrySSlGMXLQBBFGyleNysaIG/p1sO6CUhRnyQrwhG8ZPNXsXLqJeY4XvyI05JVy2EitOVH
 JFc+1ZoRMzVCEuR0O+awJya/4VADeIR1UBbsfOL2mcWcjfaBFak7YnX5xkOclq7bOKULPnoJrhf
 uQgPd68yTx6IV/Nqwcce35BO04J68oCTpAaG3BE6nPJYFvFOo9qXORFeVxDyhx/ZqY/M4/LPhfJ
 mE9WwCxa44JbHNj6UQfiKxW0akurWKMDAWKF3vqSDF3O9CO4G5Mn9+Em7dJh8EjEqUSuLtqL7qC
 9YdJQ6kflgyrAPgV+xMXF/uRYyqDMkyHCzqS4DV6M/YMthF/xYb1VXlvBvnd77zYRMgN4oteP8T
 TjLUyN5Fu6KKnqzS15f16zrvqqbDeupO7fy2+wQx3mpZauAJHLcueQ8svs9HFaQTaVIKPZkr
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=68484dd1 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=Ho3n10bA_UD04d3nvKkA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: uEXkIHqtA3yb2CHiVMukQ0OXD9oN4IXJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 clxscore=1011 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100123

On 6/9/2025 9:46 PM, Lukas Wunner wrote:
> On Tue, Jun 10, 2025 at 12:48:09PM +1000, Stephen Rothwell wrote:
>> After merging the drm-misc tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> drivers/accel/qaic/qaic_ras.c: In function 'decode_ras_msg':
>> drivers/accel/qaic/qaic_ras.c:325:17: error: implicit declaration of function 'pci_printk'; did you mean 'pci_intx'? [-Wimplicit-function-declaration]
>>    325 |                 pci_printk(level, qdev->pdev, "RAS event.\nClass:%s\nDescription:%s %s %s\nError Threshold for this report %d\nSyndrome:\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n",
>>        |                 ^~~~~~~~~~
>>        |                 pci_intx
>>
>> Caused by commit
>>
>>    c11a50b170e7 ("accel/qaic: Add Reliability, Accessibility, Serviceability (RAS)")
>>
>> interacting with commit
>>
>>    1c8a0ed2043c ("PCI: Remove unused pci_printk()")
>>
>> from Linus' tree (in v6.16-rc1).
>>
>> As a fix up patch would be a bit of a mess, I have used the drm-misc
>> tree from next-20250606 for today.
> 
> The simplest fix is to use dev_printk() and replace qdev->pdev with
> &qdev->pdev->dev.

Ick. I agree, this is the quick fix. I'll implement it and try to get 
-next unblocked ASAP.

> The PCI core already contains one occurrence of dev_printk() in
> drivers/pci/tlp.c (introduced this cycle - 82013ff394ea).
> 
> Additionally drivers/pci/aer.c goes so far as to define a custom
> aer_printk() for lack of a pci_printk().
> 
> drivers/pci/controller/dwc/pcie-tegra194.c contains further
> occurrences of dev_printk() which could use pci_printk() instead.
> 
> Those occurrences suggest that the removal of pci_printk() was
> perhaps uncalled for.
> 
> Thanks,
> 
> Lukas


