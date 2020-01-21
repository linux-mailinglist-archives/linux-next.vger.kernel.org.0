Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70788143717
	for <lists+linux-next@lfdr.de>; Tue, 21 Jan 2020 07:28:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbgAUG2q (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Jan 2020 01:28:46 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:44129 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725972AbgAUG2q (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 21 Jan 2020 01:28:46 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 481zBd6pmhz9sRK;
        Tue, 21 Jan 2020 17:28:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579588123;
        bh=BmcDu/z0+xtLxGNX2+EtJlFIdmQVvK3v9NtLm1OAAS8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Q9JX8d+ZjWzXti5N7s3w6HmwX/xr+a+ml4tKl2uVGQr+zzrEXDb9Wz9J7zm2SaDzt
         E1RJq/GquoWDvjX//OG/FsEuDFSilRHBY1AcKWm3Pnf5j4WTZr95SbBN2hP83aMgxo
         VHIgWzBuWYIfuM7qMsSmoVSQNSmSLJe8znh3Fb3uZaZ6w3nzGi97//gF1yXAMFsHyV
         DHBWBFZJ3eMuNWC6lSGgMmrOko72YIv+7mA0BD0i7W+JZjvEUQSaM9XWaxEIM6Z7+v
         CLWeBlqOObwuXLaxHArcE4CbK75cP+BF4l/ldd3WS6sJ93RKDqbVe9zWGDg8zHsO9Q
         6zbf1aIiVkfOw==
Date:   Tue, 21 Jan 2020 17:28:23 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Greg KH <greg@kroah.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: linux-next: build warnings after merge of the usb tree
Message-ID: <20200121172823.62617483@canb.auug.org.au>
In-Reply-To: <CAJKOXPcVnjT1R4dvZ+xBdZ2mQ-XS385YEv33Q++qh3K5aw6OjA@mail.gmail.com>
References: <20200107143058.7f821056@canb.auug.org.au>
        <CAJKOXPcVnjT1R4dvZ+xBdZ2mQ-XS385YEv33Q++qh3K5aw6OjA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GSxZIVJmQv4HhsVa+aE1HP.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/GSxZIVJmQv4HhsVa+aE1HP.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 7 Jan 2020 09:06:01 +0100 Krzysztof Kozlowski <krzk@kernel.org> wro=
te:
>
> On Tue, 7 Jan 2020 at 04:31, Stephen Rothwell <sfr@canb.auug.org.au> wrot=
e:
> >
> > After merging the usb tree, today's linux-next build (x86_64 allmodconf=
ig)
> > produced these warnings:
> >
> > WARNING: unmet direct dependencies detected for I2C_S3C2410
> >   Depends on [n]: I2C [=3Dy] && HAS_IOMEM [=3Dy] && HAVE_S3C2410_I2C [=
=3Dn]
> >   Selected by [m]:
> >   - PHY_EXYNOS5250_SATA [=3Dm] && (SOC_EXYNOS5250 || COMPILE_TEST [=3Dy=
]) && HAS_IOMEM [=3Dy] && OF [=3Dy]
> >
> > WARNING: unmet direct dependencies detected for I2C_S3C2410
> >   Depends on [n]: I2C [=3Dy] && HAS_IOMEM [=3Dy] && HAVE_S3C2410_I2C [=
=3Dn]
> >   Selected by [m]:
> >   - PHY_EXYNOS5250_SATA [=3Dm] && (SOC_EXYNOS5250 || COMPILE_TEST [=3Dy=
]) && HAS_IOMEM [=3Dy] && OF [=3Dy]
> >
> > WARNING: unmet direct dependencies detected for I2C_S3C2410
> >   Depends on [n]: I2C [=3Dy] && HAS_IOMEM [=3Dy] && HAVE_S3C2410_I2C [=
=3Dn]
> >   Selected by [m]:
> >   - PHY_EXYNOS5250_SATA [=3Dm] && (SOC_EXYNOS5250 || COMPILE_TEST [=3Dy=
]) && HAS_IOMEM [=3Dy] && OF [=3Dy]
> >
> > Introduced by commit
> >
> >   203b7ee14d3a ("phy: Enable compile testing for some of drivers") =20
>=20
> The fix is here:
> https://lore.kernel.org/lkml/CAMuHMdUXJo3=3Dx32xbfSUXs3O3JHaFpfxt0mHupEb+=
vzi=3D5+S4g@mail.gmail.com/
> i2c: Enable compile testing for some of drivers
> Although I need to send v2 of it.

I am still seeing these warnings.

--=20
Cheers,
Stephen Rothwell

--Sig_/GSxZIVJmQv4HhsVa+aE1HP.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4mmgcACgkQAVBC80lX
0GxbIAf+Lv12GhsdRuujWSNADlXHqtQj5I4WPaiJukooiHoxvytIvp36MElgOw0n
oB/Jt2PH3E8CB/1TEXiKWf3uaoKQhN38wq/JgVF8NXbuf6dIDQeq+lCWbqKZym1S
sYO4ssM75thoaTvxIF4VwcfsyBBN27JGr3cNb6IbEoS/RLEdUvOSvninFphvnQW8
hPj02fahhVHRGuD2PVAVXk2jyLnfEgSqzV8NjHhtGSyeu3twoukldCS7gqlSZAy0
uJYx+00e8gSLCjPUdNFVTtBDxnvYaNjRveeoLuepf7qlyf6Qnp2DnUMMQOFZ0RdX
EIpyJi6PfgSnwOjXwVhfegwNaXFYMg==
=m7Mw
-----END PGP SIGNATURE-----

--Sig_/GSxZIVJmQv4HhsVa+aE1HP.--
