Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0AD9A5DFE
	for <lists+linux-next@lfdr.de>; Tue,  3 Sep 2019 01:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726974AbfIBXHk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Sep 2019 19:07:40 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:36365 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726796AbfIBXHk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Sep 2019 19:07:40 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46Mm2K23hKz9s4Y;
        Tue,  3 Sep 2019 09:07:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567465657;
        bh=sWyxQuyh39T3qoGkjoRnfBJu9BPGs6FykK6ygxJTWh8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=b8bgHbDE/189oqHftai7fgyHgU+uUNgCSdcDVuCDai6sVa1CT7Ae4xQZB970EE+UN
         xLRyCusQgz3Go4EQ+KQN8JfcepgoajehS/owFwHQ22+07tgWq+FtCZzI5ik9pMbHkq
         NjtUghNG/I71GQxbpqPfP/60CTi6t5uma9N1tqgJM6JBuI3+wYOMX/v/Bz17tNryuD
         em6T4Hmg3wFT0U50b/hn349nrieyA+dOircVzrw21nJjoO15uCatxwNVpUzhQ5nzfW
         2DiCdh+pKNK/3KZViKHkyDobcMRY7SIgWNvRL3PXg5ygJoKFWSgmXIQyNkE/xZRJF3
         8k/GYCnrgxulg==
Date:   Tue, 3 Sep 2019 09:07:22 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the keys tree
Message-ID: <20190903090722.556b66ba@canb.auug.org.au>
In-Reply-To: <16836.1567440079@warthog.procyon.org.uk>
References: <20190902161935.78bf56f1@canb.auug.org.au>
        <20190829153116.7ffc7470@canb.auug.org.au>
        <16836.1567440079@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HZXDSEv6WllHq4LPCrh1xqt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/HZXDSEv6WllHq4LPCrh1xqt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi David,

On Mon, 02 Sep 2019 17:01:19 +0100 David Howells <dhowells@redhat.com> wrot=
e:
>
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>=20
> > The forward declararion doesn't seem to work (at laste for the
> > !CONFIG_USB_NOTIFICATIONS case. =20
>=20
> In the !CONFIG_USB_NOTIFICATIONS case, the argument is to a stub inline
> function.  Even though the argument isn't actually used, it can't be an
> undefined type - and, I'm guessing, an undefined size, meaning the compil=
er
> doesn't know how many registers/how much stack space it would occupy befo=
re
> getting to the error argument.
>=20
> I have a fix for this in my tree that just makes it an unsigned int in the
> disabled case:
>=20
> static inline void post_usb_device_notification(const struct usb_device *=
udev,
> 						unsigned int subtype, u32 error) {}

But not published, yet?

> > +#include <linux/watch_queue.h> =20
>=20
> I was trying to avoid that if I could to avoid introducing the possibilit=
y of
> circular deps, but that might not be a problem in this case.

Seems to be OK for x86_64 allmodconfig at least.

>=20
> > I then discovered that I needed to install libkeyutils-dev :-( but it
> > built OK after that. =20
>=20
> ?  The kernel shouldn't require that to build.

I was doing an x86_64 allmodconfig build which seems to build (all of?)
the samples.

--=20
Cheers,
Stephen Rothwell

--Sig_/HZXDSEv6WllHq4LPCrh1xqt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1toKoACgkQAVBC80lX
0GwZ6Af/ezIrVBbmjJouyyUc2OM8oVVCVxXLcsSRPcAFcergslPYVPsdwg52tf5l
9tQRTTNzH125ZAan3B26Enhj0OXZUfStThmf4y9nP6AO0RcBoysE3N5ikeQeibJv
fSw+B4njxMvx6rC+31E6TyX8K0Uj04rcFVVfIqy5CtbkETvEEx0i1MW1UTqO6dp+
XCtqRc4KJafgfZIPlJ+v7ChCWvVAmSRUGee6S4SUL+Kvu3O8ixdpOLFQjwq0oSqy
2w8oEnpVr19767ztDiVIySCtH8bqr0XmzAM1/TKD9hYjCukKHvr/R3TyYhEo03rr
R97ODiKXYPQv7omBlTK7B2xUEXUwTA==
=xj8a
-----END PGP SIGNATURE-----

--Sig_/HZXDSEv6WllHq4LPCrh1xqt--
