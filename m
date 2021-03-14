Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7DCC33A8CB
	for <lists+linux-next@lfdr.de>; Mon, 15 Mar 2021 00:31:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbhCNXbG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 14 Mar 2021 19:31:06 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:35265 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229585AbhCNXam (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 14 Mar 2021 19:30:42 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DzG4w6N15z9sVb;
        Mon, 15 Mar 2021 10:30:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615764641;
        bh=n/DL0a+p+Us+x4M9BhtBlh5lyRzu/objkXUKf47lLFY=;
        h=Date:From:To:Cc:Subject:From;
        b=cC3nRjV00yPqujH6FQ20jRmNUlv6gxM23CTapwp3S06c0Om77oudMaCsgDDBRXPfC
         b934P9ASMTRaunIprIUtzXUb1lHYMZ240ys4vaH96ZZk9cwu2M/7WgRd7t0D9ax9p8
         S3RzzBwrMQ/9LULdezNxkx99MGTTHgfJaoWblFzBj8nCQvAQ9HgOA1QUEQvBhIbK2p
         wQloqLNSlXyEpY+XBSiBth5d2QPPV0imr7ag9/7ILAZuZ6iwQ75k1IGoxcmIjP3XoQ
         56YbieCUyVdXma0AwEIl+iGufFHrYSGpmiB5amNn7fa84zh63P4C6yfEY1MYljKh66
         rsntvZpodSgEw==
Date:   Mon, 15 Mar 2021 10:30:39 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Chuck Lever <chuck.lever@oracle.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the cel tree with the cel-fixes tree
Message-ID: <20210315103039.1b113816@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Fy8pb.5LrkjUDOEwsqQph=v";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Fy8pb.5LrkjUDOEwsqQph=v
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the cel tree got a conflict in:

  net/sunrpc/xprtrdma/svc_rdma_recvfrom.c

between commit:

  bade4be69a6e ("svcrdma: Revert "svcrdma: Reduce Receive doorbell rate"")

from the cel-fixes tree and commit:

  898d455e7277 ("svcrdma: Add a "deferred close" helper")

from the cel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc net/sunrpc/xprtrdma/svc_rdma_recvfrom.c
index 7d34290e2ff8,d7ebecf4e512..000000000000
--- a/net/sunrpc/xprtrdma/svc_rdma_recvfrom.c
+++ b/net/sunrpc/xprtrdma/svc_rdma_recvfrom.c
@@@ -356,10 -351,16 +354,9 @@@ static void svc_rdma_wc_receive(struct=20
  	return;
 =20
  flushed:
 -	svc_rdma_recv_ctxt_put(rdma, ctxt);
  post_err:
 +	svc_rdma_recv_ctxt_put(rdma, ctxt);
- 	set_bit(XPT_CLOSE, &rdma->sc_xprt.xpt_flags);
- 	svc_xprt_enqueue(&rdma->sc_xprt);
+ 	svc_xprt_deferred_close(&rdma->sc_xprt);
  }
 =20
  /**

--Sig_/Fy8pb.5LrkjUDOEwsqQph=v
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBOnJ8ACgkQAVBC80lX
0GzAYQf/RJI1Tch0T1/9nOl+yad7JJO1+GgaAc8X/BhaskuGhfuM02DNUlS8nE7z
dOD352gR8RyrNtMsArACjzaB+HtuyCrLeXO0g/aX/4mSGA2VU/elg+P7DCfGs32j
0ariHm1b28eDN30RAHNDMNLjM3wgbqpUnp4xdvqj6qxUJ/url4r+mYPRzw/6lRZ6
D8NcTPOP1YKL2OPafpiadHZaddnaBPvHIpSpzQFf84MSVZeVv+5fO4y4pah4t1Hu
y5I604ijLtAGL/KVT1cAdi2Q/IATB/yuOAOM8vH/8+Iyl61jWwskEnsLcN3Rm54a
RzlYXDuA06lqZNAEKCVc+R9UIEA0pg==
=nCOf
-----END PGP SIGNATURE-----

--Sig_/Fy8pb.5LrkjUDOEwsqQph=v--
