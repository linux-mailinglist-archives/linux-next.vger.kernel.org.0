Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C74DD221C92
	for <lists+linux-next@lfdr.de>; Thu, 16 Jul 2020 08:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727119AbgGPGYM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Jul 2020 02:24:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:50546 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726141AbgGPGYL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 16 Jul 2020 02:24:11 -0400
Received: from localhost (unknown [122.171.202.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4611A206F5;
        Thu, 16 Jul 2020 06:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594880651;
        bh=Z/nrTcXcFk5J/58Hd9SKJQ2QPGf+Bc9TRddt07uYXJ4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J1+Y5vDv98bZYgYKLHiON0mpd/bJAW/JRJIdHK5gRELyyKKz6ZDiJO0BDj9Ejrlvv
         KX36RQTyBVP96DWYJTp/OHW4rg6XkM0uK+fOJScU6N06KiSXEMrxtEUtO/oILiqfOn
         IVWiQoPGzHyRam56Su9cKc1ueWxKpPCrlEz6ZxRY=
Date:   Thu, 16 Jul 2020 11:54:06 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: linux-next: Tree for Jul 15
 (drivers/phy/allwinner/phy-sun4i-usb.c)
Message-ID: <20200716062406.GG55478@vkoul-mobl>
References: <20200715180551.64d8d21e@canb.auug.org.au>
 <edd798bb-ee51-bb99-b885-682489e7fda5@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <edd798bb-ee51-bb99-b885-682489e7fda5@infradead.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 15-07-20, 08:18, Randy Dunlap wrote:
> On 7/15/20 1:05 AM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20200714:
> > 
> 
> on x86_64:
> # CONFIG_GPIOLIB is not set
> 
> ../drivers/phy/allwinner/phy-sun4i-usb.c: In function ‘sun4i_usb_phy0_get_id_det’:
> ../drivers/phy/allwinner/phy-sun4i-usb.c:367:11: error: implicit declaration of function ‘gpiod_get_value_cansleep’; did you mean ‘gpio_get_value_cansleep’? [-Werror=implicit-function-declaration]
>     return gpiod_get_value_cansleep(data->id_det_gpio);
>            ^~~~~~~~~~~~~~~~~~~~~~~~
>            gpio_get_value_cansleep
>   CC      fs/bad_inode.o
> ../drivers/phy/allwinner/phy-sun4i-usb.c: In function ‘sun4i_usb_phy_probe’:
> ../drivers/phy/allwinner/phy-sun4i-usb.c:707:22: error: implicit declaration of function ‘devm_gpiod_get_optional’; did you mean ‘devm_clk_get_optional’? [-Werror=implicit-function-declaration]
>   data->id_det_gpio = devm_gpiod_get_optional(dev, "usb0_id_det",
>                       ^~~~~~~~~~~~~~~~~~~~~~~
>                       devm_clk_get_optional
> ../drivers/phy/allwinner/phy-sun4i-usb.c:708:11: error: ‘GPIOD_IN’ undeclared (first use in this function); did you mean ‘GPIOF_IN’?
>            GPIOD_IN);
>            ^~~~~~~~
>            GPIOF_IN
> ../drivers/phy/allwinner/phy-sun4i-usb.c:708:11: note: each undeclared identifier is reported only once for each function it appears in
> ../drivers/phy/allwinner/phy-sun4i-usb.c:815:21: error: implicit declaration of function ‘gpiod_to_irq’; did you mean ‘gpio_to_irq’? [-Werror=implicit-function-declaration]
>   data->id_det_irq = gpiod_to_irq(data->id_det_gpio);
>                      ^~~~~~~~~~~~
>                      gpio_to_irq
> 
> 
> Full randconfig file is attached.

Thanks Randy for the report, it is fixed by adding the right gpio
header, sending a patch now

-- 
~Vinod
