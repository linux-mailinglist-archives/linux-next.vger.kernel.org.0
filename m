Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 947432F0A83
	for <lists+linux-next@lfdr.de>; Mon, 11 Jan 2021 00:57:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726049AbhAJX5n (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 10 Jan 2021 18:57:43 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:45677 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725936AbhAJX5n (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 10 Jan 2021 18:57:43 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DDYfJ5RlWz9sVt;
        Mon, 11 Jan 2021 10:56:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610323021;
        bh=cLG23pR3dbiQqeVfbzXt+mehia79QJ4+25O39jU3DO0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=GmTi4eskViAXPBq8cuIDorojxyBEZO4dxh1/uVkcwv8MRMOV5H9L6p9XzFjiqdRSg
         mUTb4Ss5ycca0u5oEg05w6xeLAjoT6Xu/PssV/8T7QWPktGL9oKbgABvUKa9Q48Jrq
         RHDbA3H6kPWG3yxD1Bdyky/fVadSZ/FeOu42unX/w7D2KqdC+cjEMxyByZHYeCgBZz
         7Pxpx0jGTldvKFlKQ4dPINJXvqAxKEwfaiKKdQq3nnI8CqzE1wz9Eh6NKrtQX9a8Yf
         GrQ0QFjEzkkXlg0RWGOlf7Pijd1Nqgt52OLlXQiKr5I1XXVq2vr2jSQQH2KraQ9nWB
         tVlqvXQIcALNg==
Date:   Mon, 11 Jan 2021 10:56:54 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm tree
Message-ID: <20210111105654.17e3aa76@canb.auug.org.au>
In-Reply-To: <20210108122540.657501b2@canb.auug.org.au>
References: <20210108115518.2b3fdf58@canb.auug.org.au>
        <20210108122540.657501b2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VbNUJrqU8Z1uA+OMxwmXnXl";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/VbNUJrqU8Z1uA+OMxwmXnXl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 8 Jan 2021 12:25:40 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Fri, 8 Jan 2021 11:55:18 +1100 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > After merging the drm tree, today's linux-next build (x86_64 allmodconf=
ig)
> > failed like this:
> >=20
> > error: the following would cause module name conflict:
> >   drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.ko
> >   drivers/gpu/drm/panel/panel-dsi-cm.ko
> >=20
> > Maybe caused by commit
> >=20
> >   cf64148abcfd ("drm/panel: Move OMAP's DSI command mode panel driver")
> >=20
> > I have used the drm tree from next-20210107 for today. =20
>=20
> This has affected the drm-misc tree as well (since it merged in the drm
> tree).
>=20
> I have used the drm-misc tree from next-20210107 for today.

And now the drm-intel tree.

I have used the drm-intel tree from next-20210108 for today.
--=20
Cheers,
Stephen Rothwell

--Sig_/VbNUJrqU8Z1uA+OMxwmXnXl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/7lEYACgkQAVBC80lX
0Gy0/gf9G7vW66eTK+izMbymxovjz3qNZPdMKQMRJtVY+9BmywvLdhb2/rQ2Jg9j
7tdZkmqxV9aILccdwl600Gv77n8pdxo6v0gxdRIh4EggINDYs+RyytyUWa9nT0vf
ElPag0eHJWvwgrHAjj/11vjqoBvR6kR/5JWIrTZ3XZW+F/BpNShXHy8U94EFaqt9
PIWejalakASQCEmUzX6n6WM87Nb7DoTiaQkfRPaAqnovFhhG5Q/jj9Y4fDki+Lca
NObjHxJINksH9/RwNYCQELv8X3okxfbUHc/E8JKL6Ya8xFzNIoPT4qnVW4yqsctq
6Z0bppzxFI29q0OJc1tJi4iMEU+XVg==
=AZPL
-----END PGP SIGNATURE-----

--Sig_/VbNUJrqU8Z1uA+OMxwmXnXl--
