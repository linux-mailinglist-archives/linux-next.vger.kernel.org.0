Return-Path: <linux-next+bounces-3657-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E776C970A29
	for <lists+linux-next@lfdr.de>; Sun,  8 Sep 2024 23:40:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A059D2820C6
	for <lists+linux-next@lfdr.de>; Sun,  8 Sep 2024 21:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 956191741D9;
	Sun,  8 Sep 2024 21:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="AWoME4iQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EA83DBB6;
	Sun,  8 Sep 2024 21:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725831623; cv=none; b=OhN9iFQsqhjs7NgwmkrdaI8D/IfB+U6kf0LB6P+MNiYwLmTuuO6q/XvL3YRirtYLYzBj0i4r9n8lo5WTBvcj0EQaRLtxat0RrhW2Q+iuFBOoUfJu49tOWYLD7z0f9guIGzFNACcnQbRObR4Tb2bvc6lH0K0ZyNB/k8PWgg03GKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725831623; c=relaxed/simple;
	bh=PGLv39SIyl2f8rgfrG1x+oME5AG3MTjBjEsrSHy671I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rXli0/W9NWGV01u2KDryi/3ymGXZuB9ZS2lH1fExvYqwgZbFfOl7k4zv8PJzZBKxjQJuuTHNVLIiAnd7jsRp3t2n5fMK31lnCW6gNqvdR++u5Z1lb72aRE4SJ2zRiX2YwwCCxjj+0B5u0jDwNw73zUbRglvxTOLD6RZA/aFmMk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=AWoME4iQ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725831612;
	bh=Hji5qUoejM6AiVSuECw5zO1EE55EAze5Yz+Kjm17pOg=;
	h=Date:From:To:Cc:Subject:From;
	b=AWoME4iQMh+UjlklqYgdMdjIwfikbDkMPvCjxv5bWYge4GTqcHAd+XdUlla2ULT2f
	 jbq/2S0eD7nUNYM2dv8/MAlbJ6ycXWZqW+srPdOPBWDGLy8S8gTDWOhcJzvoYmmZw2
	 dmmkOcxuZ051TKCbgaEd9AwG0aKss79mL/bcA6+pflz4to2ZjqbtRYTBI1WFTRrsw4
	 PHGLtuCmag7np3yKpPCgn/LFAGaVPmMi60eKxNHYs5pY/pCpB3STaMuZ43JJCkz48J
	 XZhZvq93MreLhHNFCkjfceq4s7EKg7G+Wy7rZrVGJMOWUUDfreoJ+dcBN6P6zpMCfM
	 sle3dQ8++mq2A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X23KS16vtz4wbp;
	Mon,  9 Sep 2024 07:40:11 +1000 (AEST)
Date: Mon, 9 Sep 2024 07:39:44 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the bcachefs tree
Message-ID: <20240909073944.32e242dd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EXQRo=DNIKuN.rH7o8p7z_W";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/EXQRo=DNIKuN.rH7o8p7z_W
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  86af9d1245be ("bcachefs: improve "no device to read from" message")

is missing a Signed-off-by from its author and committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/EXQRo=DNIKuN.rH7o8p7z_W
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbeGaAACgkQAVBC80lX
0GzyuAf9FN5q+1y/TJQWiE0LmSYghhRp/l/7lUYUmyfdMgyyGhpHS5lmOZpN90ee
CI03eEdjZBQXX/QEwAoWEVfyfJHWbmhKNR3puQw3+t2u2LP39Oefw30kr6vFKK7d
JkNK/HSEbMKzPSRsTEmPWz6447UUoxpk/+w6mjYmMqxTqMn/fe7VW2u5y+fAOooB
GGA9xcOYqyGN/cTz9wtI4dU0o0IEvHBvqn8ltWZcCN3hzKasySEDIeT/76OJZoCH
qMIXUJa3tRiL0ltGHd/MD5l3oMVfd/FPgHa2BYq6YbSc0b+Ci8+LoIBwsxaJe1hg
Sw6AI0aouamo4EMgqVAdyuDsVTofOg==
=ldG6
-----END PGP SIGNATURE-----

--Sig_/EXQRo=DNIKuN.rH7o8p7z_W--

