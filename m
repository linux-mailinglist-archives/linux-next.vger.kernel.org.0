Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91A9A1E7AE8
	for <lists+linux-next@lfdr.de>; Fri, 29 May 2020 12:49:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbgE2Ktr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 May 2020 06:49:47 -0400
Received: from ozlabs.org ([203.11.71.1]:57411 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725562AbgE2Ktr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 29 May 2020 06:49:47 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49YLtH6lLNz9sSp;
        Fri, 29 May 2020 20:49:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590749385;
        bh=jsv/liaUrR517PU6UZH68DhnNcK32p5YqRZISEQvKy4=;
        h=Date:From:To:Cc:Subject:From;
        b=cTlsuYrT6DmdVkLjeHoAZ3ZHt1W2odpilsuV0h2baE5t+seFN4XOBpLl3ELxvuJtJ
         9nf+xf4WMw+xCKRp3rLLEqMxO5iAFuOse/r1cwEJf9Y0pbe5t3y1lcX5nU9H1TZfeP
         xMOHEdWZpCBAxkB9/pRh5Ey8/vNK+TLCgCEd616PMhAUQUBfzYN76+N/vaDUxOkQga
         HjvyHvMxSIMWwMwPt77qR7Cw1bOcKMcozBKAt/loH1RA/MKBcDyco0fB2xiCptxM2T
         jCpe94RqiTKd0AB8HKu5T17RzUpWjk/9jIORdKhZ7hyo6ce55k9dGFlw24D2tmfFJz
         1oTvYW9kD9e+g==
Date:   Fri, 29 May 2020 20:49:42 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Qian Cai <cai@lca.pw>
Subject: linux-next: manual merge of the akpm tree with the tip tree
Message-ID: <20200529204942.0edf6cf6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3fs8AHix+/YNeajC7eNy448";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/3fs8AHix+/YNeajC7eNy448
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm tree got a conflict in:

  mm/swap.c

between commit:

  b01b21419999 ("mm/swap: Use local_lock for protection")

from the tip tree and patch:

  "mm/swap.c: annotate data races for lru_rotate_pvecs"

from the akpm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --git a/mm/swap.c b/mm/swap.c
index a8442ed0bb16..936d6b545217 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -620,7 +620,8 @@ void lru_add_drain_cpu(int cpu)
 		__pagevec_lru_add(pvec);
=20
 	pvec =3D &per_cpu(lru_rotate.pvec, cpu);
-	if (pagevec_count(pvec)) {
+	/* Disabling interrupts below acts as a compiler barrier. */
+	if (data_race(pagevec_count(pvec))) {
 		unsigned long flags;
=20
 		/* No harm done if a racing interrupt already did this */
@@ -781,7 +782,7 @@ void lru_add_drain_all(void)
 		struct work_struct *work =3D &per_cpu(lru_add_drain_work, cpu);
=20
 		if (pagevec_count(&per_cpu(lru_pvecs.lru_add, cpu)) ||
-		    pagevec_count(&per_cpu(lru_rotate.pvec, cpu)) ||
+		    data_race(pagevec_count(&per_cpu(lru_rotate.pvec, cpu))) ||
 		    pagevec_count(&per_cpu(lru_pvecs.lru_deactivate_file, cpu)) ||
 		    pagevec_count(&per_cpu(lru_pvecs.lru_deactivate, cpu)) ||
 		    pagevec_count(&per_cpu(lru_pvecs.lru_lazyfree, cpu)) ||

--Sig_/3fs8AHix+/YNeajC7eNy448
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7Q6MYACgkQAVBC80lX
0Gxf7Qf9GafonTBYFJ1TBhbZjKcBo4bG+VYP8KT+pvxJKu/MK0VcAjhwxeyUo3sU
ng9ag/S2EI9mhuwmbcr6zUPh30Mm8Ps55bVGBPf5yYFhSO8t430pWAe5tdeHRgbV
d+t6alDhCdBf+GHnmYpRXRSIhKU7QhM69i3UREtK9DbVG03g5mwP7BOTaIKX0HTQ
CJfHNj0Y97a+Mhngn8yPYl/b9RSpD2CCTNxxq4SsQ8getcoh3tWKxvPPF2V4FN+M
bpLvHRXZxxppGACxa88mQ4Bws/69JEJCxt4RGtg5cCI3Saq5JM1xO6LoSOhLg7wM
63b2ZSp/36L52k6DZ+C8Cpfzbh+8Hg==
=ZGY/
-----END PGP SIGNATURE-----

--Sig_/3fs8AHix+/YNeajC7eNy448--
