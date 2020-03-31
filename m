Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A789D198EAC
	for <lists+linux-next@lfdr.de>; Tue, 31 Mar 2020 10:37:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730186AbgCaIh6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 31 Mar 2020 04:37:58 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:33155 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729819AbgCaIh6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 31 Mar 2020 04:37:58 -0400
Received: by mail-ot1-f66.google.com with SMTP id 22so21226269otf.0;
        Tue, 31 Mar 2020 01:37:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ICwZe74cinsq+H0Mi/M0UaoDjI0NelMBSLemc/4qo/U=;
        b=DaWiXXxuW+hubThhZc6nQanxaJG1FaCt4Gagh5VUbOe+sM/L+mcOQMMnBEMeRSEvAU
         ANXuhHig71Y9jQJeexgWjVNt22NpQ/EgpDrnARhMJWxnTQ5YNIQu0352U9f9sUS9BoAm
         1LxECxDqXqIGavUYaY2hR8ItSkA6XsxxDRgF8C2M4dImsnYrbUPvD/0JVJTtqipMqflv
         ZH9V5+SCUnV/Q6rG2j6HOB2tQSnUAYLXJ40+99etu6MKCeoiUdM56e+ExlUXOPzIjh7E
         kPuS1m3ddD32s/V/ZqNl7jjmAo98V3Rc80fssLiNhOv3bQm6r2zVSR5Lf6ho7zh4K01H
         yPeg==
X-Gm-Message-State: ANhLgQ0+GiABFHxYHVT4ZTgYFaNdx/Wyv3GCIFbtOkQBhmrHMCA9GZRE
        5xRgAAsJ/FNyCxzRy5WI8+1ospPOeDxBkqVIGfc=
X-Google-Smtp-Source: ADFU+vtSPfJ+5lxhEQluC4omuajmCx1I5+UeA+6FUPL98dSUb/IOkPQ50CVMgweKGCB3Ke/QvJKhPWahlIZSg528NQg=
X-Received: by 2002:a4a:a442:: with SMTP id w2mr9650592ool.90.1585643876316;
 Tue, 31 Mar 2020 01:37:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200331104947.264c98e5@canb.auug.org.au>
In-Reply-To: <20200331104947.264c98e5@canb.auug.org.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 31 Mar 2020 10:37:45 +0200
Message-ID: <CAMuHMdW_hUzSGnPg1NMtix9ztnAoJboX62H+Yja6P7M3xF9eFg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the pci tree with Linus' tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Anirudh Venkataramanan <anirudh.venkataramanan@intel.com>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Mar 31, 2020 at 1:52 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Today's linux-next merge of the pci tree got a conflict in:
>
>   drivers/net/ethernet/intel/ice/ice_main.c
>
> between commit:
>
>   19cce2c6f6dc ("ice: Make print statements more compact")

FWIW, that doesn't really look like an improvement to me, as the long
lines are now broken by my editor, making them harder to read...

>
> from Linus' tree and commit:
>
>   894020fdd88c ("PCI/AER: Rationalize error status register clearing")
>
> from the pci tree.
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
> diff --cc drivers/net/ethernet/intel/ice/ice_main.c
> index 5ef28052c0f8,effca3fa92e0..000000000000
> --- a/drivers/net/ethernet/intel/ice/ice_main.c
> +++ b/drivers/net/ethernet/intel/ice/ice_main.c
> @@@ -3458,9 -3495,10 +3458,9 @@@ static pci_ers_result_t ice_pci_err_slo
>                         result = PCI_ERS_RESULT_DISCONNECT;
>         }
>
> -       err = pci_cleanup_aer_uncorrect_error_status(pdev);
> +       err = pci_aer_clear_nonfatal_status(pdev);
>         if (err)
> -               dev_dbg(&pdev->dev, "pci_cleanup_aer_uncorrect_error_status failed, error %d\n",
>  -              dev_dbg(&pdev->dev,
>  -                      "pci_aer_clear_nonfatal_status() failed, error %d\n",
> ++              dev_dbg(&pdev->dev, "pci_aer_clear_nonfatal_status() failed, error %d\n",
>                         err);
>                 /* non-fatal, continue */

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
