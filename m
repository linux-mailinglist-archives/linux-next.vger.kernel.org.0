Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25DF82DAA84
	for <lists+linux-next@lfdr.de>; Tue, 15 Dec 2020 11:00:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbgLOJ7o (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Dec 2020 04:59:44 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37170 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727075AbgLOJ7o (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Dec 2020 04:59:44 -0500
Received: by mail-ot1-f68.google.com with SMTP id o11so18759415ote.4;
        Tue, 15 Dec 2020 01:59:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2tYDUx6SI753W7Hldtg8DzizZYg8W92/yzDFr2NF0Jc=;
        b=FrW/FBtfpz6KgzpY+die90Y4luCoSgmkVqYbkVRwSvSM38dHi7N8bvZOEYVj+ssfmH
         dj/2xxh2vm2Yt5D31r2hIJBPwdIYI3j6dklXN5OjDwyPqbRJ3Lh5Ff0X2226dBMNPp9p
         VxKr3XqDgVXNm97xfAArqZq311Im5vvcPtkA/7/3TOyW5oh5Fp6csD462grUikbpmnBp
         h+ys4owE4tmnSm2YMhUu9Bw8GUaX+alF3O6UIOhr1qqf5cvvuKDCUcYII9D8aoa4TKGA
         6NhUEm7GH3mlwwKuc4PoCNoJWhMByuCrrpVniEqI7cSkH2GAskzPmfSYwQSfpQbQ9J5M
         hfJQ==
X-Gm-Message-State: AOAM532CBwsLvcSIHBgpVkZXWjAwA2TSUf1mwV5kOD8EeUJi4qX5m1GO
        HZ/VfnYW2uifztU3YmgleT9CMuZRlnxJVEaytv3jb304irM=
X-Google-Smtp-Source: ABdhPJyyNRhC2Vw49xndoQcAupIZbC+RrIVipadrop2ecq63H3T7mySSTLO496si4WWnsrh5cgZ2HmOOGuWj5wTt9T0=
X-Received: by 2002:a9d:2203:: with SMTP id o3mr22660508ota.107.1608026343634;
 Tue, 15 Dec 2020 01:59:03 -0800 (PST)
MIME-Version: 1.0
References: <20201214135453.16e76e9d@canb.auug.org.au>
In-Reply-To: <20201214135453.16e76e9d@canb.auug.org.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Dec 2020 10:58:52 +0100
Message-ID: <CAMuHMdWYBLqUVRyNRbOZm=oxv+_uLJ9FK6ebPPvgHcN4Y-YUSQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drm tree with the crypto tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mike Healy <mikex.healy@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Dec 14, 2020 at 2:44 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Today's linux-next merge of the drm tree got a conflict in:
>
>   MAINTAINERS
>
> between commit:
>
>   885743324513 ("crypto: keembay - Add support for Keem Bay OCS AES/SM4")
>
> from the crypto tree and commit:
>
>   ed794057b052 ("drm/kmb: Build files for KeemBay Display driver")
>
> from the drm tree.
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
> diff --cc MAINTAINERS
> index 3b358262de8f,eb18459c1d16..000000000000
> --- a/MAINTAINERS
> +++ b/MAINTAINERS

> @@@ -8985,16 -8962,13 +8993,23 @@@ M:   Deepak Saxena <dsaxena@plexity.net
>   S:    Maintained
>   F:    drivers/char/hw_random/ixp4xx-rng.c
>
> + INTEL KEEMBAY DRM DRIVER

Is it KEEMBAY?

> + M:    Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> + M:    Edmund Dea <edmund.j.dea@intel.com>
> + S:    Maintained
> + F:    Documentation/devicetree/bindings/display/intel,kmb_display.yaml

I was just going to comment about "intel,kmb_*" vs. "intel,keembay-*", until
I noticed intel,kmb_display.yaml does not exist, but is called
Documentation/devicetree/bindings/display/intel,keembay-display.yaml
in next-20201214.

> + F:    drivers/gpu/drm/kmb/
> +
>  +INTEL KEEM BAY OCS AES/SM4 CRYPTO DRIVER

or KEEM BAY?

Or Keem Bay? Keembay? KeemBay?

All of them are present in next-20201214.

>  +M:    Daniele Alessandrelli <daniele.alessandrelli@intel.com>
>  +S:    Maintained
>  +F:    Documentation/devicetree/bindings/crypto/intel,keembay-ocs-aes.yaml
>  +F:    drivers/crypto/keembay/Kconfig
>  +F:    drivers/crypto/keembay/Makefile
>  +F:    drivers/crypto/keembay/keembay-ocs-aes-core.c
>  +F:    drivers/crypto/keembay/ocs-aes.c
>  +F:    drivers/crypto/keembay/ocs-aes.h
>  +
>   INTEL MANAGEMENT ENGINE (mei)
>   M:    Tomas Winkler <tomas.winkler@intel.com>
>   L:    linux-kernel@vger.kernel.org

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
