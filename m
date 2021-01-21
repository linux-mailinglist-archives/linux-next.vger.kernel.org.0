Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2665C2FE21C
	for <lists+linux-next@lfdr.de>; Thu, 21 Jan 2021 06:56:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725881AbhAUDcA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Jan 2021 22:32:00 -0500
Received: from ozlabs.org ([203.11.71.1]:51047 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730664AbhAUAy2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 20 Jan 2021 19:54:28 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DLkRB2yKrz9sRR;
        Thu, 21 Jan 2021 11:53:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611190423;
        bh=yNIC3ySAkmU8uUU/dSr0EAUBxC+3f7iysDW4nBcI5A4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=O5/4ic9Tz8kRCe/xHqQ3AbKMDrCiQqGngPDczsVdM95UP9u3hdKdwuk3oe2df+I8+
         2yF+6yB0NiOjwFZCzfesFIizXxG9fDlhIo5/Fse9rqUh7MaCLOC3lJ2R3XiyEh//z0
         kAnUBJesss08SbyDwJktYAHRQo9VBdfX5oaUbeqfltgeoy6c9WCH4oQg71nU72wWLb
         KHe+apbBaNQtHyXV/9R//HTCDXDKJblTznxpd8PWqBcAoKnf0xxZBdvXi3xAvaDzxO
         l1sT0MTZ9WBqwgvTOIQ+CDHcG0nf5gnfHWB4E4kSFT7WykONFDr6s2FhYcYtdaHUt3
         jL3k3x6iOTBLg==
Date:   Thu, 21 Jan 2021 11:53:41 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Alex Deucher <alexdeucher@gmail.com>,
        Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20210121115341.012c1a55@canb.auug.org.au>
In-Reply-To: <20210120171501.61aa0786@canb.auug.org.au>
References: <20210115120014.4211dec6@canb.auug.org.au>
        <20210120171501.61aa0786@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DDRRKSW0y.hCdmhLur.FD1r";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DDRRKSW0y.hCdmhLur.FD1r
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 20 Jan 2021 17:15:01 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Fri, 15 Jan 2021 12:00:14 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >=20
> > After merging the amdgpu tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >=20
> > drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In functio=
n 'dm_set_vblank':
> > drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5380:33: wa=
rning: unused variable 'dm' [-Wunused-variable]
> >  5380 |  struct amdgpu_display_manager *dm =3D &adev->dm;
> >       |                                 ^~
> >=20
> > Caused by commit
> >=20
> >   98ab5f3513f9 ("drm/amd/display: Fix deadlock during gpu reset v3") =20
>=20
> I am still getting this warning.

I now get this warning from the drm tree merge.

--=20
Cheers,
Stephen Rothwell

--Sig_/DDRRKSW0y.hCdmhLur.FD1r
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAI0JUACgkQAVBC80lX
0GweBAf9H9CGW9h/lNEJuiCaeWMYnza/MyzkFy48votPkAd9AJ2/WoSk/Rn/n3M6
QSUKO/EdJohktVc0hcAXbxsE1mJs5B63ht/jsV8D6U3p7kgASTxJH9grd57sd05E
5LwfS9f+4VGWMy0Ny5/j3Q5fWfQfFdFYnW97NIjtucsKSHYMcORUJId1n8XGc0j0
JILzdXyCCACc5/rohmWeCSxST04YZ0g9E2NQI8OTEa7IZ7HVc7INtwjwo1jLZ7CN
sQiDIFsQ2ZHTCI4up678k+OpzxBHD2rkrg4JPiyNtqMM3PlgnhLTCdLp2IpzL9Nx
op3kFT5Q55sn3jMVK/uDWg1++dkdGw==
=SEhV
-----END PGP SIGNATURE-----

--Sig_/DDRRKSW0y.hCdmhLur.FD1r--
