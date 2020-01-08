Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 948E0134D33
	for <lists+linux-next@lfdr.de>; Wed,  8 Jan 2020 21:26:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725941AbgAHU0j (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Jan 2020 15:26:39 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:53215 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725446AbgAHU0i (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 8 Jan 2020 15:26:38 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47tLPS07cRz9sPJ;
        Thu,  9 Jan 2020 07:26:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578515196;
        bh=qtqQsfsb2WUiSdrCNexZ5+okx6btpBO9RQhZm9Cq9hE=;
        h=Date:From:To:Cc:Subject:From;
        b=fQqtl4VOSZYzB9G7bj671U6OzCdh+xaLyfGUaoyMMYZyVHzbJKMrvSuJE+ybk+Zup
         PLciHZtz89tc8SnOMqF+unOkE9DV3e9G2zBAmk6AkxTwZrKN4zZfT+euPC1QGMTfiK
         FzB99j8zkKrrDg/GPH7iXl3uEjvjoQnDRmpBtExHYlwIjQ2BxeK9cHVf76Mve/7xqD
         dGJONNNufsuVXJLrlIBixEdF+QI1Ld18YkqitE+wE5ozQ0/Llm/dWTCVSX7wvlNx9I
         LtarZBr+V7S8MDmRDDEqFqIKwY4NG5B4Gv1ky6vroDLJhRpE+Df8YESuLFDWmvcxkc
         LmfWWkGa5FKAg==
Date:   Thu, 9 Jan 2020 07:26:20 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the v4l-dvb-fixes
 tree
Message-ID: <20200109072620.6df67c98@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Fe0Ejl.HRUgqhHS/udTLhWC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Fe0Ejl.HRUgqhHS/udTLhWC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  21d116949e95 ("Revert "media: pulse8-cec: fix lost cec_transmit_attempt_d=
one() call"")

is missing a Signed-off-by from its author and committer.

Reverts are commits too and, as such, should have reasonable commit
messages and be signed off.

--=20
Cheers,
Stephen Rothwell

--Sig_/Fe0Ejl.HRUgqhHS/udTLhWC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4WOuwACgkQAVBC80lX
0GxoEgf/SFBTJRQPDWLB2Sjt8QltGnKLzWi3uRvPqcBoj9NWArXP0FDcj1VS0cWO
yPCbijtuMnAjTLdKpNu+Y2KhvfanjBLG+uKfiZCVtGhv/tmhqHwRZIBSb/fYY31A
gKgZbIURYUKbDkYhlF2NBZTKMw0cHeeYm8LUNAmDNgGwpay/zkvDeCHYtuahHXHi
N+TiPv6p1+Rwya3CAVCwSTQT0QmB0tua2DNEraA1vgs2hP7EmoL1VSBMPN4tP64b
lyG0ezXBsi6Rr0Gx40nQh4QzWc7+3MC73mFzaycFPI2Rus3nWoKIfhLPLdwQYuNp
YCCVJsBX/L1YkfhG7Tjq/MbgVlQ/tg==
=yrTV
-----END PGP SIGNATURE-----

--Sig_/Fe0Ejl.HRUgqhHS/udTLhWC--
