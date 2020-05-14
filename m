Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C42F91D29B6
	for <lists+linux-next@lfdr.de>; Thu, 14 May 2020 10:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbgENIJz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 May 2020 04:09:55 -0400
Received: from ozlabs.org ([203.11.71.1]:33443 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725886AbgENIJz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 May 2020 04:09:55 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49N42n4fVfz9sV7;
        Thu, 14 May 2020 18:09:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589443793;
        bh=4aGWmO0/dUYLpFjFgNKfhytFTVAq3ckc61Jr4U5Y99o=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=lBQzs4OkNobWyzWWr36uaXvOsLw0a3DT4jOgIdL8Ce6scd3BrflCJ+Np9lYaGAz2D
         8TKI4g/3aIqzOtlwnwHV4VBpkLTBFc3DOAlFObPzeBo74Rbi46Tjv0nVoHIaJ+QQ3N
         2KUqYXoo19gYcMzmKn32KeQjEi6yfnG/MHtnru1SbQZulkrWiixWngUWkGqmj/RnJ1
         xeUbvc4kdFRqEkycAMTzo54uUyQOGE8Q3roCyUPDJYDJaGBpE8O7ucXoMo7e7ZYdHN
         e38ROCoYhr6UfResuP0PKm8w4ZlL+GoSAS3X8KFJBttmsZzuM716AYWKA7QXZFIQJU
         CBSDP1iyLzycQ==
Date:   Thu, 14 May 2020 18:09:48 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the fsinfo tree with the kbuild
 tree
Message-ID: <20200514180948.5d5b38a5@canb.auug.org.au>
In-Reply-To: <20200512190614.1bebd8ba@canb.auug.org.au>
References: <20200512190614.1bebd8ba@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Yqm7nm8mU2ZpmaDp9lVNewB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Yqm7nm8mU2ZpmaDp9lVNewB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 12 May 2020 19:06:14 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the fsinfo tree got a conflict in:
>=20
>   samples/vfs/Makefile
>=20
> between commit:
>=20
>   757172f3d6f9 ("samples: vfs: build sample programs for target architect=
ure")
>=20
> from the kbuild tree and commits:
>=20
>   51d01aee410b ("fsinfo: Add fsinfo() syscall to query filesystem informa=
tion")
>   d3ee0e9da65d ("fsinfo: sample: Mount listing program")
>=20
> from the fsinfo tree.
>=20
> I fixed it up (I think - see below) and can carry the fix as necessary.
> This is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

The new resolution is below.

--=20
Cheers,
Stephen Rothwell

diff --cc samples/vfs/Makefile
index 00b6824f9237,4a6e3058812e..000000000000
--- a/samples/vfs/Makefile
+++ b/samples/vfs/Makefile
@@@ -1,5 -1,15 +1,5 @@@
  # SPDX-License-Identifier: GPL-2.0-only
- userprogs :=3D test-fsmount test-statx
 -# List of programs to build
++userprogs :=3D test-fsinfo test-fsmount test-mntinfo test-statx
 +always-y :=3D $(userprogs)
 =20
 -hostprogs :=3D \
 -	test-fsinfo \
 -	test-fsmount \
 -	test-mntinfo \
 -	test-statx
 -
 -always-y :=3D $(hostprogs)
 -
 -HOSTCFLAGS_test-fsinfo.o +=3D -I$(objtree)/usr/include
 -HOSTCFLAGS_test-fsmount.o +=3D -I$(objtree)/usr/include
 -HOSTCFLAGS_test-mntinfo.o +=3D -I$(objtree)/usr/include
 -HOSTCFLAGS_test-statx.o +=3D -I$(objtree)/usr/include
 +userccflags +=3D -I usr/include

--Sig_/Yqm7nm8mU2ZpmaDp9lVNewB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl68/MwACgkQAVBC80lX
0GxN7QgAh5CmfDufNHqbspJYg3AuK7g7M1KLotEQtxFMdk94uW0KiGHVizHi/5cp
hImffKDwEomGTE9g4x36jQBN/q3BSuIk9eMr6DfUgstyOrGOJYUnM8rmpHC7bdu+
3AobbZ5naazNw8NFc0bwUcU6hOkrMYRa388Vx9slj5xvROFBm1Zxj1pNbKd7+Cer
BwOLUXTLna5KiwwesRMaM/6BaN73yUPJSHa9UVqYCbCvuT+BN/P9cli1PKFNm0Z5
GZMDMHOwudfNw6vL4RvyrrxZFQvw+g83pNlDD5eD2XDgjvDQVBf2Evxgo1Hqsi0c
m09XWFmnAoBWF1KiQyiVxCAZNwmZXQ==
=4tFB
-----END PGP SIGNATURE-----

--Sig_/Yqm7nm8mU2ZpmaDp9lVNewB--
