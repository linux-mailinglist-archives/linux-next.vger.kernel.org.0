Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14885312ABF
	for <lists+linux-next@lfdr.de>; Mon,  8 Feb 2021 07:34:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbhBHGdZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Feb 2021 01:33:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:55342 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229821AbhBHGbl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 8 Feb 2021 01:31:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E3C5864E59;
        Mon,  8 Feb 2021 06:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612765843;
        bh=S/icdn535lryv9nbPE2ylA0wWXfxmpt/hfxjkhjIREY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=E/rZHuycGv4iCvWHONIDnd5aUj63tpmwtRs1dcO6TZFkmgqLVxpmLtjUcc95pPDt0
         Zr+yskLca53LEIMnTUmG31roGBReTWtS+iEn1+6nF5EPGNH7IMFFZS9eJV9YYRWO7p
         0oVjeklkinwVElhwWKDAjbqpQzeX6+Zfhwv/dxL8INwkvr6Tz4ncideANoTyTBBEYh
         NrIbWdgcknuNIulDOSNuUP1Hl23MFl+aMshnh27Vg+49TIePFV5cer9n/x+Js6I0i7
         zqs3ve+HL7USEMTo+xHwSYqFpMirslgMsMCm9txf5OjtYtoTQhvE/IfE5irigY4BDa
         Gfpfmd4B7iFaQ==
Date:   Mon, 8 Feb 2021 07:30:37 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the v4l-dvb tree
Message-ID: <20210208073037.0b9fe4b9@coco.lan>
In-Reply-To: <20210208113208.35449879@canb.auug.org.au>
References: <20210208113208.35449879@canb.auug.org.au>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Em Mon, 8 Feb 2021 11:32:08 +1100
Stephen Rothwell <sfr@canb.auug.org.au> escreveu:

> Hi all,
> 
> After merging the v4l-dvb tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_serial_link' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_configure_i2c' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_high_threshold' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_configure_gmsl_link' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_clear_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_enable_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_disable_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_verify_id' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_address' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_deserializer_address' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_translation' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> 
> Introduced by commit
> 
>   a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module")
> 

It sounds to be due to a Makefile mess:

	drivers/media/i2c/Makefile:rdacm20-camera_module-objs   := rdacm20.o max9271.o
	drivers/media/i2c/Makefile:rdacm21-camera_module-objs   := rdacm21.o max9271.o

Neither drivers should be including max9271.o as their objects, but, instead,
be addressing max9271 dependency via Kconfig.

Thanks,
Mauro
