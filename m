Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD6FEF6BF
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2019 09:00:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387982AbfKEIAM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Nov 2019 03:00:12 -0500
Received: from ozlabs.org ([203.11.71.1]:42435 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387810AbfKEIAM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 5 Nov 2019 03:00:12 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 476hsg2ghJz9sNT;
        Tue,  5 Nov 2019 19:00:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1572940809;
        bh=1+1tOa8Z+fF6E/+rJ1OEH3MVH5YElQTwrOuIE5/KjGw=;
        h=Date:From:To:Cc:Subject:From;
        b=SN0ZWKtrxovtQb1ZBrDmYwzFgRrVG6HkuUb6/CyJXfrE2FhSSb5VOfcJm01cvAhYS
         X7TaDV9LpSyNSTqXcP56mSCLXGvA590akI1aTwc2FEIPtU3fj1kkuIJcSGQ6VH43De
         JDXVQRJXRy1uuLaE4G1NWaotmawZ3fjOcPdNdZWf3XktSNY1N3A26scGxNgRjF/6tP
         w6IZhjzgPJDmiDH9IfI/Z+32Il95UfAGWrxN3GaA8WW6rNLD9+q2sj1T9hRTS/ldKG
         LSs4HcSdP4PTPDDHTvoRhh8MFxhWJkFxof8DD3P+mg+cqMiB3q6MiPJfZ7YCLXVGPE
         3Tka7AyHdbVlA==
Date:   Tue, 5 Nov 2019 19:00:04 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jason Gunthorpe <jgg@mellanox.com>, Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alex Deucher <alexander.deucher@amd.com>
Subject: linux-next: manual merge of the hmm tree with the drm tree
Message-ID: <20191105190004.325da6dd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//d.vAgZGcJLHrx3QMhBEqo1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//d.vAgZGcJLHrx3QMhBEqo1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the hmm tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c

between commit:

  4d8e54d2b9d3 ("drm/amdgpu/mn: fix documentation for amdgpu_mn_read_lock")

from the drm tree and commit:

  cb0d3d608a1a ("drm/amdgpu: Use mmu_range_insert instead of hmm_mirror")

from the hmm tree.

I fixed it up (I just used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_//d.vAgZGcJLHrx3QMhBEqo1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3BLAQACgkQAVBC80lX
0Gx+Hwf9Ho7HnuYW4EzPx83acbUIunPzZn171YQEvf+Vt/6qGx+HyyfLFjQRfS9c
idSQL9Lsi7Cs80/qpmrtVrHSN+BfJhMxuOw1Tm9z5XeO/cKf3Anl8jIVF74DMhzp
U9TRzrNj2LE4fllTZw+9TVyTytlUUzW8MBxKjBMoHE+mFuFz4gXwKV7wB2VDV+hB
x34gLaOGC7CpTCuFBvhgaVJzdTTFx598XZ5sLdkV7EofW5QPEaGu37owrOrqwJ1f
yWlgPm9dqWeJ1betxvB4zvrvw+AkONNTkY0uAUVbo4WmWssQFStXxGjyBEQS/Lp7
/QL30AkYdNidnaLYtLgSQQxdfA8q3g==
=CgAf
-----END PGP SIGNATURE-----

--Sig_//d.vAgZGcJLHrx3QMhBEqo1--
