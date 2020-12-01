Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4011A2CAF0F
	for <lists+linux-next@lfdr.de>; Tue,  1 Dec 2020 22:46:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727773AbgLAVpf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Dec 2020 16:45:35 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:55791 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726412AbgLAVpf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 1 Dec 2020 16:45:35 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4ClwcP3zvWz9sSs;
        Wed,  2 Dec 2020 08:44:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606859093;
        bh=NPIwis1b7A162n3BFBd8VjhMaFSoeH7XJLpCrkmC71E=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hdFSzlrM1vreMNt4FgzXy2PGD75BKBkHo1MT995Tr7M41XIfIp00Tw8B7ZDt8dqzw
         7SP9x4MVV2dzCn1DAKHxo02+5N42vRXb/9LnJ1XDirS2rIraNGlItdCIjKjgLD43R+
         /fXtkcmTv9uP3grECNtwla+YzC4KUbzdR5qydIUijAXJyx7RT+GAu90h/m8Z/zikXu
         PeHjVyhANKiXN5ITJwwnbiq9FDEZ6GaBAegzDYqyF4H32y2MeREGg7sgigKZPkeC59
         WxjGP4pDYv5phe7c4A1eWSZwmwzCWOgwnynmCnT5gKt8df7a3M0zToaJhm6j44tDh+
         0doMx/rRAsg7g==
Date:   Wed, 2 Dec 2020 08:44:52 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the block tree
Message-ID: <20201202084452.790e9f16@canb.auug.org.au>
In-Reply-To: <9ef33d53-a98e-7608-da86-f3cf7b4b6da1@kernel.dk>
References: <20201202080254.4e8dbb43@canb.auug.org.au>
        <9ef33d53-a98e-7608-da86-f3cf7b4b6da1@kernel.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QJ4nWFdjtrtHSx/=D_WlhJ/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/QJ4nWFdjtrtHSx/=D_WlhJ/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jens,

On Tue, 1 Dec 2020 14:09:24 -0700 Jens Axboe <axboe@kernel.dk> wrote:
>
> On 12/1/20 2:02 PM, Stephen Rothwell wrote:
> >=20
> > In commit
> >=20
> >   573cc9d095bc ("blk-cgroup: fix a hd_struct leak in blkcg_fill_root_io=
stats")
> >=20
> > Fixes tag
> >=20
> >   Fixes: ef45fe470e1 ("blk-cgroup: show global disk stats in root cgrou=
p io.stat")
> >=20
> > has these problem(s):
> >=20
> >   - SHA1 should be at least 12 digits long
> >=20
> > For the future, this can be fixed by setting core.abbrev to 12 (or more)
> > or (for git v2.11 or later) just making sure it is not set (or set to
> > "auto"). =20
>=20
> It's in Linus's tree, not in -next. The ship has sailed...

Ummm, 573cc9d095bc is only in your tree as far as I can see ...
however, I don't really expect these short SHA1 issues to be fixed up
(as that would require rebasing your tree), just that people will try
not to do the same in the future.

--=20
Cheers,
Stephen Rothwell

--Sig_/QJ4nWFdjtrtHSx/=D_WlhJ/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/GuVQACgkQAVBC80lX
0Gwyzwf9EpFL9eaGipMsQYBteidsUKDhAmDEDRY4FeITtUMYmDx3Z4heGwXeACiG
YHK0LcAe7cmWL6CxGGQ0eOTTi5fMIHXVcPmSO8yhCycLdpP+kfdK1yQ/8ySFm68B
4DPHus9YxYEIdhRIgHpjPVRmt/vevHHy+SLTwtPonN+kjUcmsEwtMeHECIvNptiG
jyzck4CO1OI3ISMt7G7Ug6wPiT1p6G+TMDIDxIbK7PaxIzqqIZe1Wz2EnDgYT7OH
kMg0kEG7UL01HjBlf9MA1CesYjQTz54qafxK1WaUdNe0ViRIIvUTlzaCZLUq15/a
PQ5AW4/lM1LGXIDPCrLT0EdDFp5TaA==
=oWjD
-----END PGP SIGNATURE-----

--Sig_/QJ4nWFdjtrtHSx/=D_WlhJ/--
