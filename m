Return-Path: <linux-next+bounces-5942-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EAFA6D3C1
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 06:41:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBD1616C47D
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 05:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FD632D052;
	Mon, 24 Mar 2025 05:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="K0UcNrx7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BA12E3392;
	Mon, 24 Mar 2025 05:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742794881; cv=none; b=pPS45e9cP6jXDCHsEqeFCOSq1BEfQH/qO27j0MPXuqdNWlVon9qCGi2Bm+0sCLqayNkJ1pQFsqP2AE24cnfOVIi0fOCf56zGRuEh0pxAJ+R4lEH65eP6ztw6k2PT2SR/uZXR5xEvIhdMNriqWNEO7bnaYOqyXvUdQMvBANYtbb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742794881; c=relaxed/simple;
	bh=b984k2OgR/8IM2gmxVu07aUMQ8qc79G6SBXx14h0Sqo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RWa+cKevNPtjgOigiaTTgbOcwcPPjSwjbF2oNB2sPGKiNU17uHAi1TcOYTBgEqkbosDttlMexEJpQDGmWpFSBpXIyHdwoPsSLVjx/iJWLZzOpUqJuEqAvZz7Ij1xf4EMaVxcnO34qnhznTPhG5HJifXtVZSt3I1LPLCMwKUjsuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=K0UcNrx7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742794872;
	bh=rfUALjdQJ1/td1s2AxGvECCWq2bHv8pIquJ3lUwqmUs=;
	h=Date:From:To:Cc:Subject:From;
	b=K0UcNrx7bLB14MTOZcJtFdtcD+ZNCABUpsmxwf15ErbOdih46/r8BzgW7c/4d0X8i
	 CuI6iajJqINp84NE9iCxKaoSFOKcNsdvOTEZDKXlIYwjwleLYOsx2lZdmt5f8jwAb/
	 BdClFnrqXnKrg1PBDODWmQcSb+iTtK6osz5yDuUPeWvOaeQfbCI3CA4aH/FGH6yTCw
	 sy1dF6/QQ77i6KpKKUqF1yROWfqmpl0wyuQKXv8sSseq9EcYzer47BWUi5+wZOSzvW
	 vJdLBEi9clhRakQV5WLyyuc69Qd9pxvc9h7lrN4zyKLthis44BsDKu8kXZPjC2sZkq
	 OOxgro2KZxNNA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZLhk05Gcgz4x8X;
	Mon, 24 Mar 2025 16:41:12 +1100 (AEDT)
Date: Mon, 24 Mar 2025 16:41:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Uday Shankar
 <ushankar@purestorage.com>
Subject: linux-next: manual merge of the ftrace tree with the kbuild tree
Message-ID: <20250324164111.20c92791@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/U8jX5QCO.0mG9Hap++FRQdH";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/U8jX5QCO.0mG9Hap++FRQdH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ftrace tree got a conflict in:

  scripts/tracing/draw_functrace.py

between commit:

  9d702bb1d3c0 ("scripts: make python shebangs specific about desired versi=
on")

from the kbuild tree and commit:

  a926d15a799a ("scripts/tracing: Remove scripts/tracing/draw_functrace.py")

from the ftrace tree.

I fixed it up (I just removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/U8jX5QCO.0mG9Hap++FRQdH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfg8HcACgkQAVBC80lX
0GzfCQgAmqUERGDJXbX9jfbOtIeY21yRb+glHLdbVedfZGMHaE5NchDD+fYbPpCo
oAqtvXHOgxBEVXRbPUxrpztovGkywBqp9BvTpqZdRch1FahSNP2B/RQDjzfJanEt
yfa5V6PSUWbmvAFwjcInzugisAfJCtBCgN9rwwKdJx36dNBQT8jrt0PcZPzu3lG7
qoVskSXowC6s1OEMDH5lCt6MD3QLZreDmFn8zQ8zBvzrsYCUL2uugmvcqoX2J8Jf
X/MeOPw6zNeaTF7xDIw57t8qaoeiJXypAkZuwyj5/9EUcu9dJVr/UiJEu/Ouxc8a
NZnWQi4HFyP2mIQe4IKsJGdYqNHLZQ==
=Tv+Z
-----END PGP SIGNATURE-----

--Sig_/U8jX5QCO.0mG9Hap++FRQdH--

