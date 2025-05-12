Return-Path: <linux-next+bounces-6690-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C7FAB323F
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 10:52:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E30B91893217
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 08:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F803248F69;
	Mon, 12 May 2025 08:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="JdOz2/nl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19101804A;
	Mon, 12 May 2025 08:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747039943; cv=none; b=TSVSQg8CQ6fiQ7riLnW5mRhn/Q/0aziCDzfM5Ftq4Zbi/UZfP9+hzfB7dhX7+lWCCc+V6P1usPfJcxoCFymS/Vz44WpuDBTh9MfWcnhUix3Qh7OiDAYy92PV2XPTiW0MEybT56N69ROOFONTkUeKAWMPsvo0OncnQ4wCrG60b30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747039943; c=relaxed/simple;
	bh=flxYH9zy0LLaoE4xUPifvkPrQO/W+1P2QmcwMHKlDzc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cHddsOwlp0MTXNLEMU0PI1aS83YzLbYvHhWNi/i0Fbi2P1tVmTSMK5T9Z61vio+wIRG+XEHNgqUIgEX+Wa/oNsut5DA2Idly8Zvg9VBnEEzXGM2Gbj1rANX7JWGF5XbJakp95SrtN0n48Au+hgGj3JQtAC2Wued6B06jzvRej8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=JdOz2/nl; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747039939;
	bh=WGNS5ygxJGI2aa+XFjJKAzX7XEJfsx0a9C4Z02RSkso=;
	h=Date:From:To:Cc:Subject:From;
	b=JdOz2/nlVz5THY4grvThiDRISV8fBmL8rfLczQ2kkMYsCHV6nqf4Try/Hv+57iyeu
	 WJKujoo6BNveMp+CUr0Vc412yEym/eA2x7aVbxXvwHuiMl0bdl34PM3Fif6b53mSc/
	 XVWFmrM018vL0NDzEOzapwckqtoKBMJmju0auos/6G0LoxlZ8eTWLdxjsrSuTYniWa
	 k/Bc/vm4M0OLqUEGsJCJ5u3xKKFiOLhjqgUKxRhxZt+VpXpNstEhBFrvk6QwDW4E5j
	 anRVV7nLW48xc0/WGhqjxnxrDg/qJ9CJ87jxeRLWp6uAe0HrHIlahiQ++NJHEQn+YX
	 rYsCFE5Han8Hw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zwtdt6Bzhz4wbZ;
	Mon, 12 May 2025 18:52:18 +1000 (AEST)
Date: Mon, 12 May 2025 18:52:18 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the tip tree
Message-ID: <20250512185218.6bfd18b4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OFhb5hq.FIcCQtLQOs8BNy+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/OFhb5hq.FIcCQtLQOs8BNy+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (htmldocs) produced
this warning:

WARNING: kernel/futex/futex.h:207 struct member 'drop_hb_ref' not described=
 in 'futex_q'

Introduced by commit

  b04b8f3032aa ("futex: Introduce futex_q_lockptr_lock()")

--=20
Cheers,
Stephen Rothwell

--Sig_/OFhb5hq.FIcCQtLQOs8BNy+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmghtsIACgkQAVBC80lX
0GzIFQgAi8X+er2tlhz0diT+wGzdkVyRbSgKIvkO69WHwL9fguHoiAKO74TdI8Z3
jcC4f2zpluSMKd6xliyR7qGJ/G2IQic1F0h1SCnYoYeKwFhFqI2nn2MaTJWEpQlD
Z9K9VUGESasVkGvpDBShCa6UfBdXrmUc7VoeTNzMtHFSgJ0GoO7M2bui76V78Dq1
drNFyc6xDRjaYfZDeilW37GXPEYOMKUWkgXylWjYPNuvwvfpdV2OiqLumct9aPHS
Ctg5a/27I0L3EBv9UfIKhLmADU8HOSoqEw8rxR1dIfAlQK61Ym/FQ4LJNHSeLeoQ
/X3BVBO2pV7+yciAEGCWA+z7hA7OkQ==
=F0uw
-----END PGP SIGNATURE-----

--Sig_/OFhb5hq.FIcCQtLQOs8BNy+--

