Return-Path: <linux-next+bounces-8376-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A136B85EF2
	for <lists+linux-next@lfdr.de>; Thu, 18 Sep 2025 18:16:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 427474A0877
	for <lists+linux-next@lfdr.de>; Thu, 18 Sep 2025 16:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9FBB242D63;
	Thu, 18 Sep 2025 16:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vS7mAxYI"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A7B220F5C;
	Thu, 18 Sep 2025 16:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758212172; cv=none; b=SD+9QmT9BirDWP+SZoHGz9EP74pefuvKlqS+DqMROUOb3k8/peOjS0WHiB+SUh3S2Uyw0kNUefjwk+efH1jXsXIrvgBiNdcaVtP8U5ciBiQGi1QtqGFampt84ryEbP5pC4dsZuyOnU1crYMHa/Skvkg+OUfixusEBxwt58saHSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758212172; c=relaxed/simple;
	bh=t0gATf2rRf3r4s5DY5rn2twU0ZruscwR6dDmkSXx628=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KRvLR+OU4OBXZlwXbf0qz1aDKRduy/WGQREKDjIOGJBYb/WHJOiieumCwLrznuaYKJcFk459717V4rPcW03Dqb0OMidIMmuwaju/dRH1F7nVXUojAJK6cwz+BH7+2pvkeGarbqTuzC8Dp30log8dWLpoM9u4BRyw5rGQ+G7ErKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vS7mAxYI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D2AFC4CEE7;
	Thu, 18 Sep 2025 16:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1758212172;
	bh=t0gATf2rRf3r4s5DY5rn2twU0ZruscwR6dDmkSXx628=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vS7mAxYILfwxgEQJPmekQ/sj+T+KLhyGre8DkAX/uSLyoAhacxckBtG4jsGtPqek7
	 +MKy814UhRck438HccblxklWtBlMkTuLGnX7VymiF0226gqPd5Aye5+I2w7WhvebNc
	 hAyCWcpPuI6tFuHIKny5RlWnY4JcQ0ErBsqk+C88=
Date: Thu, 18 Sep 2025 18:16:07 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Hans de Goede <hansg@kernel.org>,
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Lee Jones <lee@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Ming Yu <a0282524688@gmail.com>
Subject: Re: linux-next: manual merge of the gpio-brgl tree with the usb tree
Message-ID: <2025091800-demeaning-gills-18df@gregkh>
References: <aMwUEV6nY4AaJT8X@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMwUEV6nY4AaJT8X@sirena.org.uk>

On Thu, Sep 18, 2025 at 03:15:45PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the gpio-brgl tree got a conflict in:
> 
>   drivers/i2c/busses/Kconfig
> 
> between commit:
> 
>   daf161343a390 ("i2c: Add Intel USBIO I2C driver")
> 
> from the usb tree and commit:
> 
>   c5cf27dbaeb6e ("i2c: Add Nuvoton NCT6694 I2C support")
> 
> from the gpio-brgl tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc drivers/i2c/busses/Kconfig
> index 9921fd9ea0983,63a2b5a9abc39..0000000000000
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@@ -1357,17 -1357,16 +1357,27 @@@ config I2C_LJC
>   	  This driver can also be built as a module.  If so, the module
>   	  will be called i2c-ljca.
>   
> + config I2C_NCT6694
> + 	tristate "Nuvoton NCT6694 I2C adapter support"
> + 	depends on MFD_NCT6694
> + 	help
> + 	  If you say yes to this option, support will be included for Nuvoton
> + 	  NCT6694, a USB to I2C interface.
> + 
> + 	  This driver can also be built as a module. If so, the module will
> + 	  be called i2c-nct6694.
> + 
>  +config I2C_USBIO
>  +	tristate "Intel USBIO I2C Adapter support"
>  +	depends on USB_USBIO
>  +	default USB_USBIO
>  +	help
>  +	  Select this option to enable I2C driver for the INTEL
>  +	  USBIO driver stack.
>  +
>  +	  This driver can also be built as a module.  If so, the module
>  +	  will be called i2c_usbio.
>  +
>   config I2C_CP2615
>   	tristate "Silicon Labs CP2615 USB sound card and I2C adapter"
>   	depends on USB
> diff --cc drivers/i2c/busses/Makefile
> index 401a79c9767e6,fe8cf6325fc98..0000000000000
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@@ -135,7 -135,7 +135,8 @@@ obj-$(CONFIG_I2C_GXP)		+= i2c-gxp.
>   obj-$(CONFIG_I2C_DIOLAN_U2C)	+= i2c-diolan-u2c.o
>   obj-$(CONFIG_I2C_DLN2)		+= i2c-dln2.o
>   obj-$(CONFIG_I2C_LJCA)		+= i2c-ljca.o
> + obj-$(CONFIG_I2C_NCT6694)	+= i2c-nct6694.o
>  +obj-$(CONFIG_I2C_USBIO)		+= i2c-usbio.o
>   obj-$(CONFIG_I2C_CP2615) += i2c-cp2615.o
>   obj-$(CONFIG_I2C_PARPORT)	+= i2c-parport.o
>   obj-$(CONFIG_I2C_PCI1XXXX)	+= i2c-mchp-pci1xxxx.o



Looks good to me, thanks!

greg k-h

