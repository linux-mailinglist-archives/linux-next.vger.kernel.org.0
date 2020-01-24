Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4C0514754F
	for <lists+linux-next@lfdr.de>; Fri, 24 Jan 2020 01:16:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729191AbgAXAQv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Jan 2020 19:16:51 -0500
Received: from ozlabs.org ([203.11.71.1]:40423 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727056AbgAXAQv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 23 Jan 2020 19:16:51 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 483fp54FMDz9sRW;
        Fri, 24 Jan 2020 11:16:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579825009;
        bh=maTlgrM29xwo4ZH+pQQi6DkhDIe4g1YGOVi0d6XcCYk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=YL5N0QKux/q4AEyyM97gtRlKbiEsPWbgcpWQwWQ4fLeT4OzBdunOQb6mDnekDaGRO
         yXN5/MxFfM7ruEKdHl98UPcDRlP5XRI+df0tGFHwGuw1qQwCrsqH+uh1B+T2K60mnq
         h05bR1D1QTXbtmV57ebS+So6VtDUYMVomCIelhuWVHI6UGZD4JzuWMD3MZwGBZPiRn
         opW7PUyYGLOoI3hZAuJiBSLwgYkN6T30YSpS54Qx2xthpO5x9EfwtTyAM2aTeYIBIV
         63i0JL1Gt9C0raCKxi29L7ZawT1NCkLD/oKhWBVUawjlaxRbqzUe7Z99ejefRRC805
         ufBH9fbKCR/8A==
Date:   Fri, 24 Jan 2020 11:16:37 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>
Subject: Re: linux-next: Tree for Jan 23 (gpu/drm/panel/)
Message-ID: <20200124111637.11f09b6d@canb.auug.org.au>
In-Reply-To: <6a610bdf-3227-fcad-6208-e1e7e085c940@infradead.org>
References: <20200123172101.2f31947c@canb.auug.org.au>
        <098616df-a696-9544-5ca2-c84ce9980999@infradead.org>
        <20200123194959.GA25073@ravnborg.org>
        <6a610bdf-3227-fcad-6208-e1e7e085c940@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Dy12sGq1Yg0Wtiu=pxVkYlt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Dy12sGq1Yg0Wtiu=pxVkYlt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 23 Jan 2020 15:46:59 -0800 Randy Dunlap <rdunlap@infradead.org> wro=
te:
>
> On 1/23/20 11:49 AM, Sam Ravnborg wrote:
> >=20
> > I tried reproducing with latest drm-misc-next - no luck.
> >=20
> > Can you check if you have:
> >=20
> > 8d6cb2f7fb90018d9e3efdc9bc95e6da213a352f
> >     drm/drm_panel: fix export of drm_panel_of_backlight, try #3
> >=20
> >=20
> > As we expect this to fix it for good.
> > Maybe the patch has not hit the right tree
> > and is thus not in -next. =20
>=20
> Sorry, I don't have the linux-next git tree so I can't check that commit.

That commit was *not* in next-20200123.  It was in next-20200113 to
next-20200122 in the drm-misc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Dy12sGq1Yg0Wtiu=pxVkYlt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4qN2UACgkQAVBC80lX
0Gzvjgf+JkWxlkn41vnpeYZGzltzeNyLGc3mYBIAktjYQNQUlnHfBBFbfhs+msdg
4GjcwnR/+lpMtDefqQe1ECmxvh8yQWBwAgvA/c2hpPn4t+3DmN9pdPksEN50yaro
wCOvqtiyTZGHu11+CG5Cr4WJ7c0sGj5R8qYay2xcnQQtlrwOIeXiQ75BUBB2rKE7
wUIX8J8AM0mFuHi2RZVf3F4ZROAqO13914f3oKmtfavT+s0L4tbXTN5DIvv2gYAK
Hw5oRhmzvnM1Np4iGL1uHRCg8UK/8tQiyXFj9pe9PZu85nuytw1S6k/2DHh7aoNI
4ir6/iL0NoI7lw4MGMeO2s36n160Qw==
=cfJk
-----END PGP SIGNATURE-----

--Sig_/Dy12sGq1Yg0Wtiu=pxVkYlt--
