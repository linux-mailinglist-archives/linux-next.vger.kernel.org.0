Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2FE42DB97B
	for <lists+linux-next@lfdr.de>; Wed, 16 Dec 2020 03:57:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725796AbgLPC4x (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Dec 2020 21:56:53 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:38741 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725710AbgLPC4x (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Dec 2020 21:56:53 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cwfs53htbz9sRR;
        Wed, 16 Dec 2020 13:56:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1608087370;
        bh=NSOkPPx9uvInLMhHLnaUTrWaaoUHithaeReAffjWEUs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=GbQ7vb8hrWycDDqXZ+q0yG1Z69/FFUhAToabHWVabmmkDw6TgsQ3MjPcM6Q/qP46P
         mCh9uUtwD6T5JwuohdWUw/5UWruTh9zbVU7sXSLGljhpqWFmQRkmRPk2cBcGDTQYS9
         nHm2XMzQyFg7m0Wnf434dBkYndFc13qU5tu/DLg7bY8nYN2fvM2u9gUKCpdeD4ro+u
         /K8i0i+60b63ccfdm8YiPAIkwtWK3HsZIErkzpl32iiz5f45kp0GL13p0WnFpBYMGL
         e4DzDF5uLGZvvdecgwk/yysvagdC9gpYbqo1eUOFnh2QF1BRiRMBKkfBrvT9Mg7PVy
         AIhK23iE6ts6g==
Date:   Wed, 16 Dec 2020 13:56:08 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Wim Van Sebroeck <wim@iguana.be>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the watchdog tree
Message-ID: <20201216135608.4e7a72e5@canb.auug.org.au>
In-Reply-To: <81ec0eee-0f22-b8ad-5a71-1690d4c4ec27@roeck-us.net>
References: <20201214162129.79efb225@canb.auug.org.au>
        <81ec0eee-0f22-b8ad-5a71-1690d4c4ec27@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9.K+1omN0B/MQlAUg3oLHDn";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9.K+1omN0B/MQlAUg3oLHDn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Sun, 13 Dec 2020 22:09:55 -0800 Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 12/13/20 9:23 PM, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > After merging the watchdog tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >=20
> > In file included from include/linux/device.h:15,
> >                  from include/linux/acpi.h:15,
> >                  from drivers/watchdog/iTCO_wdt.c:48:
> > drivers/watchdog/iTCO_wdt.c: In function 'iTCO_wdt_start':
> > drivers/watchdog/iTCO_wdt.c:280:17: error: 'struct watchdog_device' has=
 no member named 'dev'
> >   280 |   dev_err(wd_dev->dev, "failed to reset NO_REBOOT flag, reboot =
disabled by hardware/BIOS\n");
> >       |                 ^~ =20
>=20
> Yes, that should have been wd_dev->parent. Sorry I didn't notice that ear=
lier.
>=20
> Guenter
>=20
> > include/linux/dev_printk.h:112:11: note: in definition of macro 'dev_er=
r'
> >   112 |  _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
> >       |           ^~~
> >=20
> > Caused by commit
> >=20
> >   9c612b338fdf ("watchdog: iTCO_wdt: use dev_*() instead of pr_*() for =
logging")
>=20
> > I have used the wtchdog tree from next-20201211 for today.

I am still getting this build failure.

--=20
Cheers,
Stephen Rothwell

--Sig_/9.K+1omN0B/MQlAUg3oLHDn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/Zd0gACgkQAVBC80lX
0Gx6Gwf9EQGh1u47Q54ZyeQAQ5dPP752BUt1Etsg9jF1KGGQaCH/6g+P6XLV7Fz/
VfJGE79I337kQjNHwwYi9Ct5e441XGBoF9UsAOi8xDvajSz8jkVH3WcjjAGan67P
6zHks/6bnDyx8ZQM4eZBH1nMpTu60YpeXcBH9JikGiTXnZiCA/ppG4nBTPxCrIyu
eE0O/2Bk81aOTvQWORhWk3leCRwqo+0jCo3pDH6xgpmE+Bh4vwatDL4xjG/dhwHM
/CiStFdbwv2xGMSjxe5/u2PW3HUSHHOYBaQozMsZAAsIvJkckgrKpi4po7i2fFOX
EAlrfBmy7VYi4TesOvPfOySydyYV7Q==
=oTQP
-----END PGP SIGNATURE-----

--Sig_/9.K+1omN0B/MQlAUg3oLHDn--
