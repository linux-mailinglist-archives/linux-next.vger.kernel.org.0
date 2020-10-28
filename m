Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A55A729D69D
	for <lists+linux-next@lfdr.de>; Wed, 28 Oct 2020 23:16:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731409AbgJ1WQs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Oct 2020 18:16:48 -0400
Received: from ozlabs.org ([203.11.71.1]:53219 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731136AbgJ1WNu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Oct 2020 18:13:50 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CLVlM2rJzz9sTq;
        Wed, 28 Oct 2020 12:06:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1603847200;
        bh=dQeqXgWR06YHwPZ477txv8BZg5dzsetxbE1eJPSomD0=;
        h=Date:From:To:Cc:Subject:From;
        b=Gsi0VMxb/T7fRrQIU+mFpipdv3qtKNaufOUrbEBwmX04nt1bN9rZgbDLZRVjTmFJt
         SgqgaOqFJC+oNfjNJ5E/NDEUZpj2Mm/SoEHFUeJUoKneYf+KD9LDJribBb0wRSZ/wG
         HTMRl2iNr7WWbuMjAUYkiM2DPHxqovn+7W4MnFay6kBv53d0yMUeLMwB6jkR60dd9g
         aCUXSXJBihjc9bte0NvJowj4aYDRTQgVXahAldZ6iVXSJf8j3v5vo50SPEcleICsOg
         oUE7iwjUYo+jRquNqLNfRG87f1PGpgjTXWgjxXHHB/OmZ2IXVzgo91TqU1ksYiuWvJ
         H2Ag/0KmDtQgw==
Date:   Wed, 28 Oct 2020 12:06:31 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Alex Deucher <alexander.deucher@amd.com>
Cc:     Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Dave Airlie <airlied@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mihir Bhogilal Patel <Mihir.Patel@amd.com>
Subject: linux-next: manual merge of the drm-misc tree with the amdgpu tree
Message-ID: <20201028120631.1a1e239c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/D7gmgiTqdCVEH3_nLdCS9s7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/D7gmgiTqdCVEH3_nLdCS9s7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c

between commit:

  ff72bc403170 ("drm/amdgpu: Add debugfs entry for printing VM info")

from the amdgpu tree and commit:

  4671078eb8e3 ("drm/amdgpu: switch over to the new pin interface")

from the drm-misc tree.

I fixed it up (I used the former version of this file and added the
following patch) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted
for merging.  You may also want to consider cooperating with the
maintainer of the conflicting tree to minimise any particularly complex
conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 28 Oct 2020 11:52:31 +1100
Subject: [PATCH] merge fix up for "drm/amdgpu: Add debugfs entry for printi=
ng
 VM info"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_object.c
index baca32263ec4..06dfe9b1c7e6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1555,7 +1555,7 @@ u64 amdgpu_bo_print_info(int id, struct amdgpu_bo *bo=
, struct seq_file *m)
 	seq_printf(m, "\t\t0x%08x: %12lld byte %s",
 			id, size, placement);
=20
-	pin_count =3D READ_ONCE(bo->pin_count);
+	pin_count =3D READ_ONCE(bo->tbo.pin_count);
 	if (pin_count)
 		seq_printf(m, " pin count %d", pin_count);
=20
--=20
2.28.0

--=20
Cheers,
Stephen Rothwell

--Sig_/D7gmgiTqdCVEH3_nLdCS9s7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+YxBcACgkQAVBC80lX
0GyGyQf/W8AS24xM+LuAbD7K+TnxKAQPBAwUY5YWJZiLBx/vdxsRPnJP/NZ4saM2
4ntUNF2DIRJN/fqsDOYPgkTF8y6kRRDfPVnBwEMNuV5u8WAvuIX3Rk+HBbAfUae3
fs0yfeYDslTmcKbYKnbjr+WhWD0APv6Lj3ETFjQ4mGTEOKzcvTJaeNhAMDwfva7/
kazP5IG9/L2hPZTaaTGbZYicc0Y6TbgFzmOEDg7lPQ5D6p/daIKZq/NAC8IXfi3Q
E/Zm8uP634hT90JO7nAMdfPzlNzDtxylBY7pXbUQAtvBvtLl6WQ5ZRFZZodEkwsR
mdWEJ2g3idZnJIUWSlU2g3u9a3+hsA==
=epSp
-----END PGP SIGNATURE-----

--Sig_/D7gmgiTqdCVEH3_nLdCS9s7--
