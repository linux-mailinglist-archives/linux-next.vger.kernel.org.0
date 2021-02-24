Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7391E3246FD
	for <lists+linux-next@lfdr.de>; Wed, 24 Feb 2021 23:40:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235483AbhBXWjk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Feb 2021 17:39:40 -0500
Received: from ozlabs.org ([203.11.71.1]:43839 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233034AbhBXWji (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 24 Feb 2021 17:39:38 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dm9nW3D18z9sBJ;
        Thu, 25 Feb 2021 09:38:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614206336;
        bh=Rc3QiwgPzVRHJ9mxb8+bpBLad5vmlVEkzHBZ8PWvVO4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=uxFLncE66/CnPdZBdKiLUWkiPaL0CnfTVeF50LKFRIQcIyMkr8u3DDZMhNAH/cSPS
         mZ5gMg+bE68FErtCu8H2qdqSGPVsjPtiekQNUPkWvo1nZHWHcgY/Qw8P62fS9lC18q
         HsFwGUE1+7cyw7oRwlWqiNx12W8w7ulUoLOW7CQQV+BVCnHgCBa7uj6Mv351MLzq+D
         yKQ088PleXE7yJKY2+sPxJa9UPocYjuO4uTTCwUr5APLfFOe15sxmQlqTgRp48ga7X
         fl9VCi3YLsXFMnkWhua9Xipatp7Bv8ZHhbGcIc/R3G/bp3TyAMruzm9rA3+UzzGx3x
         uGGIRST6ijBSg==
Date:   Thu, 25 Feb 2021 09:38:52 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Christian Brauner <christian@brauner.io>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the pidfd tree with the vfs tree
Message-ID: <20210225093852.668345a1@canb.auug.org.au>
In-Reply-To: <20210215075514.2d1f8728@canb.auug.org.au>
References: <20210125161706.05873f95@canb.auug.org.au>
        <20210215075514.2d1f8728@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Di8uM2MV_zh=UEMo9T5S7Iv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Di8uM2MV_zh=UEMo9T5S7Iv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 15 Feb 2021 07:55:14 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> On Mon, 25 Jan 2021 16:17:06 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >=20
> > Today's linux-next merge of the pidfd tree got a conflict in:
> >=20
> >   fs/coredump.c
> >=20
> > between commit:
> >=20
> >   8a3cc755b138 ("coredump: don't bother with do_truncate()")

Now:

  0016c9bb87a7 ("coredump: don't bother with do_truncate()")

> >=20
> > from the vfs tree and commit:
> >=20
> >   643fe55a0679 ("open: handle idmapped mounts in do_truncate()")
> >=20
> > from the pidfd tree.
> >=20
> > I fixed it up (the former removes dump_truncate(), so I did that) and
> > can carry the fix as necessary. This is now fixed as far as linux-next
> > is concerned, but any non trivial conflicts should be mentioned to your
> > upstream maintainer when your tree is submitted for merging.  You may
> > also want to consider cooperating with the maintainer of the conflicting
> > tree to minimise any particularly complex conflicts. =20
>=20
> With the merge window about to open, this is a reminder that this
> conflict still exists.

This is now a conflict between the vfs tree and Linus' tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/Di8uM2MV_zh=UEMo9T5S7Iv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA21XwACgkQAVBC80lX
0GwUGQf/Zw994BmJehth5KYaCHgkfsJCuV3XA5OvOFvVejU21b3PrJJjP4IYfV1d
Xt2bftADEiiIJ69bD0S34VdCTIzijq+udMv5WPBJrbhnZ9VQsQ7DIUTLm74pQD5K
KzMN23HkAa6IIRO0xeVilzn+r1BUIinLwQUZuUWPHVn11+ilidvBChGMh2PgiSm/
APTm7im7q38J0Kh7I8e1/gxld4+uhWEjEvYbhkhFLWVNuKRs9kzRjuVoj04J09FX
I4EscdhSsdqncg7gGmi8RYnMBuwe9OgM0oak92yvDRFLgt0DLN1CpSn+y1lkmV97
PTZwa32s3xts8hQYqqmjuEefnDboYQ==
=5tl6
-----END PGP SIGNATURE-----

--Sig_/Di8uM2MV_zh=UEMo9T5S7Iv--
