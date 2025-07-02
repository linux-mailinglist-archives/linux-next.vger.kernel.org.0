Return-Path: <linux-next+bounces-7312-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3864CAF659E
	for <lists+linux-next@lfdr.de>; Thu,  3 Jul 2025 00:49:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07EAB7A52DD
	for <lists+linux-next@lfdr.de>; Wed,  2 Jul 2025 22:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9678244661;
	Wed,  2 Jul 2025 22:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rxDPe0ai"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF06BA2E;
	Wed,  2 Jul 2025 22:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751496548; cv=none; b=DMIC2L8w7AcM1h9o1KUu7nnGSl31d9fvA4UfXLa+vLlRxrv575XhdBy1ayOr9ET9mZrRjBeJx6NnBACEfCMfhVG4fUhcTHAXR1TZfHq4xIoCEKtQStTegN+ztLKRP+srWFtkeD6GLPMvarF78HE9Duo+zIIRonejSK9KXOZMOFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751496548; c=relaxed/simple;
	bh=7sfsTdx+tUPNIiil3RGMB/r2QOyuXxj5Gn4QvPuVR+8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PFLnG+xDEBGm80qSTxZT3AIbBey3AgehbNMRD2BXNp5INKO+tXH6ZZgMEuJu20g2jCb0UtXjA/9j2Msbp1ybORtP17Ow0/O0wDR8kaRhGrqxEPLEJhY3tZlA7w3HPuxzARQYAi9cQ1UTIZ3Vi6Zu64c2pMkgpkx8u114fG6yl58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=rxDPe0ai; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751496523;
	bh=PFNQR8oxtz8YDNknHkqQwZkQ8U1AxZzWZP68KGjo1nk=;
	h=Date:From:To:Cc:Subject:From;
	b=rxDPe0aijAdmo7KI6Vwhkfie2/PrI0JQsDhHx1H0qELJboGFgg5MtfPyku8YumuC8
	 SZfNHbGrDLLOStbOKxK43AiyvpAJslrLKyw+uClnJois42NFi9LswVNSppoNxt3w0l
	 Q3rRR4BuElJvbqbdaOUiXGf8rivC/zusYehRpRw1ciPye0hB/9UYNNeX0GODGOnNr7
	 +uK3yMXBfX0aWhsQ6Dcn0LMmD/poNc94AhcpJwIBVz9AiXYVAd6TyCOnVlSu8U3rN3
	 wsUsk39YzmZ/2pxfDjRJDmhrn4rVzyDjiAEKJV7Nde1S3p0WMWd2RZb/IhbbVkiELH
	 mst5f9NZwtu/w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bXZnQ6lgDz4wxJ;
	Thu,  3 Jul 2025 08:48:42 +1000 (AEST)
Date: Thu, 3 Jul 2025 08:49:01 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the tip tree
Message-ID: <20250703084901.7db6e8c7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vzuV2AOnJieYBT.ulbGtpgP";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vzuV2AOnJieYBT.ulbGtpgP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  9dd69f29433d ("bugs/s390: Pass in 'cond_str' to __EMIT_BUG()")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/vzuV2AOnJieYBT.ulbGtpgP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhlt10ACgkQAVBC80lX
0GyDmQf/YyqqUeTLaDAgTMjlFKUfWEVR16q5MsKO/hAISKPCPXqXz3hGmSCOqURm
MJcg+p5wwHe/4ukG5UF302pdX96kcBxil40vpezsYZ3Rowq+pG2qeUCMG/vOOqhW
sXPZfScFyeqzjeuGV/cMnwtJd6YcEc+v8FTMhRxihNFz8+6mP58NDNAYI0LdoH+W
R0hEqAeTreKXUKvYdllSMmQrKU0XX/knOwvmxo2KDOx+9HbFT7DSGoDIT3Au1nOX
08970n5YONJi4m1btPWFKKsUoxYjKpmvttK03+ddrn3lJj0pheWStWwCrCsTAh6a
W+QIhG/6gqidcRLHC59nNuDBXjokWg==
=z+To
-----END PGP SIGNATURE-----

--Sig_/vzuV2AOnJieYBT.ulbGtpgP--

