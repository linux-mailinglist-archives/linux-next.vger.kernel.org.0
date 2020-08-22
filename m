Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CAB024E417
	for <lists+linux-next@lfdr.de>; Sat, 22 Aug 2020 02:17:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726737AbgHVARU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 21 Aug 2020 20:17:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726688AbgHVART (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 21 Aug 2020 20:17:19 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80B04C061573;
        Fri, 21 Aug 2020 17:17:19 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BYJqB1yPFz9sPC;
        Sat, 22 Aug 2020 10:17:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1598055430;
        bh=62Axsb5Hn8NKdDZCm+6NG6uOJnk3JbGkZ8Otme3gWNg=;
        h=Date:From:To:Cc:Subject:From;
        b=Mx/Jcn+JtY+xWfWWghJdBSTMXXNwKxGgDMGjS3PgMH0aZsYbw1Ryvf5P0gDWctlkx
         +pOaXF14t+IR28B/jI/zom/BEGYuUHVw3SZYAODi9nUjgSH0fC253h9Vg3uYfSXn+0
         7SO89BbMbD30qaMVUujFsvH64DyX0+w2cx8SehKSrovycfZvIzMSL+eaqaVUwgEjXV
         hKQ+DbuItby6u7/DDwYhrRaJcm1ZXHj3qp1PgD5jJcJJ1QV6PVOsdcPdzILv0HskMV
         vJKo6SOFlxwTcjayqTml1Bw+mEl4TU8xrrfPn1m5T4teUcg4AW1YC7F9yNcDulOIK6
         b971IPw7LVaBg==
Date:   Sat, 22 Aug 2020 10:17:06 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the mips-fixes tree
Message-ID: <20200822101706.6cb19f1f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yBj2UgMEv3PkuZ7+92GS0oa";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/yBj2UgMEv3PkuZ7+92GS0oa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  1697ee6e540a ("Revert "MIPS: op_model_mipsxx: Fix non-executable code bug=
"")

is missing a Signed-off-by from its author and committer.

Reverts are commits too.

--=20
Cheers,
Stephen Rothwell

--Sig_/yBj2UgMEv3PkuZ7+92GS0oa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9AZAIACgkQAVBC80lX
0GymiQf/R+JKYxuSCAKzdI6eGZTVb7F9bBrv54Ulq/au8V0EpUHewchky22LZjr3
VtPphveTBCKXFySM5s8HuUuqGOa6ZI58IdxBd1b+R6nQxk0y6eWuF/w4OA939im0
G9CSXevLHXKGKO71NioUi6kR3Rd3PryI7YntLDNfxIevukcd0+4QfPT1E4DyF3ka
iZB6TYuairYa0lZjk8w6ThLkO0Q7AATShaUxOUHrYNY17MEwBD459LiZ67CYFsyX
JvEO3xdqDpXOFdAqiq12jvwWSf8OAMZ9r1g5XzP3fvwS3KRLI6OrCTA9fpHRegEc
EV5pDheI982LAHSYd2TCZ9bixrDAoQ==
=e1tY
-----END PGP SIGNATURE-----

--Sig_/yBj2UgMEv3PkuZ7+92GS0oa--
