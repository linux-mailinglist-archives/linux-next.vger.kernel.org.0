Return-Path: <linux-next+bounces-5047-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50842A01F0F
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 06:59:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A91FC1883BBA
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 05:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF15415886C;
	Mon,  6 Jan 2025 05:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dAHv3mx/"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DFD8C1E;
	Mon,  6 Jan 2025 05:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736143163; cv=none; b=SLHrI/nV7H4B1I+DYQZ4AJEEnlIjlU4RuXmod1DwIYziGgAOf5RsKiA9axlIYXEG2zFsFEQ8i8rOk600jHS3U6uuafI2fzcveHcTqYoOiHQuK5d+wBM56rIJwhXyDuqexs+FpyZ8snn+VmlCcLRuNQ6JW86AwVs9rM5ijGNui6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736143163; c=relaxed/simple;
	bh=hMuVyFYYMV3fgnz0zm0lyJfZ8DHralq/FEaQK6jMzRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ImWkheotr3P8gmpmycchMQN20MU/+zuJGAuLAR0naejjcigcfYhCYbJfOpeWZneat6FhDiVcPXJwJqvs2kgBV0WlMSvHJWw+9UHrYetuoIoynvqcJAyr0HxZuYYhhFB5NP+TbY12TDenXH5nqzeqgqjUjNLeEOs/49UFvVm68Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dAHv3mx/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50610FaL017083;
	Mon, 6 Jan 2025 05:31:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XJ6gFo3lcT8PSgi80zIm5qWmu/Qgx+ePQVYeNFMKsRk=; b=dAHv3mx/DHBz0Qs0
	FKERcPeJWqTR70/Q0f8BA1jk4n7ikkdpjIy1GwnfW1xejVsCNL6l2qLc/13dwioW
	saxHh1ivp3L2CUOjmDtOl3bQPdncjACaoJ9P+VSbNmFzHQZUbNWAJ6br8zte07g3
	sUTQxzCRC4htDZqA2+3qxBy/fpHC4JBVh2MOgupDEzAwpLcTTbIhN2cHtzyEl6ua
	zSgcCMUFRHBSL6/YPZzUamw6uRbT9IH+bm+dsouPGzHGtHNQbeQ4vy/4ft7x/9w4
	3yiAUAbZjuGXSb9QO8EhamsqzVB4jRvvqOjZcWCBZmkSCaZqsN7Ujq9bEtVafXor
	E0xyrg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44054eget8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 05:31:34 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5065VXuo030571
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 6 Jan 2025 05:31:33 GMT
Received: from [10.253.37.44] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 5 Jan 2025
 21:31:32 -0800
Message-ID: <a1fd1874-5c29-4fb8-b8cd-6833d87ec0f3@quicinc.com>
Date: Mon, 6 Jan 2025 13:31:29 +0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the driver-core tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>,
        Lee
 Jones <lee@kernel.org>
CC: =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>,
        Linux Next Mailing List
	<linux-next@vger.kernel.org>
References: <20250106160451.277432a1@canb.auug.org.au>
Content-Language: en-US
From: Zijun Hu <quic_zijuhu@quicinc.com>
In-Reply-To: <20250106160451.277432a1@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sVqLmwN2CfKY3cA4jnbXCIm1qKMuMkv2
X-Proofpoint-ORIG-GUID: sVqLmwN2CfKY3cA4jnbXCIm1qKMuMkv2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1011
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501060047

On 1/6/2025 1:04 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the driver-core tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/leds/leds-turris-omnia.c: In function 'omnia_find_mcu_and_get_features':
> drivers/leds/leds-turris-omnia.c:457:56: error: passing argument 3 of 'device_find_child' from incompatible pointer type [-Wincompatible-pointer-types]
>   457 |         mcu_dev = device_find_child(dev->parent, NULL, omnia_match_mcu_client);
>       |                                                        ^~~~~~~~~~~~~~~~~~~~~~
>       |                                                        |
>       |                                                        int (*)(struct device *, void *)
> In file included from include/linux/acpi.h:14,
>                  from include/linux/i2c.h:13,
>                  from drivers/leds/leds-turris-omnia.c:8:
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
>   b4c3960da27d ("leds: turris-omnia: Use command execution functions from the MCU driver")
> 
> from the leds-lj tree.
> 
> I have applied the following merge fix patch.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 6 Jan 2025 15:58:47 +1100
> Subject: [PATCH] fix up 2 for "driver core: Constify API device_find_child()
>  and adapt for various usages"
> 
> interacting with commit
> 
>   b4c3960da27d ("leds: turris-omnia: Use command execution functions from the MCU driver")
> 
> from the leds-lj tree.
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/leds/leds-turris-omnia.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
> index 7d3b24c8ecae..4fe1a9c0bc1b 100644
> --- a/drivers/leds/leds-turris-omnia.c
> +++ b/drivers/leds/leds-turris-omnia.c
> @@ -438,7 +438,7 @@ static int omnia_mcu_get_features(const struct i2c_client *mcu_client)
>  	return reply;
>  }
>  
> -static int omnia_match_mcu_client(struct device *dev, void *data)
> +static int omnia_match_mcu_client(struct device *dev, const void *data)
>  {
>  	struct i2c_client *client;
>  
LGTM, thank you Stephen for this fix.
Reviewed-by: Zijun Hu <quic_zijuhu@quicinc.com>

