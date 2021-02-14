Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B1C231B28E
	for <lists+linux-next@lfdr.de>; Sun, 14 Feb 2021 21:56:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbhBNUz7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 14 Feb 2021 15:55:59 -0500
Received: from ozlabs.org ([203.11.71.1]:33505 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229924AbhBNUz6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 14 Feb 2021 15:55:58 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DdzyW569fz9s1l;
        Mon, 15 Feb 2021 07:55:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613336116;
        bh=EVbBsui6KGW++wFC+JzLdYbUNks732mHVkVY2ZWGbb0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DzIDPqOTxR3/N1DlsVLwNrBNmwCy3GIUrX+Pv7WG6JFWtMmyivJKQnGhNfEt5TCXr
         PSDwj8U7qlI0QeeX74WcCfvyb31BPQkQ8kboHYCAzjAUku4ImT8wJHEXcfuIInPbKG
         w4a2OkFfbyzuxIhJdZIyn+l1KJj46WbbmS6m1/uGAx/Tx2HJPqRiaYkhUHxX2Tb/uO
         8Cdwdq9omgvmuqiGIXhqbN1JcW3Uy1778ix9J/fB96NTWxWoe/crzblQHqSuQCEWZB
         +w5mnftyfom/dKyUUDe4a/+voZgo3yMlWRgmp2ZZ8oRhuh1X/K+bw1P+aS6fLYVRSk
         whgL+yYORqobg==
Date:   Mon, 15 Feb 2021 07:55:14 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>,
        Al Viro <viro@zeniv.linux.org.uk>
Cc:     Christian Brauner <christian.brauner@ubuntu.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the pidfd tree with the vfs tree
Message-ID: <20210215075514.2d1f8728@canb.auug.org.au>
In-Reply-To: <20210125161706.05873f95@canb.auug.org.au>
References: <20210125161706.05873f95@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ArsIgvp0L0t.NZHlsp+Pp=4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ArsIgvp0L0t.NZHlsp+Pp=4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 25 Jan 2021 16:17:06 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the pidfd tree got a conflict in:
>=20
>   fs/coredump.c
>=20
> between commit:
>=20
>   8a3cc755b138 ("coredump: don't bother with do_truncate()")
>=20
> from the vfs tree and commit:
>=20
>   643fe55a0679 ("open: handle idmapped mounts in do_truncate()")
>=20
> from the pidfd tree.
>=20
> I fixed it up (the former removes dump_truncate(), so I did that) and
> can carry the fix as necessary. This is now fixed as far as linux-next
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

With the merge window about to open, this is a reminder that this
conflict still exists.

--=20
Cheers,
Stephen Rothwell

--Sig_/ArsIgvp0L0t.NZHlsp+Pp=4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmApjjIACgkQAVBC80lX
0GyujggAh4m4z0iRPLTfMIUghwPpwI8kQZnL51ImDVUSM9JXJkx25bbLmvQrnvUd
ozFCvRsTF2kNjc0StjBfRmXN4dmlbHgfkRUgWe7ms+WkMDLj5mcsPZKfHCiIDYmX
hOHFHPrnuTSopATcEVtgRNdqUwHcJY7g1eFtaJcvkY2wTaJc2Q4zdGtdgbA/bby/
dQkiFwGcSlKLb74OIS2P65xI4M9/wNA9Zy3kJjW8ecAAK3lNf4snVGhkHVQnNltC
jefd91/NektDvTvqSaxQEZpWeaAkwPf2UdU+A2Dsx10jIZC8/5UPYAMQp99O/36t
O+BzFrJbkuy3/2omrQqq53gKASigrw==
=im1T
-----END PGP SIGNATURE-----

--Sig_/ArsIgvp0L0t.NZHlsp+Pp=4--
