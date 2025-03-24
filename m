Return-Path: <linux-next+bounces-5980-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F57A6E1B0
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 18:55:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 221253BCDCA
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 17:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7DC426739B;
	Mon, 24 Mar 2025 17:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bOTqhXZA"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB38A264A88
	for <linux-next@vger.kernel.org>; Mon, 24 Mar 2025 17:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742838054; cv=none; b=Dd1cmY4KTGIbUzqjbh8khwHZ4WlAZvY4DoMR7621s0XgllEsbxpOD4HamncMuK7Om4qsNOV64/4oraAEKQp+3fu4avBg+8IroBanWcYBb47DajTGGJRER4mSXJRcU477Rb78Zm65qTTJcInU/si0HeEU25hjLDAR414fIXBO/iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742838054; c=relaxed/simple;
	bh=GExsqTP5bLJ+U3udmB4ZWQUf83n8CResj8PDLQiXC7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tgDPJ4wepV5rybSqAcnN+yN4OGJm1T/zjxhcOLsoEfaep4G+xY0W+erQrFkVO+uW3QoYLHbXgQD0nhof8/sbly19lpWXZA94heQhe9Ky0DjAsi3j9iCHMPPEMkSQIVC77aVbLbA+m0mdElGGEPz365RdDXki84BXoxxYVPnaxK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bOTqhXZA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O9PMFO004754
	for <linux-next@vger.kernel.org>; Mon, 24 Mar 2025 17:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ky3lpKk/27DWJKFcnCrWLdeANM6vCO/gYaNrc/f6Yi0=; b=bOTqhXZAxIqwVQKF
	ce4vtv+BRFYtzCEs4IPgF1f6qdhIt9bjWkywGBcCxnscfoyA6pjbUdYMgffbSSvh
	0XWyCKlLGYyylHBC7q4tId8HIawbR+i7dJHHls2tCbuFRUmP7CUMXoZqwhNhg/k3
	GluZNYLKFXRbPn8RE2hncHrRf2GKKqrVAQ4sjhwhi5UYgVcx4FS1jsP5VklpDamT
	XxXGNZh2HNLLxhADuhOHQe4f7GwrH/lffYs8LZcMBfduFMVxQ1kaj5KaLjRDRGr/
	TJUD5o+yly5Z5oEsL1Pra/vmE/nTo73lpxI1e5NjWh+n62U8HsoGzcBf0J3dBE5B
	HsA2vg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hm79n8de-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Mon, 24 Mar 2025 17:40:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-225505d1ca5so73985965ad.2
        for <linux-next@vger.kernel.org>; Mon, 24 Mar 2025 10:40:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742838029; x=1743442829;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ky3lpKk/27DWJKFcnCrWLdeANM6vCO/gYaNrc/f6Yi0=;
        b=rWtIkjJJX4Re8tXiAgKhxdJAMYahIszpCGiHKc1+NTUNcvWJedYCS00pxJwRzToAJH
         u5FNZFXIP46iTeaI6ley4XU0FdKXxeETeAsNCMO7UrmMa6ja/QmxMVMhGDWt8ZUqT8k0
         h3TSJq3uhHa1+TlnY4gIklLSTMLVz7okYk66uqH2fCdMbae3tgKtLhwnyNqpoEDZvnd+
         I7orfP4htexULysiR66pqrm4FJmlWybxa6m8IxX6jmdS6Todmuv04Pc2Dk3OWC1puzq2
         XZRNDZ9Pj5O+XmIbcbx0ak8Rqbxp7sIYAO5kRjZ5R2VkHK/1sOfFFr1RPgD+BKvTuptw
         qweA==
