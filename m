Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35B7F142183
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2020 02:41:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728931AbgATBlB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 19 Jan 2020 20:41:01 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:57435 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728909AbgATBlB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 19 Jan 2020 20:41:01 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 481Ds60Yglz9sP6;
        Mon, 20 Jan 2020 12:40:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579484458;
        bh=4P3ogtqqr1vjC4ha8GuHrlhxXWlZ2DYN21yFap7oOgc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=di2V24Khe5jC/uq0Zc8qJJROp0ptMUKcD3qh+tGBbYSuFjIuwOPAwTuScj9yA0cLa
         9AUi6qMUfviGQiB540RlcUyVNRkC5+mHfKAtyxL6vqdWLChnytM9wyhMS2i/T6X5/3
         +l2sqJOzwYZbCbusNyQhEaWUg0cdxDb1Ft1KneUqAABfimZYFxptxJp9k5mu7OcR/S
         Yz7kyGN/18RzCGmHgndfcfr4eyEx1Yzn5q6dvu4K7aC/WR/4ab02leWvvET+8Gg7Le
         yW7JWGznSYg9z9oKp8TshzgZVL62XFQeFr6lVLv5l2ZCxJkDZdDkbRKDjULzYA8/EO
         V8NCb0TgMVYPw==
Date:   Mon, 20 Jan 2020 12:40:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Al Viro <viro@ZenIV.linux.org.uk>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Aleksa Sarai <cyphar@cyphar.com>
Subject: Re: linux-next: manual merge of the block tree with the vfs tree
Message-ID: <20200120124051.2fdcfc61@canb.auug.org.au>
In-Reply-To: <f6ff3aa5-e08b-8b25-454a-9aa51b8b5c37@kernel.dk>
References: <20191220123614.5f11d2e3@canb.auug.org.au>
        <f6ff3aa5-e08b-8b25-454a-9aa51b8b5c37@kernel.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/p3zfKWuJBbjhX_=7E_sj7Ry";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/p3zfKWuJBbjhX_=7E_sj7Ry
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jens,

On Thu, 19 Dec 2019 22:34:59 -0700 Jens Axboe <axboe@kernel.dk> wrote:
>
> On 12/19/19 6:36 PM, Stephen Rothwell wrote:
> >=20
> > Today's linux-next merge of the block tree got a conflict in:
> >=20
> >   fs/open.c
> >=20
> > between commit:
> >=20
> >   0a51692d49ec ("open: introduce openat2(2) syscall")
> >=20
> > from the vfs tree and commit:
> >=20
> >   252270311374 ("fs: make build_open_flags() available internally")
> >=20
> > from the block tree.
> >=20
> > I fixed it up (see at end, plus the merge fix patch below) and can
> > carry the fix as necessary. This is now fixed as far as linux-next is
> > concerned, but any non trivial conflicts should be mentioned to your
> > upstream maintainer when your tree is submitted for merging.  You may
> > also want to consider cooperating with the maintainer of the
> > conflicting tree to minimise any particularly complex conflicts. =20
>=20
> Thanks Stephen, I may just pull in the vfs tree to avoid this conflict.

I looks like Al has rewritten the branch you merged from his tree and
caused various conflicts in my merge of the block tree today.  I used
Al's new versions of the conflicting files.

--=20
Cheers,
Stephen Rothwell

--Sig_/p3zfKWuJBbjhX_=7E_sj7Ry
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4lBSMACgkQAVBC80lX
0GzF4wf/SWTPYajoG4wnwXpEnbOmNhKYTQQDgyMBxAzp/2DnLZkh7NzjXiH2MZ6S
q1Mm4zb7r2hR+TLI4YzrpvKKJSBiea/eeO8ANW7W7rJ+9n+Xxkn8u+ZFCMrEBoc0
kqIpfjszeZ2ABUqEeu3bP4DDzNtsMl5b01dhH4BgDGRbMJYFgvmDiOzzSqiCSJ9b
PJn1DMxRHwPPlKj+CkXkTBzqXxvvecHI25zZNctk/R2Q207tStumWY4bQQrpNEB5
ZyJrqtqqvUQUHVgiK4CXIy6R2lPRR8tpIqJ4kjuDtVeMuyph3Tv3DcQr5/GOIYJ1
Fmp5Qw+Pwd5n+4BElQmwEOW3afmAcQ==
=5GwO
-----END PGP SIGNATURE-----

--Sig_/p3zfKWuJBbjhX_=7E_sj7Ry--
