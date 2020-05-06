Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D77421C79BD
	for <lists+linux-next@lfdr.de>; Wed,  6 May 2020 20:57:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730323AbgEFS5y (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 May 2020 14:57:54 -0400
Received: from ozlabs.org ([203.11.71.1]:42129 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728142AbgEFS5y (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 6 May 2020 14:57:54 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49HQp71V4Mz9sP7;
        Thu,  7 May 2020 04:57:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588791472;
        bh=MDGlgo4ndS6TJpPhz8P8YJzmqJEf4dYMNQjJKcwAJTo=;
        h=Date:From:To:Cc:Subject:From;
        b=WA19hxNw4fstJmF/o9KbTKuanuNwU7QxfhZc/Wuk00n21+6bRRWDAW37GQm2jo5bm
         3qMo/FVKacxioGl2uKB7cUHIrTLmUj8YRgt+kAomWTYtJSq9JdOFiLjHDTyNpZpS6I
         9hwyeASXJBTgZxpVUFzlDVf6CKaClCiPytyuMJD+fT3jzwMlLaHQ+xuR1nI7x92BXc
         B/zMl6RPtBfm6sOYlkEMbyhY7q9+KXtoVnP6KCYNPg+y+Np4SiEX2jv04oiznSmrb/
         kKzwcDPJpUBaQckOAlyya3D+0BIGs7eQCg6f/bJbpSqlnsqfWpcNJ9K432TS1f4QyA
         ZgbaW2yC9zJVA==
Date:   Thu, 7 May 2020 04:57:46 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: linux-next: Fixes tags need some work in the v4l-dvb tree
Message-ID: <20200507045746.34f41e69@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P1D71kx3S66YrwKb2l2nvAW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/P1D71kx3S66YrwKb2l2nvAW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  8c038effd893 ("media: staging: ipu3-imgu: Move alignment attribute to fie=
ld")

Fixes tag

  Fixes: commit c9d52c114a9f ("media: staging: imgu: Address a compiler war=
ning on alignment")

has these problem(s):

  - leading word 'commit' unexpected

In commit

  81d1adeb52c9 ("media: Revert "staging: imgu: Address a compiler warning o=
n alignment"")

Fixes tag

  Fixes: commit c9d52c114a9f ("media: staging: imgu: Address a compiler war=
ning on alignment")

has these problem(s):

  - leading word 'commit' unexpected

--=20
Cheers,
Stephen Rothwell

--Sig_/P1D71kx3S66YrwKb2l2nvAW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6zCKsACgkQAVBC80lX
0Gz6bAf/RBY5BzXWEs+wB0Ty7nkqmhBrq+cg6SeFmJc20q3vEL0w7o8PBvo707mg
NnEaDE3iuX9Slq9hvp7W4m2VZuKMca0BVJClRaE1A/3ybqrMly/rfggkzdWiyxSB
7VPiNbXumy6TWxSNmAX01qC8kEQNeeq1d6DsC3wPRFgv8GBEGFqjJ9OAMgbNJu3r
MowsCMpeIHnsu7BxhqWkh9gSz6YjDgQFgj+nbwzdOY/lqEV1GuXtg4c3s/bT8e/S
MsznCFqASdlK7qJGRZaQnxFIZsK5Wvz1HnQ3qcU8Kb0bExY2t5WqxinLnlRxvzlJ
ymHNXqDEvmq9iI3RgGgiFvj7oO904A==
=cXi+
-----END PGP SIGNATURE-----

--Sig_/P1D71kx3S66YrwKb2l2nvAW--
