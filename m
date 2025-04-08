Return-Path: <linux-next+bounces-6186-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B410FA80FE8
	for <lists+linux-next@lfdr.de>; Tue,  8 Apr 2025 17:27:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 525AB7B05EF
	for <lists+linux-next@lfdr.de>; Tue,  8 Apr 2025 15:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5130122D4DD;
	Tue,  8 Apr 2025 15:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GV9cJy5/"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51DE1E9B16
	for <linux-next@vger.kernel.org>; Tue,  8 Apr 2025 15:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744125819; cv=none; b=BsGCFQgJM3LlM1UfaDicbOr5/QzVpo5DZcoAJok0O+HyhC8SmCcrOGuXOB9pUHpQhpSMcV1IPO/ry4Ow9BDTcGBpDpWPn/wpFffndxBL8VsQNZuaFZvZBkHXsRyew8iUm98nXPXVHHDwsovAcyxpUx8WTtkGURdvOQIbxCWJ1WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744125819; c=relaxed/simple;
	bh=aBGY5VnvleP+F8vMPlH07gsy/nK8dijdNvQCx5soGGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K8mTE461AXoheUKOaR7qL+xJ9PJEcE9nfFs7juSp1D1BuZy4YVNGKJ6yG2/RLlPwnex6MlDxlYXzNCkeneBaicWJKzj8WuHA+COb3cUSCE/PV2YyyThBZsX4abk9EpRrNd/SfsNszsnLUY8LhFJDj/VinAzCP5s/GDfjyP+kMb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GV9cJy5/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538Atnew027883
	for <linux-next@vger.kernel.org>; Tue, 8 Apr 2025 15:23:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NF2u+J3xRv/jYqarjPk3YREaPbF9uPD/ZqubOMJkE28=; b=GV9cJy5/gv6dXktH
	iTr4SZT3ZHPLPkuMcdGhP8TuBaGTFXPtOFpuO4Mhc8X7iIgaxHilf+ABS7c8Zuo4
	+vbZVjbk2UcHQ5QXNdfdRdB3AdIcCUWCZs4N2EBb+7aZn3A3OBGbG646ey8CC9yd
	lwUKwHJG49gWfRufKqA0iigzViGeh8AeoFuicgW27VDebTZQfMmQMS7pMF47f471
	zttAXcpSt8Y0MWYpreM7KYGS7r0CMPEOi4W4PA5yeu5lz97fwwsbtg0ac46DyOUj
	ZOErYeuyoXIrpb/Oo6iMH9LFdBPR0578l1h7xf+H0AyuOx1gnTxigdLdeyjzQ293
	P6IRfg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd008dd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Tue, 08 Apr 2025 15:23:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22650077995so83360895ad.3
        for <linux-next@vger.kernel.org>; Tue, 08 Apr 2025 08:23:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744125815; x=1744730615;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NF2u+J3xRv/jYqarjPk3YREaPbF9uPD/ZqubOMJkE28=;
        b=Ax3RRGrZVOc8BPnzc8DN454qAAqZlzWBkZAv0nQiGOE2uthddBcXizwHBEoLwDrL/D
         87G3DyZuPYEjJpmTTVAV/12wJino16XSbd3nL5Mt269z9qqSnT8qgTS25YWq/5kNcyhI
         BvVkUCmgjyMwSbUURciVLqDtoym2om6Xk/vr0JyDHhvDhyJMy4tz6mjWJHF5pvkfoHkI
         3FnretXQGTbKuVPl8R7kA77ClIhCLxlx7elxg5ffeE637wBwptbqiH4WlH3SesPPka5I
         biZNjTzdv3UiHia4qLj9iB+Bu2Vieube4Mg05Sr40iCmqLSJF+uNdUwDcNVIFhq1Hpjk
         4v1Q==
X-Forwarded-Encrypted: i=1; AJvYcCX8pRBIrFVnAtqIc5KWBPTC9ML/vGbKCXXbGa15KyAdj3BpNsI101pROOPQc3PeWD9pLV0b7r7zmqEU@vger.kernel.org
X-Gm-Message-State: AOJu0YyviVT464RGy18eXMKgBCjltGMCrcrt2+qtEfN5/7DPNgj6MPc8
	BFylirc5ppTFfKdAKkkFzGM9FGLFPTRkFlLvVv8QJvgdFlKQNIFulPGhAbxfQ9Ct6dxnB5kQ/05
	M6rQ48Jv2mqM71V9Uibc9e0jUmAYaLm7qEELDxXb9ZfHdOXbVZxm9A89ZOx9HkLTJPPyo
