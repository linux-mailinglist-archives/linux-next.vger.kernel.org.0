Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 878EE3AF72B
	for <lists+linux-next@lfdr.de>; Mon, 21 Jun 2021 23:06:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231303AbhFUVIj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Jun 2021 17:08:39 -0400
Received: from gimli.rothwell.id.au ([103.230.158.156]:41049 "EHLO
        gimli.rothwell.id.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230102AbhFUVIi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Jun 2021 17:08:38 -0400
Received: from authenticated.rothwell.id.au (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.rothwell.id.au (Postfix) with ESMTPSA id 4G82Bh1HLGzydf;
        Tue, 22 Jun 2021 07:06:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rothwell.id.au;
        s=201702; t=1624309581;
        bh=e/1BclmMf2BacvVDqqgjSnW53P/+f31WTjEUIS9DCtI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=SvgV1Acpm9KnVyBezOGwDGXHNcsn+BTQOfUko2Zf9P7O7Jn5XLt9PMNjO44ZSSTW1
         KI3DMw/gy+K/GrZOi8VMDEDwEcO1jxaGEeuhM/XLHTf6Wl4nhk6o32cfjpsy7E6Glh
         JFBXBGHNQBNiU/pHnQo2uJE4njJUvLEYmM238p31QpbVegn8GxT19UrJRFlZ0I/5NR
         GvtkfMigStHvm5YN4Z1Lbu4rCjMHhS0EYLnon0B7zcLbiB9+f1RBA2wrWojRA6TCAa
         ugD1Q8PJcrcSmiyHVJD4zmuTc2gi0jy1b77df3dZSuNCYR5Bms5oMzkTDOALp/twXt
         lQOqbDlKWBF1g==
Date:   Tue, 22 Jun 2021 07:06:17 +1000
From:   Stephen Rothwell <sfr@rothwell.id.au>
To:     Sean Anderson <sean.anderson@seco.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Rob Herring <robherring2@gmail.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the devicetree tree
Message-ID: <20210622070617.19517119@elm.ozlabs.ibm.com>
In-Reply-To: <456f4183-aa2e-b714-e681-819485f222a1@seco.com>
References: <20210621084216.3c477f94@canb.auug.org.au>
        <456f4183-aa2e-b714-e681-819485f222a1@seco.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P4I6nTS6syEAgLI5btpe.3c";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/P4I6nTS6syEAgLI5btpe.3c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Sean,

On Mon, 21 Jun 2021 10:38:32 -0400 Sean Anderson <sean.anderson@seco.com> w=
rote:
>
> On 6/20/21 6:42 PM, Stephen Rothwell wrote:
> >=20
> > In commit
> >=20
> >    f92f2726e3dd ("dt-bindings: clk: vc5: Fix example")
> >=20
> > Fixes tag
> >=20
> >    Fixes: 766e1b8608bf ("dt-bindings: clk: versaclock5: convert to yaml=
")
> >=20
> > has these problem(s):
> >=20
> >    - Target SHA1 does not exist
> >=20
> > Maybe you meant
> >=20
> > Fixes: 45c940184b50 ("dt-bindings: clk: versaclock5: convert to yaml")
>=20
> Ah, yes I do. Should I submit a v2?

Thats up to Rob, really.

--=20
Cheers,
Stephen Rothwell

--Sig_/P4I6nTS6syEAgLI5btpe.3c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDQ/0kACgkQAVBC80lX
0GwLKAf/QM6eIYFhsQhGwIVVASxqICi6cpK3c/VmwCIS0pVvoWzuCocrbp5+9Hpj
Zh6ZO2qfR3KlKx96HSw7pdRJ4fIvE6bzl1d2PDUT4nEQHYNLBbu26is3YdXx0xeG
ZrGBqg8xNgOxUUu1cpRCqeEKm02fmoUGHj5NwqboL5l+zgx5LVvXLFd1/P79SwlY
0gp1D3KArUvPS1bXQoHcc4y9ZcBzne7TgtEvtpYzvsnqUfpbMuK5PJLKEgBgDosa
3Dj/DrYZuUoupM35n/s//WffaJL2ipQYFr2NMvrxa0/XUxrbC9RmS+GZrG3ttb+z
Sl8m4q21z5+PgXIAyLtOmLQjOqK0UA==
=lyvv
-----END PGP SIGNATURE-----

--Sig_/P4I6nTS6syEAgLI5btpe.3c--
