Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40C9627517A
	for <lists+linux-next@lfdr.de>; Wed, 23 Sep 2020 08:28:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726625AbgIWG2I (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Sep 2020 02:28:08 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:37954 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbgIWG2I (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 23 Sep 2020 02:28:08 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08N6Rub1108395;
        Wed, 23 Sep 2020 01:27:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1600842476;
        bh=J43iLKNMWm0OCcoOCQ2lfQNIz3v7B4TM6gJmz2s5NN8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=xlbDUH03WEAizpY9xQ4JssbH3UlBBoVgmSXx2+12ohgr15LkjoUCUrxSV0wcqzw8V
         lT8x2Lf1q1d90HpVt3hyWa2XPBgd9ddKO/WEkY/SaYBq+FJp0pbD6nXR9jAxNpIzap
         dnYkb3YcPKNOy6SsOgTkAUBUrriZpQGt06Br2zII=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08N6RuFO119638
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 23 Sep 2020 01:27:56 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 23
 Sep 2020 01:27:56 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 23 Sep 2020 01:27:56 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08N6Rr7k076442;
        Wed, 23 Sep 2020 01:27:54 -0500
Subject: Re: linux-next: build warning after merge of the drm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
CC:     Swapnil Jakhade <sjakhade@cadence.com>, Jyri Sarha <jsarha@ti.com>,
        Quentin Schulz <quentin.schulz@free-electrons.com>,
        Yuti Amonkar <yamonkar@cadence.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200923133601.293b4fe6@canb.auug.org.au>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <f4581178-77b1-758b-84e5-4810ed0f46d1@ti.com>
Date:   Wed, 23 Sep 2020 09:27:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200923133601.293b4fe6@canb.auug.org.au>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On 23/09/2020 06:36, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
> 
> drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c: In function 'cdns_mhdp_fw_activate':
> drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:751:10: warning: conversion from 'long unsigned int' to 'unsigned int' changes value from '18446744073709551613' to '4294967293' [-Woverflow]
>   751 |   writel(~CDNS_APB_INT_MASK_SW_EVENT_INT,
> drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c: In function 'cdns_mhdp_attach':
> drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:1692:10: warning: conversion from 'long unsigned int' to 'unsigned int' changes value from '18446744073709551613' to '4294967293' [-Woverflow]
>  1692 |   writel(~CDNS_APB_INT_MASK_SW_EVENT_INT,
> drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c: In function 'cdns_mhdp_bridge_hpd_enable':
> drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:2125:10: warning: conversion from 'long unsigned int' to 'unsigned int' changes value from '18446744073709551613' to '4294967293' [-Woverflow]
>  2125 |   writel(~CDNS_APB_INT_MASK_SW_EVENT_INT,
> 
> Introduced by commit
> 
>   fb43aa0acdfd ("drm: bridge: Add support for Cadence MHDP8546 DPI/DP bridge")
> 

Thanks. I think we can just do:

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 621ebdbff8a3..d0c65610ebb5 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -748,7 +748,7 @@ static int cdns_mhdp_fw_activate(const struct firmware *fw,
 	 * bridge should already be detached.
 	 */
 	if (mhdp->bridge_attached)
-		writel(~CDNS_APB_INT_MASK_SW_EVENT_INT,
+		writel(~(u32)CDNS_APB_INT_MASK_SW_EVENT_INT,
 		       mhdp->regs + CDNS_APB_INT_MASK);
 
 	spin_unlock(&mhdp->start_lock);
@@ -1689,7 +1689,7 @@ static int cdns_mhdp_attach(struct drm_bridge *bridge,
 
 	/* Enable SW event interrupts */
 	if (hw_ready)
-		writel(~CDNS_APB_INT_MASK_SW_EVENT_INT,
+		writel(~(u32)CDNS_APB_INT_MASK_SW_EVENT_INT,
 		       mhdp->regs + CDNS_APB_INT_MASK);
 
 	return 0;
@@ -2122,7 +2122,7 @@ static void cdns_mhdp_bridge_hpd_enable(struct drm_bridge *bridge)
 
 	/* Enable SW event interrupts */
 	if (mhdp->bridge_attached)
-		writel(~CDNS_APB_INT_MASK_SW_EVENT_INT,
+		writel(~(u32)CDNS_APB_INT_MASK_SW_EVENT_INT,
 		       mhdp->regs + CDNS_APB_INT_MASK);
 }

I'll send a patch.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
