Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D428426422
	for <lists+linux-next@lfdr.de>; Fri,  8 Oct 2021 07:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229654AbhJHFmG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 Oct 2021 01:42:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbhJHFmF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 8 Oct 2021 01:42:05 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D421C061570;
        Thu,  7 Oct 2021 22:40:10 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id t8so26122349wri.1;
        Thu, 07 Oct 2021 22:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c2QUI9TYy6QLpttg1evSF5Z552Y1SnXO8l+S/s47Hro=;
        b=KTV6bGO6ZIzTcs8S+lfDc/Z++xPkXJQSP2d+1Eg/Mx1Jr7Nv4kgS81RPh3mDuMR9mg
         I0tFYsewbjQgbs6erHzJvZTVVdWrB5DC5rdxGrNRq5QdUAWnPVhYDhpU0e+QmgdMzlYE
         CTG36UxIC5qE7hJafvwz42v4SvydVyR08rHDsoEwL8iHMJ66j6/R3vjrpafFDP6Qnj3o
         tDfQM3fZXbNA9ufvHsBinqXmM1FEyhYse8NkIhd/BVYs0rZmB00tW9fThpTkk63MRscd
         xj+imTkg5vkJumtCfii4i7I3vkjkGMH8mBXUwzNw9b+VCWCnxiDZH08FnlYf3AlcfF/c
         4/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c2QUI9TYy6QLpttg1evSF5Z552Y1SnXO8l+S/s47Hro=;
        b=vMLIwbXPwm7J/N82q5o+QYNS+PnqGIQyYFgulap1Ky0CBzZs8IegNsBAH6xstJ+6Bd
         cPZPKzp4mL1M2fr7ORXZSqH6GO+RvfI0pyWPZKZjG0icDntOcvjh+QlAHvxk47tqGPkn
         gQv/BDrg8a6yU0FEMxFKwFMzNvF+jWynY4yXRwOOUo4094wr3SYuHOVirheymfQImb0U
         AcForQ3gYvpwV4aCKiP0f42aWyJnoRjYe6/u65edxyKB15HpB8tLpIWPaCDn/ipfhb2q
         iBp9klGQ+hxLNW7VyNM+mIE3tqIt5sM5b+KEOgAYMUUpID3fCBEzIyglLTPOTBNdvzBf
         OOcw==
X-Gm-Message-State: AOAM531jbr2T/3DfifeFro3mJqC0kpFZCGpTxFv1Ro9+cr4RNAaeBF8b
        Ebu3O83XqeoKBqIgGlvs3Zf8wQmX+MdSdVlQTAxCN/VMdZA=
X-Google-Smtp-Source: ABdhPJyMiQ/ZGhNjm9J9QB/3671bpRzCA29LquGl8paqVfA0pcGnQdMsCU/88s7/AdWZRIk3CtYY83cB14EMXwYfxsI=
X-Received: by 2002:adf:f610:: with SMTP id t16mr1478945wrp.309.1633671608705;
 Thu, 07 Oct 2021 22:40:08 -0700 (PDT)
MIME-Version: 1.0
References: <20211008151511.5a7c6e56@canb.auug.org.au>
In-Reply-To: <20211008151511.5a7c6e56@canb.auug.org.au>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Fri, 8 Oct 2021 07:39:57 +0200
Message-ID: <CAMhs-H_Gg+iLVJ43h5Boa5H1W6LieA_atiYYo+tRtw22bQZSLg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the staging tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Greg KH <greg@kroah.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

[+cc Thomas Bogendoerfer as mips maintainer]

On Fri, Oct 8, 2021 at 6:15 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the staging tree, today's linux-next build (mips
> nlm_xlp_defconfig) failed like this:
>
> drivers/pci/pci.c:4210: undefined reference to `pci_remap_iospace'
>
> Caused by commit
>
>   9f76779f2418 ("MIPS: implement architecture-specific 'pci_remap_iospace()'")
>
> CONFIG_PCI_DRIVERS_GENERIC is not set for this build, so
> arch/mips/pci/pci-generic.c is not built.

I don't know what should be the correct fix for this.
'pci_remap_iospace' for mips is added in 'pci-generic.c' which in only
compiled when 'CONFIG_PCI_DRIVERS_GENERIC' is selected. In mips there
is also 'CONFIG_PCI_DRIVERS_LEGACY' option that include 'pci-legacy.c'
and drivers in 'arch/mips/pci' are normally defining this
'CONFIG_PCI_DRIVERS_LEGACY'. For the failing build
mips_nlm_xlp_defconfig, none of them are defined and code (I guess
./arch/mips/pci/pci-xlp.c) is just initializing PCI calling
'pcibios_init' and not using PCI core apis and 'pci_remap_iospace' at
all like other drivers inside 'arch/mips/pci'. So I think the correct
thing to do would be just move this mips architecture dependent define
to be dependant of CONFIG_PCI_DRIVERS_GENERIC. The following patch
would be enough:

diff --git a/arch/mips/include/asm/pci.h b/arch/mips/include/asm/pci.h
index 35270984a5f0..421231f55935 100644
--- a/arch/mips/include/asm/pci.h
+++ b/arch/mips/include/asm/pci.h
@@ -20,7 +20,9 @@
 #include <linux/list.h>
 #include <linux/of.h>

+#ifdef CONFIG_PCI_DRIVERS_GENERIC
 #define pci_remap_iospace pci_remap_iospace
+#endif

 #ifdef CONFIG_PCI_DRIVERS_LEGACY

Thomas, if you are ok with this, let me know and I'll send this patch
to be added to staging tree for fixing this issue.

Best regards,
    Sergio Paracuellos

>
> --
> Cheers,
> Stephen Rothwell
