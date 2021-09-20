Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ABFA410DFF
	for <lists+linux-next@lfdr.de>; Mon, 20 Sep 2021 02:19:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229985AbhITAVS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 19 Sep 2021 20:21:18 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:55781 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229565AbhITAVR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 19 Sep 2021 20:21:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632097190;
        bh=n6Y6mJwPd87qzTAfHIij558bqPiM0Z4YLCOxd/dfKZI=;
        h=Date:From:To:Cc:Subject:From;
        b=KbdrCOUQ0yiXFEVjxseO4Cd0di5qpNQSygTN/0yJ0ol+bv6cC33j/kCuYg8dErqUs
         duCIM4c6jPaDXbKlqLZU/55oTRt8bJAhDYWy/Ac7Hg2uMkPqN6vez/7K6PFe4DrU6z
         FymJSxym+2HnqKauTlR5Kqx/1xQcsZeBv7sklxYsy8ShA1zF6QGEquEDVMIGq/Dnqd
         z+xiRgMZbR66eof1NTGu2Vr19XrfUgBuTuHcZGiP1Dzy9pufOYysPsijleMb5NGa4F
         lCwdbqhVjadqyekReEtyY4s0Yh6uItYxuAuLPwInQ3tVMENtMmyOzoh2m3CYOwSeUL
         b034eMKdiVT6g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HCQDP4StWz9sX3;
        Mon, 20 Sep 2021 10:19:49 +1000 (AEST)
Date:   Mon, 20 Sep 2021 10:19:48 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sean Young <sean@mess.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the v4l-dvb-next tree
Message-ID: <20210920101948.34a93713@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gdCjGjDERhYfAqrx4wkOt2+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gdCjGjDERhYfAqrx4wkOt2+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the v4l-dvb-next tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/media/rc/ir_toy.c: In function 'irtoy_tx':
drivers/media/rc/ir_toy.c:332:36: error: 'STATE_RESET' undeclared (first us=
e in this function)
  332 |        sizeof(COMMAND_SMODE_EXIT), STATE_RESET);
      |                                    ^~~~~~~~~~~
drivers/media/rc/ir_toy.c:332:36: note: each undeclared identifier is repor=
ted only once for each function it appears in

Caused by commit

  6a014f20734d ("media: ir_toy: allow tx carrier to be set")

interacting with commit

  f0c15b360fb6 ("media: ir_toy: prevent device from hanging during transmit=
")

from the v4l-vdb-fixes tree.

I have applied the following merge fix patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 20 Sep 2021 10:14:37 +1000
Subject: [PATCH] fix for "media: ir_toy: allow tx carrier to be set"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/media/rc/ir_toy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/ir_toy.c b/drivers/media/rc/ir_toy.c
index 9ea91d418635..71aced52248f 100644
--- a/drivers/media/rc/ir_toy.c
+++ b/drivers/media/rc/ir_toy.c
@@ -329,7 +329,7 @@ static int irtoy_tx(struct rc_dev *rc, uint *txbuf, uin=
t count)
 	// with its led on. It does not respond to any command when this
 	// happens. To work around this, re-enter sample mode.
 	err =3D irtoy_command(irtoy, COMMAND_SMODE_EXIT,
-			    sizeof(COMMAND_SMODE_EXIT), STATE_RESET);
+			    sizeof(COMMAND_SMODE_EXIT), STATE_COMMAND_NO_RESP);
 	if (err) {
 		dev_err(irtoy->dev, "exit sample mode: %d\n", err);
 		return err;
--=20
2.32.0

--=20
Cheers,
Stephen Rothwell

--Sig_/gdCjGjDERhYfAqrx4wkOt2+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFH06QACgkQAVBC80lX
0GzfPAf+PMwV6x5eNTNKhUAiOJsBhppdJLhjLLqapACfHWaHOSJRl5YSHiRwH3q/
BaTlSEnwAldjUUpCRPxWwI2RuXsu7kRb+Ef9lMHKLfwrqyDe6m5VbSzZlPENMcXO
V68PIcH8KH9R/xNhwns06YqXIOlcIdQG2Ifc4W2AN79D1Nzl/Zi7IYuArX66dI14
XVGhxvOvxXAggjEfUpKzktXIk5xe26VVYTnPqyggPYMxYr5sESSrEEOwqi/6Xj6y
ot9YgOETQIdNmJjJHYBWiHQu9qu0+tiSYaYpl2C9xDblDb7Mryp8PLlIs4eCVTBz
eGA93Z3KULfyLuQBI4SEtjQvUd5RNw==
=7HlU
-----END PGP SIGNATURE-----

--Sig_/gdCjGjDERhYfAqrx4wkOt2+--
