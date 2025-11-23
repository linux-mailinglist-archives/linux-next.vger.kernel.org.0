Return-Path: <linux-next+bounces-9158-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE53C7E7FC
	for <lists+linux-next@lfdr.de>; Sun, 23 Nov 2025 22:56:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 22B524E064D
	for <lists+linux-next@lfdr.de>; Sun, 23 Nov 2025 21:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 623A1264630;
	Sun, 23 Nov 2025 21:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ov/nbymV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98951B4F2C;
	Sun, 23 Nov 2025 21:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763934994; cv=none; b=BHAId/n7Pxbv/m3FT+qmNFGDhFx9syKxYVpRKc0GET2p8bLn8psx/1NzfEQQgzwntlB+G3U1YEVdJS5XTKxMP0o/x2V+k/PgtF0laIYW7yv2mR+hBys/qD+qEQYcI/cm2ZgTUnxbfOmVfLL80LoeR2htaGF1qaJ/9h8jC/cX4NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763934994; c=relaxed/simple;
	bh=NP3HhBnfFY0JVO/z0yE/ojf72SKTzR7A2pbzNWRCzLw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tp1xQ6IUIbbdgYHvTafySwfD8wq80BYRxuzGyIlIC44sJRw8VdLfF+6ejCD6HZbwyagvhHT1UcQMnZR/qTMK0JeTmWAAsDJdr10EJqfdmV+3ukqVb803eXB8ENfQEqZMaFi0VO4ZjfoL+3rnp5zuRAw7QaW7eelkj/iU5BTlBr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ov/nbymV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763934988;
	bh=NEQ8mzY1BCwNir6UD8QLbz2NLlPbMf1t+keGCULHfR0=;
	h=Date:From:To:Cc:Subject:From;
	b=ov/nbymVeLFv1Vv0WORnp07JgF2XYNQbHjXqV9hZY+oEjTtfIOD2w/iEFejK82tnA
	 A5rPBG61SLi0z0M5lvB6BpIM4hPNedfNH13LLHfQiiUayS+tQS5Sqhm3chXtTXDC+I
	 Iuu7Yi8q1jNePTGRkv6t2aX8zhmNugSHySEYCIc5f621z1TuiqNwkouflkTqHhscxS
	 raSBfwNZZPJctsNMv9+0zMp0n9VaSEf4yFqDuHmJ2wYzAhRn0kSOZ1BUm50tdFjQrZ
	 8uTCYyS+vqukUzG4tt7Rstq83Yg+TQayQkzZ6h6Fcvcms6KBqNimS5B/jMmZobQIXX
	 KjJforGQe0grg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dF2ph3BP4z4w11;
	Mon, 24 Nov 2025 08:56:27 +1100 (AEDT)
Date: Mon, 24 Nov 2025 08:56:27 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the extcon tree
Message-ID: <20251124085627.76c6fb36@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rKBemHY_cTxA+WAmEjgruxu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/rKBemHY_cTxA+WAmEjgruxu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  279a8f26024d ("extcon: usbc-tusb320: Make typec-power-opmode optional")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/rKBemHY_cTxA+WAmEjgruxu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkjgwsACgkQAVBC80lX
0Gx0LAgAj28cU9qF+6OxBBRB8I6GtHIWpC4obJbHr7iRNszRfUDVv92CxbU1FB2D
zFxhBhA6Ulp4wGEHZTDtI7DWow7Z5UZDa4Hq00VNrb+jZYgQ5lo9KqjY4u75eh3n
kHLhdtYS6Egb24YmAJGs2e8Pmq5nOyEVJres4W9tntGdXLvTGAdzpc/GPlBeT6uN
hpCLG90niGVXSb1goBRVYq7Xk8ds46if95D2GjjtZnzK8BtYprrpyabmBCaQwwXS
hG/fm2C7AqDG43qqmwTLyszBDtGuiJ1QObqDZVQhzB+oE6z+sutwTMHnQFPq/m5E
71tw0Di5xRNu8yFFSbaZgonkaYAVGQ==
=GaEn
-----END PGP SIGNATURE-----

--Sig_/rKBemHY_cTxA+WAmEjgruxu--

