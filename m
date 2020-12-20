Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2220D2DF6E8
	for <lists+linux-next@lfdr.de>; Sun, 20 Dec 2020 22:36:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727446AbgLTVgN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 20 Dec 2020 16:36:13 -0500
Received: from ozlabs.org ([203.11.71.1]:52071 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726593AbgLTVgM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 20 Dec 2020 16:36:12 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CzbVb4DBMz9sVj;
        Mon, 21 Dec 2020 08:35:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1608500125;
        bh=qF+qCkedQK7QMmZ9A2Uw7sX/ShESWgakVFo45yxtuqY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=rSd1jTiOFEAHr7sWzpIfzTFwN6A1C8adWUM2Fk90hu86iXg3Ls8ZQWv+5GTFGipra
         4uZJOwoyM1E0ToGBqhTwPELfoCm1hH/WYTCGFv3Gf+YvvD82V7f3pKzGPv4LQnYVRK
         j14kz7hnFGyi7FhIXLpr93d57zjFUcpHhlNfNG1ldTGi6rwEiukvG9jc4sSQxj4BJy
         KydtBxgk5BHq26kxRW2XafCBu53W0+Zq/NviNyZoGyISxV2VZ1F/NFZNkRD5Ks+AKb
         HT2xTz3/5n0XJQEUGxQ2BAEXtigPtusONWTH+ujH/tBudcSHuI/gy4tyB23QNW24Cj
         jo3ah8mjRpyXQ==
Date:   Mon, 21 Dec 2020 08:35:18 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the clk tree
Message-ID: <20201221083518.5ef7357c@canb.auug.org.au>
In-Reply-To: <CAMuHMdWAtUK6qDOAXZ3-qy69ZzbfZb_Z=bSvx-0S-42dfUiw9w@mail.gmail.com>
References: <20201208090555.7159b138@canb.auug.org.au>
        <CAMuHMdVYoxUOUL0zNAPzTJUSR3vGzcJWMzvtCKK=ZxyM=8hk+A@mail.gmail.com>
        <160753498332.1580929.15118515893187584689@swboyd.mtv.corp.google.com>
        <CAMuHMdWAtUK6qDOAXZ3-qy69ZzbfZb_Z=bSvx-0S-42dfUiw9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Wl28/xdXoEpx_aD2uWBr3mn";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Wl28/xdXoEpx_aD2uWBr3mn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Thu, 10 Dec 2020 08:52:41 +0100 Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
>
> > trees can be pulled into linux-next? That would find this earlier. =20
>=20
> That sounds like a great idea, also for pinctrl.
> Can you please add the following:
>     git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.g=
it
> renesas-clk
>     git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.g=
it
> renesas-pinctrl
> ?

Added from today.  Called clk-renesas and pinctrl-renesas respectively.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/Wl28/xdXoEpx_aD2uWBr3mn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/fw5YACgkQAVBC80lX
0GwDzggAgADeVZ0ZJDNfRCTsw8nanqshO91BVHA/MQdeEbjBSZa86oEops/jTd6n
PO3av4QSMgYZMEcB5KNqHDyEFgJRL7G+OuQPUF4EPJ0ey1g96FPFRJxdnUjevCKl
yvu7xG+7NO8W2CWuDLUpSRoTjXYeywpqUD1GdAl7KrF418PrXQrPCTSe/e/nK+tD
+Iy9PVX+d6qShAAuwc84CPvD+DvZn3UTs3CUO6v9QeGo9XbKp5KmJkRjLu6lO8+d
y3W7FLywZMprjqJ3cVBfZwB+CemYZOALj9Pt3u2wRMNTttPBfXxaOZgwYissM+sA
e+vCaTKdDvTKpB3n9wNBkcHbGIekzw==
=sfV2
-----END PGP SIGNATURE-----

--Sig_/Wl28/xdXoEpx_aD2uWBr3mn--
