Return-Path: <linux-next+bounces-6187-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EA8A81225
	for <lists+linux-next@lfdr.de>; Tue,  8 Apr 2025 18:23:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1BFB188FBC5
	for <lists+linux-next@lfdr.de>; Tue,  8 Apr 2025 16:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED103155330;
	Tue,  8 Apr 2025 16:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pr/2o+T2"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561BD1FBCB5
	for <linux-next@vger.kernel.org>; Tue,  8 Apr 2025 16:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744129047; cv=none; b=Tv05IatEbuuj3dfbnZJtb0sOZukfUev9tRqRYGVVc8tuMyynsqjnD3JlKBiEY7jHN6D+pBumGJy5wmTQRQmYAMDMf/Jnd2PJW2i6klZiwjNRetS3orEQCZYvrfh7o/pvAIvJ4gVso5D0EwAMcCIIIKlxAECFOLqulS+g45M1e6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744129047; c=relaxed/simple;
	bh=18Jdjy1lIDqxR48lbXfj7ebOVzAt1zWbyiJblhbXmrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ethgUo7CGoTVPznpjqycT/MQnRqXqMo8j/0o0ITRYvQVO3kMeNsEIBSkBqowoBjAnvu1iCz8X81PWXYIhlT3WnsvTua3WSRRavIL0meMxVYJEJxTjTxzi4H/piew36amJxKVJEuexmuYQXR3u/2QdCOZhc2yHNIaNkmNTjScW9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pr/2o+T2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538AsOIs015077
	for <linux-next@vger.kernel.org>; Tue, 8 Apr 2025 16:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	18Jdjy1lIDqxR48lbXfj7ebOVzAt1zWbyiJblhbXmrg=; b=Pr/2o+T2AJWIANUB
	hjsOWEzg+ENYbQZivXpM2TYLiXT/RVIy29I+nHMncuoSHYwGtXhWebERD/e7u6Bs
	RV+nPlUUZRrD1Ie7VtOaakDn6ukjL62/jEFprIlXCeHp952Ew2yUubGvEuEd8eZc
	5TJSBf5lTkEz+3rwjNDUPob723OXg+iKFVcEZk9XOpyvPQvyzf9HMAkQlOhi/YOs
	VZ11asVQT1G34crFy08214QgV0EK9b281mc708FV6GaxwcCAsFEx4enhRtZwg2zD
	7BVRMxqSFnkGcwTvuw8T8PVmdFfdpNOUsrwIfmPyzgmfUf3ICJddVVMAT46aFBqz
	h/LKlQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbugebs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Tue, 08 Apr 2025 16:17:25 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7375e2642b4so4229588b3a.2
        for <linux-next@vger.kernel.org>; Tue, 08 Apr 2025 09:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744129044; x=1744733844;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=18Jdjy1lIDqxR48lbXfj7ebOVzAt1zWbyiJblhbXmrg=;
        b=IMkcg7RfDkpoVFdtSLMcRfyioD5zKTlrSBdrzDCBXN52BP774JCS6Ot7FPm64Z5r2m
         QcwOnlQHrUKRYJU0813SnTRVQU02I2wcBhhaqc6w8bvCrlbLqrNBTSR2zYa9O2CNDN0I
         6kCBM4k3AO7xpgiJiEK41VAvPwLSgYg8AdPzYKrWlPc1DGIKvsD77+Ak88K2zPj7LvcV
         X+xAqMieTa4X3ILEj+G/Zkzj/Vd/hoSpOcQLWCIGhaVxyxjHwObdpLoo+cdzk2doD47G
         VeidDJRZG6mJfsdVj4ZIepxghIudCA7d5MSaCISaAIFqeCPY+EkFaAOaVC56b5OLD0Mw
         /jSg==
