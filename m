Return-Path: <linux-next+bounces-9102-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EDBC723DC
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 06:25:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6F6424E1DA2
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 05:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B111D26E710;
	Thu, 20 Nov 2025 05:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rr52vxNe"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE0E372AC0;
	Thu, 20 Nov 2025 05:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763616236; cv=none; b=mEW9TV2CYQiOr872btxIZLrsEtc0kbrTdJJ9OPsD/DYRYfQJ2KjWt3SvZja7DAZOArH6sG7NQgexC4eSSNtLbxCNbqyQ7bQOQlwPvZtsOyRhmRWtOcRQ+qrTwjb71m2SP4pmHoMrv12Is9WcwN71CP4Dk4IQKPem4MPAIcj88qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763616236; c=relaxed/simple;
	bh=tYCjhg1DCcAgCjx5lJfwvhKeYW/8l44XdYBjExUNg+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IaUUDEfvl4hzsvAYaeaa4Ydh4pbbgw3kSICABxIijEjaUB9304+wvTa1wJfKBqd14jsHHfzCKr7sxuvD74+PFU1ooQ0rQGs1qgWpJln1kCQEt6xCNQxrVAoiQEXRRe2m/6hdu6nc9UnzSBp2V6dQyR6dBEYK/UDCdy7OYjTKkbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=rr52vxNe; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763616230;
	bh=V9c9mEWdfnGmg5s4i2iqY/lgNQ5jKUsT800CxA/p1bc=;
	h=Date:From:To:Cc:Subject:From;
	b=rr52vxNeK2w+wuWzNNhDMCCmC6DcEDteQyVilzKIjQPXEAUH9kqzmlqRPYFPdbYYA
	 Y02X1VV1YqmiuoLWz5tv2viyZyjYK9+9q8FnrXGadgDkUWr7zKjB7wfq27PM0eKIiF
	 +naL4NqQ8YiJXn/HMe0csL3wkAQo2I4MgkB9RVndtYgFbqxOhQCN86ehh6/s1MyDb9
	 /GmqgezaC2wApTPn9cl/8dFC3Ib196mu+DXyCl1GmGvr5sZC1wRcLvHy0Zr1J4ODfX
	 g2z0xUX8mpNBpzxa7H/wFsR3oG6HNs2OLaYzyZK/MMVEXFVaA4g228LIzciBmrLeSO
	 MfYKEJoW5weMg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dBmwj6XSsz4w21;
	Thu, 20 Nov 2025 16:23:49 +1100 (AEDT)
Date: Thu, 20 Nov 2025 16:23:49 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Shuah Khan <shuah@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the kselftest tree
Message-ID: <20251120162349.0c84ab13@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3DQJPiRgbt4fT6omLX=K9yg";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/3DQJPiRgbt4fT6omLX=K9yg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the ftrace tree as a different commit
(but the same patch):

  a2f7990d3309 ("selftests: tracing: Update fprobe selftest for ftrace base=
d fprobe")

This is commit

  5810077b5219 ("selftests: tracing: Update fprobe selftest for ftrace base=
d fprobe")

in the ftrace tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/3DQJPiRgbt4fT6omLX=K9yg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkepeUACgkQAVBC80lX
0Gzluwf/UEr4Rxd/yeiaef7zaaRf/uwVRwXNbwT15nEDPWMLWB9UYoDRlHO8QBuT
6vYxaCex44JyF4v2hy7DHw3K4qkaMAwpSyFQL4zlw2Myo+pc+AZSnfzWn0grh8DE
er2rkV+bGenxPSoESrXZb59n1a54AO9sibAxvXyhG2J5j7v03Cn1ja5SjzX9iKxi
WyaBH9Z/TDx2wImXvn1AlAU033JEqsuXpCleszSc27/h6pEz3pPCpIh7DgVdkYYG
L2utG1j+c7YrYeG45sMy6HhU9yrfwOWiw2C6hYrbT+nXfzkzd+vC4HPGorwvsdaO
n/GHg5tDDoWm3RsTWnuUbm0p5H/LJw==
=e1UV
-----END PGP SIGNATURE-----

--Sig_/3DQJPiRgbt4fT6omLX=K9yg--

