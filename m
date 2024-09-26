Return-Path: <linux-next+bounces-3970-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E94986A2F
	for <lists+linux-next@lfdr.de>; Thu, 26 Sep 2024 02:04:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21F7F1C2205A
	for <lists+linux-next@lfdr.de>; Thu, 26 Sep 2024 00:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F1C01C2BD;
	Thu, 26 Sep 2024 00:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sB8Zyrlu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25BE4A32;
	Thu, 26 Sep 2024 00:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727309084; cv=none; b=rKTltNM8FKPprJybovVMxSvAZzdVjvw4+f2FE5O3VgFnbqq7onzEmRPRCBsywjIEUqo5RWkwTWhJn0qnMjL0r8+m3pbKf/xPh5yn2DHWtINXwyn1lZK/jzujglt+1t/JWQ88dhap8xSULMwFk20zK060HfjvhFJ+3Xo/sD0/klg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727309084; c=relaxed/simple;
	bh=Q61Mc3VUJ+nRDdimOoNFvkPPt6mirzH+wjq52Yo2Kp4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mAP7Bj8ZNX1SYHhF1C767t7DQRDzbMYFuV8DGhJX+couyZGp0tzN061MPjr+aJXQGU48IRFKEB4+6UdxpHmQD96gcI/buQI0r2AzUwBxm/AAB1aCXYw2jfaMlc/0ENt31OX/bDWR85Ad1dj64GyuZlbSrTJLnYjJhQfphX7dnQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=sB8Zyrlu; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727309076;
	bh=j1blJdQPrnPCNctC7QByZ7P8G+dZVI28UP5o72SSqT4=;
	h=Date:From:To:Cc:Subject:From;
	b=sB8Zyrlu9UZjj610CM59rnpGu3aMZFU3+uOdkWbTPuG5dQe2h6T5vBiYPtZRwrgYx
	 WCAVyshLMIwD4OKWnAcPl0fgbqJH7ZKycg4T25roW7cno4v9LSawKwLjHL+Q82vOuO
	 l1KBlM5xANJe3Wt/Qyz+9Y5jPtwfzAoo3dOZPdHKKndYfrhDdW97uj6M1E+06Y0SJ6
	 380vIT+fqeuIf1ZTEcusMtgwEQBHdotkY8ZK4THNjSKsjF2M5OSHwH8suvqETIVSX4
	 FAOjCDWViobcHiYTwNeLJhSQXgQNcK5Z0K3VnaKWNJPiA+Z1IDNnFTdX5HHfFWB5sZ
	 yuenzlHBauCKw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XDYkC40f3z4xNx;
	Thu, 26 Sep 2024 10:04:35 +1000 (AEST)
Date: Thu, 26 Sep 2024 10:04:34 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alice Ryhl <aliceryhl@google.com>,
 Sami Tolvanen <samitolvanen@google.com>, Gatlin Newhouse
 <gatlin.newhouse@gmail.com>, Kees Cook <kees@kernel.org>, "Peter Zijlstra
 (Intel)" <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Andrey
 Konovalov <andreyknvl@gmail.com>, Marco Elver <elver@google.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of Linus' tree
Message-ID: <20240926100434.45d58861@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wANEv3YAoDiVFAl6pjs/tH1";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/wANEv3YAoDiVFAl6pjs/tH1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging Linus' tree, today's linux-next build (x86_64
allmodconfig) failed (very quickly) like this:

error: unknown unstable option: `patchable-function-entry`

Presumably exposed by commit

  1f9c4a996756 ("Kbuild: make MODVERSIONS support depend on not being a com=
pile test build")

Which allowed the rust parts of the build to happen in my x86_64
allmodconfig build.

This is a cross build on a PowerPC LE host.

$ rustc --version
rustc 1.80.1
$ x86_64-linux-gnu-gcc --version
x86_64-linux-gnu-gcc (Debian 14.2.0-1) 14.2.0

I have reverted these commits for today:

  a2f115470520 ("kasan: rust: Add KASAN smoke test via UAF")
  e3117404b411 ("kbuild: rust: Enable KASAN support")
  f64e2f3a66e3 ("rust: kasan: Rust does not support KHWASAN")
  c42297438aee ("kbuild: rust: Define probing macros for rustc")
  cc1d98f9fe30 ("kasan: simplify and clarify Makefile")
  ca627e636551 ("rust: cfi: add support for CFI_CLANG with Rust")

Basically for the latter one (as a guess).

And the build works.

--=20
Cheers,
Stephen Rothwell

--Sig_/wANEv3YAoDiVFAl6pjs/tH1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb0pRIACgkQAVBC80lX
0Gw/QAf/UUa74b3h4LdmwUdqWoi5urJVUt9qsu/dyY35z8CZUSsZ9NPnbGz238On
VmnV+Qzn7xAg5RT3jJ4IgseR1EYR6B1mWKh440QwQ3mOU2AT7gMxefNv+oNi3Ta9
gkksyRVmiqXJvnKmu78wYV8AhM10lDgDPv9nsV5y94yHlgP0BIS/GvIpDnxkXrXs
RliKH+KbNxP02+GpPQGmidVj4C4UbeOjmQqoVuuxgQWpB2BNbDujiutMlX7cOKnw
u2Lb48kUSUD4ZjHGu9hn2FIO3/LXjF0sRKMaY84+6bYa4bNhe4CKI9IhRQwypZ5y
7NUGQzRAs0TpFhg7UTXsH5VgcQgPPw==
=p3KM
-----END PGP SIGNATURE-----

--Sig_/wANEv3YAoDiVFAl6pjs/tH1--

