Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F81A175260
	for <lists+linux-next@lfdr.de>; Mon,  2 Mar 2020 04:44:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726805AbgCBDo5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 1 Mar 2020 22:44:57 -0500
Received: from ozlabs.org ([203.11.71.1]:51425 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726758AbgCBDo5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 1 Mar 2020 22:44:57 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48W5cl2HwQz9sPR;
        Mon,  2 Mar 2020 14:44:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583120695;
        bh=RE64/CC4GTkrUVJEyyPC3E0NI9nq1JvTICucGATw7ys=;
        h=Date:From:To:Cc:Subject:From;
        b=RR9fjuBVG2ku4N3ycqGbSTIZ1L5wZLnLqJJGrfJWWilYMj46gPIkIbKU80PfCEtRj
         WimTPf3h/1haHuEZXsHGzHfziys+aSgF9YdMOsClpD4bJR0cYiS5etWBwLOQ5/MPKG
         PrVppag2UcHWpc7YcPjNaLVe0/I2P2jpsDVRctRYdLNbZRk1yE9EU77wugTvNn9mwM
         x5MOGqr/L/if9ySO3RCODvwLOdcPXWWfyyrCw0AaJI39+nPrdcBzuHTpRTDpZAPBLP
         ED3Iik7mjtWW9Aj9adnktcFJmP1otu1Hd8gtwJYyRo84srFJ/VIpyICwctdM3qwkNm
         pPOyy+n8zCVNw==
Date:   Mon, 2 Mar 2020 14:44:52 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Theodore Ts'o <tytso@mit.edu>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: linux-next: build warning after merge of the random tree
Message-ID: <20200302144452.6a7c4907@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//AJJERX5+tXGlT89fR6mCmM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//AJJERX5+tXGlT89fR6mCmM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the random tree, today's linux-next build (x86_64
allnoconfig) produced this warning:

drivers/char/random.c:820:13: warning: 'crng_initialize_secondary' defined =
but not used [-Wunused-function]
  820 | static void crng_initialize_secondary(struct crng_state *crng)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  5cbe0f13b51a ("random: split primary/secondary crng init paths")

--=20
Cheers,
Stephen Rothwell

--Sig_//AJJERX5+tXGlT89fR6mCmM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5cgTQACgkQAVBC80lX
0Gw7Vgf/QvQWJJnfyV2c5oiPRmKdE+nJSgejsc6SHpFB5wtbo5xG/wpRbpVM80kC
Mjo3CRc9mPbkMEVURRpZ+vHeJl/tRyDb3/62tnWV4d+jT1l/Zwb3DsD34DtoQ+1j
maZoXIqr6k5irxPbXY351RgpD9Fsc52Z5Mdtk1g5/Bs0bJv0T9PaPdgBz64ch7QQ
i+hkOwtHNtLy/Ak8ubZxrhU+IS8bJVy+h3BGVs2EAtP1lvzoeAaSJCxLHvH8ISmI
Y9FkOIMeY5MDTreeEvY56BECevHgGDHYQgxWT8LbpbLmFKoHSdMO5OQuTwRoPVf1
DxAvV+xhzO5obmbC8UZ6Wx4FU4BvLA==
=eHLM
-----END PGP SIGNATURE-----

--Sig_//AJJERX5+tXGlT89fR6mCmM--
