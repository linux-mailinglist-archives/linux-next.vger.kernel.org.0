Return-Path: <linux-next+bounces-9548-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D741CF61EA
	for <lists+linux-next@lfdr.de>; Tue, 06 Jan 2026 01:54:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E48C30453AE
	for <lists+linux-next@lfdr.de>; Tue,  6 Jan 2026 00:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED5F97404E;
	Tue,  6 Jan 2026 00:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="psE3cKJg"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337934A3C;
	Tue,  6 Jan 2026 00:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767660878; cv=none; b=BMS4uDj70eQBHYWfNZbtSwJcOyTdtobqctlKbcKHCaBKWOueZEfdLCJoKWqbR4UgVKrMRhp4OmSqwUIBVH2iSKh87fGlBNB97Xr2LLIAk8goBurwPNB4S+GS8/BQtpdLWxAfr2XE7pTAtmpYjMxv723hRtRKHkk5OsnFmxdcya8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767660878; c=relaxed/simple;
	bh=i0yKjByST7b6Alcyy3NdKwz0B0J+4g0R/KZaIAFPM1w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Jw8THxOufO1d33Y/Bi+uWXfLF0nwe3Zed1gASGUGuHj9+HpRxEaXnux95vtKAiV9BOdz5Dgu6gMbpoZxPW9kRgoQ0FG/Lknov8UqPqp0Nk85SyQaHgURTs4csGw8TGph/08ihn09K1jL4AC9rlyP2ziuBeZqGpBenU1Zx1rzPBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=psE3cKJg; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1767660873;
	bh=Ed/s8bh6RXhcqa0QP3b9GWheuDjX+Z/gaDWJ6Jz7CC8=;
	h=Date:From:To:Cc:Subject:From;
	b=psE3cKJgCYyzLZFkgLuBFzk68PVVDZnPyXQxw+I5ZtjrwO2PUAtODo/wem5PCRbx5
	 fZTtEmgj2eZSB+KnHCb2McgmsDiT5kp/pINBuVxM7qnjTjhFdMdiNxas5/ltmxvjWE
	 siCafDQuL3Tozk9GzdM88DYydBr2gMhqOPWTNQzvxkhHdwN+TooTyg9uawQPzjPooz
	 DwzVm2njPyUvcbjDQK4uppQfg6Jaf2PiJoGNXhqQu1KVw7yEMcG5S72R+3OWS7N6QH
	 YqvR+IBzBXTPbXrAzFVx3lp5m0UpTFLYaEKqucCcA79iEz7C5dlpKbmTRb6rc0oZfG
	 myJoSV4k+5UVw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dlXkK3WTGz4w11;
	Tue, 06 Jan 2026 11:54:33 +1100 (AEDT)
Date: Tue, 6 Jan 2026 11:54:32 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, Joel
 Granados <joel.granados@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the sysctl tree
Message-ID: <20260106115432.039d130b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gBAfhCuhzvaM/D.3SZCadZ_";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gBAfhCuhzvaM/D.3SZCadZ_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sysctl tree, today's linux-next build (htmldocs)
produced these warnings:

WARNING: kernel/sysctl.c:475 function parameter 'u_ptr' not described in 'p=
roc_int_k2u_conv_kop'
WARNING: kernel/sysctl.c:475 function parameter 'k_ptr' not described in 'p=
roc_int_k2u_conv_kop'
WARNING: kernel/sysctl.c:475 function parameter 'negp' not described in 'pr=
oc_int_k2u_conv_kop'
WARNING: kernel/sysctl.c:475 function parameter 'k_ptr_op' not described in=
 'proc_int_k2u_conv_kop'
WARNING: kernel/sysctl.c:502 function parameter 'u_ptr' not described in 'p=
roc_int_u2k_conv_uop'
WARNING: kernel/sysctl.c:502 function parameter 'k_ptr' not described in 'p=
roc_int_u2k_conv_uop'
WARNING: kernel/sysctl.c:502 function parameter 'negp' not described in 'pr=
oc_int_u2k_conv_uop'
WARNING: kernel/sysctl.c:502 function parameter 'u_ptr_op' not described in=
 'proc_int_u2k_conv_uop'

Introduced by commit

  936d17ea83dc ("sysctl: Replace unidirectional INT converter macros with f=
unctions")

--=20
Cheers,
Stephen Rothwell

--Sig_/gBAfhCuhzvaM/D.3SZCadZ_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlcXUgACgkQAVBC80lX
0Gxa4wf/fZev+dp3E8q1biB9ZqVVGuBG1bPvZ/pGqMDMnatv++ThekQfl43GUCo/
nyat9f3nnB6THrmgDGVpRtpQQd04BDM2QGySncuGtJGx4EwSyhKvs6qCHGLn3jKO
HVTI5rvZB3SJE+rQqNcsKIe5pOBfsyZ488mA6l+OoIM39QoOloj4YpHU14tdfig4
MH/pSE9848WXRVSQR08uMfTeQ0ysDW+y7WMMm8ftgJHrlnW6oyWL126qrylCIdFs
0a9mHgPmR4fcS5WYg8YIJyTN3jK1MVuGWn7i4NzKNBrgEmWiL12wyJ34cRqltfc7
yocfFIeLqxBq539RgKNVLWLy5Egqdw==
=fOX7
-----END PGP SIGNATURE-----

--Sig_/gBAfhCuhzvaM/D.3SZCadZ_--

