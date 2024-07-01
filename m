Return-Path: <linux-next+bounces-2760-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BECD91DBA7
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 11:41:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4167A1F23298
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 09:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34EE983A18;
	Mon,  1 Jul 2024 09:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="IG5stIMf"
X-Original-To: linux-next@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6885C524C9;
	Mon,  1 Jul 2024 09:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719826910; cv=none; b=Hi+m5g2hr4mMfQDF9lkr8GAUecy+EP7v2mhAtakLwqLPkKA4/W//VfKMNFR4rUWuZNesHVtzz1fjH/xFMFJ7K16H73XvaCwktq9nCAPyb0H2uK3GsSeVRjiUgT0pCDHlSSu3WDm6OmYtplRcjcDcRLQ2ECqf9ziQ2WmQXDTCzl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719826910; c=relaxed/simple;
	bh=W2FtqVZmFFmz8xYyngU16lTUGiuPORQT/UMAj+MDzMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Z41hreFNfOsTC60MNMvyFNYe7oIotIXixIXRBuma176rkjsCBa6dRVQTisaew6iSClbOf6nNDrT9VS7faByYiWd1jflaXDteH5pWF7dpUQoSHWmaAjwVoUUl6FGdw5Zy18K2/6+sMe+lj/Lgp2Rh0IN+tIz7GkF3bC+uWf1wGzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=IG5stIMf; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4618DKUD028717;
	Mon, 1 Jul 2024 11:41:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	NELJzmKSWmV5+LkugKpquX6gMQupWRQnNGEFr2cD8U8=; b=IG5stIMfKBFSYxkx
	7QqpII60xQZcZnTDqy8WqZ1ovDPhgSFGPh7YTCxbUYg3WcJ5Qgd85sQyuYI6Yt24
	ueaci4AfQwt8ls78jJQDZbR1hLNySVTkffAji48swu29UTXzYw7mKm2itcXTleB5
	1ope08svXXExvTiVlkCgGMDGuqD2Kwm/ZQeESyRPfaiHaWHr7GJsuuEThVk1ColH
	pvUPpy8q6YUwbXv/O7DvL+vAReineD+84vu+OCesf+HEIFi24uduo5wlO37C4TYD
	rH4rw8wb+CMPcqM3KKrNAgF2E6W7QIwoh/KSyNvypwkaYb6d4lV/stwdKgjgiGy6
	+9qT0Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 402uu0m4rw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 11:41:38 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2147540046;
	Mon,  1 Jul 2024 11:41:33 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3E4552171FF;
	Mon,  1 Jul 2024 11:41:14 +0200 (CEST)
Received: from [10.252.5.127] (10.252.5.127) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 1 Jul
 2024 11:41:13 +0200
Message-ID: <78644a85-9e42-8af7-778a-80383bc7c0f4@foss.st.com>
Date: Mon, 1 Jul 2024 11:41:09 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: linux-next: build failure after merge of the drm tree
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown
	<broonie@kernel.org>
CC: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Raphael
 Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Yannick Fertre
	<yannick.fertre@foss.st.com>,
        Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>,
        Linux Next Mailing List
	<linux-next@vger.kernel.org>
References: <Zn8TKYDCOCtbbNH8@sirena.org.uk>
 <2024063022-trapping-affidavit-56fd@gregkh>
Content-Language: en-US
From: Philippe CORNU <philippe.cornu@foss.st.com>
In-Reply-To: <2024063022-trapping-affidavit-56fd@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_08,2024-06-28_01,2024-05-17_01



On 6/30/24 09:26, Greg Kroah-Hartman wrote:
> On Fri, Jun 28, 2024 at 08:46:49PM +0100, Mark Brown wrote:
>> Hi all,
>>
>> After merging the drm tree and then some other trees which seem to have
>> allowed the driver to be built much later in the merge process today's
>> linux-next build (x86_64 allmodconfig) failed like this:
>>
>> /tmp/next/build/drivers/gpu/drm/stm/lvds.c:1212:19: error: initialization of 'void (*)(struct platform_device *)' from incompatible pointer type 'int (*)(struct platform_device *)' [-Werror=incompatible-pointer-types]
>>   1212 |         .remove = lvds_remove,
>>        |                   ^~~~~~~~~~~
>> /tmp/next/build/drivers/gpu/drm/stm/lvds.c:1212:19: note: (near initialization for 'lvds_platform_driver.<anonymous>.remove')
>>
>> Caused by commit
>>
>>    6597efcfc53585d5 ("drm/stm: Allow build with COMPILE_TEST=y")
>>
>> interacting with
>>
>>    aca1cbc1c9860e39 ("drm/stm: lvds: add new STM32 LVDS Display Interface Transmitter driver")
>>    0edb555a65d1ef04 ("platform: Make platform_driver::remove() return void")
>>
>> I have applied the below fixup patch.
>>
>>  From 59a5e11f41e93512ca1a5aed36c1c396d175797d Mon Sep 17 00:00:00 2001
>> From: Mark Brown <broonie@kernel.org>
>> Date: Fri, 28 Jun 2024 20:45:16 +0100
>> Subject: [PATCH] drm: Fix up STM LVDS driver for void remove() conversion
>>
>> Signed-off-by: Mark Brown <broonie@kernel.org>
>> ---
>>   drivers/gpu/drm/stm/lvds.c | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/stm/lvds.c b/drivers/gpu/drm/stm/lvds.c
>> index bfc8cb13fbc5c..2fa2c81784e97 100644
>> --- a/drivers/gpu/drm/stm/lvds.c
>> +++ b/drivers/gpu/drm/stm/lvds.c
>> @@ -1186,15 +1186,13 @@ static int lvds_probe(struct platform_device *pdev)
>>   	return ret;
>>   }
>>   
>> -static int lvds_remove(struct platform_device *pdev)
>> +static void lvds_remove(struct platform_device *pdev)
>>   {
>>   	struct stm_lvds *lvds = platform_get_drvdata(pdev);
>>   
>>   	lvds_pixel_clk_unregister(lvds);
>>   
>>   	drm_bridge_remove(&lvds->lvds_bridge);
>> -
>> -	return 0;
>>   }
>>   
>>   static const struct of_device_id lvds_dt_ids[] = {
>> -- 
>> 2.39.2
>>
> 
> Looks good, thanks!
> 
> greg k-h

Hi Mark,
Many thanks for this fix and all my apologies for having creating this 
issue.
What's next and how can I help?
Philippe :-)
ps: On my side, I am still trying to understand why I did not "catch" 
this issue that looks "pretty big".



