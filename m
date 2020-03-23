Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80E7418F3DD
	for <lists+linux-next@lfdr.de>; Mon, 23 Mar 2020 12:43:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728151AbgCWLnn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Mar 2020 07:43:43 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:36624 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728115AbgCWLnn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 23 Mar 2020 07:43:43 -0400
Received: by mail-pj1-f65.google.com with SMTP id nu11so5980854pjb.1;
        Mon, 23 Mar 2020 04:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0JOxub9d4VjSXMXskvu51BJ1QSfTigyzc+ouxeQXEaA=;
        b=S9OGfzCzXIcIMKESKPTI8raOcWYhYOumisUPYKGxWopELZnGo5EDBHP/9ZZS5gbe2w
         /VTjACjsW0S8pFuQGPsuNAD02f/dEozjEJFpH5Z1GV7cWF8qnArzU276bY5yjQSo9nIz
         X73BPjrLKVNUTOwzrSuYKxnKHFcTqFBAzwoeL6W5vJCUg40UR2s1Y2qDM6AUAoDaKJed
         btej/h4t866SU5t06/GAQEmKvVjlUHZY8h40F+nfPoJ1oLfDWeUCLdAl+vi6KMqt9oOv
         BGeMy3giOF5S5/Mmt/bOMKFKK/A7lvtg5zZsbFXTDjKNyPeMKWq1GNyJTEPgCHccCcSr
         ewIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0JOxub9d4VjSXMXskvu51BJ1QSfTigyzc+ouxeQXEaA=;
        b=Ih3JJyT6aNicrBjzXNw/Q0CizylZFqDORNSptfhlvt1nr/1doWkqaPP1q+MBofbGn7
         YWdIUuZUXucYfrf1+xrfDbVIPwsXbDKBi/yMivR1uQZMYml/UuDw5Rk+VFZ1VMKOmzVU
         DYXMxx3mTvaKXZOFl1FwWF5XtMtlP8FnOpc29FPkT2L4FWtEfYjU49yEaYnnCm01YzVn
         juRzJL8Y0jHdupwe0ME4WtPymxYgKeUpmP4uWhnFhBY3g/92eHAzxIeR3uh0Vg41Cn+e
         uG1QjkBRIW8TRGxe1aZ6s9PJNDsqGcRYbFrhJFYrT9L/3ARk73wmi6BS62YdYutDuWM0
         oNvg==
X-Gm-Message-State: ANhLgQ2vQKduxw7COvRi3P+0qiTQfb9JcbQ2uNuR3wnB0BmrEqytP+D2
        SfJUU8SC8Ge30kUHU+QGqMQ9kM6A9bcNyO2eGpA=
X-Google-Smtp-Source: ADFU+vuipq4kIJ7C8yZtaz5IdeyNyOaNs3ZibsKgTMdYID/vP2bcwGDGGG4hdry0X8YTgQB/Xzpul6noFe7xvMN8AYs=
X-Received: by 2002:a17:90a:8403:: with SMTP id j3mr25160854pjn.8.1584963820252;
 Mon, 23 Mar 2020 04:43:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200323143816.345b3d54@canb.auug.org.au>
In-Reply-To: <20200323143816.345b3d54@canb.auug.org.au>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 23 Mar 2020 13:43:32 +0200
Message-ID: <CAHp75Vfozkw2sBwLO95EEsW955Wqi9G1JOW-zpretnhHS2waSA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the
 drivers-x86 tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Greg KH <greg@kroah.com>, Darren Hart <dvhart@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Mar 23, 2020 at 5:38 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
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

Thank you, Stephen, looks good to me!

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
>         depends on ACPI
>         depends on INPUT
>         select INPUT_SPARSEKMAP
>  -      help
>  -        This driver provides support for the Intel Virtual Button interface.
>  -        Some laptops require this driver for power button support.
>  -
>  -        To compile this driver as a module, choose M here: the module will
>  -        be called intel_vbtn.
>  -
>  -config INTEL_SCU_IPC
>  -      bool "Intel SCU IPC Support"
>  -      depends on X86_INTEL_MID
>  -      default y
>  +      select LEDS_CLASS
>  +      select NEW_LEDS
>         ---help---
>  -        IPC is used to bridge the communications between kernel and SCU on
>  -        some embedded Intel x86 platforms. This is not needed for PC-type
>  -        machines.
>  +        This driver adds support for hotkeys found on Topstar laptops.
>
>  -config INTEL_SCU_IPC_UTIL
>  -      tristate "Intel SCU IPC utility driver"
>  -      depends on INTEL_SCU_IPC
>  -      ---help---
>  -        The IPC Util driver provides an interface with the SCU enabling
>  -        low level access for debug work and updating the firmware. Say
>  -        N unless you will be doing this on an Intel MID platform.
>  +        If you have a Topstar laptop, say Y or M here.
>
>  -config INTEL_MID_POWER_BUTTON
>  -      tristate "power button driver for Intel MID platforms"
>  -      depends on INTEL_SCU_IPC && INPUT
>  +config I2C_MULTI_INSTANTIATE
>  +      tristate "I2C multi instantiate pseudo device driver"
>  +      depends on I2C && ACPI
>         help
>  -        This driver handles the power button on the Intel MID platforms.
>  +        Some ACPI-based systems list multiple i2c-devices in a single ACPI
>  +        firmware-node. This driver will instantiate separate i2c-clients
>  +        for each device in the firmware-node.
>
>  -        If unsure, say N.
>  +        To compile this driver as a module, choose M here: the module
>  +        will be called i2c-multi-instantiate.
>
>  -config INTEL_MFLD_THERMAL
>  -       tristate "Thermal driver for Intel Medfield platform"
>  -       depends on MFD_INTEL_MSIC && THERMAL
>  -       help
>  -         Say Y here to enable thermal driver support for the  Intel Medfield
>  -         platform.
>  +config MLX_PLATFORM
>  +      tristate "Mellanox Technologies platform support"
>  +      depends on I2C && REGMAP
>  +      ---help---
>  +        This option enables system support for the Mellanox Technologies
>  +        platform. The Mellanox systems provide data center networking
>  +        solutions based on Virtual Protocol Interconnect (VPI) technology
>  +        enable seamless connectivity to 56/100Gb/s InfiniBand or 10/40/56GbE
>  +        connection.
>
>  -config INTEL_IPS
>  -      tristate "Intel Intelligent Power Sharing"
>  -      depends on ACPI && PCI
>  +        If you have a Mellanox system, say Y or M here.
>  +
>  +config TOUCHSCREEN_DMI
>  +      bool "DMI based touchscreen configuration info"
>  +      depends on ACPI && DMI && I2C=y && TOUCHSCREEN_SILEAD
> ++      select EFI_EMBEDDED_FIRMWARE if EFI
>         ---help---
>  -        Intel Calpella platforms support dynamic power sharing between the
>  -        CPU and GPU, maximizing performance in a given TDP.  This driver,
>  -        along with the CPU frequency and i915 drivers, provides that
>  -        functionality.  If in doubt, say Y here; it will only load on
>  -        supported platforms.
>  +        Certain ACPI based tablets with e.g. Silead or Chipone touchscreens
>  +        do not have enough data in ACPI tables for the touchscreen driver to
>  +        handle the touchscreen properly, as OEMs expect the data to be baked
>  +        into the tablet model specific version of the driver shipped with the
>  +        the OS-image for the device. This option supplies the missing info.
>  +        Enable this for x86 tablets with Silead or Chipone touchscreens.
>
>   config INTEL_IMR
>         bool "Intel Isolated Memory Region support"



-- 
With Best Regards,
Andy Shevchenko
