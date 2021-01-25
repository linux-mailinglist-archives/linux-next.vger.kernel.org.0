Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC37B3020EE
	for <lists+linux-next@lfdr.de>; Mon, 25 Jan 2021 05:03:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726725AbhAYEC7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 24 Jan 2021 23:02:59 -0500
Received: from ozlabs.org ([203.11.71.1]:54295 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726630AbhAYEC6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 24 Jan 2021 23:02:58 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DPGQv1pVDz9sVr;
        Mon, 25 Jan 2021 15:02:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611547335;
        bh=t4Cdmr6WPppmw/WPPi2js/whhfRw4imP1sO+Om/hfuA=;
        h=Date:From:To:Cc:Subject:From;
        b=V5lwbOQD2k0SZTZjBTAKk01dMc8lAsjWR5oeKRcYD52CCAvU0dF96HIx8O0wCjU2F
         4QmEAAN+rVz1VwSEsFITVBNw5WbCvzxU5nXP1rAXp/gl7u3NAwmVGljhdjZ4jRGf8s
         NLJRvJbrV1+SvbPFAiZxsKBA4RW7FDLka8tOZZdxJ8pFLieIBEdyZpRV9dx9yVU/Oc
         7G9cJcB55XBsIvW9zPrEutLvEV36HhKjCEDX/vVFy5cEnoxA+VD90k3BNjObQti+m6
         AaAnTZrY//XgsoYbcBVkL+s70BBBtNi9TCoeSvpyh1VKqyBvTjKCTJV5FeI1c1uFbc
         NDkjLv/9/zCeg==
Date:   Mon, 25 Jan 2021 15:02:13 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Hannes Reinecke <hare@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sasha Levin <sashal@kernel.org>
Subject: linux-next: manual merge of the scsi-mkp tree with the kbuild tree
Message-ID: <20210125150213.2b09c92e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vlco5R12RarBjpBdHN0u1L/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vlco5R12RarBjpBdHN0u1L/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi-mkp tree got a conflict in:

  drivers/scsi/gdth.c

between commit:

  537896fabed1 ("kbuild: give the SUBLEVEL more room in KERNEL_VERSION")

from the kbuild tree and commit:

  0653c358d2dc ("scsi: Drop gdth driver")

from the scsi-mkp tree.

I fixed it up (I deleted the file) and can carry the fix as necessary.
This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/vlco5R12RarBjpBdHN0u1L/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAOQsUACgkQAVBC80lX
0GwkBwf6A0A4dPfz96Fl+355R9TD4Le3/bMBWpD3l9ZqZiCrBDyj2sPw3EBe0fbp
l4DppIgmTpdnF6sM+mp6DZUi/cWlJsFutSJHl5clBhvQ30d6muV8I39GHnlsCM2J
D4+H+GinCPrt20ehZrTrgtAA6Nl7gXP3ZHlOjQxq5lzHZdmtYUxZddEwWIIx8S67
2uBAl+F7yHByjN1DNVHqTILgvDR4JeBuz2QxAzpe3V56MhrjfjoPE7WuWrbVaSFc
Nor+B8WkJxjm88ekP/XH0wJqHX+C86y++pb9343scc8LHP+i0eLnsvw+kti+qRO6
dznIJiUyXXySDEHqXLtifw4AtALbpA==
=yQGu
-----END PGP SIGNATURE-----

--Sig_/vlco5R12RarBjpBdHN0u1L/--
