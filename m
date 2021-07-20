Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C8C53CF54F
	for <lists+linux-next@lfdr.de>; Tue, 20 Jul 2021 09:32:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232727AbhGTGvo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Jul 2021 02:51:44 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:35685 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229684AbhGTGvP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Jul 2021 02:51:15 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GTVlM5fyfz9s1l;
        Tue, 20 Jul 2021 17:31:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626766304;
        bh=Qur8bvvIU6iEx0EgzbfwK+Fesw2hd8eOYcHRg1aHBVs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=GLtZrB2z6VTiFEh2gG06hnEBj2YNDg9zcZ4vbDEyXdoGD9fzKt8yeuWMcrGsp/jXC
         wf++mT1NZx9YxRzsoYkguey0oVdmp0rSo4facknW00+dhlbC6IqGY2Hqt6crfcXhVc
         uZZxQYOxts+WI0lhusCVKzyPLEcKdDTb6hk/6T86vLViJxw/svltM8Ya4r8Hiz2neK
         4UpYxYRZlIVf4tahN+q2WifmxP6IfjwwdX6obT0MM3X9o4T+mdIclrcCCZqUQWpd5s
         AXh5IPJCnFjzoV4ALY/u+4ivOGplukQRvsHmWY3QsuA1Qujlqmsiqey0lOPU8IbQuI
         Qh2fuzonPgfzQ==
Date:   Tue, 20 Jul 2021 17:31:42 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        "William A. Kennington III" <wak@google.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning from Linus' tree
Message-ID: <20210720173142.00a375c5@canb.auug.org.au>
In-Reply-To: <20210708122544.011171b3@canb.auug.org.au>
References: <20210601172026.6bc0a96f@canb.auug.org.au>
        <20210708122544.011171b3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nxr6C.gUKUXygzOV9CnfzPk";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/nxr6C.gUKUXygzOV9CnfzPk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 8 Jul 2021 12:25:44 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Tue, 1 Jun 2021 17:20:26 +1000 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > When building Linus' tree, today's linux-next build (htmldocs) produced
> > this warning:
> >=20
> > include/linux/spi/spi.h:671: warning: Function parameter or member 'dev=
m_allocated' not described in 'spi_controller'
> >=20
> > Introduced by commit
> >=20
> >   794aaf01444d ("spi: Fix use-after-free with devm_spi_alloc_*")
> >=20
> > This has been around for a while (at least v5.13-rc1 and next-20210409).
> > Sorry I did not report it earlier. =20
>=20
> I am still getting this warning.

I am still getting this warning.  It is now on line 675.

--=20
Cheers,
Stephen Rothwell

--Sig_/nxr6C.gUKUXygzOV9CnfzPk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmD2e98ACgkQAVBC80lX
0GwY/AgApe05ioTeshM0yuIV4rgiX56kgCa+OIH3rTCCni/Lv5KMIf1LU+gF88H3
lAmXjXp3h7PGeRjb9SPN/ryt0cbWR9l3rOcFEg1Euomh+mLn1vOZhJHPZiktVV8K
CBNTbkD/6QMrEbb8536EohWpYRmYWP1F8ta2X9yKQdIL94Xjy9SLLbkoKixxYhbd
UpxEVR1Xo51+Zf1t2HZXJnusaZLYG3Zfm7T1E7zW72EZKJ+mg4hwePTJ/yNTj2Iw
Xs1MMOK/eiWyeodf5YELaUaqDNi3zVzUM+SkFYtTht6VBkaK6dMwmSk1MhAX/FY7
ZrsrNtjVmAo0KpeJIlZjNwNj6/+5cQ==
=Vgnl
-----END PGP SIGNATURE-----

--Sig_/nxr6C.gUKUXygzOV9CnfzPk--
