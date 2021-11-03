Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB2F444000
	for <lists+linux-next@lfdr.de>; Wed,  3 Nov 2021 11:30:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231968AbhKCKdX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Nov 2021 06:33:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231961AbhKCKdX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Nov 2021 06:33:23 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0237C061714;
        Wed,  3 Nov 2021 03:30:46 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id v65so2101163ioe.5;
        Wed, 03 Nov 2021 03:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rJ0W9665zPN33aTHCee5/NAuKAsFNx/P9dYEi6U9HoY=;
        b=LsZEz8mwaGbJQ9F6VUUAzCwksNpBCNKXe9VoZ8Wgck0e7kaQ8mXSqaGTx3PJ6mtUI3
         Qun8/sZbcpXmcDcXvzOGvjMSZ6N3630nzhihI+yT9+clmvkNODgozOuww7WC9TT/QRfC
         xfn17nuOmzuBxCaYyG7X2QQqcjWQzXwrsayadxhxohfWJLVkxvziCReqXhyxHqEldLBe
         CIrXA7HmZK58E0sh828Gn/rAOs1xq7LauJqbtJ1IWORymFBcL2y/Fdo1yOFVh86O+EEv
         vC7u7SmQdmv/4pJ36EvVO2aECSdWqdBvV865YCwHAtLRyCcKhBZXvVe+pM4pmwlqutbz
         pqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rJ0W9665zPN33aTHCee5/NAuKAsFNx/P9dYEi6U9HoY=;
        b=anqudKXrmRFISy3K6xG1XqSsbuwHU1m+gVerw24v9+adj/0aj7xGhCp/H7Rok3RXPQ
         3eGaBjjLJe3MPtgV9NYg2JY8rjawScerxGu2nHeQTz4Zgpb932WzF+qspWcfs/9M7ziQ
         D97Ff3Qbjc2mY8y7tExy1D1dKAOYLFSyyc4EcDkyRmPCFMmoVifRAL2cuQLRAA7GEDtk
         CLUIPMMvy1W9Q+KHe7Nd3ZC4zBHZ5rTvbeK147S7y/g8IRKVhY3oQDFNs0kMmuKDLDUp
         vFrSwUvbjwHycBcFlGNHJymI6PpEpdsTtj8bb4GIx+1bkSPuLWdCQdNNEogs8nsRmWpp
         GpNw==
X-Gm-Message-State: AOAM533WR+2vHtO4pqQ/VMm+H6jLdW0sSDun4hQ2neo/lPOcqWq+sJfk
        mY4ONWLqmz4pawc2AJSYFL5++2X+CAS4kTJKbY8=
X-Google-Smtp-Source: ABdhPJwxaX+ZSzkC08wQZnyBshUwZ+yVOM14zJF+O1WfAUAgt2J2bqOjHxzj77GO0xfn0kklyH+x1iLyGXlJ1DeYzRY=
X-Received: by 2002:a5d:9c4c:: with SMTP id 12mr30213483iof.64.1635935446370;
 Wed, 03 Nov 2021 03:30:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211103141919.4feefaf0@canb.auug.org.au>
In-Reply-To: <20211103141919.4feefaf0@canb.auug.org.au>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 3 Nov 2021 11:30:35 +0100
Message-ID: <CANiq72=fuk-eVuCpW5jkDn71Pbs=1L2LhSvadR_bTjxcPvtVUQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with Linus' tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Adam Bratschi-Kaye <ark.email@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Andrii Nakryiko <andrii@kernel.org>,
        Antonio Terceiro <antonio.terceiro@linaro.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Boris-Chengbiao Zhou <bobo1239@web.de>,
        Daniel Xu <dxu@dxuuu.xyz>,
        Dariusz Sosnowski <dsosnowski@dsosnowski.pl>,
        Douglas Su <d0u9.su@outlook.com>, Finn Behrens <me@kloenk.de>,
        Gary Guo <gary@garyguo.net>, Jiri Olsa <jolsa@kernel.org>,
        Jiri Olsa <jolsa@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Miguel Ojeda <ojeda@kernel.org>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Wed, Nov 3, 2021 at 4:19 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> diff --cc scripts/Makefile.modfinal
> index 7f39599e9fae,c0842e999a75..000000000000
> --- a/scripts/Makefile.modfinal
> +++ b/scripts/Makefile.modfinal
> @@@ -39,11 -39,12 +39,12 @@@ quiet_cmd_ld_ko_o = LD [M]  $
>
>   quiet_cmd_btf_ko = BTF [M] $@
>         cmd_btf_ko =                                                    \
> -       if [ -f vmlinux ]; then                                         \
> -               LLVM_OBJCOPY="$(OBJCOPY)" $(PAHOLE) -J $(PAHOLE_FLAGS) --btf_base vmlinux $@; \
> -               $(RESOLVE_BTFIDS) -b vmlinux $@;                        \
> -       else                                                            \
> +       if [ ! -f vmlinux ]; then                                       \
>                 printf "Skipping BTF generation for %s due to unavailability of vmlinux\n" $@ 1>&2; \
> +       elif $(srctree)/scripts/is_rust_module.sh $@; then              \
> +               printf "Skipping BTF generation for %s because it's a Rust module\n" $@ 1>&2; \
> +       else                                                            \
>  -              LLVM_OBJCOPY="$(OBJCOPY)" $(PAHOLE) -J --btf_base vmlinux $@; \
> ++              LLVM_OBJCOPY="$(OBJCOPY)" $(PAHOLE) -J $(PAHOLE_FLAGS) --btf_base vmlinux $@; \
>         fi;

It looks like the `$(RESOLVE_BTFIDS)` line is gone with this
resolution. The rest looks good.

Thanks!

Cheers,
Miguel
