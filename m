Return-Path: <linux-next+bounces-5045-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D0BA01EEC
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 06:41:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DE0F3A38B6
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 05:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 251541553AB;
	Mon,  6 Jan 2025 05:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pcz2XvfI"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66080171D2;
	Mon,  6 Jan 2025 05:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736142086; cv=none; b=VYJAD9SDwEz4hiV4RRR2HZQuTfK/+6Hn+KCNw1t1sMXCbxwqjIcma/SQkvbHVwyYMp/K7zLj8AQTowkkD9UpRoaDB/uZ9VeoJEmaHFCrrekxlotWZ40PhyZpNsSwEiwsK45m6G3++Xa0fxddJVNdRCDc+8FfSKSv/WgEXItXqHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736142086; c=relaxed/simple;
	bh=brCFUO8pDphmev7HmdN5+5kDh1B26MwEvJT3KlOVSvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PqbeHX5tu8bn1YN3OqsEYjUq01p53m3Sy4IXbFVTZC1/eHJ18gJ0CbLP8jWdv5uI9EetCpW5gkOAPM5cangTha9XD6XclFTeKUPVYk/eLkuqOkkST+zmS4tlwdbqm/X36VZgexXS/fhTDfBGbrf5rTUO4NQZ7hEUErc40gQaxRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pcz2XvfI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 505Ntu6I002552;
	Mon, 6 Jan 2025 05:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y2HlhqtPCs2nCScKckWA3Iurah5VIfpoKFMLzkAarQ4=; b=pcz2XvfIIBMBGWtO
	gW++yHwRRPl1HokflUmqx4wfv6gesKovfRWMvzqM5TqjVKdwaWgte1DUQWysfjDa
	ev1LYfHWq1lK7DCV2ZDdunyk6sKJHTS1mU78lY7yNvPGevYi7Q0yw3oB4OrXqJsb
	AHQdnciYxnvIZWignXSCvrSaQwrFNUdXHwp0C2g5zkbEzSeovFbA8PB4Y3jDwYow
	HLcBxJSwNTmju3aDj0B1xp47bR9yfBUSkrbm39cp2mYmqKB4IaOt2Zem2vlcnr6f
	a9Y9sydWULugZogquNJZKKdwn7ifvgjPyNYN093sbtkuMshsP6aeBcQmVMgujJTU
	Fo3tBg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43yxnn8utk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 05:41:06 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5065f5p5017298
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 6 Jan 2025 05:41:05 GMT
Received: from [10.253.37.44] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 5 Jan 2025
 21:41:03 -0800
Message-ID: <3e45846a-e5ad-4edc-865d-13f8ba722edf@quicinc.com>
Date: Mon, 6 Jan 2025 13:41:01 +0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the driver-core tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>,
        Wolfram
 Sang <wsa@the-dreams.de>
CC: Heiner Kallweit <hkallweit1@gmail.com>,
        Wolfram Sang
	<wsa+renesas@sang-engineering.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>,
        Linux Next Mailing List
	<linux-next@vger.kernel.org>
References: <20250106155332.050670e4@canb.auug.org.au>
Content-Language: en-US
From: Zijun Hu <quic_zijuhu@quicinc.com>
In-Reply-To: <20250106155332.050670e4@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5F_ibeE3DaWIZr6qosk-v01KXymppRSr
X-Proofpoint-ORIG-GUID: 5F_ibeE3DaWIZr6qosk-v01KXymppRSr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 clxscore=1011 priorityscore=1501
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501060048

On 1/6/2025 12:53 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the driver-core tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> drivers/i2c/i2c-core-base.c: In function 'delete_device_store':
> drivers/i2c/i2c-core-base.c:1350:58: error: passing argument 3 of 'device_find_child' from incompatible pointer type [-Wincompatible-pointer-types]
>  1350 |         child_dev = device_find_child(&adap->dev, &addr, __i2c_find_user_addr);
>       |                                                          ^~~~~~~~~~~~~~~~~~~~
>       |                                                          |
>       |                                                          int (*)(struct device *, void *)
> In file included from include/linux/acpi.h:14,
>                  from drivers/i2c/i2c-core-base.c:16:
> include/linux/device.h:1085:49: note: expected 'device_match_t' {aka 'int (*)(struct device *, const void *)'} but argument is of type 'int (*)(struct device *, void *)'
>  1085 |                                  device_match_t match);
>       |                                  ~~~~~~~~~~~~~~~^~~~~
> 
> Caused by commit
> 
>   f1e8bf56320a ("driver core: Constify API device_find_child() and adapt for various usages")
> 
> interacting with commit
> 
>   3cfe39b3a845 ("i2c: Replace list-based mechanism for handling userspace-created clients")
> 
> from the i2c tree.
> 
> I have applied the following merge fix patch.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 6 Jan 2025 15:33:36 +1100
> Subject: [PATCH] fix up for "driver core: Constify API device_find_child() and
>  adapt for various usages"
> 
> interacting with commit
> 
>   3cfe39b3a845 ("i2c: Replace list-based mechanism for handling userspace-created clients")
> 
> from the i2c tree.
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/i2c/i2c-core-base.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index bd90a6084fc0..c21a16aa96dc 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -1306,10 +1306,10 @@ new_device_store(struct device *dev, struct device_attribute *attr,
>  }
>  static DEVICE_ATTR_WO(new_device);
>  
> -static int __i2c_find_user_addr(struct device *dev, void *addrp)
> +static int __i2c_find_user_addr(struct device *dev, const void *addrp)
>  {
>  	struct i2c_client *client = i2c_verify_client(dev);
> -	unsigned short addr = *(unsigned short *)addrp;
> +	unsigned short addr = *(const unsigned short *)addrp;
>  
>  	return client && client->flags & I2C_CLIENT_USER &&
>  	       i2c_encode_flags_to_addr(client) == addr;

LGTM, thank you Stephen for this fix.
Reviewed-by: Zijun Hu <quic_zijuhu@quicinc.com>

