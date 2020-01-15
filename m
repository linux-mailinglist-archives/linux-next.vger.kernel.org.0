Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AB0C13B8CA
	for <lists+linux-next@lfdr.de>; Wed, 15 Jan 2020 06:09:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726553AbgAOFJL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Jan 2020 00:09:11 -0500
Received: from mail-out.m-online.net ([212.18.0.10]:38902 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbgAOFJK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Jan 2020 00:09:10 -0500
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 47yFjb18nFz1rVvt;
        Wed, 15 Jan 2020 06:09:07 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 47yFjb0Rryz1r0GR;
        Wed, 15 Jan 2020 06:09:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id wv2R1Mb3tDIk; Wed, 15 Jan 2020 06:09:05 +0100 (CET)
X-Auth-Info: m7VLb3Fv9Vu6GyyKS3Q9hd/0Pv7crRUj+i9rR/1cWSQ=
Received: from [IPv6:::1] (unknown [195.140.253.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Wed, 15 Jan 2020 06:09:05 +0100 (CET)
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200115120258.0e535fcb@canb.auug.org.au>
From:   Marek Vasut <marex@denx.de>
Message-ID: <d9b60770-fa22-deaa-3a80-6dad0fba3aa3@denx.de>
Date:   Wed, 15 Jan 2020 06:09:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200115120258.0e535fcb@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 1/15/20 2:02 AM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the sound-asoc tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> In file included from include/linux/phy/phy.h:17,
>                  from drivers/phy/phy-core.c:17:
> include/linux/regulator/consumer.h:600:1: error: expected identifier or '(' before '{' token
>   600 | {
>       | ^
> include/linux/regulator/consumer.h:599:1: warning: 'regulator_is_equal' declared 'static' but never defined [-Wunused-function]
>   599 | regulator_is_equal(struct regulator *reg1, struct regulator *reg2);
>       | ^~~~~~~~~~~~~~~~~~
> In file included from include/linux/phy/phy.h:17,
>                  from include/linux/usb/otg.h:13,
>                  from include/linux/usb/of.h:12,
>                  from drivers/usb/common/common.c:15:
> include/linux/regulator/consumer.h:600:1: error: expected identifier or '(' before '{' token
>   600 | {
>       | ^
> include/linux/regulator/consumer.h:599:1: warning: 'regulator_is_equal' declared 'static' but never defined [-Wunused-function]
>   599 | regulator_is_equal(struct regulator *reg1, struct regulator *reg2);
>       | ^~~~~~~~~~~~~~~~~~
> In file included from include/linux/phy/phy.h:17,
>                  from include/linux/usb/otg.h:13,
>                  from include/linux/usb/of.h:12,
>                  from drivers/usb/phy/of.c:9:
> include/linux/regulator/consumer.h:600:1: error: expected identifier or '(' before '{' token
>   600 | {
>       | ^
> include/linux/regulator/consumer.h:599:1: warning: 'regulator_is_equal' declared 'static' but never defined [-Wunused-function]
>   599 | regulator_is_equal(struct regulator *reg1, struct regulator *reg2);
>       | ^~~~~~~~~~~~~~~~~~
> In file included from include/linux/phy/phy.h:17,
>                  from include/linux/usb/otg.h:13,
>                  from drivers/usb/host/ohci-hcd.c:37:
> include/linux/regulator/consumer.h:600:1: error: expected identifier or '(' before '{' token
>   600 | {
>       | ^
> include/linux/regulator/consumer.h:599:1: warning: 'regulator_is_equal' declared 'static' but never defined [-Wunused-function]
>   599 | regulator_is_equal(struct regulator *reg1, struct regulator *reg2);
>       | ^~~~~~~~~~~~~~~~~~
> In file included from include/linux/phy/phy.h:17,
>                  from include/linux/usb/otg.h:13,
>                  from drivers/usb/host/ehci-hub.c:17,
>                  from drivers/usb/host/ehci-hcd.c:305:
> include/linux/regulator/consumer.h:600:1: error: expected identifier or '(' before '{' token
>   600 | {
>       | ^
> include/linux/regulator/consumer.h:599:1: warning: 'regulator_is_equal' declared 'static' but never defined [-Wunused-function]
>   599 | regulator_is_equal(struct regulator *reg1, struct regulator *reg2);
>       | ^~~~~~~~~~~~~~~~~~
> In file included from include/linux/amba/bus.h:19,
>                  from drivers/of/platform.c:14:
> include/linux/regulator/consumer.h:600:1: error: expected identifier or '(' before '{' token
>   600 | {
>       | ^
> In file included from include/linux/amba/bus.h:19,
>                  from drivers/of/platform.c:14:
> include/linux/regulator/consumer.h:599:1: warning: 'regulator_is_equal' declared 'static' but never defined [-Wunused-function]
>   599 | regulator_is_equal(struct regulator *reg1, struct regulator *reg2);
>       | ^~~~~~~~~~~~~~~~~~
> In file included from include/linux/phy/phy.h:17,
>                  from drivers/usb/core/phy.c:12:
> include/linux/regulator/consumer.h:600:1: error: expected identifier or '(' before '{' token
>   600 | {
>       | ^
> include/linux/regulator/consumer.h:599:1: warning: 'regulator_is_equal' declared 'static' but never defined [-Wunused-function]
>   599 | regulator_is_equal(struct regulator *reg1, struct regulator *reg2);
>       | ^~~~~~~~~~~~~~~~~~
> In file included from include/linux/phy/phy.h:17,
>                  from drivers/ata/ahci.h:25,
>                  from drivers/ata/ahci.c:35:
> include/linux/regulator/consumer.h:600:1: error: expected identifier or '(' before '{' token
>   600 | {
>       | ^
> include/linux/regulator/consumer.h:599:1: warning: 'regulator_is_equal' declared 'static' but never defined [-Wunused-function]
>   599 | regulator_is_equal(struct regulator *reg1, struct regulator *reg2);
>       | ^~~~~~~~~~~~~~~~~~
> In file included from include/linux/phy/phy.h:17,
>                  from include/linux/usb/otg.h:13,
>                  from include/linux/usb/of.h:12,
>                  from drivers/usb/core/usb.c:42:
> include/linux/regulator/consumer.h:600:1: error: expected identifier or '(' before '{' token
>   600 | {
>       | ^
> include/linux/regulator/consumer.h:599:1: warning: 'regulator_is_equal' declared 'static' but never defined [-Wunused-function]
>   599 | regulator_is_equal(struct regulator *reg1, struct regulator *reg2);
>       | ^~~~~~~~~~~~~~~~~~
> In file included from include/linux/phy/phy.h:17,
>                  from include/linux/usb/otg.h:13,
>                  from include/linux/usb/of.h:12,
>                  from drivers/usb/core/of.c:12:
> include/linux/regulator/consumer.h:600:1: error: expected identifier or '(' before '{' token
>   600 | {
>       | ^
> In file included from include/linux/phy/phy.h:17,
>                  from include/linux/usb/otg.h:13,
>                  from include/linux/usb/of.h:12,
>                  from drivers/usb/core/of.c:12:
> include/linux/regulator/consumer.h:599:1: warning: 'regulator_is_equal' declared 'static' but never defined [-Wunused-function]
>   599 | regulator_is_equal(struct regulator *reg1, struct regulator *reg2);
>       | ^~~~~~~~~~~~~~~~~~
> In file included from include/linux/phy/phy.h:17,
>                  from drivers/ata/ahci.h:25,
>                  from drivers/ata/libahci.c:32:
> include/linux/regulator/consumer.h:600:1: error: expected identifier or '(' before '{' token
>   600 | {
>       | ^
> include/linux/regulator/consumer.h:599:1: warning: 'regulator_is_equal' declared 'static' but never defined [-Wunused-function]
>   599 | regulator_is_equal(struct regulator *reg1, struct regulator *reg2);
>       | ^~~~~~~~~~~~~~~~~~
> In file included from include/linux/phy/phy.h:17,
>                  from drivers/usb/core/hcd.c:35:
> include/linux/regulator/consumer.h:600:1: error: expected identifier or '(' before '{' token
>   600 | {
>       | ^
> include/linux/regulator/consumer.h:599:1: warning: 'regulator_is_equal' declared 'static' but never defined [-Wunused-function]
>   599 | regulator_is_equal(struct regulator *reg1, struct regulator *reg2);
>       | ^~~~~~~~~~~~~~~~~~
> In file included from include/linux/phy/phy.h:17,
>                  from drivers/ata/sata_mv.c:50:
> include/linux/regulator/consumer.h:600:1: error: expected identifier or '(' before '{' token
>   600 | {
>       | ^
> include/linux/regulator/consumer.h:599:1: warning: 'regulator_is_equal' declared 'static' but never defined [-Wunused-function]
>   599 | regulator_is_equal(struct regulator *reg1, struct regulator *reg2);
>       | ^~~~~~~~~~~~~~~~~~
> In file included from include/linux/phy/phy.h:17,
>                  from include/linux/usb/otg.h:13,
>                  from include/linux/usb/of.h:12,
>                  from drivers/usb/core/message.c:21:
> include/linux/regulator/consumer.h:600:1: error: expected identifier or '(' before '{' token
>   600 | {
>       | ^
> include/linux/regulator/consumer.h:599:1: warning: 'regulator_is_equal' declared 'static' but never defined [-Wunused-function]
>   599 | regulator_is_equal(struct regulator *reg1, struct regulator *reg2);
>       | ^~~~~~~~~~~~~~~~~~
> In file included from include/linux/phy/phy.h:17,
>                  from include/linux/usb/otg.h:13,
>                  from drivers/usb/core/hub.c:26:
> include/linux/regulator/consumer.h:600:1: error: expected identifier or '(' before '{' token
>   600 | {
>       | ^
> include/linux/regulator/consumer.h:599:1: warning: 'regulator_is_equal' declared 'static' but never defined [-Wunused-function]
>   599 | regulator_is_equal(struct regulator *reg1, struct regulator *reg2);
>       | ^~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   b059b7e0ec32 ("regulator: core: Add regulator_is_equal() helper")
> 
> I have added the following fix patch for today.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 15 Jan 2020 11:58:36 +1100
> Subject: [PATCH] fix for "regulator: core: Add regulator_is_equal() helper"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  include/linux/regulator/consumer.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/regulator/consumer.h b/include/linux/regulator/consumer.h
> index 2c89d886595c..6a92fd3105a3 100644
> --- a/include/linux/regulator/consumer.h
> +++ b/include/linux/regulator/consumer.h
> @@ -596,7 +596,7 @@ regulator_bulk_set_supply_names(struct regulator_bulk_data *consumers,
>  }
>  
>  static inline bool
> -regulator_is_equal(struct regulator *reg1, struct regulator *reg2);
> +regulator_is_equal(struct regulator *reg1, struct regulator *reg2)
>  {
>  	return false;
>  }

Sorry for the breakage, thanks for the patch.

Acked-by: Marek Vasut <marex@denx.de>
