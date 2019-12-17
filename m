Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF2B4123732
	for <lists+linux-next@lfdr.de>; Tue, 17 Dec 2019 21:22:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727437AbfLQUWM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Dec 2019 15:22:12 -0500
Received: from ozlabs.org ([203.11.71.1]:38737 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727036AbfLQUWM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Dec 2019 15:22:12 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47cqLP4KnCz9sR4;
        Wed, 18 Dec 2019 07:22:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1576614128;
        bh=HNE5QHDUpxYl9Gzpb/l907YVIFjvEkK/+MtEopkr4DA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=rv6PmcXHfNhTSM8MDTyYiTm/oeNrBYgP6Y96EF/L825FjFNR52ZF2cF7QHb2ATXce
         SMhAj85MStFfrhdi6xUfYjth0bBc/USrqLnDXEODzD7AFCYRgPre9kar4oW/Z21d0S
         wS2InJKRaDB3x0yuEYoQHy+i9VBRw/pG219TntpTFxpVfGhKCxAoL0xWQUMD85qDDE
         V6X7Q8e2aQq3MuD/MxIymsXlzeUuaT4tYTXQFmbRNMIo9W8rXtqSFPAaST1xuZkTM2
         Xgf6d4Pl35ZYFoc0dhssM1cf7wts60hsYV1whyHkl15lCCTtQIEUY8JQfrRzlM7VJC
         ujSQIxs1cyFYA==
Date:   Wed, 18 Dec 2019 07:22:04 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Icenowy Zheng <icenowy@aosc.io>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20191218072204.06ca0cd9@canb.auug.org.au>
In-Reply-To: <20191217131937.GZ624164@phenom.ffwll.local>
References: <20191216122331.43c766f1@canb.auug.org.au>
        <20191217131937.GZ624164@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qP.7snxCKhckK3Gxq8N8hHT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qP.7snxCKhckK3Gxq8N8hHT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Tue, 17 Dec 2019 14:19:37 +0100 Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Dec 16, 2019 at 12:23:31PM +1100, Stephen Rothwell wrote:
> >=20
> > After merging the drm-misc tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >=20
> > drivers/gpu/drm/bridge/analogix/analogix-anx6345.c: In function 'anx634=
5_i2c_probe':
> > drivers/gpu/drm/bridge/analogix/analogix-anx6345.c:738:30: error: impli=
cit declaration of function 'i2c_new_dummy' [-Werror=3Dimplicit-function-de=
claration]
> >   738 |    anx6345->i2c_clients[i] =3D i2c_new_dummy(client->adapter,
> >       |                              ^~~~~~~~~~~~~
> > drivers/gpu/drm/bridge/analogix/analogix-anx6345.c:738:28: warning: ass=
ignment to 'struct i2c_client *' from 'int' makes pointer from integer with=
out a cast [-Wint-conversion]
> >   738 |    anx6345->i2c_clients[i] =3D i2c_new_dummy(client->adapter,
> >       |                            ^
> >=20
> > Caused by commit
> >=20
> >   6aa192698089 ("drm/bridge: Add Analogix anx6345 support")
> >=20
> > interacting with commit
> >=20
> >   2c2f00ab1641 ("i2c: remove i2c_new_dummy() API")
> >=20
> > From Linus' tree.
> >=20
> > I have applied the following fix up patch for today:
> >=20
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Mon, 16 Dec 2019 12:11:19 +1100
> > Subject: [PATCH] drm/bridge: fix up for removal of i2c_new_dummy()
> >=20
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au> =20
>=20
> Thanks pulled into drm-next since I just processed the first drm-misc-next
> pull.

Thanks.  For the future, though, merge fixes like this should be part
of the actual merge commit to avoid bisection problems.

--=20
Cheers,
Stephen Rothwell

--Sig_/qP.7snxCKhckK3Gxq8N8hHT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl35OOwACgkQAVBC80lX
0GyJpAf/ZAQL39Fy+xbh/QKHNPjpxIBNkCwgsPMRTUIUT/rkDwmYQSHdjFWhOdHH
zG/io4ZNhuqtAjttARJgAVzeT9JBKlCEVFABGRZE6C5VrTRbeCsjN6uU/+jqk0sx
xkBxXz7y/sld8dFFsmJb7NxutkanUeVAGKzhjHMOEwrf33tEaGKWjnODtzc2y1TB
3e62mnjllvYR04jEMJhOLW6HJoFXM5CsXlTUVaQ3vw6P9lPXTSQ7+9q8FkDeQfyc
VbrI9HUJpsjt25Nz+XSPCBoS1sEt79FvpgkxjI7sZDrnmVcyeoZSWetl1aO/GFA/
/NxVcfb1iWbgF4q83MtZq9mwqZRT2A==
=PKb0
-----END PGP SIGNATURE-----

--Sig_/qP.7snxCKhckK3Gxq8N8hHT--