X-Forwarded-Encrypted: i=1; AJvYcCWnbCQMWhKI3VJeyUPl9fsp8R0ZDxa6Yxq2Pyh/AXfdpD3T8hmEB/iz/wPZX5gc+vkS5EptYMSlu+Fe@vger.kernel.org
X-Gm-Message-State: AOJu0Yy03WY9Ik54wEXg3vScidOP/TKmo0BVmmbUv1Syksmr3jiXqYpw
	rdoyz5sMLYVMkTDOv/GVI+FTOrebSFiOc+PVWzG5C4EGdnlH64BFfqCLw0UHMBIaIvlOr79MfzJ
	1EN+ArwCsCFWcATmr0wue7roPAVuyfdH90nRbgZrlXCrmqdi+wFubZVo1bYFsNvdsr5mF
X-Gm-Gg: ASbGnctoF2TBgxBU9n4fBtAVzkRDxllMWB/KgOq8qlKiVeEhbCdin/vcMnc3ceNGxrh
	OseMw+zzn6OmgfuOq7pvGZWWux7+TqzzlW+Ffy8TvCNzHGg5oBthj0PhOqgKC/tdFg1LRfubN7f
	htC4worMx0eFyKUWCYfv516hrHqvn5xyEuofWVOF/3UE+Az7rzkIf2hD4ZLRk8Ks4Jmo68Rg0lX
	i8O5vhvbXXZ3yHaNPHBVzMSMDTHDtKYUbxI5blFjFLR3bKp9pQqNqYQ3UFNut+IfOpOc9y52HMj
	dD6oNHwsbPiFrqjwQPU+Y+sRHaDYKxX4lf2OMR0H5/ePxi+xgK//64/6XeCE3RJHVo4yaAw=
X-Received: by 2002:a05:6a20:2585:b0:1f5:7eb5:72c7 with SMTP id adf61e73a8af0-1fe4300f7d1mr22409115637.29.1742838028973;
        Mon, 24 Mar 2025 10:40:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5oX8dTPG7ZC/grxFyBcsgx+ra9S9lw3KDuIrotZWq/1lAVLboQBF+jfRGO9uzwcJKAsNMeQ==
X-Received: by 2002:a05:6a20:2585:b0:1f5:7eb5:72c7 with SMTP id adf61e73a8af0-1fe4300f7d1mr22409079637.29.1742838028460;
        Mon, 24 Mar 2025 10:40:28 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390618efdbsm8559210b3a.178.2025.03.24.10.40.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 10:40:28 -0700 (PDT)
Message-ID: <13fc00da-3dcc-42bc-b5b7-0bce9739ffc9@oss.qualcomm.com>
Date: Mon, 24 Mar 2025 10:40:25 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the kbuild tree
To: Arnd Bergmann <arnd@arndb.de>, Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc: Oliver Glitta <glittao@gmail.com>,
        Alessandro Carminati <acarmina@redhat.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-next <linux-next@vger.kernel.org>
References: <20250324103048.3d8230f9@canb.auug.org.au>
 <9faf14a1-ba47-46bf-9ddb-629782b8b52d@oss.qualcomm.com>
 <5d58bda3-4f6f-435e-962d-a8a5724112f5@app.fastmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <5d58bda3-4f6f-435e-962d-a8a5724112f5@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: q5MJnGhR1cOaAyTI8T_HkT6_EVTvgPx9
X-Proofpoint-ORIG-GUID: q5MJnGhR1cOaAyTI8T_HkT6_EVTvgPx9
X-Authority-Analysis: v=2.4 cv=IKYCChvG c=1 sm=1 tr=0 ts=67e19922 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=wx1vDGlhu_UX7bQBBhoA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_06,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 mlxlogscore=837 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240127

On 3/24/2025 10:37 AM, Arnd Bergmann wrote:
> On Mon, Mar 24, 2025, at 14:52, Jeff Johnson wrote:
>> On 3/23/2025 4:30 PM, Stephen Rothwell wrote:
>>>
>>> I have temporarily reverted the latter commit until the former are
>>> fixed up.
>>>
>>
>> +Arnd, will you post your changes for these?
> 
> I have sent out the last 10 module description patches
> I had in my tree now.
> 
>       Arnd

Thanks, Arnd!

