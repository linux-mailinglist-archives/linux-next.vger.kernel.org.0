Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE4818F240
	for <lists+linux-next@lfdr.de>; Mon, 23 Mar 2020 10:57:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727831AbgCWJ5R (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Mar 2020 05:57:17 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:45965 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727761AbgCWJ5R (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 23 Mar 2020 05:57:17 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 0BB825C0103;
        Mon, 23 Mar 2020 05:57:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 23 Mar 2020 05:57:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=sZsRjJGKL3+lzrSQCOmN0+4i4vo
        9aQwP9g+5evcqicI=; b=QzErKeKCMKJ2WMZLBjHYUtAovNR5hez7IMDFYvbJvPw
        Peoofk4TVbCKK/jFjOpgW7ofbw15j3Ql3bJrQKVD8bDtGJFSpyaC5RYaNy0S0pqc
        GrToW2cPMKfjnlAh8LGA8RQB5S1owAcnHRALztH0DpEBvp6QI2PzW4vZ6gARDA0w
        VcEJOoeSrFx5uH+jqYKdI/3+U1+FMGpfadaV+t2i0WxK7kjcSxmoxjsVrhqrIBtL
        +HTcWvKYWgXZB5Qp/VEpcTJng//As8l828+nUAurDSuW1nMHP5tUdniR+nQAYPtf
        p8AHDlfNLZoYiKyWkcORJGg6M9anusvbrZMYc2R1ScA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=sZsRjJ
        GKL3+lzrSQCOmN0+4i4vo9aQwP9g+5evcqicI=; b=afraNww6yjHOtzYiKDQcAE
        YwJgtkd9XYaFdzmOGQIByCZTB5hTexUTEYuifY7Nm5K8U9t8+agxFE4QW5xLcyDN
        FH4EvMxYFHle2C1tpxYnR5ifFVaNbetOfyB8Y8mj90rnUvQYfFa7HZP82N68O8kk
        Y/Q4bkIc+0/0eOXP2PMUCa3qpdQ5q43gE8Jtsgc3N8YoWPxYLpj0ZzfexlT0yBEf
        z85JNp9YCFkDJ7PAmpmrX1l/QljNetUw38ZAlDW3PRJxGl4JCmd5xQdDJ8e6jxwU
        Pv6rHhmSMF7QZmUiTQevjdDpMfYGb5JswtuJ+N/HQCcDQBIWIDLa0HbA+Rzxht1w
        ==
X-ME-Sender: <xms:-od4XpSs25QUjxlFw1DAZECaD0nN3xldoIZA_diIZN9zYRVBZfRMEg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudegkedgtdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucfkphepkeefrdekiedrkeelrddutd
    ejnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepghhr
    vghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:-od4XoQJkHXtA6dQfi1DaIqCL9cl2CZBTSIUL_lYIWJdk_4Nzwb-fA>
    <xmx:-od4Xt52j9-XR8oeLh-6W43F18ahqW-j3xA4sZhCf-SQOWlQ-Wmo_g>
    <xmx:-od4XlUeIvcaw3xcYQ8QoYvs7p_V5OH29cUVLWxn4ryAK66epS35Bg>
    <xmx:_Id4Xtxch6j6xIMb4wRPAItQ_Pagz_-6slaR1N52QJ99u3IXaKtBKg>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 0D63B328005D;
        Mon, 23 Mar 2020 05:57:13 -0400 (EDT)
Date:   Mon, 23 Mar 2020 10:57:12 +0100
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the
 drivers-x86 tree
Message-ID: <20200323095712.GD425358@kroah.com>
References: <20200323143816.345b3d54@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200323143816.345b3d54@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Mar 23, 2020 at 02:38:16PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the driver-core tree got a conflict in:
> 
>   drivers/platform/x86/Kconfig
> 
> between commit:
> 
>   45a3d578f2ed ("platform/x86: Kconfig: Group modules by companies and functions")
> 
> from the drivers-x86 tree and commit:
> 
>   835e1b86ef8c ("platform/x86: touchscreen_dmi: Add EFI embedded firmware info support")
> 
> from the driver-core tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc drivers/platform/x86/Kconfig
> index ae75b19e8649,cd9e2758c479..000000000000
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@@ -1134,46 -978,54 +1134,47 @@@ config TOPSTAR_LAPTO
>   	depends on ACPI
>   	depends on INPUT
>   	select INPUT_SPARSEKMAP
>  -	help
>  -	  This driver provides support for the Intel Virtual Button interface.
>  -	  Some laptops require this driver for power button support.
>  -
>  -	  To compile this driver as a module, choose M here: the module will
>  -	  be called intel_vbtn.
>  -
>  -config INTEL_SCU_IPC
>  -	bool "Intel SCU IPC Support"
>  -	depends on X86_INTEL_MID
>  -	default y
>  +	select LEDS_CLASS
>  +	select NEW_LEDS
>   	---help---
>  -	  IPC is used to bridge the communications between kernel and SCU on
>  -	  some embedded Intel x86 platforms. This is not needed for PC-type
>  -	  machines.
>  +	  This driver adds support for hotkeys found on Topstar laptops.
>   
>  -config INTEL_SCU_IPC_UTIL
>  -	tristate "Intel SCU IPC utility driver"
>  -	depends on INTEL_SCU_IPC
>  -	---help---
>  -	  The IPC Util driver provides an interface with the SCU enabling
>  -	  low level access for debug work and updating the firmware. Say
>  -	  N unless you will be doing this on an Intel MID platform.
>  +	  If you have a Topstar laptop, say Y or M here.
>   
>  -config INTEL_MID_POWER_BUTTON
>  -	tristate "power button driver for Intel MID platforms"
>  -	depends on INTEL_SCU_IPC && INPUT
>  +config I2C_MULTI_INSTANTIATE
>  +	tristate "I2C multi instantiate pseudo device driver"
>  +	depends on I2C && ACPI
>   	help
>  -	  This driver handles the power button on the Intel MID platforms.
>  +	  Some ACPI-based systems list multiple i2c-devices in a single ACPI
>  +	  firmware-node. This driver will instantiate separate i2c-clients
>  +	  for each device in the firmware-node.
>   
>  -	  If unsure, say N.
>  +	  To compile this driver as a module, choose M here: the module
>  +	  will be called i2c-multi-instantiate.
>   
>  -config INTEL_MFLD_THERMAL
>  -       tristate "Thermal driver for Intel Medfield platform"
>  -       depends on MFD_INTEL_MSIC && THERMAL
>  -       help
>  -         Say Y here to enable thermal driver support for the  Intel Medfield
>  -         platform.
>  +config MLX_PLATFORM
>  +	tristate "Mellanox Technologies platform support"
>  +	depends on I2C && REGMAP
>  +	---help---
>  +	  This option enables system support for the Mellanox Technologies
>  +	  platform. The Mellanox systems provide data center networking
>  +	  solutions based on Virtual Protocol Interconnect (VPI) technology
>  +	  enable seamless connectivity to 56/100Gb/s InfiniBand or 10/40/56GbE
>  +	  connection.
>   
>  -config INTEL_IPS
>  -	tristate "Intel Intelligent Power Sharing"
>  -	depends on ACPI && PCI
>  +	  If you have a Mellanox system, say Y or M here.
>  +
>  +config TOUCHSCREEN_DMI
>  +	bool "DMI based touchscreen configuration info"
>  +	depends on ACPI && DMI && I2C=y && TOUCHSCREEN_SILEAD
> ++	select EFI_EMBEDDED_FIRMWARE if EFI
>   	---help---
>  -	  Intel Calpella platforms support dynamic power sharing between the
>  -	  CPU and GPU, maximizing performance in a given TDP.  This driver,
>  -	  along with the CPU frequency and i915 drivers, provides that
>  -	  functionality.  If in doubt, say Y here; it will only load on
>  -	  supported platforms.
>  +	  Certain ACPI based tablets with e.g. Silead or Chipone touchscreens
>  +	  do not have enough data in ACPI tables for the touchscreen driver to
>  +	  handle the touchscreen properly, as OEMs expect the data to be baked
>  +	  into the tablet model specific version of the driver shipped with the
>  +	  the OS-image for the device. This option supplies the missing info.
>  +	  Enable this for x86 tablets with Silead or Chipone touchscreens.
>   
>   config INTEL_IMR
>   	bool "Intel Isolated Memory Region support"



Looks good, thanks.

greg k-h
