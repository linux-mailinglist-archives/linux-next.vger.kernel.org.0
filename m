Return-Path: <linux-next+bounces-5055-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 776F3A02669
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 14:23:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B30B1646E6
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 13:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E8981DDA1E;
	Mon,  6 Jan 2025 13:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Lo4eTUKB"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4541D619D;
	Mon,  6 Jan 2025 13:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736169801; cv=none; b=j3b1XLnwVNGiqiHsAOIYd2IFp8U2veKzshwKILStd+2oTKdPUoueK+d1GwyC/HS1BGBYeK31QHoIKsx/QbhEl7O1zFSp2BtBE+kWxpRf5eToNtA3x0V4G7B9eOLJlG/13CTtFfpSRo3fkIe6iDLVa141A8m5XNlnkj8NNRE/0d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736169801; c=relaxed/simple;
	bh=EQanYnAugqL+reWe8cV+6Xo4vWORrcNYbtYAlUuMB80=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QRWDAR1U392A/EFH5uT5jcLMP4yLtJPSVcjACOWsb3GOlx+ztzyQek7DnlIOSuV9twM+FGQoPgARY3dN0vbhGiHtU0vHbEOIHuPQpdSLvObl8Zwk/xvp/xlU8ZREDhoY+Ii8oMdD04zzzfAeqtpb4uz7yX8l4vFNk+XY9wZsOqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Lo4eTUKB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5067EkIC016602;
	Mon, 6 Jan 2025 13:23:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dbi9Ei9IXYJ7mLiMJcaOEjl9H5CuRs5/mT1ITovSd9U=; b=Lo4eTUKBeuXdcayR
	WSjGSiHkOy/ro0/Id3bpaLrVKZZDdlyY0BEELb8qPg9cs9Gh/W5a/7XJkGFWkUh8
	szcBn+Qw6BervFtL18K3pgCFm+xAr3jbxIF9oIQnFXvINCwJHXQIFVswuC2oL8Tn
	KjWPHsg9SMfRy6gkQbilHrMff4RCostUnMrSX1FN5HR9Ok9PMQpliiD5We+LhtLS
	oi5qGrRxmmUpII1/So0XFKdYzw09JdJ7Db4Ng0s4HWZnoD4hVgEGWcWRVST6FNmS
	lGFQQZ3HVY+K2/5UGjaTvUFcafT+kmruJXXhOxkQzhTLeUe4vmlqsIR5R16af72w
	EiYtGA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 440am8rrp8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 13:23:06 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 506DN6dj029551
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 6 Jan 2025 13:23:06 GMT
Received: from [10.151.36.43] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 6 Jan 2025
 05:23:04 -0800
Message-ID: <409116b0-ebb2-025f-ba8c-0eff3e7e11dc@quicinc.com>
Date: Mon, 6 Jan 2025 18:53:01 +0530
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
        Linux Next
 Mailing List <linux-next@vger.kernel.org>
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
X-Proofpoint-GUID: nMp_nhRgXK9EGOzZH7khke-zoHf8H8cD
X-Proofpoint-ORIG-GUID: nMp_nhRgXK9EGOzZH7khke-zoHf8H8cD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 mlxlogscore=921 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501060118



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
I have posted the fix. Please check the patch at [1]
[1] 
https://lore.kernel.org/lkml/20250106131558.2219136-1-quic_mdalam@quicinc.com/T/#u

Thanks,
Alam.

