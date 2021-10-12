Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2526429EBA
	for <lists+linux-next@lfdr.de>; Tue, 12 Oct 2021 09:35:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234260AbhJLHhn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Oct 2021 03:37:43 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:17937 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234082AbhJLHhn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Oct 2021 03:37:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634024142; x=1665560142;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=JnajjZ4WxUBcaEw+nx+jgD2W+ODYf4Y30ZAYWEcq4fM=;
  b=1OynkErJzVT1MxY3xqjF6IcV7VYBvN4yY2k/WSqi2eXo27/YngWjR3gQ
   L2w14jbNKlwml5F7aJarWjZ2KJqYEq9WM0G2WbfkomIqMx5VAkHuvceF0
   tYGsVKkHYhInQkNIHbqh79IvX8a2ne3lrGlHgntQNjDZ7FYaDsWdioJmc
   N55ywtsq0NQ21UDRbW4kDqUc/A27lIQ800bGuaSZCriakZXqI1xGGYStH
   WvoehUQDw3dinc7rUhN9dHvwZFSgj/eI6R93nOnfUtwSjeDDwjp63r450
   oF4P/Ggn1KDcDMoBvE8TqYXMUsWfovbtNbFyHl9PyVrYbGaTAy8NWuAcW
   Q==;
IronPort-SDR: x/nWZIk+9MABBkvWZ+F2BITSZzSZPU9dw/RDL5ToAonYiP6Jt6lxezQHCbPbSsY3HLe2HUglDK
 8F4YSDVm8hPD3RhaDRl2bAk8oiFRM1c4s95MkcbvfZ0CnLEPXrgrMqMlIjgCPKWEdnC2jAISY3
 RRIARLOEwqXlLqq2WPUodQlGavGPtQUgiU8tJ0Z4U6pnDusgYaGLBtLj4uXTEK0iLYOkxhc17S
 jCfSgZo2D005rAX7GhOsUCAphWZQ3XU63kLH5QbX6r5LmiGk7w+bA2KPjs3Z3p/sN5C7YXbf/g
 apODWeVKOJxqJqBpZJhDHxwH
X-IronPort-AV: E=Sophos;i="5.85,367,1624345200"; 
   d="scan'208";a="139955500"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Oct 2021 00:35:41 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 12 Oct 2021 00:35:40 -0700
Received: from [10.159.245.112] (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Tue, 12 Oct 2021 00:35:39 -0700
Subject: Re: linux-next: build failure after merge of the arm-soc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20211012110309.17d51c3e@canb.auug.org.au>
From:   Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
Message-ID: <97e578a3-b12e-1975-717d-a0cf663673f0@microchip.com>
Date:   Tue, 12 Oct 2021 09:35:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211012110309.17d51c3e@canb.auug.org.au>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 12/10/2021 at 02:03, Stephen Rothwell wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi all,
> 
> After merging the arm-soc tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> Error: arch/arm/boot/dts/sama7g5.dtsi:167.3-7 syntax error
> FATAL ERROR: Unable to parse input tree
> 
> Caused by commit
> 
>    9be4be3ed1ec ("Merge branch 'arm/dt' into for-next")
> 
> I added the following patch for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 12 Oct 2021 10:37:29 +1100
> Subject: [PATCH] merge fix for missing semicolon
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

This patch is valid.

When solving this merge conflict in at91-next here:
https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git/commit/?id=dbbb39806c65b0ab3f330fc7a855bc13b20ad2ce

I had following patch to have the nodes in alphabetical order:

--- a/arch/arm/boot/dts/sama7g5.dtsi 

+++ b/arch/arm/boot/dts/sama7g5.dtsi 

@@@ -159,11 -137,22 +159,27 @@@ 

                         clocks = <&clk32k 0>;
                 };

+               adc: adc@e1000000 { 

+                       compatible = "microchip,sama7g5-adc"; 

+                       reg = <0xe1000000 0x200>; 

+                       interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>; 

+                       clocks = <&pmc PMC_TYPE_GCK 26>; 

+                       assigned-clocks = <&pmc PMC_TYPE_GCK 26>; 

+                       assigned-clock-rates = <100000000>; 

+                       clock-names = "adc_clk"; 

+                       dmas = <&dma0 AT91_XDMAC_DT_PERID(0)>; 

+                       dma-names = "rx"; 

+                       atmel,min-sample-rate-hz = <200000>; 

+                       atmel,max-sample-rate-hz = <20000000>; 

+                       atmel,startup-time-ms = <4>; 

+                       status = "disabled"; 

+               }; 

+ 

  +              chipid@e0020000 { 

  +                      compatible = "microchip,sama7g5-chipid"; 

  +                      reg = <0xe0020000 0x8>; 

  +              }; 

  + 

                 sdmmc0: mmc@e1204000 {
                         compatible = "microchip,sama7g5-sdhci", 
"microchip,sam9x60-sdhci";
                         reg = <0xe1204000 0x4000>;


Sorry for not having mentioned this conflict in the pull-request.

Best regards,
   Nicolas

> ---
>   arch/arm/boot/dts/sama7g5.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/sama7g5.dtsi b/arch/arm/boot/dts/sama7g5.dtsi
> index efcaa6ad7533..f98977f3980d 100644
> --- a/arch/arm/boot/dts/sama7g5.dtsi
> +++ b/arch/arm/boot/dts/sama7g5.dtsi
> @@ -162,7 +162,7 @@ ps_wdt: watchdog@e001d180 {
>                  chipid@e0020000 {
>                          compatible = "microchip,sama7g5-chipid";
>                          reg = <0xe0020000 0x8>;
> -               }
> +               };
> 
>                  adc: adc@e1000000 {
>                          compatible = "microchip,sama7g5-adc";
> --
> 2.33.0
> 
> --
> Cheers,
> Stephen Rothwell
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 


-- 
Nicolas Ferre
