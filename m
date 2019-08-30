Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BA88A36D0
	for <lists+linux-next@lfdr.de>; Fri, 30 Aug 2019 14:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727675AbfH3Ma5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 30 Aug 2019 08:30:57 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35381 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727386AbfH3Ma5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 30 Aug 2019 08:30:57 -0400
Received: by mail-wm1-f67.google.com with SMTP id l2so7276629wmg.0
        for <linux-next@vger.kernel.org>; Fri, 30 Aug 2019 05:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lK3SdEfdHzl9jiQrhuM9R9qwguoBC0l1FGo+Jyx6ye4=;
        b=mGALJXQYufxSI9/NMXya55UCstbt+vyLc/JREg/ztiRBsbrhkFs+2GBIwHI+npCKmx
         9nopyIVxmxq7feMOYn4uj7VpUvPipLTxMmuGfCgZXtlk2DdRiNLLdltVivFn6INeK+Ru
         EWFP1NT5G4L9YOzyONXBummjWiPklvYAsFAGV93+0zjwiLGpQzC8uTIqvIeetVDT4bs0
         iwmgG+uPaZUH4oI5NmSaiS42tL1QmZ0ahpUC4uJIPdg5P8NxWeTDMTElbqMfLRXAcpZ4
         hTlslfMebOGZYUa3kLbXbACr65UU4EtwpZ/0gWZQHWR384uJ5hoOGOJx9JtpegrcqjMn
         TRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lK3SdEfdHzl9jiQrhuM9R9qwguoBC0l1FGo+Jyx6ye4=;
        b=a7WgFmJ2cl5PmxnlR2u4TGaWohcnp2yN0ZoQWZG2LD+ut58hVUTAvqEfdRjAfu3I/y
         hLYB1MxVGY6pffqGwYLXuaDJSsR+yO4ck/ZjmymoKDHwejO0iF9PaihOQMZqI6UPIW+j
         dQ12QKu8dSkOK3k1v6Ckcn+RAk/yWb2Q6Ij6wGKKMSRr5jRe8uEt5Q535mfknynX5roc
         Cz7NUcJjyT+qBnKIBMFi6NP825sZPL9k6YLGO1C8XpXQt9PLprqGV5DRF/p144fz3Vba
         JLenVLS9M5WeWMs1CrlvKLporGcYxUNnw79thZv7s8oHLEFeKrJjC4pAe+zWNxcTyQLV
         orOg==
X-Gm-Message-State: APjAAAW/18x39BQPgiDNNp2buMAwutjuHYS2cUhVO/PkZBD+xILZjNwv
        5gerGBwG8HrfQ8Y3rNzNQ8x7qAgZ5JDJWKMp7egT
X-Google-Smtp-Source: APXvYqxiSI/F1NevyNssi3lKq65ebc/V93G1PJODpIbGRxXGCx11RsYl1WKBYAF6TnctmYCzjRhkwGQ0+ZS3SlpMW7E=
X-Received: by 2002:a1c:658a:: with SMTP id z132mr18335687wmb.98.1567168254754;
 Fri, 30 Aug 2019 05:30:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190830132311.7190ccc3@canb.auug.org.au>
In-Reply-To: <20190830132311.7190ccc3@canb.auug.org.au>
From:   Bjorn Helgaas <bhelgaas@google.com>
Date:   Fri, 30 Aug 2019 07:30:42 -0500
Message-ID: <CAErSpo618ewbJQHS3E3KWhTLe6T47u=Xjx9E-gYKMzjn=MmujA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the pci tree
To:     Vidya Sagar <vidyas@nvidia.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Krzysztof Wilczynski <kw@linux.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

[+cc Krzysztof]

On Thu, Aug 29, 2019 at 10:23 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the pci tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>
> drivers/pci/controller/dwc/pcie-tegra194.c:24:10: fatal error: linux/pci-aspm.h: No such file or directory
>    24 | #include <linux/pci-aspm.h>
>       |          ^~~~~~~~~~~~~~~~~~
>
> Caused by commit
>
>   81564976b1a9 ("PCI: tegra: Add Tegra194 PCIe support")
>
> I have reverted that commit for todat.

Thanks, Stephen.

I *could* fix this by removing that include in the merge, since the
contents of linux/pci-aspm.h were moved into linux/pci.h by
https://git.kernel.org/cgit/linux/kernel/git/helgaas/pci.git/commit/?id=7ce2e76a0420

But as far as I can tell, pcie-tegra194.c doesn't actually require
anything from linux/pci-aspm.h, so I'd rather amend the tegra194
commit https://git.kernel.org/cgit/linux/kernel/git/lpieralisi/pci.git/commit/?id=81564976b1a9
so it doesn't include pci-aspm.h in the first place.

Bjorn
