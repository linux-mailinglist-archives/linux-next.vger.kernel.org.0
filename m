Return-Path: <linux-next+bounces-5949-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E16A6D64F
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 09:38:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D087F7A4FED
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 08:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F5325D55B;
	Mon, 24 Mar 2025 08:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="m7WG47WK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7B125D52C;
	Mon, 24 Mar 2025 08:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742805457; cv=none; b=n7F2j5kw47PtrXmAOvL5fRYSDaBk80B+J5gryzldL9TW7rSjZay9ltxqYb2D5IMeX7TnCxSRi+Pxl4PzTmCtaka3gVdsLLd23V3gmeUTcqZUIbxLQNs+D+XL/Ej15Qhv4ZjoPMAAzSfvucZKTcf+ODibMqMIkP+TDYFGm8z7aLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742805457; c=relaxed/simple;
	bh=D69SC+5FQc2WAFqCzWqeK4ofTdNQe+cRvdH05Lz/0Ns=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ag2KdrBhwHiRz7AVfWe2kHyzvV7YK1b/v+F019NDIXAT07D73vWVPLz3eEozFQKyqQW2y76D3jUcl7mtBNH7R0US3sNIAjHNHDmtkofto5zMv+HtVYeuX6L+axd2hLnZZwNkEslt0gID9c1PKInCSdmUyLMzNotjFjad51T37GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=m7WG47WK; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742805450;
	bh=dGrsEpWWQThTpylnaO8MjPKqdNf2MabWrZhjdBJLAlU=;
	h=Date:From:To:Cc:Subject:From;
	b=m7WG47WKYD8yWyYb8XYQL/uuVvGYZP6QuAMUfQiiGTNawr7xM+EVC9R1BQk1PjlSR
	 2TKGzzV8vzeoyZRE/Ov641eQLedFr2OYaouLZXcNAV6+HBMCIu07s4P7T7ieYzzojm
	 RdnPQjbAtA+h9rtLn4iw1uKPJPmB4IIhp/l+16tvjxy8BuqAkAypQzfPwiDlzMfm2z
	 DxlcrUaNPJ9xiEj3qVGc13EqJQCC1UnpdjHx+bpbsLpYGtiUzt8L13JR+kvuwHkOEu
	 +B1f+ZTYNvLWDCTsTIp8R1cJ8MzCiMVRV2ErWkcHLS1M9hgARF09pBX7qEFHFaKN7D
	 KBYpd1yuXhtNA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZLmdQ0117z4wbn;
	Mon, 24 Mar 2025 19:37:29 +1100 (AEDT)
Date: Mon, 24 Mar 2025 19:37:28 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sherry Sun
 <sherry.sun@nxp.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the tty tree
Message-ID: <20250324193728.4af92ccc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kH8wyLagAvfHnj_cEOSj3hM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/kH8wyLagAvfHnj_cEOSj3hM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tty tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/tty/serial/fsl_lpuart.c: In function 'lpuart_poll_init':
drivers/tty/serial/fsl_lpuart.c:642:29: error: unused variable 'sport' [-We=
rror=3Dunused-variable]
  642 |         struct lpuart_port *sport =3D container_of(port,
      |                             ^~~~~
drivers/tty/serial/fsl_lpuart.c: In function 'lpuart32_poll_init':
drivers/tty/serial/fsl_lpuart.c:696:29: error: unused variable 'sport' [-We=
rror=3Dunused-variable]
  696 |         struct lpuart_port *sport =3D container_of(port, struct lpu=
art_port, port);
      |                             ^~~~~
cc1: all warnings being treated as errors

Caused by commit

  3cc16ae096f1 ("tty: serial: fsl_lpuart: use port struct directly to simpl=
y code")

I have applied the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 24 Mar 2025 19:10:57 +1100
Subject: [PATCH] fix up for "tty: serial: fsl_lpuart: use port struct direc=
tly
 to simply code"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/tty/serial/fsl_lpuart.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/tty/serial/fsl_lpuart.c b/drivers/tty/serial/fsl_lpuar=
t.c
index 33eeefa6fa8f..4470966b826c 100644
--- a/drivers/tty/serial/fsl_lpuart.c
+++ b/drivers/tty/serial/fsl_lpuart.c
@@ -639,8 +639,6 @@ static void lpuart32_wait_bit_set(struct uart_port *por=
t, unsigned int offset,
=20
 static int lpuart_poll_init(struct uart_port *port)
 {
-	struct lpuart_port *sport =3D container_of(port,
-					struct lpuart_port, port);
 	unsigned long flags;
 	u8 fifo;
=20
@@ -693,7 +691,6 @@ static int lpuart_poll_get_char(struct uart_port *port)
 static int lpuart32_poll_init(struct uart_port *port)
 {
 	unsigned long flags;
-	struct lpuart_port *sport =3D container_of(port, struct lpuart_port, port=
);
 	u32 fifo;
=20
 	port->fifosize =3D 0;
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/kH8wyLagAvfHnj_cEOSj3hM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfhGcgACgkQAVBC80lX
0Gxj+wf6A8Nz+mmyouOrNfjIEFol8Od7tyO2xm/TwkseiY4wrOfYuS4h9JVNVgR0
HpKVLaTsJMRpmZ12XmTFrolsd72itth5gjZjFQMLYagtkWumHMdPcvvomzM7nj79
q2Y7pk7BFXJF5qWyrCHxE6NzhI/AxrFs0PG8VXlHvcoBW/CXAfoYg5P/u7yyN5mH
HzKBvBOZgfxeLJy3EiT9/hi97WHQA30pCMuZfyrbWFrwdYG+wEupJrq2u/GeK6eE
rOWNCnLiks5mJGRFc/nFx76759Tl+RmnrcmcC2ffpFQ6othoss5bKi/MIsOnvn8x
t27YKRC3nhNP7yF+Uswagb8DilcpAg==
=b6IY
-----END PGP SIGNATURE-----

--Sig_/kH8wyLagAvfHnj_cEOSj3hM--

