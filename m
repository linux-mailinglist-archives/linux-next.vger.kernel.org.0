Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF61459682
	for <lists+linux-next@lfdr.de>; Mon, 22 Nov 2021 22:15:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235045AbhKVVSL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Nov 2021 16:18:11 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:46243 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240208AbhKVVSL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 Nov 2021 16:18:11 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hyg5f6ZhQz4xZ5;
        Tue, 23 Nov 2021 08:15:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1637615703;
        bh=zhyPezHqXnxv9v02FkveBpf0/1xDQr1BtUE6XwlZfjI=;
        h=Date:From:To:Cc:Subject:From;
        b=WI3iysxbN89oIMDw2YXZ6XQbphgVs0DFFKWppBhlrZgF+Yn4ONXQQsCW+f0lHdfHj
         4puQK3Fw5w+8YVC+stfMmNe+DIz5EdHyeDsdsWqOWfwWYA+midtec48NRj2QosZRV2
         I5qMO6/YKiehaXiGxOl8Yr/6+sIMKTAb2yuAHYTy9QYzfLlwVxpWRRtJfl0Z5yG0wV
         lDr+VYntxczLitoMohRVRmwCxTfkprj1RaDvdJjODdM+N92oHzZlIij250YIfgtRbQ
         wg+9nKRByFw6jVXeiEuiHOBulilbDAMFs14PJQm1dHN6y2jSRtGSl2c1RcTbpAOu87
         yJoa4Zk1JilTg==
Date:   Tue, 23 Nov 2021 08:15:01 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "J. Bruce Fields" <bfields@fieldses.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the nfsd tree
Message-ID: <20211123081501.6815bffe@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ijE=guvO8lmm3eRhdsUMwvR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ijE=guvO8lmm3eRhdsUMwvR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  52e66ccaa3ca ("debug")

is missing a Signed-off-by from its author and commiter.

--=20
Cheers,
Stephen Rothwell

--Sig_/ijE=guvO8lmm3eRhdsUMwvR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGcCFYACgkQAVBC80lX
0Gy4RwgAkXMXKUb8AJvakEX270nMpkIHAdbrOww4yntD/P6bEOIxytc7IoYHFnto
l0CWUizM43jiRAR1AbFk5QvyDS4c36E1f2ZUfg/aneBXIeDwr9PyKCyMoLSDGULF
jOFRxPD9Q0FzQEB3Zpa1TmE2NnorD7vqB9nTlT025jNz8ysluX4NzYSfE+mW4k2n
Zw6V9R5Mf+edm3pV3SPzLAtXBstYH/7uS+frubPoFbZ4hhGlOgZorFneLApFe8P6
I3JSv6FXQ5zpzZp4gE3GMyty82O7ejo49Y5awjp62SgO9+ryvhOR0zjzKF0YrPBn
Mnsyd+A53c3PNMK0Gwv9wr+jQbR3OA==
=Laap
-----END PGP SIGNATURE-----

--Sig_/ijE=guvO8lmm3eRhdsUMwvR--
