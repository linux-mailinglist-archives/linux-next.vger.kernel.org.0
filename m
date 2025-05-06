Return-Path: <linux-next+bounces-6543-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2EEAABEDD
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 11:16:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E01A01C26482
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 09:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 559AC16EB7C;
	Tue,  6 May 2025 09:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Zmzz+fch"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DDF269B08;
	Tue,  6 May 2025 09:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522685; cv=none; b=GyaBJB/LuEtCbgTPJhrdxXXjw6XwY4TrBJJeIKSqWOMzOIzNYjEAV4pzepcC2DUd7O+Ohn89wfk5U91qr5u8WDPI6JUx4UadsLOlrZzCfR6KYszXuQk0EpC1PQqasWgWfPdKvuDnlnKElsQtitnuHoQ/sf5E8qYrMUAAEjTfnyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522685; c=relaxed/simple;
	bh=xWCBXfZXchEREz413z0ufZfBuYmDssLsk+IROdV/hZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=A4SQSxQm4lXkDeztKECUqZfpKGdBgmMLFPfj2D8TSMfPgBc1b4xMp6GyWWoqiinSfXYk6MtMr5VmLwN/p/nCvDU1UaxxaX8qB9E17Pvrr1BUtzWWPcNQ4RJA3zF9XRFwdQFTT6JiDBZL3i1ZXXa14913J07sZdeBnpEdtfyKwxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Zmzz+fch; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746522677;
	bh=2OrIKvQnwifqLz45NIG2Uk6cBVnTx26dfgxe8rVv4BY=;
	h=Date:From:To:Cc:Subject:From;
	b=Zmzz+fchmUp2kNmwGun/zD85bJzTC1bTRmcihypqPsTL/rrvj4ZwVBr5aPzKDIFH3
	 yYlYcdKnxgYzAU4hNoGPZ/a8Fqa/5rabjJ/7EYPM/f9k4fZK5Q1P3P8hNAVNSe1C3l
	 27Y4nI9QDp+09F4RJZKVAamAlt+OpSiGBS9vNzJ3033V8AYgreZOIvw2yV6wTEU3LL
	 3E2iqtNCMUIa8Sw2Be7jegee4tvxnNldy2ugsgD1DhOGoztlho5K/7Q0XDuqfVcWAs
	 kwHcqPkvVAztXlf+TZItFtiUliSC8GsthMZQSWyq6II5yjoo9VP6ovX7VbkspBjklT
	 qh+vwgl4qIVIg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZsCLX73tnz4x8f;
	Tue,  6 May 2025 19:11:16 +1000 (AEST)
Date: Tue, 6 May 2025 19:11:14 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: "Yo-Jung (Leo) Lin" <leo.lin@canonical.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the i2c-host tree
Message-ID: <20250506191114.1809d6ba@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ei/rubxB65Qyctt.=RJhlI+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Ei/rubxB65Qyctt.=RJhlI+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the i2c-host tree, today's linux-next build (i386 defconfig)
failed like this:

drivers/i2c/busses/i2c-i801.c: In function 'i801_probe_optional_targets':
drivers/i2c/busses/i2c-i801.c:1180:54: error: 'struct i801_priv' has no mem=
ber named 'mux_pdev'
 1180 |         if (!IS_ENABLED(CONFIG_I2C_I801_MUX) || !priv->mux_pdev) {
      |                                                      ^~

Caused by commit

  27f4a0d6938a ("i2c: i801: don't instantiate spd5118 under SPD Write Disab=
le")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/Ei/rubxB65Qyctt.=RJhlI+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgZ0jIACgkQAVBC80lX
0GwazAf/Y7g/QeciJBcsQwQ80bHzyaL/ULLiaSi63eiGOgxu8+s9fNSsMzOBu3dK
AXz4N8i1aIZH1G+WTGoRIZrkUSESFk8BDcwhSKmTJmoodeDMQQof92ApYLxEqees
E7x2mMUQ5vzN606qkZaUfydoAObbE17i070uJZhtiVn/333ZINbDOLn3rak6r6j0
i0xCvyUTZqawj27GWY2uR+ym38t22LZF6EKIbgPfskbQ6FSMgVXD4PLv9oFGU+xK
L5OMc82N+Fz4CodG5d/XEQXT/jMBFpoQADiZwbr7ZwK/9MVwhJ2RghFivowoAwcy
ynyppmPQIYt7Qhl0YIEYF3c8lI10fA==
=zWZb
-----END PGP SIGNATURE-----

--Sig_/Ei/rubxB65Qyctt.=RJhlI+--

