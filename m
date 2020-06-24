Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E293207703
	for <lists+linux-next@lfdr.de>; Wed, 24 Jun 2020 17:15:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404271AbgFXPPU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Jun 2020 11:15:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404052AbgFXPPU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Jun 2020 11:15:20 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1CF6C061573
        for <linux-next@vger.kernel.org>; Wed, 24 Jun 2020 08:15:18 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id s10so1887528oih.10
        for <linux-next@vger.kernel.org>; Wed, 24 Jun 2020 08:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kyLX8XtKSQSzf1u6tUVRGJzXgpczRRSln3I+Nwk++to=;
        b=Vj1AKSYSjNfcC1ZEGsOotC3bvnMg/g3G6pdJ1ezAjge4evUCcp6G54UVl+P0pl2XZ9
         D5PYHPbigj3NQsF43eqvZMOMXqnHeLeqmbwUWm5N4ZXQ+iaC9sLoGXyOwfQBaN/xdGxF
         EX9STuY8CFF+v0Roz73C7FMcFUfGJuvS+ppHUZc6jzJwhekuT3NkkyzQQsgpiq95a89f
         sMSbPPC9pem/c0dzqukXGni1r3DXchx1qsDuoXeJ8V6ZXR/Yw/0XxhhlW0ONpsDNdyPq
         m0oiQrwmvjNBFHhU9los18X9rXQNu4pOPm2EZCzgbGK7VOZZGektkzCEBs/Z3B/iprcG
         bvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kyLX8XtKSQSzf1u6tUVRGJzXgpczRRSln3I+Nwk++to=;
        b=PPK3YUJHIWQLitNmnWeaUbagW5KVjtBYcr1CWCxn4uRDDsiefMHN78awGPhCj6h2Mj
         9V9CvzRCzS+pKB6MOGubdgDdi0X71KX9k1LIgHb6LY9dlepIubrPqoc4xM0F3Afi+f3S
         fNVUsjwe/AqiVP74Yz9so00l0F5z5C8xdNAf4H8zovRaLlDCdVOMCc6ynKITKs2/wj6W
         8ES4gr1FZaBVBPYkJP6pyiavm6dHIvsrSkTNDrTxjDA/oY3sbzFXiHL4NXAIp6k4Aa6r
         fFYG9rdByp3FevETWYlJ7GtmqmL3UXua72v6NyF2zPOaq8RpHlgCzCWHlagAQdkNR1Be
         z9nA==
X-Gm-Message-State: AOAM533qJOxcExiusnLatwFiX/uADa5ips6/FXifHmWSDDVPezg5hv9g
        dqJ1tNtV7RV1e2ahY8js2jCOKDZOF686i7NwUgIh8Q==
X-Google-Smtp-Source: ABdhPJzCR3yd5XHXF9590lIiwlLynD3w2IpHXEDDTWn+2h5TtW5v8YCR6G6I4/aCJNPxCV49xX4Wa8O69i9VV7cQUtI=
X-Received: by 2002:aca:554c:: with SMTP id j73mr21109662oib.172.1593011717984;
 Wed, 24 Jun 2020 08:15:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200624095007.141f0357@canb.auug.org.au>
