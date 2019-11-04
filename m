Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1BC0EF104
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2019 00:06:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729843AbfKDXGB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Nov 2019 18:06:01 -0500
Received: from ozlabs.org ([203.11.71.1]:56085 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729846AbfKDXGB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 4 Nov 2019 18:06:01 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 476T1K1t0mz9s7T;
        Tue,  5 Nov 2019 10:05:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1572908757;
        bh=bcQDFl1NxHyPUjlL1kPXVTHHa4/ZPezNRSdImfwYJEs=;
        h=Date:From:To:Cc:Subject:From;
        b=qlakukKsPV49LVOcnVx7tWZEYKZcOwG/68sZJ0PzM5XdKit+bgB59MbSok+eSv29R
         tj740q3SBiDqpayQWIMbYwk0oAifBG2IzkLHaNgtKOJZEOzMYEumHKUn+oUepycQGO
         V9KOPIbhgBs2oD8qQKnDKperh11Unraex82SGF1UTfbhU5uOMcQbVPtRPDMxZ0ZhcA
         KUvmAPS17CDYCvMfg544HD5nCptf9Izahy/7LsInByvYgV2fAdoBVm62XsynFeACeo
         QAJgMGzpgd7HRGa3y5paDyhw9yMVj2cjhfSTpyGfUPQpvvevfFS+vwx7T++hj4HvfL
         e6jZ8SNe6sRTw==
Date:   Tue, 5 Nov 2019 10:05:56 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        Paul Burton <paulburton@kernel.org>
Subject: linux-next: manual merge of the mips tree with the mips-fixes tree
Message-ID: <20191105100556.52f266a2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gxbBgbskU/k6U81oiDJHtY=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gxbBgbskU/k6U81oiDJHtY=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mips tree got a conflict in:

  arch/mips/sgi-ip27/ip27-init.c

between commit:

  637346748245 ("MIPS: SGI-IP27: fix exception handler replication")

from the mips-fixes tree and commit:

  4bf841ebf17a ("MIPS: SGI-IP27: get rid of compact node ids")

from the mips tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/mips/sgi-ip27/ip27-init.c
index 79a52c472782,8fd3505e2b9c..000000000000
--- a/arch/mips/sgi-ip27/ip27-init.c
+++ b/arch/mips/sgi-ip27/ip27-init.c
@@@ -67,16 -62,25 +62,16 @@@ static void per_hub_init(nasid_t nasid
  	REMOTE_HUB_S(nasid, IIO_ICTP, 0x800);
  	REMOTE_HUB_S(nasid, IIO_ICTO, 0xff);
 =20
- 	hub_rtc_init(cnode);
+ 	hub_rtc_init(nasid);
 =20
 -#ifdef CONFIG_REPLICATE_EXHANDLERS
 -	/*
 -	 * If this is not a headless node initialization,
 -	 * copy over the caliased exception handlers.
 -	 */
 -	if (get_nasid() =3D=3D nasid) {
 -		extern char except_vec2_generic, except_vec3_generic;
 -		extern void build_tlb_refill_handler(void);
 -
 -		memcpy((void *)(CKSEG0 + 0x100), &except_vec2_generic, 0x80);
 -		memcpy((void *)(CKSEG0 + 0x180), &except_vec3_generic, 0x80);
 -		build_tlb_refill_handler();
 -		memcpy((void *)(CKSEG0 + 0x100), (void *) CKSEG0, 0x80);
 -		memcpy((void *)(CKSEG0 + 0x180), &except_vec3_generic, 0x100);
 +	if (nasid) {
 +		/* copy exception handlers from first node to current node */
 +		memcpy((void *)NODE_OFFSET_TO_K0(nasid, 0),
 +		       (void *)CKSEG0, 0x200);
  		__flush_cache_all();
 +		/* switch to node local exception handlers */
 +		REMOTE_HUB_S(nasid, PI_CALIAS_SIZE, PI_CALIAS_SIZE_8K);
  	}
 -#endif
  }
 =20
  void per_cpu_init(void)

--Sig_/gxbBgbskU/k6U81oiDJHtY=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3ArtQACgkQAVBC80lX
0Gx2MAgAk6gYWLfbpy/H85DV75vTBcXsNWzdv8V54Tw6NHlHLqMoqeYdzHfJ4VMg
yLltzvVqLRdaGhpazgdHYyBNU7HeABCe7ggqRBtoZt25qnTmrB912fZBFDWT0Y9T
Ev7fl70hKs2WFnwSXkebY9A0Qrx3lp23tuK+JX/hww5VCOCmpdsNmuLfOR9k7tqG
gOgr+R2q6ubYCBOtduAAiLRqDNK/D6/DVwfn/DFGcy0W9OFwK7Gh7AJK0dV1dZgL
1emPCbUYHzxgINbosQFEt5+JCvzcbDZ14bvZLbqro/5Udv+J+NcMUAOWInoS5rX+
F/udKJ2cKeu6LaBlh7tG6567cJZ5Pg==
=s7UN
-----END PGP SIGNATURE-----

--Sig_/gxbBgbskU/k6U81oiDJHtY=--
