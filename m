Return-Path: <linux-next+bounces-7585-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7858AB07BE2
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 19:18:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D327A7B4C8F
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 17:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 224AA2F5C24;
	Wed, 16 Jul 2025 17:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hPR9P7Vn"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36112F5C43
	for <linux-next@vger.kernel.org>; Wed, 16 Jul 2025 17:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752686310; cv=none; b=DaclCoXYjVfDrAWfp7+J8OSkqSBGbwFY3snY2fabFay7Z0jmkGf/2OC43Xc2bXq1XL0LmofjJyYWRFrRpFqJ5ylKnQDTy9g0Onc3MfPpB9wnuznN4EMS1agLIzCdrQ9IdfZNcr/q3gRgIhOCJTzhihhtCGQjrKRwNcHCkH2XIb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752686310; c=relaxed/simple;
	bh=6RzJT1L60GvhmajeO4pYpV61WuPIfNveFy1ljekZwUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oMkzQ+35PoyMqmMWiI9cUEEq6YNDGtWL5n1tWolgkY7ZnUD97g9KtrhzIv0zrr2hNHz+sOyNraqzza3xNiTEyar3oNGSTA91/afb0q9qb1etrSivJjqtKQSezBNaIbPus7oydVIkRnahKf4WNyAZ2pA2oeGv20TxYWIiB8yM7gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hPR9P7Vn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GGDXYM015650
	for <linux-next@vger.kernel.org>; Wed, 16 Jul 2025 17:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/tMth6o7tHgbIUQxZkR6tUZ2rv+sepU1UeAb/Pu8vhE=; b=hPR9P7VnD6Vfboen
	Oe0xd1Hbb1CL+U8J8zbXW/1QCBNPzds+NcaxleI45fPoewHe81S+KWfBgRSizcxH
	h31zRd6dXlLR/y9Rm/X9XG/mF4YAC/sj3YFRp+4p+vjNhp18YNzx9bvF/iqPnMik
	Ir3mQBdU6YFs+8JXvPZAJCglt7cY6IpMy45ButNyHot1hj5ldKfMLXbg+MgBIb0b
	DQClV5cw5FosXR/mwchmdNA7PYTmjwNIrr/QfJpOvPxBKe/Ib1TYRrOc9CJkkh6b
	Hm10V8eIPtpcTZxaskQCLL6LZV6yWsvU9cpzQiy2qpR94snWFQAbWNSOm1kKJAoe
	9cxjfw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dyqrn1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Wed, 16 Jul 2025 17:18:23 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b38d8ee46a5so93928a12.1
        for <linux-next@vger.kernel.org>; Wed, 16 Jul 2025 10:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752686303; x=1753291103;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/tMth6o7tHgbIUQxZkR6tUZ2rv+sepU1UeAb/Pu8vhE=;
        b=KrFeoGM7hTL8DC/47iyPTfNk4ERZAZgoZtDdxk/sSQD+0g4fJUgi0jWrVvqCOaRtpt
         XazpIDjAuU5fySScw/LFPO12ApS+NvazHyicbqLfHkknfmrzUfLG/K8l3gCrrhyh6T6E
         850qNLXhD8SS8JXoj1A9CmZl+p2xaqkJwIlIu9ENqD3LYnVoZeunuctQwC/ZnmKaqK4o
         YdnzqNFw/vOIMt+Gm1Dn/STSho3Y+cKTdoT903chMy+B48ULNxODOhJNyDidznRmyCEj
         PRggqAv5eF4Wma2K3HUi0dDaSOTXtc2B2EicqnQkndg3JvjEADDFWQIMjA59x1dFghU5
         +4iA==
X-Forwarded-Encrypted: i=1; AJvYcCUnRaVRVaQXsgRS808ViokuNzjKAE5tr4tT6MYKShDBVUhJM+3cbMCbI6HBqckXiu6nQqhSvap6qZ+8@vger.kernel.org
X-Gm-Message-State: AOJu0YyKwbPCOsyqbQSunVf5H/TOAhNOWuVM5k5IWbm8YCx9mt2pTWOp
	Jin47Ny02QtzTSS6uSN5vEN95dAoCz6yiUusw9lm9hWlafiu3gZRKFrZ7lKr8f+Ilu3+D+M5w2c
	fNcJFMRehMHIHnaKqOpFscWDaGf8l4sHdLLQmCe/uLKfOOpNAzTLPRIlnPCwD1alv
