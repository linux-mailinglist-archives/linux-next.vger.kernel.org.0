Return-Path: <linux-next+bounces-6185-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E780A80F70
	for <lists+linux-next@lfdr.de>; Tue,  8 Apr 2025 17:13:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45FF617D84B
	for <lists+linux-next@lfdr.de>; Tue,  8 Apr 2025 15:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8991722A4F2;
	Tue,  8 Apr 2025 15:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kcWlkfMA"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A6E1A314B
	for <linux-next@vger.kernel.org>; Tue,  8 Apr 2025 15:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744124953; cv=none; b=EfczJBSjQw2GTr8o1SAp9/bBp1ii+85yTn5bHiNGNpX6rka5j6CCIQczZ/5rWx9Q7xdCcBUe1i+klNvnwP9yhe3QaZDQbnAx7MJWtshJedQXIJUy1kpKzciLaBzwq1EMu4lQnW3mJb2B2crNCvlo7eTqRpYYCOkCtK8QepR9zdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744124953; c=relaxed/simple;
	bh=DPtNxNE+awhfgbfCzrEemVYPnMctjJbIu3cTdoxmhmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZK958p/VXWob8Y/jPm2T9UvMD6FS0v8g0FoNRCnP9mYE5oYqWfZxmXrxahk6k/DJb0czRhGLWvvaXk4uIVFq6Eb8tnTjD0aNr8oAXf6csbW0HI/Qe0Ka2lheLXicYrrvuo5cgrvlV0xDDzrJ3PGrYc7JKRUSI1dxIwG/kqhIUNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kcWlkfMA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538Bc9gR020149
	for <linux-next@vger.kernel.org>; Tue, 8 Apr 2025 15:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pctFuou7K6UODLPKxKTgI/jveEjfklrGVfRqNLl+hro=; b=kcWlkfMAIyTvGUK2
	O78nkAl7Eb6+80JcljLlCLB9xTnZRvYCnbpJcQ2jIYgUQ7miDpf5v0JUizGurTiO
	0+R7mVlR21PvylbpxztvklnLCxeTAG1MwWrcSs0J5SGqBSQSrYhq9GOcfurK28Kq
	VOPdo3WwtY1lc+ZxbYyJZqO7M/vnll9klrFQSkTuTIxLkD7u80EvHtsFl+1sxbqM
	We9/mPsmkgMomHtqo+BMVSC0HqYAVo0K//7oA5cf48jZFgFjTjaNh8gUDJopCbLb
	rCJXhG5ZgHD1SQsMFx9SJ7g4UIikkkIRi4hHwsRj2jZW32lZCR0hW6iMaiwZ+APK
	7uRy+w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2r6e8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Tue, 08 Apr 2025 15:09:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2254bdd4982so81486065ad.1
        for <linux-next@vger.kernel.org>; Tue, 08 Apr 2025 08:09:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744124950; x=1744729750;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pctFuou7K6UODLPKxKTgI/jveEjfklrGVfRqNLl+hro=;
        b=V/eOfoPustUVn+QdkRGlM/nwfUlsTPzUTESMV5muM+S+poG0xgiQf+F07EdIrPOiXW
         R6Qo8NnNtL6/PpSBM8p4/7+xC5NQCiZfczv2iwce+0NSeJ5F+lU/9+WA0zJUGaVakSFO
         dP2mEbsrFCup2P0QV40UTS8hbFJGNiXLFGguWj4/VcroBmi7dqEX5CvtlJJiSLMPpfof
         ASs2Lc/x9eD2zt0prdsfE4QMMqQdmCgXyCYbA5SffI4Y7Uak5+pwVfCUQnZvNKaWnKSj
         4lIkCBSPar2SXWEIdGkOPzHCsAdEd7XcJCX+V1CFo7ycYcRlVfM3mwdoUXXA+baUJePD
         Bq1g==
X-Forwarded-Encrypted: i=1; AJvYcCVulLY49lCat583EFHS0W3qEGFIHkKYZwY3Qpj1KzZjEQMcdHk9Gug88vaQ2Yk/upTE9F7+fiqP+5ub@vger.kernel.org
X-Gm-Message-State: AOJu0YyzmgIR0jHQAvIYQXWDXjrlNTEUIMw3ThSVDkFUGqDhW/cXSxqD
	0lHL8Yttn6XX6Gx0hoYDlkNuzp9HHNS5j2epqVnBoUxl62h41akbLLtHdKCf0/frTGZALg0pr52
	Y/3fOu1O0gaIiR0U0oYfXt1cRnUQalUKF+A4XpRJ7Lry4okpOSp8nyNQPg9Wk9dzYT7hb
