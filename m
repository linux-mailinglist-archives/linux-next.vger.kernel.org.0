Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F87A3A8902
	for <lists+linux-next@lfdr.de>; Tue, 15 Jun 2021 20:58:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230162AbhFOTAL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Jun 2021 15:00:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbhFOTAK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Jun 2021 15:00:10 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6444AC061574;
        Tue, 15 Jun 2021 11:58:04 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id k7so24223281ejv.12;
        Tue, 15 Jun 2021 11:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0xCBSrZTq3lR+Z5Xk389LhiHH2/uglF9MoazKFAcyjw=;
        b=oaY5gWBCgLbXI4bRJ4AHMdbKlyI4aNBDcdO/P9RrpfAy7pJO1r9Ia+xEGyhb2BGQcL
         w3Wm9hRMs5Qt6QRYD2Lg+0cCJaLbiJ4/QEv1o/C9Ysmv6WVuGSgIoFFwss7hGfVjUeoc
         wNTJtzDV06PDlRYest8XrNgvPFG7T9p/XvB7hMWmP7VbLhkeFpOH6uVto/ovYIHcBq/i
         M9n1FN/ZQVTUYvFkH1uMkHCX2fcky07i7cUSb8cuOr9XaXWIFef8cc9e5HBXOIwfMbqU
         BD0rSrdZ+OZ9rLVW8/TwaIaXR+NZpZUqfKbqxQuIRoQeHjxNLOwRSZwhRX47iy23yP7m
         bHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0xCBSrZTq3lR+Z5Xk389LhiHH2/uglF9MoazKFAcyjw=;
        b=GZYsrgUwEFxbL9/yc/kAeeSXjwG0N+A7ZCWwjBeQN3AfJEFzT1ZC4mc6oJRyQ3JAse
         4ne3ksF69UDQ3uwGOfcZ+GGpvEXhGjjK3mjZLKO9qq4iYYiAA5R3jV+BogawaiO2Sp18
         OgfMoPse3sOq6bNopEw+G2o7OfC0iodPm+JHvXVVWJ7fouAeJbUReOliTPRf9WWxlTdg
         LLNAcrM2pgi0TSDHO9RHOsPcD7jzYEOGQXoRsJZImGVtiVQDQwohM/iIcHWi0/Ts3cuP
         1HQpnmph83wl1Wr8N/dx6mCKPdgY7xewE+lY5NCw3ARMXB8eWveRN3JEZcWYbLVNqRvH
         qubQ==
X-Gm-Message-State: AOAM533MsAvSaErFqkn217983RMFhgQFwgmQolECVE/DnDsZsbpcbgn0
        fzmzdcLEOyHDmCVj//4ouNPifF/XugMe1KhgNOjL96c=
X-Google-Smtp-Source: ABdhPJzNlge3ea+4G8oidJAyC9M1zdt9+7pRNlfUsDyqWIV2NfzdKLU1B3Ue4V9rtTG8FCaBt20XOY+0zNIKuhXDw9U=
X-Received: by 2002:a17:906:85d5:: with SMTP id i21mr1104005ejy.360.1623783482956;
 Tue, 15 Jun 2021 11:58:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210615125958.541c275c@canb.auug.org.au> <20210615184704.4204347f@xps13>
In-Reply-To: <20210615184704.4204347f@xps13>
From:   Rob Herring <robherring2@gmail.com>
Date:   Tue, 15 Jun 2021 12:57:51 -0600
Message-ID: <CAL_Jsq+G-gF9MbmF9_XWTjVu7LOgJ1YpuPqAAf7vGdvzvZ6dwg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the devicetree tree with the mtd tree
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Richard Weinberger <richard.weinberger@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jun 15, 2021 at 10:47 AM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
>
> Hi Stephen,
>
> Stephen Rothwell <sfr@canb.auug.org.au> wrote on Tue, 15 Jun 2021
> 12:59:58 +1000:
>
> > Hi all,
> >
> > Today's linux-next merge of the devicetree tree got a conflict in:
> >
> >   Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
> >
> > between commit:
> >
> >   6947ad674944 ("dt-bindings: mtd: Convert ti, am654-hbmc.txt to YAML schema")
> >
> > from the mtd tree and commit:
> >
> >   9b358af7c818 ("dt-bindings: mux: Convert mux controller bindings to schema")
> >
> > from the devicetree tree.
> >
> > I fixed it up (the latter removed the file, so I just did that) and can
> > carry the fix as necessary. This is now fixed as far as linux-next is
> > concerned, but any non trivial conflicts should be mentioned to your
> > upstream maintainer when your tree is submitted for merging.  You may
> > also want to consider cooperating with the maintainer of the conflicting
> > tree to minimise any particularly complex conflicts.
> >
>
> Thanks for the warning. Indeed the txt file being touched by
> 9b358af7c818 is being updated into a yaml file which does not reference
> the mux binding anymore.
>
> Rob, how do you want to proceed?

It shouldn't be an issue merging as taking the deleted file is simple
enough to resolve.

Rob
