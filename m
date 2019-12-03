Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 932A210F3C6
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2019 01:04:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725853AbfLCAEE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Dec 2019 19:04:04 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:40511 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725775AbfLCAED (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Dec 2019 19:04:03 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47RhzP0l0Wz9sNx;
        Tue,  3 Dec 2019 11:04:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1575331441;
        bh=ofrQW0TxwGuulPyyDJrLFkNoyUmA1WX9cbDzUsNjSzU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=jERqg3KyVq1w3LRkRhHkGgwkLi71aZdEPPxg6vbuLchjnlFySZl1CcWLpDlCf2NWH
         3SC76kLFVNZ73Qhs2MgHh71IqEW6qvqtqu1y7LbS83noP7VacMzNeYxD6dAnkGZBXb
         z3EzGI+gxyG40cXifuz+n4jN2PKUKyUt80dWkZxGbKcggabcKHvGklqpbZj1iiHuzJ
         0DuT+sYznwt8WRs7ZI+0YPA+vMSqV5ZR6zOSS6oJk9SLVpzrC9gqUXjqUuWd/Eg6p7
         38fX07XfuOCs9P0sEpdnUga7Mpm/iffLE/pDYdE3SIQZaPx2nLJbsWXSRKnoEke0aC
         rDwtSzt3tA0uw==
Date:   Tue, 3 Dec 2019 11:04:00 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>,
        Linus <torvalds@linux-foundation.org>
Subject: Re: linux-next: manual merge of the devicetree tree with the
 arm-soc tree
Message-ID: <20191203110400.1b6b279b@canb.auug.org.au>
In-Reply-To: <20191114132131.56089c64@canb.auug.org.au>
References: <20191114132131.56089c64@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qXPlHYDi8KsouRe1yiGKkSv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qXPlHYDi8KsouRe1yiGKkSv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

This is now a conflict between the arm-soc tree and Linus' tree.

On Thu, 14 Nov 2019 13:21:31 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the devicetree tree got a conflict in:
>=20
>   Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
>=20
> between commit:
>=20
>   577dd5de0990 ("arm64: dts: juno: add GPU subsystem")
>=20
> from the arm-soc tree and commit:
>=20
>   3afd6389f320 ("dt-bindings: gpu: mali-midgard: add samsung exynos 5420 =
compatible")
>=20
> from the devicetree tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
> index 018f3ae4b43c,c9bdf1074305..000000000000
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
> @@@ -21,11 -29,8 +29,12 @@@ properties
>         - items:
>             - enum:
>                - amlogic,meson-gxm-mali
> +              - realtek,rtd1295-mali
>             - const: arm,mali-t820
>  +      - items:
>  +          - enum:
>  +             - arm,juno-mali
>  +          - const: arm,mali-t624
>         - items:
>             - enum:
>                - rockchip,rk3288-mali
> @@@ -34,16 -40,8 +44,7 @@@
>             - enum:
>                - rockchip,rk3399-mali
>             - const: arm,mali-t860
> -       - items:
> -           - enum:
> -              - samsung,exynos5250-mali
> -           - const: arm,mali-t604
> -       - items:
> -           - enum:
> -              - samsung,exynos5433-mali
> -           - const: arm,mali-t760
>  =20
> -           # "arm,mali-t628"
>  -          # "arm,mali-t624"
>             # "arm,mali-t830"
>             # "arm,mali-t880"
>  =20

--=20
Cheers,
Stephen Rothwell

--Sig_/qXPlHYDi8KsouRe1yiGKkSv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3lpnAACgkQAVBC80lX
0Gy4ewf+NX1otwr8rrbU2acRi56O4a9hBWjL0oXOLgyVdoUdYL3/iF5l/Q6wA/La
oGnuvlceXlBMxKL9nTXwlClE2dl3OElCShhS27phspwp9EfDHL6CjaO6IF/dW+0j
7D8QkN+lnyqCm5mYqzwQUkq/6RV44MbnZFySAna7TOvwqaAR5WetJGlQgnJjsgGX
ERrIe3dCHLzWuL+Km87tifOBU36BwxEqkRJEJqrqIfNk6Ty7YomUa4AcWpLAnD++
7YwuX48ab3X3vdgZCl8SdwHMrr1s1T5fiPqJOgCVBK5TezZGgrjWdqrW23hFpSJR
H/uDVxTcFJVJgWRIpkQxPO62Z9L+xQ==
=wce3
-----END PGP SIGNATURE-----

--Sig_/qXPlHYDi8KsouRe1yiGKkSv--
