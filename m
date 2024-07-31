Return-Path: <linux-next+bounces-3174-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC8D943894
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 00:06:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC7431F21532
	for <lists+linux-next@lfdr.de>; Wed, 31 Jul 2024 22:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5C8916C875;
	Wed, 31 Jul 2024 22:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HtSpoymF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EB3160860;
	Wed, 31 Jul 2024 22:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722463559; cv=none; b=AveYAEOKvnAR2CwxurlC0+1ZsGnP7h4+j94etUxac27pDPqS8r/ynayX19OfpLLOvOx15my3wZmbVOTO4FLtE26K3+FjzVbW9EWTe2efQeLxsdoxHmchNllozIDH0BP38sav/OlKlxQaZEHd0Mng+4QWNzuEXs6jOCHtvZD+bDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722463559; c=relaxed/simple;
	bh=AxUC1XBNg8UXVpQWib+TWN9QyXDtktFY04EXdDehLPM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=skEJtuiK6uYkwbCzNvXaAeHnYXUUaCb8kjJFVlXrkx02BrpVLeJSzHwspx9maf1uXtC4aZLdVa9LPbgZJeg2iB9yMiozbyJg9IgRbHUUJYVxvER8PslIWBoDHoz7cjce4JWZhCFnwlsLEXKfVRHCDFXSxebNqeF7TZpL3fR0SnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HtSpoymF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722463555;
	bh=jrOlqhZluOehL23q8ZHUZiIkCRgOco9y3L6Z0N1WKCE=;
	h=Date:From:To:Cc:Subject:From;
	b=HtSpoymFNhTee3Y5zelQC8e9IEZXVr7RU1JfMLOWhgLsNUE/Fuz+Tg6UaEtg+d9cJ
	 TqbkBsAxhfTFhY/mpZ047jPjZkwpu6slXzUBoj+7zpPqIodahB5RRMH/Npne6gES/Z
	 ET9b/wblOo92rgnLe0hsfCJsmP7yMv/yyiIJG6z+uX/qeYTvmvApSIBxUYN9y+amTe
	 KIl4VpiEgF6LiL1yqMx18R6Me19EpqwjhfoQGrmUGb+N70OG9LgNGQWS87UeRK6Nih
	 MajTS3lLmvXf9TN69ORZzxRitqD4K3JsbgYe+0vSncgX/TYjxQ0zk46XK0N95yrfvu
	 DPeruOnQQ6FvA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WZ5l74wz8z4wc1;
	Thu,  1 Aug 2024 08:05:55 +1000 (AEST)
Date: Thu, 1 Aug 2024 08:05:54 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the vfs-brauner
 tree
Message-ID: <20240801080554.6b9bffb5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FP4Knip0dpa71H0bCSkm+4d";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/FP4Knip0dpa71H0bCSkm+4d
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  9861c8945bc7 ("qnx6: Convert directory handling to use kmap_local")
  2d6834a509de ("ufs: Convert ufs_check_page() to ufs_check_folio()")

are missing a Signed-off-by from their author and committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/FP4Knip0dpa71H0bCSkm+4d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaqtUIACgkQAVBC80lX
0GyMYQf/TsKQlW2LvL43iLlsJT8tDzgpouEjxozJrhW9FOoygwcY8h551mUzyU9c
SFQBTet3Wa1GLzqZLV56noLod1gMcaqhkdGqq2myWHEhTBzN+a5jREbML9EaYYBe
ZtJLj1/pKjPPmkBEZPctwXxKuXfQMtfmzll/WfM2e2ztvEO4KqrkxASdf+l0zGQA
aQo3J8sMpqwV4+isDPqQ2dmqvE+BN1VxuuPTo+1ZnLTMcZHq2Wsn4Bf5zwdLel/E
OoRpIs97MqX/CsTJJB9ZbhUTE9EKzyaKkqJwESQMAysoDR03UfrkMYcY48VV9R4v
epa82QSWy+zPQ9zMBY/JmvaAEbXPKw==
=RXe/
-----END PGP SIGNATURE-----

--Sig_/FP4Knip0dpa71H0bCSkm+4d--

