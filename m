Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A3FC2423A4
	for <lists+linux-next@lfdr.de>; Wed, 12 Aug 2020 03:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbgHLBVT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 11 Aug 2020 21:21:19 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:35097 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726143AbgHLBVS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 11 Aug 2020 21:21:18 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BRBjl2xGFz9sTR;
        Wed, 12 Aug 2020 11:21:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1597195276;
        bh=QBHyCva9zEOwk3HWDt2SuYf4ktc43CEMAm9+qAb06+U=;
        h=Date:From:To:Cc:Subject:From;
        b=V27m89sQk3Tf9htHNPwxaPbJMuHI3HND9bv95NQ4Ohb6sDA49etPYgAGpNbKcdKPX
         Q6NYsU+gf+NL2FP0vjVpv/mSBz3u8ycoHa77vz8pWfKsjo3COgRNXYEWTeiF2S+mMO
         /zmP8qGDHWHX1ZELXn1qU9BKp3St7Gig3IzDEIp+QSJfMgdXh0egrUMpUV9l0n8oLh
         y3q0WAj+kWpnvNlKDJPqigHrC1aYAiKwKOlJZojNUhCmE1UDO8ccBp26D45CCz3AjH
         QFR7Qxx+rbP3gHA2xc550W1zqo/pVw/HLBucuFEIPR2A24DUS07NDUg/5JI7OnrzZW
         3vdZeUt6lJoMQ==
Date:   Wed, 12 Aug 2020 11:21:13 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>
Subject: linux-next: manual merge of the tip tree with Linus' tree
Message-ID: <20200812112113.4234eb58@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Z53MucyYlPMirJyzsMcZgLy";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Z53MucyYlPMirJyzsMcZgLy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  kernel/time/timekeeping.c

between commit:

  025e82bcbc34 ("timekeeping: Use sequence counter with associated raw spin=
lock")

from Linus' tree and commit:

  19d0070a2792 ("timekeeping/vsyscall: Provide vdso_update_begin/end()")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/time/timekeeping.c
index 406306b33452,4c7212f3c603..000000000000
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@@ -39,8 -39,6 +39,8 @@@ enum timekeeping_adv_mode=20
  	TK_ADV_FREQ
  };
 =20
- static DEFINE_RAW_SPINLOCK(timekeeper_lock);
++DEFINE_RAW_SPINLOCK(timekeeper_lock);
 +
  /*
   * The most important data for readout fits into a single 64 byte
   * cache line.

--Sig_/Z53MucyYlPMirJyzsMcZgLy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8zRAkACgkQAVBC80lX
0Gy6owf+LqSPbYCgCg4vUHyZzgckHki7mmlfzXTbeMAjWoqZTIx22rVumNYIDvVL
AQuviDspD3CmuCShL2VhhQA5NkLeCncnth2WUfz5eb8/ftZG6+OSZFCvtMyzXHuP
rt35BfuaUEd+PuXLaoqS5dkO2Gc/IWZtlTDChdJozh9ZTC/rOBuGZL56bKlFbFvb
ruX18jpVoVJOLr3pc6PpW3M0Rw4PvkgWd2QsM+ErxFjEAiFqdQ2EIef4pLlTw4B9
MdH88azzZSqAzCK48r6Q4g1+haGPPfQmfBbL3TYwhQcf896Z30aJPuwismsfknkq
Ys0hR1fBFfZxXYVblaK/5oMJKbtdcg==
=Rkfl
-----END PGP SIGNATURE-----

--Sig_/Z53MucyYlPMirJyzsMcZgLy--
