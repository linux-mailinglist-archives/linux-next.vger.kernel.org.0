Return-Path: <linux-next+bounces-9157-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C08D8C7E7F3
	for <lists+linux-next@lfdr.de>; Sun, 23 Nov 2025 22:53:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 985EE4E080B
	for <lists+linux-next@lfdr.de>; Sun, 23 Nov 2025 21:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A377D26ED4D;
	Sun, 23 Nov 2025 21:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="U+vViSzD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43F12517AC;
	Sun, 23 Nov 2025 21:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763934800; cv=none; b=Qk9iHGX8cCriSL3DFIW19pY93UjnOKXEMjtBXTRWeoHYvMpdkYddGoarXAdq0MtWB6a6S2KPNSQRjZ/hp8aj1kB/lBgtYSvUJlNCy2iOGatyJkzKPKqLdJvDEm3ZSyn4gBBo84ATHzwymY0vwULsY176/Snn5NALckUTeIkjSB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763934800; c=relaxed/simple;
	bh=QvM5KIq5AIaOJgFOEufch2hLQ+Orl1ZS8LblxANt5PA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nFRBg1NQcIv8+YlCNRkVaR/0Xkn8G6Djw0Crair3v5SyLQirwFf6UuZtYjR9d35YodOaLbV+/8pP8bF1JQ1S7w9vj3vYHqDl7YXcCMk12NomQrxncobMmZjAy8kdoMfqE1/Nv+EwIUphXqlxSM/ullUVg1V97TMmkJQ4M/SQkXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=U+vViSzD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763934788;
	bh=hQd9l0BaFrmtYA2hIsLPFHIPWChtTNt9IEdyybVkQfM=;
	h=Date:From:To:Cc:Subject:From;
	b=U+vViSzDr36fEhcXmYR96c2MolvoQ7qqMiFt16omzvtHZRcuVSqXBRJK4+ffsa8Ac
	 BlLQsfIPUUc+zb/UTxPYR0g/pJCyXWXHZ5TMI/UkGeaU0eqsYtGtEIbwdv11kvhVSC
	 7joQkMZOvZlz7glb54RcU1cx3/kbVW89rV+Xdlw0VE1cptMUkDhuJYGSj0/M0B0V4W
	 nZE0ApYNHegS4K56kyG9sOFcLAeNiWJqLAIQpLytbnpSut/wzC6zGUDtu9bvyB572P
	 ynsRT+eAowFSRsc3KGIWeiJCzfAkZJ9HeOvQHLtR+xRaEXOS4A2MMGwsn7c9PM4ge5
	 Ew27BIsT8B/PQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dF2kr10XQz4w93;
	Mon, 24 Nov 2025 08:53:07 +1100 (AEDT)
Date: Mon, 24 Nov 2025 08:53:07 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the printk tree
Message-ID: <20251124085307.30709037@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2Gy8nbtNbvtsqkm0Pz/lY5d";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/2Gy8nbtNbvtsqkm0Pz/lY5d
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  863eb2c656b4 ("printk: Avoid irq_work for printk_deferred() on suspend")

Fixes tag

  Fixes: 26873eb26c45 ("printk: Avoid scheduling irq_work on suspend")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 26873e3e7f0c ("printk: Avoid scheduling irq_work on suspend")

--=20
Cheers,
Stephen Rothwell

--Sig_/2Gy8nbtNbvtsqkm0Pz/lY5d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkjgkMACgkQAVBC80lX
0GyRFAf/atnw6qQZDR8LTR3CUnSJ/A0tw2OQ4vtFEHDFLU7giipacU3BqVPoamSR
L0lIevFKayO1eJWQ+LEUsAgg2b5tIGb+vHxev/R5eu6vDr/KvBnbZljQEVqhDbJK
JBlqjWyQeeGS66xhb+HrrzwAbVL0FlhMBjDlXktnVnfmVvksg7ki9ndSL58sUYh1
uuBY2cKRRdfjOycs1YkHU1b0AIG2Xu65b2JNTcvSmcr6uAF3vd/K7L5GCiro9lBa
4UMpdKmPPhp33/f4WIwiNgiyjGln6jb9rds4sIY0nfKPg29MmULBBxBlHtoIWI9j
a3o9SKUFXRm9sUdJ9LrNHdtHcb8p1g==
=9sAr
-----END PGP SIGNATURE-----

--Sig_/2Gy8nbtNbvtsqkm0Pz/lY5d--

