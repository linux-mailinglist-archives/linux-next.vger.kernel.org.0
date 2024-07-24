Return-Path: <linux-next+bounces-3120-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6332D93AD32
	for <lists+linux-next@lfdr.de>; Wed, 24 Jul 2024 09:34:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 952FB1C21B20
	for <lists+linux-next@lfdr.de>; Wed, 24 Jul 2024 07:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A61D27D07D;
	Wed, 24 Jul 2024 07:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="PymCAZhn"
X-Original-To: linux-next@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A84574040;
	Wed, 24 Jul 2024 07:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721806464; cv=none; b=tPzrC33TaDxaVAlXHytkI/vYELX8IqK4VsAB0d/bwiSUvReT7m4F3uPPN6Fjh5sTUTbgMxfUGxVfcfzbB2bU5toGQL95qDJKM4zXpqsS7U/UxHHwFIDb3QxG0RcNCMZGJywKA2Oh2fH7pNVNI2qG3RNrdv3O49vIGqkQQ3VatD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721806464; c=relaxed/simple;
	bh=V3zw4PVWEDhbehn6Pvqbvxh35yyLjTiel4D+aqBFdzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qzh5qzieFMpnLG8cmlLamyn6lyvYHa1VmoFsOzvOejDK+PrB7t2heNavPYVzMONSFX/FtW/XetGtJ+b0innV3JqfbPaX3Jc/bsVVp5BToBVcEH5O10A9xGgGwiEPXUdn1SXgn6YT1v40WNYMdUAe4om9MW81id4zWekpAtxIPdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=PymCAZhn; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46O767sL007164;
	Wed, 24 Jul 2024 09:33:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	GK3Oc+q41MBAFbfRzQCytYL38tGYUPGsjlytu+9jtCU=; b=PymCAZhn6L3/Si2z
	shAzEngQv7mhlCW8uVd6fi6VOxi+J/86JUIGsE50oJ5UaUO/B6q6nP8/fTp96287
	E2HXswEzRynX9AhQa+fJABP4R14yh/YxuvnKuaFmp1KJz9Z3oJZ3CdFHSGuY1SHD
	BPFtO3GAKfg918dn1K6huSviBBEfL5thtCTOSSKFG1QdSrUFjp84R6zexKMxHdF0
	tMEPO25a9uxWsoq4Wz25TN9XpxuF8DA2ouXIIwgaWA6uGnc6sfMZddlgb4hI6dQ4
	w0AVYb63dPaevqHWZuRthEx/Thle690XK/nppEaiEVkL/c8d7QiiDu2VCxgfn42Z
	6ADO8w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 40gpt141hn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jul 2024 09:33:53 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 317AC40045;
	Wed, 24 Jul 2024 09:33:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 890B520DD62;
	Wed, 24 Jul 2024 09:33:22 +0200 (CEST)
Received: from [10.129.178.17] (10.129.178.17) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 24 Jul
 2024 09:33:19 +0200
Message-ID: <86ea9b8f-424d-4624-9827-3cfbace8d7e6@foss.st.com>
Date: Wed, 24 Jul 2024 09:33:18 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the drm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Mark Brown <broonie@kernel.org>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
	<ville.syrjala@linux.intel.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>,
        Linux Next Mailing List
	<linux-next@vger.kernel.org>
References: <Zn8TKYDCOCtbbNH8@sirena.org.uk>
 <20240724091123.0dac1f76@canb.auug.org.au>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20240724091123.0dac1f76@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-24_05,2024-07-23_02,2024-05-17_01

Hi,

Deep apologies for this mistake.

Is there any way that we can help within our scope ?

Best regards,
Raphaël

On 7/24/24 01:11, Stephen Rothwell wrote:
> Hi all,
>
> On Fri, 28 Jun 2024 20:46:49 +0100 Mark Brown <broonie@kernel.org> wrote:
>> After merging the drm tree and then some other trees which seem to have
>> allowed the driver to be built much later in the merge process today's
>> linux-next build (x86_64 allmodconfig) failed like this:
>>
>> /tmp/next/build/drivers/gpu/drm/stm/lvds.c:1212:19: error: initialization of 'void (*)(struct platform_device *)' from incompatible pointer type 'int (*)(struct platform_device *)' [-Werror=incompatible-pointer-types]
>>  1212 |         .remove = lvds_remove,
>>       |                   ^~~~~~~~~~~
>> /tmp/next/build/drivers/gpu/drm/stm/lvds.c:1212:19: note: (near initialization for 'lvds_platform_driver.<anonymous>.remove')
>>
>> Caused by commit
>>
>>   6597efcfc53585d5 ("drm/stm: Allow build with COMPILE_TEST=y")
>>
>> interacting with
>>
>>   aca1cbc1c9860e39 ("drm/stm: lvds: add new STM32 LVDS Display Interface Transmitter driver")
>>   0edb555a65d1ef04 ("platform: Make platform_driver::remove() return void")
>>
>> I have applied the below fixup patch.
>>
>> From 59a5e11f41e93512ca1a5aed36c1c396d175797d Mon Sep 17 00:00:00 2001
>> From: Mark Brown <broonie@kernel.org>
>> Date: Fri, 28 Jun 2024 20:45:16 +0100
>> Subject: [PATCH] drm: Fix up STM LVDS driver for void remove() conversion
>>
>> Signed-off-by: Mark Brown <broonie@kernel.org>
>> ---
>>  drivers/gpu/drm/stm/lvds.c | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/stm/lvds.c b/drivers/gpu/drm/stm/lvds.c
>> index bfc8cb13fbc5c..2fa2c81784e97 100644
>> --- a/drivers/gpu/drm/stm/lvds.c
>> +++ b/drivers/gpu/drm/stm/lvds.c
>> @@ -1186,15 +1186,13 @@ static int lvds_probe(struct platform_device *pdev)
>>  	return ret;
>>  }
>>  
>> -static int lvds_remove(struct platform_device *pdev)
>> +static void lvds_remove(struct platform_device *pdev)
>>  {
>>  	struct stm_lvds *lvds = platform_get_drvdata(pdev);
>>  
>>  	lvds_pixel_clk_unregister(lvds);
>>  
>>  	drm_bridge_remove(&lvds->lvds_bridge);
>> -
>> -	return 0;
>>  }
>>  
>>  static const struct of_device_id lvds_dt_ids[] = {
> This is now a conflict between the driver-core tree and Linus' tree.
>

