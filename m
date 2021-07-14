Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66E653C938E
	for <lists+linux-next@lfdr.de>; Thu, 15 Jul 2021 00:07:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbhGNWJN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Jul 2021 18:09:13 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:56389 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229750AbhGNWJM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Jul 2021 18:09:12 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GQBRH07B2z9sWX;
        Thu, 15 Jul 2021 08:06:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626300379;
        bh=3sjf8tBucROZft13lGzMVcuc9PVn4PNEtMK0fpzshNc=;
        h=Date:From:To:Cc:Subject:From;
        b=n+PWOs7boCZyds55T1huhOhB2jX5S8T4uB2FPXtao5nUPMlVee35sGojnLChWOyXd
         vkToee6tP8h9qQfvpiRWvLFmMG+/KY8WQqkXZuTsHGJS8UoM05NS9T3YStMh0a1n3F
         EqHvNeR09wYHseS5BULE7PFgiB/HUjU5uF9IAILRYPnTUOYq6w9zLrsn2Vr7P0Nj10
         6hcMjbB/TAclfQNVqWHCHGTzYDlMltIrAaP9hUUyfPYp0y6o6TvnZTXd/yFU6nSkZu
         ZTXV2sVod7ZXCcFF/ZwfK/yfjg0EmHYPUobKcFZGCVC6SERkffhP7CEmc70bz7RBb9
         YVKkT5jz94H/A==
Date:   Thu, 15 Jul 2021 08:06:17 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the imx-mxs tree
Message-ID: <20210715080617.28efa29b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nQFaQkTI1=76QKPnSe2mqQB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/nQFaQkTI1=76QKPnSe2mqQB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  857e67e935b7 ("ARM: dts: add SolidRun SolidSense support")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/nQFaQkTI1=76QKPnSe2mqQB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDvX9kACgkQAVBC80lX
0Gx4dAgAhBSMLGiePMUQn1+Q8yNJytW9rT8AmDbieuz35zOqKb/jPEWf74TpZxIA
YA10SKnOIMNOf/J8YrbsQwfYtGCyLWSKWCT08eH2IlM7Vp9g64gbh/6yNDAGWJop
lsQuEXCDcc0ZrweoNCIIrKPkQCg7CvzGSeekBqFd78NFockPkJYqnZiVGl2XiNqx
1i2YWDMaIPz+c8r6Ze6MlxRdU+tMOEUrXW0V7I8J6AMvHr+pQib8tlVyJ6g1oCW9
rayXcSe09xl6XcK3y+r6ouJD40oUgPYDOfC6cSl2mc3f/+0tWRyzxHVHGFQB8RmI
aFuJfSRDgVvGJW9WN3aEJ+LWQUEQ0w==
=E11V
-----END PGP SIGNATURE-----

--Sig_/nQFaQkTI1=76QKPnSe2mqQB--
