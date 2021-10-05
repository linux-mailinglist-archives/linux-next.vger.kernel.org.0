Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAA48421CC6
	for <lists+linux-next@lfdr.de>; Tue,  5 Oct 2021 05:10:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230462AbhJEDMF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Oct 2021 23:12:05 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:37503 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbhJEDMF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Oct 2021 23:12:05 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HNjJ539KDz4xbR;
        Tue,  5 Oct 2021 14:10:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633403414;
        bh=0gtw1pRG+MY95DNmHFmnmgRGAOC03N7aBs4CDO1/fN8=;
        h=Date:From:To:Cc:Subject:From;
        b=WFZ7msN4vG4z1ZHQb6PEtX63/E5hU2T1vixeX2+OIDJeIQKLbliYCaSPIFXTyNmcB
         k5Lo05Lm+TAE6V/OI2RElyuoYpVButZEQkUAICBpPssqRPMoOJoMuncLBNJcOZE+QV
         hnHQpDTDrl225zb0qtdnbBhzmJXvDvHaMyZUiPdoB6mFidO2py+nV085IliGDzFzLW
         bqNj0YPX3uSBcSNnne3srFNnekzk+2nTP+ffRL1lIehdsZ0HlmgxBqn6OWbR+2YduU
         3TR6dC0ekZ365A+LWluQZxtVK+MWZJ2mSAo6gfcriIWbCkfXdPVeeZ/niy+PDenoty
         RHmHvb42hYWSA==
Date:   Tue, 5 Oct 2021 14:10:12 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Paul Moore <paul@paul-moore.com>, Jens Axboe <axboe@kernel.dk>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Pavel Begunkov <asml.silence@gmail.com>
Subject: linux-next: build failure after merge of the selinux tree
Message-ID: <20211005141012.31e20a26@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6zb64Pz+HKOYxddNqIGAeGP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6zb64Pz+HKOYxddNqIGAeGP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the selinux tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

fs/io_uring.c: In function 'io_init_req':
fs/io_uring.c:7069:3: error: 'ret' undeclared (first use in this function);=
 did you mean 'req'?
 7069 |   ret =3D security_uring_override_creds(req->creds);
      |   ^~~
      |   req
fs/io_uring.c:7069:3: note: each undeclared identifier is reported only onc=
e for each function it appears in

Caused by commit

  cdc1404a4046 ("lsm,io_uring: add LSM hooks to io_uring")

interacting with commit

  1e1e4658e108 ("io_uring: init opcode in io_init_req()")

from the block tree.

I have applied the following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 5 Oct 2021 14:01:10 +1100
Subject: [PATCH] fixup for "io_uring: init opcode in io_init_req()"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/io_uring.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/io_uring.c b/fs/io_uring.c
index 9a3c3198ff90..c36ae439e64f 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -7062,6 +7062,8 @@ static int io_init_req(struct io_ring_ctx *ctx, struc=
t io_kiocb *req,
=20
 	personality =3D READ_ONCE(sqe->personality);
 	if (personality) {
+		int ret;
+
 		req->creds =3D xa_load(&ctx->personalities, personality);
 		if (!req->creds)
 			return -EINVAL;
--=20
2.33.0

--=20
Cheers,
Stephen Rothwell

--Sig_/6zb64Pz+HKOYxddNqIGAeGP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFbwhQACgkQAVBC80lX
0GxIMQf+OKIUg1IqMImIXYDBb5QWGyc70fBV3wxbwAI5JK6FyN0s6pGVrduz6Ua3
h+86nfIg6tGIVPAnhfPJEqKBjZOekiMnUPMHKlBO9qvASQe33LyztwQ6KhC+G3aW
3c2S4ZvAeGSey2qPFoukSpKceQQD0CX6uGx+T+Af8XvYXyzSY7eCEfDgdbqn5HZX
8MFnqREoVV1zP5ZpNBbf7H+fz7bQUHuvWpeKrLig3w/z/21DFbO3dT34bKlitCvd
0qZIlrQpNVW0h3Qq6n6KOYqBGgBsLYWbS2IAPf/oZbXdgriFy3IOf6qWiGm6SjRc
5Dwbo0JCvL7MqqMb68XXf14nT4s1oA==
=UxFF
-----END PGP SIGNATURE-----

--Sig_/6zb64Pz+HKOYxddNqIGAeGP--
