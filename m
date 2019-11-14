Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88B6FFBF65
	for <lists+linux-next@lfdr.de>; Thu, 14 Nov 2019 06:23:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725807AbfKNFXM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Nov 2019 00:23:12 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:50231 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725440AbfKNFXL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 Nov 2019 00:23:11 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47D8yM28wwz9s7T;
        Thu, 14 Nov 2019 16:23:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573708989;
        bh=kVIA/Cvj5N5Onr6PfKTRRp26lzLZ0YxhUn1dPy3BKlY=;
        h=Date:From:To:Cc:Subject:From;
        b=nMldFydGhuVjvGJGKU6txsB3yxCB+oekEoTQPGaG8onaylLfdxyBULpH9RK+GWqgf
         NPtn6IUmZ4KoqJebJJUmINF8iRjQnDW+em2wlSChhJaf5llQSjN8L7SvtyNwWzs5hE
         su6T+GhuMLaXhQo9HBkUxsY1LLc4Ruauo+pf+RaZLIQ/GQZ2mFn/IUjo6mt6X6B8RX
         5/JCyyi6TFTAf/t70iryAdxMzQmsNqHPdTOzWmywJ/OLCkt6wKTXT07e2q5bTc9ihR
         9G8WN0Ur1+SMtEvK7G83ASGhe8c77yY6/HzbZwjTbll9AkF7lf0if1a5CQK4kvnnzu
         pX2XGhdYzwJmw==
Date:   Thu, 14 Nov 2019 16:23:06 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jason Gunthorpe <jgg@mellanox.com>, Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alex Deucher <alexander.deucher@amd.com>
Subject: linux-next: manual merge of the hmm tree with the drm tree
Message-ID: <20191114162306.6d66211b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FWnSSU+bu4ka/a7xyuFdAf3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/FWnSSU+bu4ka/a7xyuFdAf3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the hmm tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c

between commit:

  4d8e54d2b9d3 ("drm/amdgpu/mn: fix documentation for amdgpu_mn_read_lock")

from the drm tree and commit:

  a2849b5dcc9e ("drm/amdgpu: Use mmu_interval_insert instead of hmm_mirror")

from the hmm tree.

I fixed it up (the latter removed the code updated by the former, so I
did that) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_/FWnSSU+bu4ka/a7xyuFdAf3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3M5LoACgkQAVBC80lX
0GxjAgf8CgzHIOinx88yr2qPH9/zJRciNOlKcHtNcS186Q9JD1D1fxIaS+OqS4R3
dGLrhg++Gpt3MDh2iJ9g7mEN1Fb4OR16HZXBvlxITtEe9ll6uFJhRWbKLTf1lmdF
xgtgwvZzhed5WlH8/C2z+WiK+RDOf49brkAoJn6aUDCx6oRHGWERDP2wqgwWkIHP
znQ/xzVQLpXzy251vLCe9EwvaJstVQctc83YWCAG2uPlTl/eyACn+MSVJVk8hBWI
pbg24L55a3GvQutrPvHmFjS9Mnf3ciIv3MF/V9tDUo0wH0IgPvHM0leTDS5pp4MP
xFNm97dTSx/viOEfg3rUZb7Wm04K4w==
=Bxwk
-----END PGP SIGNATURE-----

--Sig_/FWnSSU+bu4ka/a7xyuFdAf3--
