Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2EE31CCDFD
	for <lists+linux-next@lfdr.de>; Sun, 10 May 2020 22:49:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729280AbgEJUta (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 10 May 2020 16:49:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729216AbgEJUta (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Sun, 10 May 2020 16:49:30 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 216D3C061A0C;
        Sun, 10 May 2020 13:49:30 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Kx51663xz9sSc;
        Mon, 11 May 2020 06:49:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589143766;
        bh=mJUvh5jroj1ztaJp3MGTxckhrhGeFpIRDrh7kNWFb/8=;
        h=Date:From:To:Cc:Subject:From;
        b=iN5hwNVf7jztA841KkPITOpWsf9kBUZEX+L8RWxf8oD64S9FoQbUoaChpwC22KJWz
         utTYFyOSOyO2T5ezdYdZBAK74RhAP1iqELKNudASMc/0F06AI5vjiFn5rrREJm9ejE
         ylV9kb4Zk4nwURDSn0oY5k/fUpCBFeSAEIWJa6Gnk2dALxgRII5QtDSFnIaSrJKY0K
         6RIQQHezrXlcVYua08heTzPO68m9edE6f3AW08hJWUkAgP7JRrHZcNLJdg9dtwgo0B
         iE5wciu71GnvMDgy4KiQjGr5i+jjfymWshPMwLCUpXu9yfykV3phR6by0hal7wAC9C
         7rpTnROShd2JA==
Date:   Mon, 11 May 2020 06:49:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Darrick J. Wong" <darrick.wong@oracle.com>,
        David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Brian Foster <bfoster@redhat.com>
Subject: linux-next: Fixes tag needs some work in the xfs tree
Message-ID: <20200511064919.5cd5dd28@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+/xVCeJAwV=Cl3X=Ao=Yk2R";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+/xVCeJAwV=Cl3X=Ao=Yk2R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  43dc0aa84ef7 ("xfs: fix unused variable warning in buffer completion on !=
DEBUG")

Fixes tag

  Fixes: 7376d745473 ("xfs: random buffer write failure errortag")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/+/xVCeJAwV=Cl3X=Ao=Yk2R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl64aNAACgkQAVBC80lX
0GzCkgf9FC1x7wXEAObLtB6g4ioTF0mbUq/Z8iNuPaJjnEHCm3EIEtGx/GTKQsVx
rhKLGG98kGDx6lT1Y58Cgw8bk2NMNrPm+wLyEWhOAFpi/YWFtmZNqGHiWSX+YA8p
BoGXbvIbU032y5yeEQfKC5NP2g3DRMPs1Ze5S2Tu2UsPXV/1DIDHMRu+CH3FD0pS
bWhWscOGeoZrJhrKTRWh39wxUUSzIxHvZ+inX4JHSD2MumU+EG2eyEaxwWCXM09t
bnTAk0PuEe+BiEcypcuVobMHr8Rex99N9UG0Xs1HndVcsUcIvORcUBCN49iKzKSd
64R1/c1ukLMHuQJ61LZmnFfyccl0gA==
=tLlb
-----END PGP SIGNATURE-----

--Sig_/+/xVCeJAwV=Cl3X=Ao=Yk2R--