X-Gm-Gg: ASbGncsOgR7ychndCCCyTNctfECjzM7AaASDaPXsJ14EsQIt0YvhXlqi7EX43bLvSbL
	p/p7mg1Yppo545GSad9obMJCvXjEDr3uWtJkSV+BXgZ6UINENi7LVLilb8/g/c+3hRpIIsWXjom
	/ARe8OBc8vPU/Lxvnj08EhLsQhBmYjCkKR6kGRFxJDlhXdpSJtdg6vA5Wgapb1MeYJuFwK088nd
	O5k0fVN0wmlB7PqrKiaS5HBI5wxEorT/VkExuILIdNYa3TKDdKb+4WgDf6J+gPjwZ6+lAhcUEHe
	vxZ4zQElLYFY7AUdSAkXwfAlCOcp27NIgEO2fyj9Z6k8DGoHWbuB0kBrd4WR+hWkfC/rMX0=
X-Received: by 2002:a17:903:19c4:b0:216:3d72:1712 with SMTP id d9443c01a7336-22a95587be7mr216673035ad.48.1744124949504;
        Tue, 08 Apr 2025 08:09:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNrtrSw2E1SAGUq7CqH0A6kBJG37r/+rnOESKXQy0U2GuSemu5naPzR5orh59B/fwt9z1wGQ==
X-Received: by 2002:a17:903:19c4:b0:216:3d72:1712 with SMTP id d9443c01a7336-22a95587be7mr216672525ad.48.1744124949072;
        Tue, 08 Apr 2025 08:09:09 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866eca9sm101503035ad.170.2025.04.08.08.09.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 08:09:08 -0700 (PDT)
Message-ID: <26cafcbb-6a94-40ab-aabf-3c9943cfb925@oss.qualcomm.com>
Date: Tue, 8 Apr 2025 08:09:05 -0700
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
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250408113747.3a10275a@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aPBtq-K6FTcvqDGiBA4Pdx844v_yEr8M
X-Proofpoint-GUID: aPBtq-K6FTcvqDGiBA4Pdx844v_yEr8M
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f53c17 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=3WJfbomfAAAA:8 a=rOUgymgbAAAA:8 a=4uOVVYVnsCJchGKozvwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=1cNuO-ABBywtgFSQhe9S:22 a=MP9ZtiD8KjrkvI0BhSjB:22 a=IwZ_ZZASwsaSaAdrsfNp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_06,2025-04-08_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=908 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080105

On 4/7/2025 6:37 PM, Stephen Rothwell wrote:
> Hi Dave,
> 
> On Tue, 8 Apr 2025 01:06:28 +0000 "Dr. David Alan Gilbert" <linux@treblig.org> wrote:
>>
>> * Stephen Rothwell (sfr@canb.auug.org.au) wrote:
>>>
>>> After merging the ath-next tree, today's linux-next build (x86_64
>>> allmodconfig) failed like this:
>>>
>>> drivers/net/wireless/ath/ath12k/ahb.c: In function 'ath12k_ahb_stop':
>>> drivers/net/wireless/ath/ath12k/ahb.c:337:9: error: implicit declaration of function 'del_timer_sync'; did you mean 'dev_mc_sync'? [-Wimplicit-function-declaration]
>>>   337 |         del_timer_sync(&ab->rx_replenish_retry);
>>>       |         ^~~~~~~~~~~~~~
>>>       |         dev_mc_sync
>>>
>>> Caused by commit
>>>
>>>   6cee30f0da75 ("wifi: ath12k: add AHB driver support for IPQ5332")
>>>
>>> I have used the ath-next tree from next-20250407 for today.  
>>
>> I guess a clash with the recent:
>> Fixes: 8fa7292fee5c ("treewide: Switch/rename to timer_delete[_sync]()")
> 
> I will try that out tomorrow.

Yes, looks like you'll need to carry a patch:
s/del_timer_sync/timer_delete_sync/

Until that renaming patch makes it down to my tree and we rename.




