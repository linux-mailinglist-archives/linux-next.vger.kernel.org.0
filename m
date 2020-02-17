Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2405B16086D
	for <lists+linux-next@lfdr.de>; Mon, 17 Feb 2020 04:03:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbgBQDD1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 16 Feb 2020 22:03:27 -0500
Received: from condef-09.nifty.com ([202.248.20.74]:64493 "EHLO
        condef-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726485AbgBQDD1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 16 Feb 2020 22:03:27 -0500
X-Greylist: delayed 411 seconds by postgrey-1.27 at vger.kernel.org; Sun, 16 Feb 2020 22:03:26 EST
Received: from conssluserg-01.nifty.com ([10.126.8.80])by condef-09.nifty.com with ESMTP id 01H2jWYg024852
        for <linux-next@vger.kernel.org>; Mon, 17 Feb 2020 11:45:33 +0900
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 01H2jPY1032324;
        Mon, 17 Feb 2020 11:45:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 01H2jPY1032324
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1581907525;
        bh=dFtfS7OE4fr2IIqmIi4GkbGlqk2GjJVy7T+VtdQBYyw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=MiffLscpW6V/vY9NKjcmqQBPbl0SyUVp2sekNgvCzRPQlWjQqRuKFYUWc46uJmzzk
         bbJv08L8LcVqFXwYVGa7fiAGTg1JsRK7llWmGuKlPSt4p5gOSiIO30FadQCL0S7OKF
         OxGAWxpGRloMyedZ2paHpUnQmEEAaLrbqLn9VieWSSymuI4XLk/2yJktwy2m8L11/h
         gfCLOJVy6Y6yaq6vAytmIw7Xx/I1pg/BX3BPWFZS6t6PzmSXUt0tIeNiicpOyqROTV
         a5c0qjOqnuHwOt6z7lrK66e+wzaMEBlKIQYktKdUpLrDXbEC4NSP08/+of5Iqk0H+k
         WAxcxlXm+MlAQ==
X-Nifty-SrcIP: [209.85.221.176]
Received: by mail-vk1-f176.google.com with SMTP id i4so4161947vkc.3;
        Sun, 16 Feb 2020 18:45:25 -0800 (PST)
X-Gm-Message-State: APjAAAVYqcVqacfq4iVCBeUciJmXS3u7i0jsbB0lmsveAHbicP+IRTuu
        4AZIQ4L9/CtxGZlLSM3SHdxiEj2vXihRlU0bwUA=
X-Google-Smtp-Source: APXvYqzN9GjDEyUEGugCEeJ16X4r7qJ6iHnC3AzqP0bd8iZ52TjtI/Hgij0iqKDtnn5jy/2Gi4w3i0xR2LHl4BZLwqQ=
X-Received: by 2002:a1f:1bc3:: with SMTP id b186mr4702934vkb.96.1581907524503;
 Sun, 16 Feb 2020 18:45:24 -0800 (PST)
MIME-Version: 1.0
References: <20200217122242.2da61737@canb.auug.org.au>
In-Reply-To: <20200217122242.2da61737@canb.auug.org.au>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 17 Feb 2020 11:44:48 +0900
X-Gmail-Original-Message-ID: <CAK7LNARMBiu24R40ChLT7W6sWCsRA+62M71hQw1nnBWquCW7sg@mail.gmail.com>
Message-ID: <CAK7LNARMBiu24R40ChLT7W6sWCsRA+62M71hQw1nnBWquCW7sg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the csky tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Guo Ren <ren_guo@c-sky.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        MaJun <majun258@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Mon, Feb 17, 2020 at 10:22 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the akpm-current tree got a conflict in:
>
>   arch/csky/include/asm/Kbuild
>
> between commit:
>
>   aeb58bb21421 ("csky: Add PCI support")
>
> from the csky tree and commit:
>
>   25e6e2bca62a ("asm-generic: make more kernel-space headers mandatory")
>
> from the akpm-current tree.
>
> I fixed it up (the latter is a superset of the former) and can carry the
> fix as necessary.


Correct. The latter is a superset.

Andrew sends rebased patches to Linus,
so it should be probably fine.

Thanks.


> This is now fixed as far as linux-next is concerned,
> but any non trivial conflicts should be mentioned to your upstream
> maintainer when your tree is submitted for merging.  You may also want
> to consider cooperating with the maintainer of the conflicting tree to
> minimise any particularly complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell



-- 
Best Regards
Masahiro Yamada