X-Gm-Gg: ASbGncsqg9rV0Fcou10xt1nncUcJwzzHnAkpoApDE7kX1XXKqdl2KRDNPt0EpBgLTvG
	LpQKOhB6p84KeO8XsI5V7gpTlnBGxyIxBccExMb1QW6hX3QqjoD6YjaR0z32c39n5kWB2X7yue0
	akPqOgdCoYonkkOo8DShbnIb1JX7/5WuzNUmKUnr70CA1lShYiPHq7Sg9xmyeNqdjxdR1JC1I5i
	c4u60qrGE6mbQkIsoYuzI8olh4fmyICrtvUuDrSXBsB5YyzeCj02wf+Mvs7nwb+Mgq8B5uaUQK5
	3kosMTqa2mp9uyuPIR5SWkU3FR3yDCBBhyXvjNAnfDMQ89e04PPNcRmxyCBa/zIWWMkfF92LgsJ
	6jqB96zk90uc2CJff7ZE=
X-Received: by 2002:a05:6a20:1584:b0:234:e109:6bdf with SMTP id adf61e73a8af0-2390c56e8bbmr294954637.19.1752686303015;
        Wed, 16 Jul 2025 10:18:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF56y5nV1rAeM2TuaaRxByMhD0eKi4TFlVWOHGMOxWKdeVyu82Dt3msTx7dIP/gme5crNDFgg==
X-Received: by 2002:a05:6a20:1584:b0:234:e109:6bdf with SMTP id adf61e73a8af0-2390c56e8bbmr294908637.19.1752686302511;
        Wed, 16 Jul 2025 10:18:22 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe345f2esm13991621a12.0.2025.07.16.10.18.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 10:18:22 -0700 (PDT)
Message-ID: <3dc23475-1c16-435b-9c6d-d2d7996280c4@oss.qualcomm.com>
Date: Wed, 16 Jul 2025 10:18:20 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the wireless-next tree with the
 wireless tree
To: Johannes Berg <johannes@sipsolutions.net>,
        Stephen Rothwell <sfr@canb.auug.org.au>, Kalle Valo <kvalo@kernel.org>
Cc: Wireless <linux-wireless@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Miri Korenblit <miriam.rachel.korenblit@intel.com>,
        Pagadala Yesu Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>
References: <20250716135252.51125baa@canb.auug.org.au>
 <4ee6758a49e6f01c5e42b2f7c27aff905ac07dfa.camel@sipsolutions.net>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <4ee6758a49e6f01c5e42b2f7c27aff905ac07dfa.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jwrMm7CfeNIm29gZsd7s7ZKgHlgmlg3i
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=6877dee0 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=ULWNt2tdzX7OOLHh:21 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=Swg7eHfTgBCftI4JXWkA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDE1NSBTYWx0ZWRfX3SSjauJXfbHH
 hzRaHUgszpMs58SiBNxyK05XSmIIP9Bu5J1rPG7tqjobez2OgPmn+Wwe+MlvqARZABjyU3ZrscZ
 9i1jSUGIgZj4mhOi95Kg4oqMT4rk/FwJUL1XjxJIjf9aDiFNssRp1CifY0GTsl15KzB8xKtISOk
 KuWpRzDx+SKGZo8ZQhNzUD5BXnxd3wyEyCUJfjfy9DM9JfbqRgBhgT2+3rLcLXjUvb2HbPioqKn
 ZjtjTo4od2XmvjggP8Osm1R8SgtZa5t1zDiUpcVvKr9z27wqMTcBB4YJZZw6D1Vb738ZWVcJNR9
 DCbww1XBYxMZeN8XSCXe4BgpjpRKXzMylYTKZZlJooOwe0b9NFzxsgQdgAnIZrb5VOwR0YqsExZ
 /eh1xIJuZkCjunQLWAkZE6RPKp7P8x9HNEAiZlEox3FzQsgl18tMAIWj/GZCJGVcbpg6illy
X-Proofpoint-GUID: jwrMm7CfeNIm29gZsd7s7ZKgHlgmlg3i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1011 mlxlogscore=999
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160155

On 7/16/2025 1:59 AM, Johannes Berg wrote:
> On Wed, 2025-07-16 at 13:52 +1000, Stephen Rothwell wrote:
>> Hi all,
>>
>> Today's linux-next merge of the wireless-next tree got conflicts in:
>>
>>   drivers/net/wireless/intel/iwlwifi/fw/regulatory.c
>>   drivers/net/wireless/intel/iwlwifi/mld/regulatory.c
>>
>> between commit:
>>
>>   5fde0fcbd760 ("wifi: iwlwifi: mask reserved bits in chan_state_active_bitmap")
>>
>> from the wireless tree and commit:
>>
>>   ea045a0de3b9 ("wifi: iwlwifi: add support for accepting raw DSM tables by firmware")
>>
>> from the wireless-next tree.
>>
> 
> Thanks for the heads-up.
> 
> I'll double-check, and give Jakub a heads-up, he's probably going to hit
> this, unless I defer the wireless-next pull request. We'll figure it
> out.

I'm planning on sending an ath PR for the 6.17 merge window early next week,
so I hope there will still be one more wireless-next PR.

/jeff

