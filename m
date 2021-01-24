Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26B99301AEC
	for <lists+linux-next@lfdr.de>; Sun, 24 Jan 2021 10:51:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbhAXJve (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 24 Jan 2021 04:51:34 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:46441 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726456AbhAXJvc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 24 Jan 2021 04:51:32 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DNpCS4Nt2z9sVr;
        Sun, 24 Jan 2021 20:50:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611481844;
        bh=IjNP0+o8q2HgXl9ZSmZp38QGon7MAP4LeRsJD4c9jwk=;
        h=Date:From:To:Cc:Subject:From;
        b=dHd+C52VVLHjLxZRZFEacQgxlENBdLF/yQWjJSob0tK8KFTxrcINBI+SxccRiCBB9
         L2aebif510nDeLIRm1K++eYC1WtgJRObfIal1s7Vri9L62PFqm8WWFjhJ3fRhwQc+k
         4S0smOD/MfDHprnsScA+MifhhfKwJ0UKTvC6ofOx4MyH2a8ulkRwX7pnUaQOu1sqdO
         SZ8wf/etV/NU0aHaFqlrhHItIapsbrH77q2jn5Wqe/BRM1O1jkMDHQugXlfDswkiFt
         ip0eXLu3xCSVGFLJwc7gcOTZ+5c14QzDa0q345sSZgxontjhon+qmwZ0NQU+eoRuiI
         NFDZGxiTUx9rA==
Date:   Sun, 24 Jan 2021 20:50:35 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Whitehouse <swhiteho@redhat.com>,
        Bob Peterson <rpeterso@redhat.com>
Cc:     Andrew Price <anprice@redhat.com>,
        Andreas Gruenbacher <agruenba@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the gfs2 tree
Message-ID: <20210124205035.60529397@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7JLq83Pa8S9FHtvPxPar8o8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7JLq83Pa8S9FHtvPxPar8o8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  d2097641ed78 ("gfs2: Fix invalid block size message")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/7JLq83Pa8S9FHtvPxPar8o8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmANQusACgkQAVBC80lX
0GwdTAf8CV3MLEez3gBVB0L6W8lWvensY2S/WRmic4wTQr84hgq1WquroAJ85loj
2iT/sMFE5/BLq9JcBhj3wLki3a8AV0L9Rpne4gx5QtHK3s0CsUoAl3IdRJX3yG2N
eMlbIFqmDcsvbPsD5u5xg5w1HhW93RgYu+WvBT/Zou8RaFuLfn2maFV3PiTBUjdp
NmQzEyDdOmsVX4g3okY4BYPZjo6qnoQzl5XcWw1V8MODBCcUDHplm7PEjkUkqvFz
oma/tkbn2TYy54QxnrDfiHrvTQxqNRFzd4KYtURys1ZDL3MJNHCdQ3L9Rrab0HdT
m5Xhd6zFZXl+6PJbidyXXk3GS6az3w==
=eFhF
-----END PGP SIGNATURE-----

--Sig_/7JLq83Pa8S9FHtvPxPar8o8--
