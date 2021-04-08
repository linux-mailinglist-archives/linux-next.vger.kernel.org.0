Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F80D3580B1
	for <lists+linux-next@lfdr.de>; Thu,  8 Apr 2021 12:36:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230294AbhDHKgu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Apr 2021 06:36:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230322AbhDHKgt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Apr 2021 06:36:49 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21A28C061760;
        Thu,  8 Apr 2021 03:36:36 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FGHkB0jzFz9sW4;
        Thu,  8 Apr 2021 20:36:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617878194;
        bh=j4QGZTMJ7F8NZ7P4vtdLkL4aQEB5U/c62uThoHhiCGA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=g159QLykDclcupTbZf0sgGO8WyDYk5WWJumEdJHk9FlEw0M0EC1CugB/bD2j/VbYw
         EphEFC1mgBey8m+QcP+ZxWhTMwcJdVyI6CI+jZ77EDx3SwxKCkmUOokVi2FdFBGFDK
         Fis98f1Qv8KZ7sNTC4GdQM59khcL3vbarrKazuRBPI7Ct+geDo6/mJ6rfHj8JQRDix
         pM6UFFZS8iyxzRevVb7AAzpe3w8TycSmAyLH/AEk6oAut3irrX2I77+M82q+MJFHzM
         5A8eBVjFePTOXk6/L+ZnyTtVetuDl6AJd3DF9x1vPgkToBHjUNrcDCAdwHpvtKYCC3
         0yk4oAo+2M0Ow==
Date:   Thu, 8 Apr 2021 20:36:32 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Piotr Gorski <lucjan.lucjanov@gmail.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 kbuild tree
Message-ID: <20210408203633.08012e20@canb.auug.org.au>
In-Reply-To: <20210408203449.58e5edf8@canb.auug.org.au>
References: <20210408203449.58e5edf8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yFGNIYqX5JEHKFwlhGReMZO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/yFGNIYqX5JEHKFwlhGReMZO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 8 Apr 2021 20:34:49 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the akpm-current tree got a conflict in:
>=20
>   Makefile

This also affected init/Kconfig

> between commit:
>=20
>   2f8864dbe668 ("kbuild: move module strip/compression code into scripts/=
Makefile.modinst")
>=20
> from the kbuild tree and commit:
>=20
>   7b35c1a01c2e ("init: add support for zstd compressed modules")
>=20
> from the akpm-current tree.
>=20
> Also commit
>=20
>   ee2305118fc3 ("kbuild: add support for zstd compressed modules")
>=20
> from the kbuild tree seems to do the same as the akpm-current commit
> above, so I just effectively reverted the akpm-current commit.
>=20
> I fixed it up (see above) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/yFGNIYqX5JEHKFwlhGReMZO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBu3LEACgkQAVBC80lX
0Gw1Ewf/eSWpGlpJKPpX5u6VIv1QYDb3LfVuNAlAH+gUxHQJcVqjZMOQXHUyY4xf
LblmeKvVFqdwSbDZC9TsjxGiXVSatJAwZ6W/Zu6J2DaXP+RTx/F82ppr34NJBSYR
uLTXo5nZv8vG2HyjVjcq1BHmaVbYjwyxI6bUXjBZ3cOEyeBZJTTxFoc4q8c5UWjP
HcqIxWIXCbvfAHdNEPxg+kpybZrlgkGof0bYVK+LJNZpzm6UKxfd9gSye7ehCoHD
G0N3oC38YpUE1o3rJuRHhgNeAUfJuDGS3RH15ZCs0SHcUUkQEe9h8kAmJlxf/Pr/
PVEcO0THmebB4D9nIPpeoaDh9/PyLA==
=EzBd
-----END PGP SIGNATURE-----

--Sig_/yFGNIYqX5JEHKFwlhGReMZO--
