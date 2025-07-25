Return-Path: <linux-next+bounces-7715-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4345FB115FE
	for <lists+linux-next@lfdr.de>; Fri, 25 Jul 2025 03:42:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 546621C87BF1
	for <lists+linux-next@lfdr.de>; Fri, 25 Jul 2025 01:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9DE31F473C;
	Fri, 25 Jul 2025 01:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="d7mvekEr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD4710FD;
	Fri, 25 Jul 2025 01:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753407768; cv=none; b=PpfWMA3gyhTttGz95Fh8IRITHOqRF9SbK5uko+VBxxQtSFG1PC+Qtg3jC1jwQHE9jM0WDKMwN+oMfF38XVuAZiGZhsxTTXo0wIKyK3B+YU/eVF3OGh713Q/ck+Ngkjsq6gih2A7vVDtxCgW3cbVKt5vZS6q1i3vGvu2G8mofYD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753407768; c=relaxed/simple;
	bh=18NllIxMihXIJ4niSuAA/fxerz8LjaSkgT8XPvDIDZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=B5KGxZusRtvA1P3CKhT4ldF0aX15E/4m7G9Ld7DUo48FneaDnQ+QhaOKRcNLwPh+DtNM0onLFw6aL2O4HdzhgyNIVYkhggx+gyK3aSCQZL6+gOPva9u5284SDlokvBkD3GTCfmu8dLi0TAjQTsG+aKtkGBMcQFao5nGBQzSM4dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=d7mvekEr; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753407584;
	bh=4nENx6PKo5cxbBQMQF0lSVmyaOia3w0uir+1UteemEo=;
	h=Date:From:To:Cc:Subject:From;
	b=d7mvekErQc9sIU93mQLsxN4+PR23ZTrp6vHrqX7NQBQjwIbMl/wHvfG22JZrmvU4K
	 u7UHt2kkerlWccV8ov4d0DzGcBofw1CMqKlA18e+sJmA1bb6qhd69C2n+gTk0ez42V
	 CqonCw5HAgf9R7wY7N6XUFaLMa/1ODs9iDc+179gmPCk4gglHN+JYQ8It/h6XI1OdR
	 rQh8FQ9qb890+s9bIRxZWtVZwA+ZXVxcuW1HcXGT0TX78Izvf6e0e/J7thAzakG8z4
	 FAvoCC581+L+QlKk/mAIawp36oOcHr2yhD0kHFeq6iUk3hXX0ta3Z26V8Mlesbnzs2
	 k/qvQnjWDC1zA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bp9Xc2lNzz4xcY;
	Fri, 25 Jul 2025 11:39:43 +1000 (AEST)
Date: Fri, 25 Jul 2025 11:42:42 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the tty tree
Message-ID: <20250725114242.6f7a01fe@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/H7Pl7UkUKGc6FCfB9CBO_HT";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/H7Pl7UkUKGc6FCfB9CBO_HT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm-nonmm-unstable tree as a different
commit (but the same patch):

  a8d455db2621 ("serial: 8250_dw: Fix typo "notifer"")

This is commit

  6e1663784e61 ("serial: 8250_dw: fix typo "notifer"")

in the mm-nonmm-unstable tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/H7Pl7UkUKGc6FCfB9CBO_HT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiC4RIACgkQAVBC80lX
0GzdCwf/Ubm3kX00utNbrUn+gmkvDAhmq2qkj2dglKw6uCD0Imrn5B3TDs4Dxy2X
vuJ7oBOp0WYBV/d+BPBlRztdE4g2Err0CCE3dGaFImN4xOk9KUcO4XjTdpD2lifo
cC4t5WwkMnfN4QMUnsuYkWb3bBLc/HMddy771S/nYjK/YmF8/595WNzpoTz5lov5
CGbLhf1Ba+bBr6PnLkkmzHjCUKgp2/lxOH8ktRK4jwH/aWv50sap8ScJWKZT8bNf
xGZ2UrcBOW7PaBNdKouCa3BBdbaIvyrkKJMLOZkuJKiDqsZJ87bel4N89KJOqTgv
m7yw6Y3KIKSoHbhKCbQyb8c1vZg6Fg==
=flaZ
-----END PGP SIGNATURE-----

--Sig_/H7Pl7UkUKGc6FCfB9CBO_HT--

