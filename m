Return-Path: <linux-next+bounces-4025-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE62E98B2C1
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 05:39:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 658CD1F237B9
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 03:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C13461A304F;
	Tue,  1 Oct 2024 03:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mHJsaKGd"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED97615688E;
	Tue,  1 Oct 2024 03:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727753967; cv=none; b=VBxYUBw0MtUvCQenvkfTOc64bRsfZ6fTeYwZXe6VCtdnIzJkfJYvAxjb1ALY7TWhPkt9mWbG3+8r5XEcWLJuVqbTQbnnYJiffceImTIdct77oBkhFckMeoVX+M1LIghbLNSnIaiW4yxxlRcUB5uN81fSFvI/PS2pfgqxtCnRdOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727753967; c=relaxed/simple;
	bh=dpGB6MqtxqP5dWabvrvhIo4fZoTeglA4BD4WSxeblQY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OAXAdF2WtBRbfI1uLh4sRHcmNcEcfov9LBMMec0wzRUSeGQQ+Q2FwY3Ref9emkPD14pa9Gi7lroS8ppDaaRZkDnbpK8g0oc+wuDUfZ7+/X9eozXe7hQz2PYsXSQYhdDnIKqJWBeTRR/GrnIKwRUBjNui+sXNB0GEQF5opcHPH30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=mHJsaKGd; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727753962;
	bh=W9IP0JvJ4iWy7hAqr5fcioGo2LxVnpkZfHqORUSMNS0=;
	h=Date:From:To:Cc:Subject:From;
	b=mHJsaKGdyBjO7eqryrCxppMvad7Z19+nRhBl9A7OC8LRXtdwenYYaAaQRSJO7usro
	 NFH9AsmHeVTF5/ac/nLMeNBHGFGdWRTHhBeujM4sSp8J2Ut+fdRDj7yaDiUhO7IH06
	 qTvne6ArI0hjjc9oIibj1YzkPNYaYYlqFNNDfsyn0XyRcL5I36qu/6+b4xqlBGyZmp
	 zygyS7jFBdjlvjoMW5IpEeOODVQvquVoLeViGDdq4/Ii6gjD8U9aSS42hnfFMI0fyb
	 2Dyyrmcb7WP4LSyX1MgwP94m+W2xJVJxGARPwkEZuShoMwnQItru/vU+Cvv2JwNgof
	 ggN+GE83HCRgA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XHkFj6RCPz4wb5;
	Tue,  1 Oct 2024 13:39:21 +1000 (AEST)
Date: Tue, 1 Oct 2024 13:39:20 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: David Howells <dhowells@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the vfs-brauner tree
Message-ID: <20241001133920.6e28637b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IX_zpA2cUniAeXeC0VWTqQa";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/IX_zpA2cUniAeXeC0VWTqQa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/core-api/folio_queue.rst: WARNING: document isn't included in=
 any toctree

Introduced by commit

  28e8c5c095ec ("netfs: Add folio_queue API documentation")

--=20
Cheers,
Stephen Rothwell

--Sig_/IX_zpA2cUniAeXeC0VWTqQa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb7bukACgkQAVBC80lX
0Gx1iAf/f0/4mObOk/oS/zoT8c2/KvqzFa61MsSTWihHsS0oT/u928f75ZL+zF1j
rv2zfX5odM+PU7KnMrVCh+8BDH4Syx0KzsJvPC+reJ9Fr0ThNQs9ZCVW1kEnLkkB
02fLqzRr//WMOdvtlnu+L15EUUMbgXBlPrZg2H8s4DgALzvS3vvuwzkbaPB+f/Po
iP39ZbvLijZv/1ogIRWOblXc9mO8a9BRUkuUDn1ygupiab5S8rvBoPknAJyOLUI1
qnwydP7YUerMb1gkVRRuPrSm/fs97edZLqC6fMZNpLrGM21u2PwsipvaYi8tsP9N
5a8MuVCvvA8xfgzxMO+YpGerBW6Hfw==
=cdON
-----END PGP SIGNATURE-----

--Sig_/IX_zpA2cUniAeXeC0VWTqQa--

