Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C80CD33CBA4
	for <lists+linux-next@lfdr.de>; Tue, 16 Mar 2021 03:58:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbhCPC6E (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 15 Mar 2021 22:58:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231687AbhCPC5b (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 15 Mar 2021 22:57:31 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B1DAC06174A
        for <linux-next@vger.kernel.org>; Mon, 15 Mar 2021 19:57:31 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id a8so9749240plp.13
        for <linux-next@vger.kernel.org>; Mon, 15 Mar 2021 19:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Rf7S66rR/H+4CcWlMfRSPZkVzNT7/177BSacxGhHD8I=;
        b=Lm4/9BNVdPZXepl/VdJ6JlRk3/HVO5f/Pc84ftxjWxtzOKX7PUUz+qCOEpm1Fo9tJW
         EvXNzch85VijjAb9IjFAfg3FG+Zf9uXYcYhWZZD9bdTK9vQjn/7sSSvOFtMWRY57xZwH
         SokRC8QClLBJuETVBKT8hIX57DElrKsXZHFaBvNFk4hZR/ObcOyPRm6u4ByL8v/oIzES
         K4792632LJu+mi8bt7kLyy8PzrKVCAjvM/FOWwBFH6Q5V3O/bxG/hupcDaH8/Lrj6WUZ
         6aIBE16O985eoCZ0d9xH0ycLi9YvgjYjlIbNs0eIyHlcF5Af/14zXAEyv/nlIJiqWknw
         MqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Rf7S66rR/H+4CcWlMfRSPZkVzNT7/177BSacxGhHD8I=;
        b=bvNutJC+ufdYqbUAlH3Gf+lS7qSFovX9mWiMSScaLGKqrsQgTnvmie8XxZZ8yGfQnF
         bsr6PNFg04RIbibK/vWC/OcD3UNg6oBrX6wpdtXAW1g40FEq1He0tuh38XRRCMvvmrpH
         VXQPXKKWVaQUE7RNhAxaCMjDeZFwqlNVpz4sMA1Vkyuzbhq9jvGmI4h3AlkpbD7i5lQd
         /nVL2lAKYob/z3kn8vtW+EFwIn1gk9EUjXPGckrhfN0kz5oOC3TjxQoq5RQ85BtdiagK
         91iKU5FxXqLJwuf32JiXI17kP2V1tQ7vxUIYHjtIbeBtuQC9qJoLQZAuw1iS5KjtHrb3
         gYlQ==
X-Gm-Message-State: AOAM532Iy4bGrLgj131+g4HZzoxiBKROPAl+aGJksepj90/T4rWrdeeq
        b6AyRGV4jKR13wQcMnSot1+nDzRPjs0hjEkgUwZpDV6fYp0SJpfAhVw=
X-Google-Smtp-Source: ABdhPJzJ5G4QqN5Lc7h2lqNcvKyrM3bMtW5xQLxW/SIEK8yTvF3wRy1bRBm4zQDQFhvQ14n+j3+RDtsxBNiAO/dNwRI=
X-Received: by 2002:a17:90a:d991:: with SMTP id d17mr2333400pjv.229.1615863450942;
 Mon, 15 Mar 2021 19:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210315162428.3719edb2@canb.auug.org.au> <bebcf210-e0a4-31d5-5c56-38643ce77ec4@infradead.org>
In-Reply-To: <bebcf210-e0a4-31d5-5c56-38643ce77ec4@infradead.org>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Tue, 16 Mar 2021 10:56:53 +0800
Message-ID: <CAMZfGtWQNhPR0N1cX1aR2R4_7acEE+0VDiHMJEkAPaXnWKhZqA@mail.gmail.com>
Subject: Re: [External] Re: linux-next: Tree for Mar 15 (arch/x86/mm/init_64.c
 :: vmemmap)
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        X86 ML <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Mar 16, 2021 at 12:05 AM Randy Dunlap <rdunlap@infradead.org> wrote=
:
>
> On 3/14/21 10:24 PM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Warning: Some of the branches in linux-next are still based on v5.12-rc=
1,
> > so please be careful if you are trying to bisect a bug.
> >
> > News: if your -next included tree is based on Linus' tree tag
> > v5.12-rc1{,-dontuse} (or somewhere between v5.11 and that tag), please
> > consider rebasing it onto v5.12-rc2. Also, please check any branches
> > merged into your branch.
> >
> > Changes since 20210312:
> >
>
> on x86_64:
>
> In file included from ../include/asm-generic/bug.h:5:0,
>                  from ../arch/x86/include/asm/bug.h:93,
>                  from ../include/linux/bug.h:5,
>                  from ../include/linux/signal.h:5,
>                  from ../arch/x86/mm/init_64.c:10:
> ../arch/x86/mm/init_64.c: In function =E2=80=98remove_pmd_table=E2=80=99:
> ../arch/x86/mm/init_64.c:1127:8: error: implicit declaration of function =
=E2=80=98vmemmap_pmd_is_unused=E2=80=99; did you mean =E2=80=98vmemmap_pmd_=
populate=E2=80=99? [-Werror=3Dimplicit-function-declaration]
>         vmemmap_pmd_is_unused(addr, next)) {
>         ^
> ../include/linux/compiler.h:58:52: note: in definition of macro =E2=80=98=
__trace_if_var=E2=80=99
>  #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
>                                                     ^~~~
> ../arch/x86/mm/init_64.c:1126:11: note: in expansion of macro =E2=80=98if=
=E2=80=99
>     } else if (IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP) &&
>            ^~
>

I believe this compiler error is fixed by:

https://lore.kernel.org/linux-mm/20210309214050.4674-4-osalvador@suse.de/

Thanks.

>
> Full randconfig file is attached.
>
> --
> ~Randy
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
