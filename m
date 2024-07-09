Return-Path: <linux-next+bounces-2855-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1DC92AF74
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 07:38:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3F58282902
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 05:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E489445948;
	Tue,  9 Jul 2024 05:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="H9RNPmtg"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A7B12F375;
	Tue,  9 Jul 2024 05:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720503478; cv=none; b=kEEJCbosuU+V+yn/oNruSN5E9QjQWJe0j2A3puO12DgtKmODCsCYg/eS5M+0TB7H7PA7izM70qYIrJvKQEKBSsciqFG0IVuby1qN7cmnOKhmtSiKZHIAusaBfDt1kHT7ZH+GSzoPq4pMfY3XEvFSblPpXDO9YO8bSDs2Q2+LMX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720503478; c=relaxed/simple;
	bh=OvEheWWr/Xaaxfb/IzwJiJS5OKTS97s57xi1JzrKHTo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=q1mGG1nxTm77ZO/4Oi/bmGUErGaP0jgR+XWAUtZk8Bqy+pxJq3y5weXFlZLkrEmt0NIAShDi4sD/Zgpi5yIwLieTacbpexDu4tovSQJ8d3ZVq3wNMSowNGUeVQbp9y2+BL5mt565v1vizzCj5T26XKke84Z3EwyVmpNNal11QEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=H9RNPmtg; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720503470;
	bh=Kb2sNZnu0CcRvr0hN0gsbVGhVm931fLwhcdsA85amDU=;
	h=Date:From:To:Cc:Subject:From;
	b=H9RNPmtgzMjYhbPrnQW7VzPV1TitDyOZoQLNsiaL2bhA5Ux6NhObPj/LXSYikRTfW
	 +Q7gAO1MZhrIkw54BPm1g/gIXCHU+Jc9BiAMg/lAPGrAh37Un/HJvQEhhZfZT3AOPv
	 ++yyKkSa02YRkTsFWXrUccyP3Md+KcIyKrCAhntG5kfgPLv/EMq0iy6FbrxLNn9CnF
	 50onYLseRgIr3Pa6dWPdR/j1EKbkaSVt5FE4lx8wbRZDRiJ2H2/8wNwjqLBLihppY5
	 zuLJj0sCoIze+X5DskS4ghCJoQo1oZz/5nIn1c4ruqbpPoM/HRsJZIKdYxrcvTtfZT
	 k5uPw07DDPL8g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJ8s92Wk3z4wZx;
	Tue,  9 Jul 2024 15:37:49 +1000 (AEST)
Date: Tue, 9 Jul 2024 15:37:47 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: linux-next: manual merge of the tty tree with the tty.current tree
Message-ID: <20240709153747.07d7272c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/20wsyuH.4Ohkr5IbyyKsu/p";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/20wsyuH.4Ohkr5IbyyKsu/p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tty tree got a conflict in:

  drivers/tty/serial/imx.c

between commit:

  9706fc87b4cf ("serial: imx: only set receiver level if it is zero")

from the tty.current tree and commit:

  3093f180bc6e ("serial: imx: stop casting struct uart_port to struct imx_p=
ort")

from the tty tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/tty/serial/imx.c
index ff32cd2d2863,d96f0524f7fb..000000000000
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@@ -1549,10 -1553,9 +1554,10 @@@ static int imx_uart_startup(struct uart
 =20
  static void imx_uart_shutdown(struct uart_port *port)
  {
- 	struct imx_port *sport =3D (struct imx_port *)port;
+ 	struct imx_port *sport =3D to_imx_port(port);
  	unsigned long flags;
  	u32 ucr1, ucr2, ucr4, uts;
 +	int loops;
 =20
  	if (sport->dma_is_enabled) {
  		dmaengine_terminate_sync(sport->dma_chan_tx);
@@@ -1984,8 -1937,8 +1989,8 @@@ static void imx_uart_poll_put_char(stru
  static int imx_uart_rs485_config(struct uart_port *port, struct ktermios =
*termios,
  				 struct serial_rs485 *rs485conf)
  {
- 	struct imx_port *sport =3D (struct imx_port *)port;
+ 	struct imx_port *sport =3D to_imx_port(port);
 -	u32 ucr2;
 +	u32 ucr2, ufcr;
 =20
  	if (rs485conf->flags & SER_RS485_ENABLED) {
  		/* Enable receiver if low-active RTS signal is requested */

--Sig_/20wsyuH.4Ohkr5IbyyKsu/p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaMzKsACgkQAVBC80lX
0GwBaAf+IQdnt5lHrEVR733zi2DEUfysmf9dniwZEnSKMMXn21Pi/l/RACvNcKoq
BU1au5gAw+QxyvggvqAjxGSjF+ASNNsYeUWmGyxy4yUN0RfTlzfbl3SUYQZswvyn
BFmn15gdHDVUh5d7mYPOss3HekEhwYmC6KqDhLECj2BVDCVQk3WxeXGC8906bL9V
E84grww3k0K8T+32EW3yxyNvDfFDoe0dqIi6DI8A79aCs7X53SsmkQ961eedT59y
NvED0bUgIpRlcOSPgRJdQUwHIeOvcoPfB+oW1Y6vO6Dn3NvZrqBy8N3z3mworD42
f0B2+LP3QYgCFsoZr3TfBejhm4MMtQ==
=yz1h
-----END PGP SIGNATURE-----

--Sig_/20wsyuH.4Ohkr5IbyyKsu/p--

