Return-Path: <linux-next+bounces-6848-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A38ABD87F
	for <lists+linux-next@lfdr.de>; Tue, 20 May 2025 14:50:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E6AFC7B41BC
	for <lists+linux-next@lfdr.de>; Tue, 20 May 2025 12:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 262281D8E07;
	Tue, 20 May 2025 12:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qz5qnNBD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4AB1AF4C1;
	Tue, 20 May 2025 12:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747745352; cv=none; b=nvKthv1RMIZj05VzPA4oF9BMViKkTHCnv9a7nraG6HyIIfJvD2y1aHjYyvSZ9c/yfb4LtuKRcgdaIqlAyCEot3LTTSrxRVd7rOWTbFPXTCTkXkGo5+w0/6VYUyU/jo3dMN0qjX6Y+7g6MfB45t/q7iuX+DydPbnK5/+jD/xWhH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747745352; c=relaxed/simple;
	bh=8EsmjkZoPHETsmoj/Rl7M3pI3KCf9Jrk5I362guI2cU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LfH0L2AuhB2AMx3GsO6dr7ULdQCq+OPTw1midT3CJ5QZZtnehWeV37sI4p2OEmLDbpCxLDvghI8Qk8QDtUGORZ6e6u3y78e/MfdLbEI1VzVhXbPc9cbVeFjRNMuFMu7S4SmMXGrA5FkWS6fiVXZ4F4jHi/v1n9pn5Fvvnp6XwAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qz5qnNBD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747745347;
	bh=UYdQ1sUCNaAHqlog/H5/0CsnNbdmP7KKu2x9T/TLTNQ=;
	h=Date:From:To:Cc:Subject:From;
	b=qz5qnNBDxKKL3vwkMkT5UCn0YH1eD+CPzuKg7wk28e6g8L9WnKdmK82htIelMFB8+
	 6o+BYie1VoXiSYu5t+kfS3UXP2frnH10omDJhzNKsoRbzMSdjs2Gv6qkkn3J5n+Iu4
	 IeVe5pFg81RIfQiBRpjRHMgusybld7Ugl4PCQS4mJJSRn5gFxx2gufZb2PuGfbss5F
	 wdGQLAN+0dQrgnZUkB1dMBN1kXH+uXf+62WOFFYfblwBKp4JhckOWhErEZdId+59v0
	 xa01v+kxCnOuu23POwTW6ApvGPlx3y//vGtfiQ2GMVlaf5Qy0j6pTtcV9yZQDGsaYw
	 +H5qEboZBeBsA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b1vWQ6Bgxz4x21;
	Tue, 20 May 2025 22:49:06 +1000 (AEST)
Date: Tue, 20 May 2025 22:49:06 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: "Xin Li (Intel)" <xin@zytor.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the tip tree
Message-ID: <20250520224906.61135dd4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nAh23AS40sxVl0WInM8XSjh";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/nAh23AS40sxVl0WInM8XSjh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  54c2c688cd93 ("x86/xen/msr: Fix uninitialized variable 'err'")

Fixes tag

  Fixes: d815da84fdd0 ("x86/msr: Change the function type of native_read_ms=
r_safe()"

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 502ad6e5a619 ("x86/msr: Change the function type of native_read_msr_=
safe()")

--=20
Cheers,
Stephen Rothwell

--Sig_/nAh23AS40sxVl0WInM8XSjh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgsekIACgkQAVBC80lX
0Gz2Kwf/Vn8cxuubOPplyv0I1L/vGmVFxXiCFruJtYYN543PoaA3HBQ2p0jeAnuB
yCTQdb0szndyqrh+Ve7fid0qlnN1nhMnf39qkbcJQHOrKsdkTU+QCsl+gnAdPIgY
h4qXyqgUuS/ehtT2XcUgGUHXbR0PPNGw4bpzMTOz0WVtnNORAZUyUpZjbQK04Aa9
OusAvw71ojPyfcnie8Tcsj2sjGN+nsxpuHQqwJShbHN7iDPyXe4gciZttLL2sQwb
AkfZ9F4mmpenu+bOjBh43DGt+4bdpHqOC0dfv0laP1X8ZRo73Sgww29ldo7ldCd9
+pH7u2RBllHQ/W84wlGOT+ZYGTmhNA==
=C4nZ
-----END PGP SIGNATURE-----

--Sig_/nAh23AS40sxVl0WInM8XSjh--