X-Gm-Gg: ASbGncvZgX7uZn+Hbirk2v8Y/MgTWFFhLT98QKwbEpGjeANznUhwqgxTj7tiT6Apahj
	GC35nbEt4KW0XxIXYqX8HtDLIdqYjjse+pfSFsmeztp1Nm58dYKqhdzPj8JoHl9mdaLI98vf82q
	lM3htPcdz6LXLz6lGZXwgVkg+PGvSIl9dIpJ1c8EXssyVBuo/+AtEUiwq23yaqWSbpYNRjJE7uO
	1uMpAlh/Lx31FF/RIyoGqKPLLdpP0jg6ijpRxigZv/4UqFwDF1eoxzzRyOBtx+wAHXMJwSsGkag
	uiXuQqTvR4Qsx7SOq3xBW5I+Y5qe2mARTBAIJnfZd3t/F8y2Cwdr/u/DltMuTI3MBUYvTeU=
X-Received: by 2002:a17:903:3ba7:b0:215:9642:4d7a with SMTP id d9443c01a7336-22a95428babmr189624775ad.0.1744125814301;
        Tue, 08 Apr 2025 08:23:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrdN25OA1XG8KyNqW7/XlHJMumnbDPU5Qnl4hGT38grG496JV/Pr0d9saQWHGnZ0hfOM5Gfg==
X-Received: by 2002:a17:903:3ba7:b0:215:9642:4d7a with SMTP id d9443c01a7336-22a95428babmr189624405ad.0.1744125813874;
        Tue, 08 Apr 2025 08:23:33 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785ad8f8sm101872065ad.42.2025.04.08.08.23.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 08:23:33 -0700 (PDT)
Message-ID: <ee51a503-6580-4f46-aa38-77f1b9ba6535@oss.qualcomm.com>
Date: Tue, 8 Apr 2025 08:23:31 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the ath-next tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
        "Dr. David Alan Gilbert" <linux@treblig.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Balamurugan S <quic_bselvara@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        Ath10k List <ath10k@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250408105146.459dfcf5@canb.auug.org.au>
 <Z_R2lEVjqn2Y3_sP@gallifrey> <20250408113747.3a10275a@canb.auug.org.au>
 <26cafcbb-6a94-40ab-aabf-3c9943cfb925@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <26cafcbb-6a94-40ab-aabf-3c9943cfb925@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UjqEpbvYHQIxhJOiClWYQF6n8E_zQOC7
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f53f78 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=3WJfbomfAAAA:8 a=rOUgymgbAAAA:8 a=HC-cJF9i_tize61FGOsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=1cNuO-ABBywtgFSQhe9S:22 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-GUID: UjqEpbvYHQIxhJOiClWYQF6n8E_zQOC7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_06,2025-04-08_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=982 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080107

On 4/8/2025 8:09 AM, Jeff Johnson wrote:
> On 4/7/2025 6:37 PM, Stephen Rothwell wrote:
>> Hi Dave,
>>
>> On Tue, 8 Apr 2025 01:06:28 +0000 "Dr. David Alan Gilbert" <linux@treblig.org> wrote:
>>>
>>> * Stephen Rothwell (sfr@canb.auug.org.au) wrote:
>>>>
>>>> After merging the ath-next tree, today's linux-next build (x86_64
>>>> allmodconfig) failed like this:
>>>>
>>>> drivers/net/wireless/ath/ath12k/ahb.c: In function 'ath12k_ahb_stop':
>>>> drivers/net/wireless/ath/ath12k/ahb.c:337:9: error: implicit declaration of function 'del_timer_sync'; did you mean 'dev_mc_sync'? [-Wimplicit-function-declaration]
>>>>   337 |         del_timer_sync(&ab->rx_replenish_retry);
>>>>       |         ^~~~~~~~~~~~~~
>>>>       |         dev_mc_sync
>>>>
>>>> Caused by commit
>>>>
>>>>   6cee30f0da75 ("wifi: ath12k: add AHB driver support for IPQ5332")
>>>>
>>>> I have used the ath-next tree from next-20250407 for today.  
>>>
>>> I guess a clash with the recent:
>>> Fixes: 8fa7292fee5c ("treewide: Switch/rename to timer_delete[_sync]()")
>>
>> I will try that out tomorrow.
> 
> Yes, looks like you'll need to carry a patch:
> s/del_timer_sync/timer_delete_sync/
> 
> Until that renaming patch makes it down to my tree and we rename.

NM. Since the timer_delete_sync() API is already in my tree I can make a
one-off patch for this.

/jeff

