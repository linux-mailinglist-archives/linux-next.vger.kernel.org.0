Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7300F2B7A63
	for <lists+linux-next@lfdr.de>; Wed, 18 Nov 2020 10:31:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726107AbgKRJ3m (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Nov 2020 04:29:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725964AbgKRJ3m (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Nov 2020 04:29:42 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A6ADC0613D4;
        Wed, 18 Nov 2020 01:29:41 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id u2so661869pls.10;
        Wed, 18 Nov 2020 01:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5YNMYNP9cArkS4W3wGQqmXDnORbfFktuwzIh97yXSHw=;
        b=HmddkjUnxxUY2T+NaxKo/9hPOcUPoyJD8v3SVuSL46Rppmwz9JLDJt/FKtaVQ51sbn
         yTYdmY6g9gBF9SVQl3wKPiYz8YRY7KsgsL1xvdQmUwOMkv44r2xXdjVaZIG6GwSH3i2/
         V8tX/sdtxr/Zis0QCXJFESPKt6XxrNyWKxiArfkxNbsywrzeuYRUryySYF5H2XYwrTW9
         P4VHqtWYw4+4noinhKzsYnUldf4jd1ctDYyDZKFARJFCdd/3OH3GNG/W1sAX0zznAW94
         mrDaapikKj/ren+fJ1J9iQVDY0t61Gm6jdBbpl9dmAzaPVKxWDeDvmensR69ARDkz16Y
         fwYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5YNMYNP9cArkS4W3wGQqmXDnORbfFktuwzIh97yXSHw=;
        b=Vvy78NNPAFt5AxQ6Z+J5dN4qr/ulgzQPTn17RNXKCGWrK50O/3EdiCdZWkDFphIyEf
         GjVkCehkAnKjYJTF2CTc40ij5Cn6GzmEHgD6uxre0JUKiz9BkSiYMm4nqwB/DQ0NQ9l6
         9D2EBovvK0nV7RaNtULM/Hw95RvBRCm9Aj9iiOkcHNqXSkArPaq7Ru568NftgriQSJ6C
         vYWLGeCcY5NFE07bWkm4cnuloRJdfTu5YvfabMlZcVVhnK51buD72s/jMxHyQv+1K6kt
         NdBlqdFMerCOHi7X6CVhCrIQT8eVHXND3nfI3+9FHX9ZRFHotF86i0wIESKKbj6pzs81
         tK0g==
X-Gm-Message-State: AOAM532ZGPgp+kAZjVcSwDgsdkR0xtScMg+RMjAocqJg8DGRi0xpHLLF
        dL4eQ6/NBm2EYFoEm1Np/0JDdj6zbCvIhRyMFeGp/Hprwp6JpA==
X-Google-Smtp-Source: ABdhPJyCUn9Vm5gHpfmLKr0eAZXmGXpdkGKd4b4XruTQ8uFlncc4wYRUnvW/trqJVcmKQatObtOIJ5oqsPD4TyTPwb4=
X-Received: by 2002:a17:902:d216:b029:d8:db1d:24dc with SMTP id
 t22-20020a170902d216b02900d8db1d24dcmr3827727ply.39.1605691780758; Wed, 18
 Nov 2020 01:29:40 -0800 (PST)
MIME-Version: 1.0
References: <20201118142445.461d3792@canb.auug.org.au> <CACRpkdahE38tamkVZLx+m3nkE_dDfaN-u7gEwH48BEnf1BvsFg@mail.gmail.com>
In-Reply-To: <CACRpkdahE38tamkVZLx+m3nkE_dDfaN-u7gEwH48BEnf1BvsFg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 18 Nov 2020 11:29:24 +0200
Message-ID: <CAHp75VevuYCZVPw8HHcaoGdHBvXxHTNnujbf2BUyBECmFHZFDQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the gpio tree with the kspp-gustavo tree
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 18, 2020 at 9:53 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Wed, Nov 18, 2020 at 4:24 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> >   b8e0b635e6e6 ("gpio: Fix fall-through warnings for Clang")
> >
> > from the kspp-gustavo tree and commit:

Stephen, the fix looks good to me.

> Interesting I guess this is a clang tree?
> Please rebase on the GPIO tree and send me + Andy this patch so we
> can integrate it properly.

Linus, I don't think they are rebasing their trees, so we simply may
pull their tree to yours, or they may pull your immutable branch/tag
to theirs.
In any case it's a standard procedure to solve conflicts. I think
Linus T. can do it when the second PR (whoever will be second) comes
to him.
Just mention this conflict in a PR message.

-- 
With Best Regards,
Andy Shevchenko
