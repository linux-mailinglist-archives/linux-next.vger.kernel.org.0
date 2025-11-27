Return-Path: <linux-next+bounces-9234-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CC086C8C80F
	for <lists+linux-next@lfdr.de>; Thu, 27 Nov 2025 02:09:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6A06E4E6806
	for <lists+linux-next@lfdr.de>; Thu, 27 Nov 2025 01:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B325B1D63D8;
	Thu, 27 Nov 2025 01:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="A5cDG+0N"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF20A28FA91;
	Thu, 27 Nov 2025 01:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764205769; cv=none; b=QjcxP2m9CLDqrDE6i2SS1GhU5XdY7Q3aXA9H5F5RJAOhwWSFDxu1/rE/apP8dROv3/RM+pP10qFDEK6aYdUmVjpACrgvQKY0l53IAjqNRB4aGU4wEi7g0H7hIpy7l6n667OiEkOs2KgengazkG6qk/c3O+UFlZjAe79iul9EXPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764205769; c=relaxed/simple;
	bh=4bN7GRswtu9IayHT3v729YN19DngxAoVqfNnRupboA8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tU/mTPoJd4KHd0XpZUyePP0hD11SqjJMqypfe66WvzAR8ap1LHkLeb+Y4lZVuSDNFqd1DH5HZety4//pKLZIKKKDLKCZVZOZbiUMomLs9XaSr09IsBOO9ZM0Qwr9PgGtasWSHPB3VFDW9Nv+ERxTB9fCNaK0/hFOzymirmsKvUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=A5cDG+0N; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764205763;
	bh=0gySJsdJvwUIj/tUcW0g6F13h8LCjnm9AviV/O1NkmA=;
	h=Date:From:To:Cc:Subject:From;
	b=A5cDG+0NSkHkBt/rHR4x/rmjqHsXKJeoY35U26JQiZIO/Q6TSInYKkcYRjNTW0ARq
	 P/jvwZz3BwleAeBCABkoYCmToPjN0ee6LMz3jg/N+JuXnxqXK2YnjoT6YFJEHYp5IA
	 d4/4ls0b3RdW30fYzcYN5hVK4c3BvtFxt4fjDlZ3aBoa0QFiYXaIzcLCc7tTe7r5M/
	 1AqD7zTcput3J+LoJmsa56GogQZWg+R3q7/jwrCadIUk3eISZvxJNuF74rZ2Ik1q9/
	 JjaLZyyZNndcsJ9M7f2PSyB27rptoOQzfrnUEn2Lwf934BcUVt8YNC1l90GRIczxnR
	 GzsIZVqt55h8g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dGyxt47zcz4wGw;
	Thu, 27 Nov 2025 12:09:22 +1100 (AEDT)
Date: Thu, 27 Nov 2025 12:09:21 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ilpo =?UTF-8?B?SsOk?=
 =?UTF-8?B?cnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, "Jiri Slaby (SUSE)"
 <jirislaby@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the tty tree with the tty.current tree
Message-ID: <20251127120921.3c398213@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MfATAwB/W1e.SWo8bgtMdHV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/MfATAwB/W1e.SWo8bgtMdHV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tty tree got a conflict in:

  drivers/tty/serial/8250/8250_rsa.c

between commit:

  2bf95a9bcb50 ("serial: 8250: Fix 8250_rsa symbol loop")

from the tty.current tree and commit:

  37d55c92e9db ("serial: drop SERIAL_8250_DEPRECATED_OPTIONS")

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

diff --cc drivers/tty/serial/8250/8250_rsa.c
index 1f182f165525,3b9c00515407..000000000000
--- a/drivers/tty/serial/8250/8250_rsa.c
+++ b/drivers/tty/serial/8250/8250_rsa.c
@@@ -209,27 -200,4 +209,3 @@@ void rsa_reset(struct uart_8250_port *u
 =20
  	serial_out(up, UART_RSA_FRR, 0);
  }
-=20
- #ifdef CONFIG_SERIAL_8250_DEPRECATED_OPTIONS
- #ifndef MODULE
- /*
-  * Keep the old "8250" name working as well for the module options so we =
don't
-  * break people. We need to keep the names identical and the convenient m=
acros
-  * will happily refuse to let us do that by failing the build with redefi=
nition
-  * errors of global variables.  So we stick them inside a dummy function =
to
-  * avoid those conflicts.  The options still get parsed, and the redefined
-  * MODULE_PARAM_PREFIX lets us keep the "8250." syntax alive.
-  *
-  * This is hacky. I'm sorry.
-  */
- static void __used rsa8250_options(void)
- {
- #undef MODULE_PARAM_PREFIX
- #define MODULE_PARAM_PREFIX "8250_core."
-=20
- 	__module_param_call(MODULE_PARAM_PREFIX, probe_rsa,
- 		&param_array_ops, .arr =3D &__param_arr_probe_rsa,
- 		0444, -1, 0);
- }
- #endif
- #endif
 -EXPORT_SYMBOL_FOR_MODULES(rsa_reset, "8250_base");

--Sig_/MfATAwB/W1e.SWo8bgtMdHV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmknpMEACgkQAVBC80lX
0GwlwwgAnix7/puvR72NxaxqqxRa7FCVSzYJxxAkmIDpcrGtCv/gt1leqKeLCt2p
5UXRKVrnI5Z6B/983pkL6aGaRMgYVLOViD3jm7o3sK8XtaV1bk8vKzmz+GDQhYT9
mb1qq+lRieg2CR5s4tplHNi6MgfRzhp5VQAPVSMnG0wv21TjSQoCYzKe3UTFELS/
n3q4eAq5FQMx2cJ5CeM8O3AQCR7+mIxSCOttW+g2wZP8HQ3gbkM3X13Y1Qli54rE
U/F/E2/vxvZUVnnecE3V0BPDsyseEP7YtiHmJQimTmZeLp1gmLaP88ZiiZfqz4wC
LhZZO5C+c6fgekavjjecVsPy/rcPjg==
=+DAO
-----END PGP SIGNATURE-----

--Sig_/MfATAwB/W1e.SWo8bgtMdHV--

