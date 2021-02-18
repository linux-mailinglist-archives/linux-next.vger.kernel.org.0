Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96E8231ED28
	for <lists+linux-next@lfdr.de>; Thu, 18 Feb 2021 18:22:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231897AbhBRRUR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Feb 2021 12:20:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230331AbhBRNxz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 Feb 2021 08:53:55 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DECBC061756;
        Thu, 18 Feb 2021 05:53:08 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id k13so3839330ejs.10;
        Thu, 18 Feb 2021 05:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e4WxhpsUCYoI68epWSVeYmZpkTYdeeFLMrDY4wlplfI=;
        b=pHcD0ghentGOj45fVxrfkX0xPlSZvJlC0kd55797B5+7/FDJlRdHC9SkXW6ugmrNgK
         X6hGVuBi8QvWvI67Qz+hZ8U7osHbDuB6KtlpwRBkq/2shwzErWmKsoy3LTn6TQGu1jIl
         Yo64yXGT9VUimy9DnHi719D1gvNEgtvWVw+U68Z7BoJaiOvA9lBI19trc+JMMBa+FlMw
         jq00qgzP+phsfc+PuRwfmT8Ze9o8f5Jm2VJ3YOTcrF6wv+YcRf6K/VpPwCp8M03Q1wRi
         wRrU5a+VkfQ8wMMML5nmr+vFJ64WpquXC8gxvaAl4x4hfAdn1BPVCq86muKBF1COxEvF
         2AgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e4WxhpsUCYoI68epWSVeYmZpkTYdeeFLMrDY4wlplfI=;
        b=IflLrPbg4VFK+tXbIiKlF5oLpGYSiSGOQQVPZfTXueiYSzCw7SayrbTYJrWOroU7/l
         pblvlWWPx0jMrKnoGkJmB7H88TXO6X7sdwBsyUMPSJzq3yEI0UvS1MXXvYRLHwGMJus3
         9dS/niSPFkdZD1bXhpZXBZ32pbBexjlGnvR5L4CBw3tZcOSqTervdECZfTqhGhSlh5us
         wYr3xeoIZ6CfzBLaUQd+shh/GSgBzPJGh0A/sqoVJn5FFuXiVmamjSdCkJL+XJ3mzrEK
         DIdpSjfREbooHsae3TGSnNrv01N5CsnxAL7v3WzlBEj5ViJ7Jeuh9BTjUcG+sfLn4oKX
         AcRg==
X-Gm-Message-State: AOAM531HnUhZy3MzaZMQCQuYcCTtZs0G0mSULcru1cny9Z//goRtaiFW
        uAbGqlbXPFCVMB+3hHM4MMOPuH8htOC33bB7zw==
X-Google-Smtp-Source: ABdhPJyjnj3etHjyJP96CAwGNcurZz9kLIYoqEOkH+GezZ/ZGsXaciElTkISu6NL/wj6DRkIqVBz6keGOskaBkyE5vc=
X-Received: by 2002:a17:906:f85:: with SMTP id q5mr4044757ejj.108.1613656386829;
 Thu, 18 Feb 2021 05:53:06 -0800 (PST)
MIME-Version: 1.0
References: <20210218144815.5673ae6f@canb.auug.org.au> <874ki9vene.fsf@mpe.ellerman.id.au>
 <20210218223427.77109d83@canb.auug.org.au>
In-Reply-To: <20210218223427.77109d83@canb.auug.org.au>
From:   Rob Herring <robherring2@gmail.com>
Date:   Thu, 18 Feb 2021 07:52:52 -0600
Message-ID: <CAL_JsqJ9Ske4hkWn3uo8-nef29MQ1DkNdtE=gxbqj8CKrtQorg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the devicetree tree with the powerpc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Feb 18, 2021 at 5:34 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Michael,
>
> On Thu, 18 Feb 2021 21:44:37 +1100 Michael Ellerman <mpe@ellerman.id.au> wrote:
> >
> > I think it just needs this?
> >
> > diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
> > index 87e34611f93d..0492ca6003f3 100644
> > --- a/arch/powerpc/kexec/elf_64.c
> > +++ b/arch/powerpc/kexec/elf_64.c
> > @@ -104,7 +104,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
> >
> >       fdt = of_kexec_alloc_and_setup_fdt(image, initrd_load_addr,
> >                                          initrd_len, cmdline,
> > -                                        fdt_totalsize(initial_boot_params));
> > +                                        kexec_fdt_totalsize_ppc64(image));
> >       if (!fdt) {
> >               pr_err("Error setting up the new device tree.\n");
> >               ret = -EINVAL;
> >
>
> I thought about that, but the last argument to
> of_kexec_alloc_and_setup_fdt() is extra_fdt_size and the allocation
> done is for this:
>
> fdt_size = fdt_totalsize(initial_boot_params) +
>                    (cmdline ? strlen(cmdline) : 0) +
>                    FDT_EXTRA_SPACE +
>                    extra_fdt_size;
>
> and kexec_fdt_totalsize_ppc64() also includes
> fdt_totalsize(initial_boot_params) so I was not sure.  Maybe
> kexec_fdt_totalsize_ppc64() needs modification as well?

You're both right. Michael's fix is sufficient for the merge. The only
risk with a larger size is failing to allocate it, but we're talking
only 10s of KB. Historically until the commit causing the conflict,
PPC was just used 2x fdt_totalsize(initial_boot_params). You could
drop 'fdt_size = fdt_totalsize(initial_boot_params) + (2 *
COMMAND_LINE_SIZE);' from kexec_fdt_totalsize_ppc64() as well, but
then the function name is misleading.

Lakshmi can send a follow-up patch to fine tune the size and rename
kexec_fdt_totalsize_ppc64.

Rob
