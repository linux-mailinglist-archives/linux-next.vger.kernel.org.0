Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E7EE4265EB
	for <lists+linux-next@lfdr.de>; Fri,  8 Oct 2021 10:29:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbhJHIbL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 Oct 2021 04:31:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234074AbhJHIbJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 8 Oct 2021 04:31:09 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31A3EC061760;
        Fri,  8 Oct 2021 01:29:14 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HQhDm1fFYz4xbZ;
        Fri,  8 Oct 2021 19:29:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633681752;
        bh=zz9QbqiABTKsB6SeC5ZSYzCr8Ng291vyDHjYp5g7EZw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=RMTCvg7PYoPbipKbGojHbSiozVTwU6kgrw6CUXAQV005fxHWqLJPKQDsduE2tJzM5
         9caP3y+jk1UesaXvW2d4TZjs63attcC8PC+PquOCrzboImT0HKWMwhptD7H7jFEO4M
         6eww7cEIdvMaCyH+0gkM6cjL4u8xyep32nPH0n+4NkprGsHNMGtbDVJnQ3joBVFZvk
         4oI4c3spnKOJHynZisClRx8un5bb/zLs5ejYbM5VZR24WFunG/8BCSJMBDrGx9aTlU
         yTXqNmFuDeKH0GGou3nCxLift4S4KsEk6pDAbfCsj+Tz+D9g/EP7YCDDhZR1GmL2hq
         tX9/pPgcwFH9Q==
Date:   Fri, 8 Oct 2021 19:29:10 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Simon Ser <contact@emersion.fr>
Cc:     Alex Deucher <alexdeucher@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
Message-ID: <20211008192910.600a188d@canb.auug.org.au>
In-Reply-To: <jXLIcCYkgHdIQna5SW6W4GGHVG5By4-GXiaosbXyyaYXFNTH60nmH6twdxMYgM2X63FhEOyxU7Qh_vbKFywBKmUwp7l4DYXe_hTt86AS-ZM=@emersion.fr>
References: <20211008113116.4bdd7b6c@canb.auug.org.au>
        <jXLIcCYkgHdIQna5SW6W4GGHVG5By4-GXiaosbXyyaYXFNTH60nmH6twdxMYgM2X63FhEOyxU7Qh_vbKFywBKmUwp7l4DYXe_hTt86AS-ZM=@emersion.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CRuPf2hkRrq=FJoYpdb7XO7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/CRuPf2hkRrq=FJoYpdb7XO7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Fri, 08 Oct 2021 06:27:05 +0000 Simon Ser <contact@emersion.fr> wrote:
>
> On Friday, October 8th, 2021 at 02:31, Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>=20
> > Hi all,
> >
> > After merging the amdgpu tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > ERROR: modpost: "get_mm_exe_file" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko=
] undefined!
> >
> > Caused by commit
> >
> > f4f80155e6e8 ("amd/display: only require overlay plane to cover whole C=
RTC on ChromeOS")
> >
> > I have used the amdgpu tree from next-20211007 for today. =20
>=20
> Not sure why this would happen. This commit builds fine on my machine, an=
d I
> don't think it's possible to disable this function with Kconfig?

That symbol (get_mm_exe_file) is not exported to modules.

--=20
Cheers,
Stephen Rothwell

--Sig_/CRuPf2hkRrq=FJoYpdb7XO7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFgAVYACgkQAVBC80lX
0GyFfwf7BalbHntmA7QkynH0M1UpodMwHzD6wIQcEKgU/8JdNQv4AH4ExwObw5tb
71+R3p0kBr1OBFDXdxNNSBSBZCUZRE4hQBnBVjm8NMO1eFMGehSRdMa0rcTNbPIR
tCvYozHDNs94J1oL3jzzM3lAGHImhINmVbRoBsLUlHZyoVANLa26uxyBzO+JZxd3
0wRZcEVrwP7OGWYMseuX9ni5EmXMcJkwzpCevV0F/644ZoBf5wV6b07MheAzA55Z
nMVVffj72mILqig73RwuwRr/M6FDqMWW9vYlIfeeAhypqnIY1d6UowKkkGVRmt4b
qBoDq3jPhFoOJNoUwcqBbPEHHO7sJQ==
=/IkY
-----END PGP SIGNATURE-----

--Sig_/CRuPf2hkRrq=FJoYpdb7XO7--