In-Reply-To: <20200624095007.141f0357@canb.auug.org.au>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Wed, 24 Jun 2020 08:15:06 -0700
Message-ID: <CAJ+vNU25ycoSGros7_SbHfZ4ShP5=oT2RMM74OtCsk6B3k2Bhg@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the imx-mxs tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jun 23, 2020 at 4:50 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the imx-mxs tree, today's linux-next build (arm
> multi_v7_defconfig) produced these warnings:
>
> arch/arm/boot/dts/imx6qdl-gw53xx.dtsi:350.4-27: Warning (reg_format): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0:reg: property has invalid length (20 bytes) (#address-cells == 2, #size-cells == 1)
> arch/arm/boot/dts/imx6qdl-gw53xx.dtsi:353.5-28: Warning (reg_format): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,4,0:reg: property has invalid length (20 bytes) (#address-cells == 2, #size-cells == 1)
> arch/arm/boot/dts/imx6qdl-gw53xx.dtsi:356.6-29: Warning (reg_format): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,4,0/pcie@4,0,0:reg: property has invalid length (20 bytes) (#address-cells == 2, #size-cells == 1)
> arch/arm/boot/dts/imx6dl-gw53xx.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
> arch/arm/boot/dts/imx6dl-gw53xx.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
> arch/arm/boot/dts/imx6dl-gw53xx.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
> arch/arm/boot/dts/imx6qdl-gw53xx.dtsi:349.14-360.5: Warning (avoid_default_addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0: Relying on default #address-cells value
> arch/arm/boot/dts/imx6qdl-gw53xx.dtsi:349.14-360.5: Warning (avoid_default_addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0: Relying on default #size-cells value
> arch/arm/boot/dts/imx6qdl-gw53xx.dtsi:352.15-359.6: Warning (avoid_default_addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,4,0: Relying on default #address-cells value
> arch/arm/boot/dts/imx6qdl-gw53xx.dtsi:352.15-359.6: Warning (avoid_default_addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,4,0: Relying on default #size-cells value
> arch/arm/boot/dts/imx6qdl-gw53xx.dtsi:355.22-358.7: Warning (avoid_default_addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,4,0/pcie@4,0,0: Relying on default #address-cells value
> arch/arm/boot/dts/imx6qdl-gw53xx.dtsi:355.22-358.7: Warning (avoid_default_addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,4,0/pcie@4,0,0: Relying on default #size-cells value
> arch/arm/boot/dts/imx6qdl-gw54xx.dtsi:407.4-27: Warning (reg_format): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0:reg: property has invalid length (20 bytes) (#address-cells == 2, #size-cells == 1)
> arch/arm/boot/dts/imx6qdl-gw54xx.dtsi:410.5-28: Warning (reg_format): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,8,0:reg: property has invalid length (20 bytes) (#address-cells == 2, #size-cells == 1)
> arch/arm/boot/dts/imx6qdl-gw54xx.dtsi:413.6-29: Warning (reg_format): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,8,0/pcie@8,0,0:reg: property has invalid length (20 bytes) (#address-cells == 2, #size-cells == 1)
> arch/arm/boot/dts/imx6dl-gw54xx.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
> arch/arm/boot/dts/imx6dl-gw54xx.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
> arch/arm/boot/dts/imx6dl-gw54xx.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
> arch/arm/boot/dts/imx6qdl-gw54xx.dtsi:406.14-417.5: Warning (avoid_default_addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0: Relying on default #address-cells value
> arch/arm/boot/dts/imx6qdl-gw54xx.dtsi:406.14-417.5: Warning (avoid_default_addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0: Relying on default #size-cells value
> arch/arm/boot/dts/imx6qdl-gw54xx.dtsi:409.15-416.6: Warning (avoid_default_addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,8,0: Relying on default #address-cells value
> arch/arm/boot/dts/imx6qdl-gw54xx.dtsi:409.15-416.6: Warning (avoid_default_addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,8,0: Relying on default #size-cells value
> arch/arm/boot/dts/imx6qdl-gw54xx.dtsi:412.22-415.7: Warning (avoid_default_addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,8,0/pcie@8,0,0: Relying on default #address-cells value
> arch/arm/boot/dts/imx6qdl-gw54xx.dtsi:412.22-415.7: Warning (avoid_default_addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,8,0/pcie@8,0,0: Relying on default #size-cells value
> arch/arm/boot/dts/imx6qdl-gw53xx.dtsi:350.4-27: Warning (reg_format): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0:reg: property has invalid length (20 bytes) (#address-cells == 2, #size-cells == 1)
> arch/arm/boot/dts/imx6qdl-gw53xx.dtsi:353.5-28: Warning (reg_format): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,4,0:reg: property has invalid length (20 bytes) (#address-cells == 2, #size-cells == 1)
> arch/arm/boot/dts/imx6qdl-gw53xx.dtsi:356.6-29: Warning (reg_format): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,4,0/pcie@4,0,0:reg: property has invalid length (20 bytes) (#address-cells == 2, #size-cells == 1)
> arch/arm/boot/dts/imx6q-gw53xx.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
> arch/arm/boot/dts/imx6q-gw53xx.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
> arch/arm/boot/dts/imx6q-gw53xx.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
> arch/arm/boot/dts/imx6qdl-gw53xx.dtsi:349.14-360.5: Warning (avoid_default_addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0: Relying on default #address-cells value
> arch/arm/boot/dts/imx6qdl-gw53xx.dtsi:349.14-360.5: Warning (avoid_default_addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0: Relying on default #size-cells value
> arch/arm/boot/dts/imx6qdl-gw53xx.dtsi:352.15-359.6: Warning (avoid_default_addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,4,0: Relying on default #address-cells value
> arch/arm/boot/dts/imx6qdl-gw53xx.dtsi:352.15-359.6: Warning (avoid_default_addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,4,0: Relying on default #size-cells value
> arch/arm/boot/dts/imx6qdl-gw53xx.dtsi:355.22-358.7: Warning (avoid_default_addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,4,0/pcie@4,0,0: Relying on default #address-cells value
> arch/arm/boot/dts/imx6qdl-gw53xx.dtsi:355.22-358.7: Warning (avoid_default_addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,4,0/pcie@4,0,0: Relying on default #size-cells value
> arch/arm/boot/dts/imx6qdl-gw54xx.dtsi:407.4-27: Warning (reg_format): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0:reg: property has invalid length (20 bytes) (#address-cells == 2, #size-cells == 1)
> arch/arm/boot/dts/imx6qdl-gw54xx.dtsi:410.5-28: Warning (reg_format): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,8,0:reg: property has invalid length (20 bytes) (#address-cells == 2, #size-cells == 1)
> arch/arm/boot/dts/imx6qdl-gw54xx.dtsi:413.6-29: Warning (reg_format): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,8,0/pcie@8,0,0:reg: property has invalid length (20 bytes) (#address-cells == 2, #size-cells == 1)
> arch/arm/boot/dts/imx6q-gw54xx.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
> arch/arm/boot/dts/imx6q-gw54xx.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
> arch/arm/boot/dts/imx6q-gw54xx.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
> arch/arm/boot/dts/imx6qdl-gw54xx.dtsi:406.14-417.5: Warning (avoid_default_addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0: Relying on default #address-cells value
> arch/arm/boot/dts/imx6qdl-gw54xx.dtsi:406.14-417.5: Warning (avoid_default_addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0: Relying on default #size-cells value
> arch/arm/boot/dts/imx6qdl-gw54xx.dtsi:409.15-416.6: Warning (avoid_default_addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,8,0: Relying on default #address-cells value
> arch/arm/boot/dts/imx6qdl-gw54xx.dtsi:409.15-416.6: Warning (avoid_default_addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,8,0: Relying on default #size-cells value
> arch/arm/boot/dts/imx6qdl-gw54xx.dtsi:412.22-415.7: Warning (avoid_default_addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,8,0/pcie@8,0,0: Relying on default #address-cells value
> arch/arm/boot/dts/imx6qdl-gw54xx.dtsi:412.22-415.7: Warning (avoid_default_addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,8,0/pcie@8,0,0: Relying on default #size-cells value
>
> Introduced by commits
>
>   26d7c769d460 ("ARM: dts: imx6qdl-gw53xx: allow boot firmware to set eth1 MAC")
>   48d799918adf ("ARM: dts: imx6qdl-gw54xx: allow boot firmware to set eth1 MAC")
>

Stephen,

Thanks for the catch - sorry about that. I will submit a new version
of those that have the missing #address-cells and #size-cells that
caused the warnings.

Tim
