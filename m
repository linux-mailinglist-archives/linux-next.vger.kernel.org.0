Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 968132983CB
	for <lists+linux-next@lfdr.de>; Sun, 25 Oct 2020 22:54:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1417989AbgJYVy2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 25 Oct 2020 17:54:28 -0400
Received: from ozlabs.org ([203.11.71.1]:46489 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1417968AbgJYVy2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 25 Oct 2020 17:54:28 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CKBZR3LH4z9sSs;
        Mon, 26 Oct 2020 08:54:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1603662866;
        bh=TZzmsecreB+HQ3YoPylN9A9i8OGFAhec9UiaxQ+xX3M=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=tct5+d9pmKMaZxp01GVYVXYXDdcikr35LxojMRx8N0Kete3AD+QIK5prSWDQDbb2p
         2FrewZ8oqASxemKKqIKl6TAAWO0IzpV+BUzGwr0V6p5Ar/WQIYh/kcShQW/ebN48G0
         TnAX4PeTAxbLr0Rh9ya2Q4UWX9bfD32ws+4lROXiDm2j4G9zJDwi8yBXzGbwyavkHQ
         ABEs//1JBh3BBGTCysBxJkAEqufjCgfn9nIZ+Zm6I69NS+4w5DrscdvsctBAmSaM4h
         HUjXq+h3NC7VmgiGQGYmp13cYwpm8GiHfSOKjFIAlXjzP+YXoopyQyCAtDQfXva8n9
         IMHaEpQGIUx5g==
Date:   Mon, 26 Oct 2020 08:54:21 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Chen-Yu Tsai <wens@csie.org>, Olof Johansson <olof@lixom.net>,
        Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Yangtao Li <frank@allwinnertech.com>
Subject: Re: linux-next: manual merge of the sunxi tree with the arm-soc
 tree
Message-ID: <20201026085421.1536d873@canb.auug.org.au>
In-Reply-To: <20201008132017.ju5ih5prn4aifeml@gilmour.lan>
References: <20201006145637.57d20ba1@canb.auug.org.au>
        <20201008132017.ju5ih5prn4aifeml@gilmour.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5cOVhmDMoOlKpr.yUM_Vpz4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/5cOVhmDMoOlKpr.yUM_Vpz4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

On Thu, 8 Oct 2020 15:20:17 +0200 Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Tue, Oct 06, 2020 at 02:56:37PM +1100, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > Today's linux-next merge of the sunxi tree got a conflict in:
> >=20
> >   arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> >=20
> > between commit:
> >=20
> >   0dea1794f3b4 ("arm64: allwinner: A100: add the basical Allwinner A100=
 DTSI file")
> >=20
> > from the arm-soc tree and commit:
> >=20
> >   7e66a778cb8b ("arm64: allwinner: A100: add the basical Allwinner A100=
 DTSI file")
> >=20
> > from the sunxi tree.
> >=20
> > These are 2 versions of the same patch.  For now I am just using the
> > version in the arm-soc tree ... please sort this out.
>=20
> The branch in arm-soc has a build breakage (that doesn't happen in
> linux-next since the clk tree has the commit to fix it) so I sent a new
> PR
>=20
> Once that PR is in arm-soc, I guess that merge issue will go away

I am still getting the same conflict (but between Linus' tree and the
sunxi tree).  It looks like the sunxi tree has not been updated since
October 6 ...

--=20
Cheers,
Stephen Rothwell

--Sig_/5cOVhmDMoOlKpr.yUM_Vpz4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+V9A0ACgkQAVBC80lX
0GwtfQgAnV5elcf14NCyUDR6S3pnr+Okc/wu6aXUIrUVVwWuJ9aXnwcArhNoIs2t
xT5LFpUVMgLV3lEqJGhsh0E53TOlVYULyKGk4HiLTW1vLlOTBKsIvhnL32mbx+zr
76YWSJQmPlhwlgDYiFAHvAuczCAy3HxgECt2zPpn/oDDXw24KOmdJ1YKlMiW2sHr
CQe3su6fMmw/8GraJbzPCxikG8Ry624iU+jFy8si6YnohnkYQSs4LiGld3i4Uezm
xigeEMVrciADDqV4LMIBBXzy4e/dAohx2krsAbh76Q9wJ+nMNEbBquxguTbh1czg
mpkeJq6L+17a7Vf3jSr1yhj2ZZPH2A==
=0aUi
-----END PGP SIGNATURE-----

--Sig_/5cOVhmDMoOlKpr.yUM_Vpz4--