X-Forwarded-Encrypted: i=1; AJvYcCVDAHU4Ni8j4jIH7zHvtMs/WlklWw7nGJmk/LhqpPtK7ICypdIqc0pAH9xlPPm7JEDg425mWd4vSUUC@vger.kernel.org
X-Gm-Message-State: AOJu0YztEfbHlZO76qanzC/Du+ZeIBbfgGhE3CBZIYoWfhXoWTHfb0P1
	P7solcF8eZe23fN1kZ717xWud0OFtZjjvCcolp/TUkV/MBWlAN8xAtt0QdCvNNqpuqTTu5Xp6kC
	pniT3SzOTw2pK5CsctRF+RMfZ0pFeYW6jyWDP4mqkndsXn9vFVcNE9R70k2LP
X-Gm-Gg: ASbGncuhMFib17OjI4fUkUOZblqKoHOyotZP0rRH8dfrHOAYibG+xTjJ+gt5Gr4796c
	h4eSHRJ4HFrDGkp9lx0eYqFRBpUnf55gS0/YD/eP1nmfngacb1rHXJLXW2834diW1USLCH6GwwE
	FfKeveMKgvYUObkfqJb1V+xfZ9ZkH5CVDZUZULFZlSpHV8lYMC0xIi7ZO8HRYuCIqFJ0hTn7FTU
	M/ArxVHRVEbMWjHumlQ1/ZDj0Gopme9J30TmYGKmgiBSUH7fhh6FwCZphzL25B0DU3T9Z9k/JRB
	KzpQixe5lGmDYEwoLTMYFl5p949JQCzlQPz/9JlMQjdRnh7so0KkLmjKjjHbwSmrR1aCS3g=
X-Received: by 2002:a05:6a00:1411:b0:730:927c:d451 with SMTP id d2e1a72fcca58-739e4c0ccc3mr24526633b3a.20.1744129044316;
        Tue, 08 Apr 2025 09:17:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJZdKS/o6NN6Q4KWocquKtvYVNzy+D0M8LQwJcJbyDtel4rJpvz67ulbdOI7/T5HoHSsQK+Q==
X-Received: by 2002:a05:6a00:1411:b0:730:927c:d451 with SMTP id d2e1a72fcca58-739e4c0ccc3mr24526570b3a.20.1744129043635;
        Tue, 08 Apr 2025 09:17:23 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97ee6besm11119301b3a.54.2025.04.08.09.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 09:17:23 -0700 (PDT)
Message-ID: <4ae387b2-0dd7-413b-b66c-1f136455e23f@oss.qualcomm.com>
Date: Tue, 8 Apr 2025 09:17:21 -0700
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
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Balamurugan S <quic_bselvara@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
References: <20250408105146.459dfcf5@canb.auug.org.au>
 <Z_R2lEVjqn2Y3_sP@gallifrey> <20250408113747.3a10275a@canb.auug.org.au>
 <26cafcbb-6a94-40ab-aabf-3c9943cfb925@oss.qualcomm.com>
 <ee51a503-6580-4f46-aa38-77f1b9ba6535@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ee51a503-6580-4f46-aa38-77f1b9ba6535@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: krd0nAAnAjAQCKHrIfmjTgI02OLB4zhy
X-Proofpoint-ORIG-GUID: krd0nAAnAjAQCKHrIfmjTgI02OLB4zhy
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f54c15 cx=c_pps a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=vn2k7iJgzrTi_hPdtGYA:9 a=QEXdDO2ut3YA:10
 a=-FEs8UIgK8oA:10 a=VxAk22fqlfwA:10 a=IoOABgeZipijB_acs4fv:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_06,2025-04-08_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=487 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504080111

On 4/8/2025 8:23 AM, Jeff Johnson wrote:
> NM. Since the timer_delete_sync() API is already in my tree I can make a
> one-off patch for this.

please review https://msgid.link/20250408-timer_delete_sync-v1-1-4dcb22f71083@oss.qualcomm.com

I'll wait a bit for any tags to accumulate before I merge into ath-next

/jeff

