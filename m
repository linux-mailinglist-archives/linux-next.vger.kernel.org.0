Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E116B2CAE61
	for <lists+linux-next@lfdr.de>; Tue,  1 Dec 2020 22:30:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728360AbgLAVab (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Dec 2020 16:30:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:49104 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727156AbgLAVaa (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 1 Dec 2020 16:30:30 -0500
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1658B208C3;
        Tue,  1 Dec 2020 21:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606858190;
        bh=PcL86GGZM0lINkp20VJpuJRunmqO7tMbA8yBSVplGwQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=YE/potU5SVfVdae4xB77xhKU9Lzw/ie1rO5kOiNINOZGD1jNsC4lu1TyVBGaAjpd6
         lli+jfT6dK1sadfE+tW8hF1WfgVY+xAWuunjK3+zMxD0DRknIkDCc9cKRSabmtEITe
         dyNCy2RHF780vsNfe7TMFY2TdKrfaAU7WtyefcE8=
Received: by mail-oi1-f169.google.com with SMTP id s18so3421772oih.1;
        Tue, 01 Dec 2020 13:29:50 -0800 (PST)
X-Gm-Message-State: AOAM532rKM2B9MNGRPW37ENtk8dKIddcdigSzbLFLRWIlMcs/d5ppXzz
        /kBTgdCH6zKfeS5k0RNPA0KzL+EnnG7rHk4IABY=
X-Google-Smtp-Source: ABdhPJynUVrnm5jNymCZyz7FpjcNdUGYN5fLNI0BtT9fOXVbhBkozziYwKXo69NsTQsNQCg0w2e4UvNOMdosOAg9dCM=
X-Received: by 2002:aca:5ec2:: with SMTP id s185mr3103969oib.33.1606858189293;
 Tue, 01 Dec 2020 13:29:49 -0800 (PST)
MIME-Version: 1.0
References: <20201201210349.7f617c65@canb.auug.org.au> <6a11bb20-2e3b-e106-8030-019580d176b1@infradead.org>
In-Reply-To: <6a11bb20-2e3b-e106-8030-019580d176b1@infradead.org>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Tue, 1 Dec 2020 22:29:38 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFiv64fCs8yxm-Z3fktKGcOgWHCdbWrc_921mcx=_54vg@mail.gmail.com>
Message-ID: <CAMj1kXFiv64fCs8yxm-Z3fktKGcOgWHCdbWrc_921mcx=_54vg@mail.gmail.com>
Subject: Re: linux-next: Tree for Dec 1 [crypto/aegis128.ko]
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ondrej Mosnacek <omosnacek@gmail.com>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 1 Dec 2020 at 20:53, Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 12/1/20 2:03 AM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20201130:
> >
>
> on i386 or x86_64:
>
> CONFIG_CRYPTO_AEGIS128=m
> CONFIG_CRYPTO_AEGIS128_AESNI_SSE2=y
>
>
> ERROR: modpost: "crypto_aegis128_update_simd" [crypto/aegis128.ko] undefined!
>

Fix posted here.
https://lore.kernel.org/linux-crypto/20201130122620.16640-1-ardb@kernel.org/

Which compiler version are you using? This does not reproduce for me
with GCC 7.5.0
