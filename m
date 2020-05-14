Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63D061D25F3
	for <lists+linux-next@lfdr.de>; Thu, 14 May 2020 06:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725806AbgENEq1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 May 2020 00:46:27 -0400
Received: from mail.zx2c4.com ([192.95.5.64]:49915 "EHLO mail.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725794AbgENEq1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 May 2020 00:46:27 -0400
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id df5ef381;
        Thu, 14 May 2020 04:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
        :references:in-reply-to:from:date:message-id:subject:to:cc
        :content-type; s=mail; bh=PE/H4CXhRSEB5FLtI6sjan2fvtw=; b=aXHhlQ
        hKJtBkhKRi3+NVcJxy56rF0b2tvMKYtpoztaGUxEhvLh3uqZCszusTiI7hLd3C4Y
        Xza9ft3Y3Wgt/fYO5JucAJiTgt7iBx0syh079sv5piCKPOc9galz4NGbWDDfWGCG
        li1WiYLrp3bONFwZxulPGGLJUy2mjhE5f7TyrAdVnMfQzJGinMdNQ3LYrmLrihfu
        uC3DNwUonXxsrn/lMravOitp8Ho5Lt+COJ7smOiocU2FlxT9v8wM736UusYSxwWJ
        CIrDxUpb9qwqP4YEc3zo7sj3MHFqc1+oEGk9C9+Zx/w2Qs/8Ftf5YQkFwYF7NTCJ
        7uIqY3aQiBq0o/Ew==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8dda2136 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Thu, 14 May 2020 04:32:43 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id w11so1554310iov.8;
        Wed, 13 May 2020 21:46:23 -0700 (PDT)
X-Gm-Message-State: AOAM531h6slkEd0yszYrbH19bj1gaQ/d0LTt1pvW2M4fdkzW61CCFSXd
        MaO87JaOJQzvoZWHNB8niAewyN4OXqKforZSmJI=
X-Google-Smtp-Source: ABdhPJzcRk9Jn3eB0ogJHIaCvKD8L+gK1sQoOyT1l6QXWin+UGkYbgOmCEAe8Zk7jAtYZdHuq/XAjRD/6SiFwyOSn7A=
X-Received: by 2002:a6b:b486:: with SMTP id d128mr2406785iof.79.1589431582612;
 Wed, 13 May 2020 21:46:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200514143055.1f71ba68@canb.auug.org.au>
In-Reply-To: <20200514143055.1f71ba68@canb.auug.org.au>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Wed, 13 May 2020 22:46:10 -0600
X-Gmail-Original-Message-ID: <CAHmME9osYhwzFEyGUELqSSNexgK56NJrOrWTi3vnyDft8tv-hw@mail.gmail.com>
Message-ID: <CAHmME9osYhwzFEyGUELqSSNexgK56NJrOrWTi3vnyDft8tv-hw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the keys tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     David Howells <dhowells@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hey Masahiro,

Your touch might be helpful here. CRYPTO_LIB_CHACHA20POLY1305 is a
tristate and depends on as well as selects other things that are
tristates.

Meanwhile BIG_KEYS is a bool, which needs to select
CRYPTO_LIB_CHACHA20POLY1305. However, it gets antsy if the the symbol
its selecting has =m items in its hierarchy.

Any suggestions? The ideal thing to happen would be that the select of
CRYPTO_LIB_CHACHA20POLY1305 in BIG_KEYS causes all of the descendants
to become =y too.

Jason


On Wed, May 13, 2020 at 10:31 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the keys tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> WARNING: unmet direct dependencies detected for CRYPTO_LIB_CHACHA20POLY1305
>   Depends on [m]: CRYPTO [=y] && (CRYPTO_ARCH_HAVE_LIB_CHACHA [=m] || !CRYPTO_ARCH_HAVE_LIB_CHACHA [=m]) && (CRYPTO_ARCH_HAVE_LIB_POLY1305 [=m] || !CRYPTO_ARCH_HAVE_LIB_POLY1305 [=m])
>   Selected by [y]:
>   - BIG_KEYS [=y] && KEYS [=y] && TMPFS [=y]
>   Selected by [m]:
>   - WIREGUARD [=m] && NETDEVICES [=y] && NET_CORE [=y] && NET [=y] && INET [=y] && (IPV6 [=y] || !IPV6 [=y])
>
> WARNING: unmet direct dependencies detected for CRYPTO_LIB_CHACHA20POLY1305
>   Depends on [m]: CRYPTO [=y] && (CRYPTO_ARCH_HAVE_LIB_CHACHA [=m] || !CRYPTO_ARCH_HAVE_LIB_CHACHA [=m]) && (CRYPTO_ARCH_HAVE_LIB_POLY1305 [=m] || !CRYPTO_ARCH_HAVE_LIB_POLY1305 [=m])
>   Selected by [y]:
>   - BIG_KEYS [=y] && KEYS [=y] && TMPFS [=y]
>   Selected by [m]:
>   - WIREGUARD [=m] && NETDEVICES [=y] && NET_CORE [=y] && NET [=y] && INET [=y] && (IPV6 [=y] || !IPV6 [=y])
>
> WARNING: unmet direct dependencies detected for CRYPTO_LIB_CHACHA20POLY1305
>   Depends on [m]: CRYPTO [=y] && (CRYPTO_ARCH_HAVE_LIB_CHACHA [=m] || !CRYPTO_ARCH_HAVE_LIB_CHACHA [=m]) && (CRYPTO_ARCH_HAVE_LIB_POLY1305 [=m] || !CRYPTO_ARCH_HAVE_LIB_POLY1305 [=m])
>   Selected by [y]:
>   - BIG_KEYS [=y] && KEYS [=y] && TMPFS [=y]
>   Selected by [m]:
>   - WIREGUARD [=m] && NETDEVICES [=y] && NET_CORE [=y] && NET [=y] && INET [=y] && (IPV6 [=y] || !IPV6 [=y])
> x86_64-linux-gnu-ld: lib/crypto/chacha20poly1305.o: in function `xchacha_init':
> chacha20poly1305.c:(.text+0x12d): undefined reference to `chacha_init_arch'
> x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x13d): undefined reference to `hchacha_block_arch'
> x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x14b): undefined reference to `chacha_init_arch'
> x86_64-linux-gnu-ld: lib/crypto/chacha20poly1305.o: in function `__chacha20poly1305_encrypt':
> chacha20poly1305.c:(.text+0x2ab): undefined reference to `chacha_crypt_arch'
> x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x2bd): undefined reference to `poly1305_init_arch'
> x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x2d6): undefined reference to `poly1305_update_arch'
> x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x317): undefined reference to `chacha_crypt_arch'
> x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x32d): undefined reference to `poly1305_update_arch'
> x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x379): undefined reference to `poly1305_update_arch'
> x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x385): undefined reference to `poly1305_final_arch'
> x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x413): undefined reference to `poly1305_update_arch'
> x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x434): undefined reference to `poly1305_update_arch'
> x86_64-linux-gnu-ld: lib/crypto/chacha20poly1305.o: in function `chacha20poly1305_encrypt':
> (.text+0x59d): undefined reference to `chacha_init_arch'
> x86_64-linux-gnu-ld: lib/crypto/chacha20poly1305.o: in function `__chacha20poly1305_decrypt':
> chacha20poly1305.c:(.text+0x847): undefined reference to `chacha_crypt_arch'
> x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x859): undefined reference to `poly1305_init_arch'
> x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x86d): undefined reference to `poly1305_update_arch'
> x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x8a7): undefined reference to `poly1305_update_arch'
> x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x8f1): undefined reference to `poly1305_update_arch'
> x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x8fc): undefined reference to `poly1305_final_arch'
> x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x94f): undefined reference to `chacha_crypt_arch'
> x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x9d9): undefined reference to `poly1305_update_arch'
> x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x9f9): undefined reference to `poly1305_update_arch'
> x86_64-linux-gnu-ld: lib/crypto/chacha20poly1305.o: in function `chacha20poly1305_decrypt':
> (.text+0xb78): undefined reference to `chacha_init_arch'
> x86_64-linux-gnu-ld: lib/crypto/chacha20poly1305.o: in function `chacha20poly1305_crypt_sg_inplace':
> chacha20poly1305.c:(.text+0xf16): undefined reference to `chacha_init_arch'
> x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0xf3b): undefined reference to `chacha_crypt_arch'
> x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0xf50): undefined reference to `poly1305_init_arch'
> x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x1094): undefined reference to `chacha_crypt_arch'
> x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x1155): undefined reference to `poly1305_update_arch'
> x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x117b): undefined reference to `poly1305_update_arch'
> x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x11da): undefined reference to `poly1305_update_arch'
> x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x1223): undefined reference to `poly1305_final_arch'
> x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x1321): undefined reference to `chacha_crypt_arch'
> x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x1401): undefined reference to `poly1305_final_arch'
> x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x14a3): undefined reference to `poly1305_update_arch'
> x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x14d6): undefined reference to `poly1305_update_arch'
> x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x1507): undefined reference to `poly1305_update_arch'
> x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x1573): undefined reference to `poly1305_update_arch'
> x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x15aa): undefined reference to `poly1305_final_arch'
>
> Caused by commit
>
>   f22998a0de8a ("security/keys: rewrite big_key crypto to use library interface")
>
> I have used the keys tree from next-20200512 for today.
>
> --
> Cheers,
> Stephen Rothwell
