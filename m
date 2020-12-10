Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB0252D5431
	for <lists+linux-next@lfdr.de>; Thu, 10 Dec 2020 07:53:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387626AbgLJGvV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Dec 2020 01:51:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730932AbgLJGvR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Dec 2020 01:51:17 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2230EC0613D6;
        Wed,  9 Dec 2020 22:50:37 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id h18so3927490otq.12;
        Wed, 09 Dec 2020 22:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d75p4fmQcIoYTfVRN5/LQXekYssU3dbuRUo+X/xP0qo=;
        b=AcckApLQxgopq53MO6NXNCgMzDhabXdJ0YBSSvRxKNTga3m6MfV3kYBh5V1GX5GG37
         Z4wYQpIMkMu0sB93hngk6c1OGi3Y93Bj1sZNPrL0qgdvQtBw6shOdSMCK3GiBQqAQCUO
         muKde3styzwUylS5vK7Yu7CghtdQ139UowlpgnTVhokiquVCPFRHMItQ6QBCpQNrz71C
         wpU2bfC/SKCk3kzovzk9oGBXNUN9hwn31lQ3SdGnCDXx7csKWXTBx554A2pdyN2n7zGC
         htauwh5srbq4VECfNIGVZBV7fPz3TgdLJLd0JvcFpFeOFuePlXB54Qztw7R8UbKYjiDU
         17/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d75p4fmQcIoYTfVRN5/LQXekYssU3dbuRUo+X/xP0qo=;
        b=GKpZ6lS5wLcKds7J/r9j04Ak0M4wLl/lYXRQ8kFK85nkDrt9rn4INLLXuIqXkzU441
         EJ+g9SjmVg/uQgacQqaJGyN9a5dMjJLrU2AuCLG2N4sERlfA8i1f5khZhRdIrNTHcrXK
         YnHz51aacI/YiX/MapcwAnrQs+Sh8IqUauAkEfpsr0qDM8lqPW0jCqbRnzmjYynEEVU0
         g+DV+uC39LWJleZszSnRtmvm/xnvpM8jzQYz8tJ9bp32k5Oai54tYJLx6ySJ6RqR0KE8
         HVYueBipxtT5BhRLMk4bFpyR2vcPUDFtmeXM1j9zmdGmQkMmpU0RVuNe98iVtKaNkWQP
         FuQg==
X-Gm-Message-State: AOAM530Lxq+S7XJtEZTVQaZQ8m3L80N+oXbv8xyofCzOL9j5LcxygE6d
        duOv01RUyYp+4CdoSuFEPMIPwjkTSsE4dGAjFAGSisYM
X-Google-Smtp-Source: ABdhPJzkl5jegoJipOiVDt8wp+ap3KzjmSPKv0LRYwWHyaWZjcy/a1y4DDLc/cV+A69NiZMHgZrmEEnWArAoKINe+1E=
X-Received: by 2002:a9d:589:: with SMTP id 9mr4908951otd.72.1607583036573;
 Wed, 09 Dec 2020 22:50:36 -0800 (PST)
MIME-Version: 1.0
References: <20201210174047.3d1f8aaa@canb.auug.org.au>
In-Reply-To: <20201210174047.3d1f8aaa@canb.auug.org.au>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Thu, 10 Dec 2020 07:50:25 +0100
Message-ID: <CAMhs-H-Xv8V+pfAGZcURZrd7he6UGEadyAJvnoPSF03Y3RftTA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the staging tree with the phy-next tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Greg KH <greg@kroah.com>, Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Thu, Dec 10, 2020 at 7:40 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the staging tree got conflicts in:
>
>   drivers/staging/Kconfig
>   drivers/staging/Makefile
>
> between commit:
>
>   53e7c92c7fa0 ("staging: mt7621-pci-phy: remove driver from staging")
>
> from the phy-next tree and commit:
>
>   518b466a21ad ("pinctrl: ralink: add a pinctrl driver for the rt2880 family")
>
> from the staging tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks for doing this. Removing both in staging is the correct thing to do.

>
> --
> Cheers,
> Stephen Rothwell

Best regards,
    Sergio Paracuellos
>
> diff --cc drivers/staging/Kconfig
> index 4d7a5ddf9992,c42708e60afc..000000000000
> --- a/drivers/staging/Kconfig
> +++ b/drivers/staging/Kconfig
> @@@ -94,8 -92,8 +92,6 @@@ source "drivers/staging/pi433/Kconfig
>
>   source "drivers/staging/mt7621-pci/Kconfig"
>
> - source "drivers/staging/mt7621-pinctrl/Kconfig"
>  -source "drivers/staging/mt7621-pci-phy/Kconfig"
> --
>   source "drivers/staging/mt7621-dma/Kconfig"
>
>   source "drivers/staging/ralink-gdma/Kconfig"
> diff --cc drivers/staging/Makefile
> index 89bde2370eee,ebcc646d7b51..000000000000
> --- a/drivers/staging/Makefile
> +++ b/drivers/staging/Makefile
> @@@ -37,7 -36,7 +36,6 @@@ obj-$(CONFIG_GREYBUS)         += greybus
>   obj-$(CONFIG_BCM2835_VCHIQ)   += vc04_services/
>   obj-$(CONFIG_PI433)           += pi433/
>   obj-$(CONFIG_PCI_MT7621)      += mt7621-pci/
> - obj-$(CONFIG_PINCTRL_RT2880)  += mt7621-pinctrl/
>  -obj-$(CONFIG_PCI_MT7621_PHY)  += mt7621-pci-phy/
>   obj-$(CONFIG_SOC_MT7621)      += mt7621-dma/
>   obj-$(CONFIG_DMA_RALINK)      += ralink-gdma/
>   obj-$(CONFIG_SOC_MT7621)      += mt7621-dts/
