Return-Path: <linux-next+bounces-5048-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E0BA01F25
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 07:17:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 535D4188495B
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 06:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EF4743AA9;
	Mon,  6 Jan 2025 06:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CFYT6BJM"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FE2522A;
	Mon,  6 Jan 2025 06:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736144230; cv=none; b=fF00Tv2aKkXcDWMoJqUtHEeQR7blfL3sohdABA2Qwf7AtFQUKaj7cH7/i9qAcbbxcYIKQHWtI15fJJf7h4N9o/wk9E9nQlacnEjJ3avJnwJ0P9lsKOsgsroFK3zMEJEXcH+HyKvVjzmgSSp1JHhAl/q61q1RWYQuG9x52gAioX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736144230; c=relaxed/simple;
	bh=pAxcsgLvkayOuCCpWUHV4oWwKGLsVG2C0d/nOa3BY1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hx6XVA5J5Oir1ab8wttEEZTEo1LleMwsA6Nhj73bM6nbowW3oCTQZ/tbm6JLgGO6YjNyowwmwCsCrxtpzMr8iIR6KRL3SMyd1oT3z+kwTZKqeHJZ3HqZTkqA21NzqLyLxd//OaqLkEmkM3Xm2+J8QYqa3scoN9Ydho6j1TKp6EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CFYT6BJM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5063XbJf032611;
	Mon, 6 Jan 2025 06:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vP4qECh25ipOf5AP/uGm+CqjGh6jblrERb8Kmm0+lLo=; b=CFYT6BJMsY8N8oVa
	OaNMFNt6sXeeHqGpmlootBG3Z9peZ/7elo92JeWlviKW3Rn1c9096pLJJ2Pcc81N
	CGChpNap1/tgHY75zRKmx8TUbG4Cqd+R5sWMRhf1YUwPvrZVj3xE52owQNQqT+2j
	alABCduytxAxXYvswYLETXWQo5Otq91bEbVgf8X7uPsGBtR0O07MrdKxrjGEKV5n
	rwu/f24WQbidMmOUS5c2AwLdfXgOtu6KPTpLzM0HenCVswc2Lh7w3dMnQwmjud4F
	AOJE09AgOOuqWGCg+sKSa9JzcUN1QZpsNWxBhw+WyaOfd9VuXW5/5bHhN4IRlu49
	K+u0gg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4407ck89ma-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 06:16:58 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5066Gvq6006619
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 6 Jan 2025 06:16:57 GMT
Received: from [10.152.201.53] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 5 Jan 2025
 22:16:55 -0800
Message-ID: <79fc738a-9c9c-a1a7-af37-bca9247e73be@quicinc.com>
Date: Mon, 6 Jan 2025 11:46:51 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: linux-next: build failure after merge of the nand tree
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>,
        Miquel Raynal
	<miquel.raynal@bootlin.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Linux Next
 Mailing List" <linux-next@vger.kernel.org>,
        <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20250106124834.5a82a6da@canb.auug.org.au>
 <20250106125104.16305a1e@canb.auug.org.au>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <20250106125104.16305a1e@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pp7NkQy66sJDW1lmQnD9Ze6DNYKL6z8G
X-Proofpoint-ORIG-GUID: pp7NkQy66sJDW1lmQnD9Ze6DNYKL6z8G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 malwarescore=0 phishscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501060054



On 1/6/2025 7:21 AM, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 6 Jan 2025 12:48:34 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> After merging the nand tree, today's linux-next build
>> (x86_64_allmodconfig) failed like this:
>>
>> In file included from include/linux/string.h:389,
>>                   from include/linux/bitmap.h:13,
>>                   from include/linux/cpumask.h:12,
>>                   from include/linux/smp.h:13,
>>                   from include/linux/lockdep.h:14,
>>                   from include/linux/mutex.h:17,
>>                   from include/linux/notifier.h:14,
>>                   from include/linux/clk.h:14,
>>                   from drivers/mtd/nand/qpic_common.c:6:
>> In function 'fortify_memset_chk',
>>      inlined from 'qcom_clear_bam_transaction' at drivers/mtd/nand/qpic_common.c:88:2:
>> include/linux/fortify-string.h:480:25: error: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror=attribute-warning]
>>    480 |                         __write_overflow_field(p_size_field, size);
>>        |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> cc1: all warnings being treated as errors
>>
>> Caused by commit
>>
>>    fdf3ee5c6e52 ("mtd: nand: Add qpic_common API file")
> 
> Actually caused by commit
> 
>    8c52932da5e6 ("mtd: rawnand: qcom: cleanup qcom_nandc driver")

  Ho ok, checking on this, will post a fix quickly.

Regards,
  Sricharan

