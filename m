Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0F092FCAFD
	for <lists+linux-next@lfdr.de>; Wed, 20 Jan 2021 07:18:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729002AbhATGR4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Jan 2021 01:17:56 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:48613 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728411AbhATGPp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 20 Jan 2021 01:15:45 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DLFcQ5Blnz9sVy;
        Wed, 20 Jan 2021 17:15:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611123302;
        bh=fZzZa6Ejo+/Pl7W1xYcUoSns0+O+AX52JKnE/iQuOpQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=SPDmJs/bCMMzhPpZJFjK7dc9/jfniWDP7oGwil16z+Hz6S8HFVvKMCcgh+3riDP5t
         vDFQ3RCdeoiTzfBxeUhyZ0s8mWQFyHpmt3FGzl+XkwRmFWZ3+P8yWAkiodQVYUHvkM
         K5Mvq+lR2U6rJILWqpnBxbLTjM5VGwuuVp31HhZU8x88HqNW6hmWaYoMQS/AzdaezU
         Ja3FH/Qzx3lJiMkaOlVokCxT+ZWTjdaKnkQZ0IyOG/BJBBQe3uzLYPvsjlm7dqDj2M
         eoDNCMBGa7+U0vfls1ElMbXv0EOJQz2MD1AFi/mOr8rKYx2B7PndtHWls19ZuqhGfb
         mgOser8PgFzLw==
Date:   Wed, 20 Jan 2021 17:15:01 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20210120171501.61aa0786@canb.auug.org.au>
In-Reply-To: <20210115120014.4211dec6@canb.auug.org.au>
References: <20210115120014.4211dec6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/t88OOVC7pcSBAvlrNtrM6bs";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/t88OOVC7pcSBAvlrNtrM6bs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 15 Jan 2021 12:00:14 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> After merging the amdgpu tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function =
'dm_set_vblank':
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5380:33: warn=
ing: unused variable 'dm' [-Wunused-variable]
>  5380 |  struct amdgpu_display_manager *dm =3D &adev->dm;
>       |                                 ^~
>=20
> Caused by commit
>=20
>   98ab5f3513f9 ("drm/amd/display: Fix deadlock during gpu reset v3")

I am still getting this warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/t88OOVC7pcSBAvlrNtrM6bs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAHymUACgkQAVBC80lX
0GxkTwgApj7kDx9tIJuzN8TSNAryaVW466ScnO5gWAxb5GtNPtpFAx2OgdEdGKUG
Oo9jS1titDFN6cevOW6laH9a1wsX2XupEIqPGC1BzLwAgtueFrX5h630VGjvKuFN
5l25RvvrCzJmPLOGeirIehqLPgIR5Z0+88RfV9rFRI3wEUxNx5K3310B1M3T2tUe
qsdIhDOxLDPwgAC3C5zcipwBXxmU8g6zDTYw07w+OKBX/ZRvxqm/Dghrg8tRX1Y0
QMfo7LOrIzN8vhOYbYKBz7zYDAG90XNpbvYGf1FSLpkjHSZrrHhj2CEgQKz4vMCW
yHfYDxpvt2/dcTnzeIo+cADVeg/qOw==
=ynEO
-----END PGP SIGNATURE-----

--Sig_/t88OOVC7pcSBAvlrNtrM6bs--
