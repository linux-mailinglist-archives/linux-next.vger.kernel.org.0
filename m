Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 685AB27E8FE
	for <lists+linux-next@lfdr.de>; Wed, 30 Sep 2020 14:54:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728340AbgI3MyB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Sep 2020 08:54:01 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34113 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725776AbgI3MyB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 30 Sep 2020 08:54:01 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C1bmP0n28z9sS8;
        Wed, 30 Sep 2020 22:53:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601470439;
        bh=ITAoACACOSJwNRhRYeETTT4Trm8gFpFR4fLNuGG80tw=;
        h=Date:From:To:Cc:Subject:From;
        b=jqj4a3HifSMPPGsulHv5ZcBzJD6+IL+d+awd/QwMFyHIBPvkgSLWaB9C+GeBVRdvJ
         r0N3hp+lCRY4W1w3DVEUs+1kZ9pUimFIr3uzSxRUvZBKvDm2da6iexIaqykfXd4hf5
         ItvB4f/9WP9EGYPJxI65r4xV6v4ZzkerCAEyWzwWqS1It/Vc6Oyx+r6P219C/U288M
         ebWp51VTQRK1d1SGa9uCwPmko1rX6PwCz0/qXH1w4AYENVs+Sy4KQRznOeq8dTlWPD
         g+6+slM71eXBpMLEmvTHFFhB2aCHytffbqaVvV2Yn4+wPbsxvphEVV3xLD5zKUfXd/
         +spHx9KBidLiQ==
Date:   Wed, 30 Sep 2020 22:53:56 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Xunlei Pang <xlpang@linux.alibaba.com>
Subject: linux-next: Fixes tag needs some work in the tip tree
Message-ID: <20200930225356.714b1235@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bPq+/dM18VJ/a.oJTsDHfMC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/bPq+/dM18VJ/a.oJTsDHfMC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  df3cb4ea1fb6 ("sched/fair: Fix wrong cpu selecting from isolated domain")

Fixes tag

  Fixes: 10e2f1acd010 ("sched/core: Rewrite and improve select_idle_sibling=
s())

has these problem(s):

  - Subject has leading but no trailing quotes

--=20
Cheers,
Stephen Rothwell

--Sig_/bPq+/dM18VJ/a.oJTsDHfMC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl90f+QACgkQAVBC80lX
0Gwp3Af/UpF5ruXRpSy9XLzGE0KX/NNQ5Zj6fE1Qkpi49stWHmQlHXC8Ub4PSamb
Vr12kGl0IwdsvdVtWCQ9C3Mw4pIdo7B8m0BxITKjTTfNyssqCuyDqkAWmCJ+GoUy
Q3fOY9+UC5ZLCphRa63qsCobsED8CymIOdqL0/6j3dwfshV7IoBlGYzo/2zSJzXB
CTzolsv9kjLgCeJjlXpeIMBwg7GDYoSH7Lao64fv+akGsGOEZoTYTXJMi0iEOhaC
GZEJLoaa8EUgVCiUGhJ50ARO4Lc5bYST8t5rZ9tncFG1gkhtTVR/D/NFHXUY9wrS
cvq8p6GH0ambkYlKFSX7fey9qZzEYA==
=eV8N
-----END PGP SIGNATURE-----

--Sig_/bPq+/dM18VJ/a.oJTsDHfMC--
