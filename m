Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F2DE45AF71
	for <lists+linux-next@lfdr.de>; Tue, 23 Nov 2021 23:52:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233951AbhKWWzd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Nov 2021 17:55:33 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:46377 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbhKWWzd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Nov 2021 17:55:33 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HzKCS0FC6z4xR9;
        Wed, 24 Nov 2021 09:52:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1637707942;
        bh=nJ3v47D44xi4bEAxxkbK0bqu4F1ye/w5S9LdQhDunn4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=lO6/hCKdQwbOUH0oetFG7UsGnAgEIqnJOQapPnQBGFzu8nlcwbpSTESmOzrme/9m3
         0hl8HHecNnVoZvfQx6LtrT5wOrpPUmsmBVk8TDExdJIN5N0Im3QvkVjli6yGgCvEWW
         tIiaAVYIJJQXTB07OD/S+Mq+An0KshvUC1nIWBIXo/mLc7h88IML8yzXu34DQW9oZu
         GaYxGuHSBM/VawRO2vBrH/tRmrwo4sMo+yMmYV7aZWdx9/6k6v9mT9bLaXrgnczRYW
         4CltoMs7jzL4q/0Z5OrX+JZcACdXY5I0Aic+K3zBKS1VkS6KTtQ2mVJwLq+rOfW4j9
         bSV6sMZdpBLGQ==
Date:   Wed, 24 Nov 2021 09:52:18 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Waiman Long <longman@redhat.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Minchan Kim <minchan@kernel.org>,
        Mike Galbraith <umgwanakikbuti@gmail.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, lkft-triage@lists.linaro.org
Subject: Re: [PATCH v2] locking: Fixup write_lock_nested() implementation.
Message-ID: <20211124095218.4a83f39e@canb.auug.org.au>
In-Reply-To: <20211123170134.y6xb7pmpgdn4m3bn@linutronix.de>
References: <CA+G9fYtH2JR=L0cPoOEqsEGrZW_uOJgX6qLGMe_hbLpBtjVBwA@mail.gmail.com>
        <CAK8P3a1NhpNxWfj3gDnuf4bWK_fiE8cjcRyN7e8j95NmvOzbGw@mail.gmail.com>
        <CAMuHMdVuoUAM-6H2BXYtUH++4yXhRCGLAdbzx2GqAJk64FYO=A@mail.gmail.com>
        <20211123145006.bon3usz4ilhw6ymg@linutronix.de>
        <20211123160712.fssioyabln5erx2u@linutronix.de>
        <20211123170134.y6xb7pmpgdn4m3bn@linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/w9K6C0uM4PeS2VBEioL/GRL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/w9K6C0uM4PeS2VBEioL/GRL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 23 Nov 2021 18:01:34 +0100 Sebastian Andrzej Siewior <bigeasy@linut=
ronix.de> wrote:
>
> Andrew, please merge it into:
>   locking/rwlocks: introduce write_lock_nested
>   locking-rwlocks-introduce-write_lock_nested.patch
>=20
> And if someone could test it, I get sh4 defconfig built with and without
> lockdep. x86 seems still to build, too. So it can't be that bad.
>=20
> v1=E2=80=A6v2: I noticed a typo in _raw_write_lock_nested() and decided t=
hat it
> is no needed so now it is removed for !CONFIG_INLINE_WRITE_LOCK.
>=20
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  include/linux/rwlock_api_smp.h | 1 -
>  kernel/locking/spinlock.c      | 4 ++++
>  2 files changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/linux/rwlock_api_smp.h b/include/linux/rwlock_api_sm=
p.h
> index f0c535ec4e654..dceb0a59b6927 100644
> --- a/include/linux/rwlock_api_smp.h
> +++ b/include/linux/rwlock_api_smp.h
> @@ -47,7 +47,6 @@ _raw_write_unlock_irqrestore(rwlock_t *lock, unsigned l=
ong flags)
> =20
>  #ifdef CONFIG_INLINE_WRITE_LOCK
>  #define _raw_write_lock(lock) __raw_write_lock(lock)
> -#define _raw_write_lock_nested(lock, subclass) __raw_write_lock_nested(l=
ock, subclass)
>  #endif
> =20
>  #ifdef CONFIG_INLINE_READ_LOCK_BH
> diff --git a/kernel/locking/spinlock.c b/kernel/locking/spinlock.c
> index 996811efa6d6e..7f49baaa49793 100644
> --- a/kernel/locking/spinlock.c
> +++ b/kernel/locking/spinlock.c
> @@ -301,6 +301,10 @@ void __lockfunc _raw_write_lock(rwlock_t *lock)
>  }
>  EXPORT_SYMBOL(_raw_write_lock);
> =20
> +#ifndef CONFIG_DEBUG_LOCK_ALLOC
> +#define __raw_write_lock_nested(lock, subclass)	__raw_write_lock(((void)=
(subclass), (lock)))
> +#endif
> +
>  void __lockfunc _raw_write_lock_nested(rwlock_t *lock, int subclass)
>  {
>  	__raw_write_lock_nested(lock, subclass);
> --=20
> 2.34.0
>=20

I have added that patch to iinux-next today.

--=20
Cheers,
Stephen Rothwell

--Sig_/w9K6C0uM4PeS2VBEioL/GRL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGdcKIACgkQAVBC80lX
0GxcKwf8DSXSQ4vFx8KZgCNUsRDvQY9k0L1Anncmc+YDBzHVLsGNp1y16KV8RnFG
EH3z7YUHfQXJw+IuwV+zVx4sScskhe0rsnYeevnobC9sYlBR1FWNczzXVL9l2Cy5
VT3OOvp3pP9voolA0ESmtt2jvROTpjX0jzIbDPE/kfkAwbzeypsp7oNPKRnc/19E
h3oVYUIRteF/Z/ix3b5WEXhByTlVyHsTtvhnifDaIMY8GwERfpsVg86s159FTpgc
DxpjChCd5a82fz/Xu8/4FgU97YAoJi8xchXIv+xwQU3Np6Z891N4dK8blRsk4ZSJ
4TE4qakICK1UDliAhxUa6Ec4DWnokg==
=TnkZ
-----END PGP SIGNATURE-----

--Sig_/w9K6C0uM4PeS2VBEioL/GRL--
