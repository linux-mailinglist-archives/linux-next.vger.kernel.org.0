Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE23D3BC46E
	for <lists+linux-next@lfdr.de>; Tue,  6 Jul 2021 02:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229740AbhGFAyx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 5 Jul 2021 20:54:53 -0400
Received: from ozlabs.org ([203.11.71.1]:55495 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229733AbhGFAyv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 5 Jul 2021 20:54:51 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GJkXr10JYz9sXN;
        Tue,  6 Jul 2021 10:52:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1625532732;
        bh=z/DZ35sugsGXHcXx3xGhUN/XMaBXjJOnze8Ymh5hl3E=;
        h=Date:From:To:Cc:Subject:From;
        b=qkT75D4Kv/izygeFpA5Ia9FGu2gWvh7uKrlwOITtRyIXvXesJpNgsyMs6+9GuSSc8
         vfzuSZJaRY1ChaVNtHClH18wbdj5Kvzfrs0VxvP9d83MQJi6v3/jJEJny0M34zeV10
         yrH99MTayQLCJqBlRQhXKKyWjWMY4ldZg2o0eAPvi5gpiCzMZQB5owYx4HIxrjDR0Y
         gEw4Tx2sUvYuZ5SLtheRRXKFAuHjA3QdO28bXnfwdBl02FAGYjHRkJzZ4JXSLPPIi5
         T9hQZYplmiLPCFz41qyan/0yErlx97IT1D7wC1UMLhiPPg+pyDX3LSMQMftxkesyI5
         JO9oXXr/VlW9A==
Date:   Tue, 6 Jul 2021 10:52:11 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Alex Sierra <alex.sierra@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the amdgpu tree with Linus' tree
Message-ID: <20210706105211.58372119@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/L.fLIj=vi9/QZ.jIHcYgX/d";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/L.fLIj=vi9/QZ.jIHcYgX/d
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c

between commit:

  e058a84bfddc ("Merge tag 'drm-next-2021-07-01' of git://anongit.freedeskt=
op.org/drm/drm")

from the origin tree and commit:

  8c21fc49a8e6 ("drm/amdkfd: add owner ref param to get hmm pages")

from the amdgpu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 307d22abd814,2e9ad6e0dfbb..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@@ -695,9 -692,8 +691,9 @@@ int amdgpu_ttm_tt_get_user_pages(struc
  	readonly =3D amdgpu_ttm_tt_is_readonly(ttm);
  	r =3D amdgpu_hmm_range_get_pages(&bo->notifier, mm, pages, start,
  				       ttm->num_pages, &gtt->range, readonly,
- 				       true);
 -				       false, NULL);
 -out_putmm:
++				       true, NULL);
 +out_unlock:
 +	mmap_read_unlock(mm);
  	mmput(mm);
 =20
  	return r;

--Sig_/L.fLIj=vi9/QZ.jIHcYgX/d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDjqTsACgkQAVBC80lX
0GyOMQf/SwJeBNy9zwnKww2yAKpgIHm1EWwe2gcB0WUZt7xZAIqz8QpH5cAjkocI
vplUIVTI/OAuvuMJ/rd/fQTJ0jXTTcCOGOy7u5/2sKya37taRmcWY0C4ybDGnT9D
V8ge8n6GC8JrPP683EpIW+NEf0yIqZ+m5pme2/cR01A2oeYvMxuAczctqmi0fFPH
3gNP1H/mgszf5rUzhHk+H74eJjdz4jxNrC92HCle2C1ERnB9jC2ey37yCMUfb8wb
7eNv0UQslffwl4gEPVgfmfMIAkGgsf0givoTc4lQLzXLpmvWiqAweZiRfaex/3v0
uDNOSvqh3R6dqsoZ2/0SIKPNyldOrA==
=JOzK
-----END PGP SIGNATURE-----

--Sig_/L.fLIj=vi9/QZ.jIHcYgX/d--
