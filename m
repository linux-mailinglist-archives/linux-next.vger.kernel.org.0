Return-Path: <linux-next+bounces-8671-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8106CBF9089
	for <lists+linux-next@lfdr.de>; Wed, 22 Oct 2025 00:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 66DE74E65D6
	for <lists+linux-next@lfdr.de>; Tue, 21 Oct 2025 22:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A441329ACD7;
	Tue, 21 Oct 2025 22:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="V+Oya4O7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD64226980F;
	Tue, 21 Oct 2025 22:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761085186; cv=none; b=aSp5bZNgxE6XfvSCb3F0aWHpraUnXY/nHCgtI2TGoOJugPZgyvFOxi/z89KOZqR6c/Peyxk/HAwgzlI52QXX24dYM+rJ9ZQT4Zi1sB82eqWlx15PCcxpGXxCb6hn4SZyZ7ANJns5N6hRvLsIFIsBqcEL2rRD/wVfi+CRYXwCRBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761085186; c=relaxed/simple;
	bh=8fMjFWquV2dgaLIou3m2hj+hwxrxCHRPd8woCIK2DSk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UgV/Jq/2q5qMrBEv+jGStjLzuUyZa1/K28wgZB21lBPKvbQN14482wzbTpOw28k3dJXiNW23iCp8z8fmIHfF+eXQkqdJknBbBhZ6Y4bQlBrcr4puKpUe34xI/GxHmzKXqEKO6tp1jrkPKVJ6tggDRmsfCkW1St829ZwWmybofck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=V+Oya4O7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761085173;
	bh=URgOCCsjPm64zg3kWEpgRQ33FAkB/Nwdd46fhQkDsaY=;
	h=Date:From:To:Cc:Subject:From;
	b=V+Oya4O7IzQd2LRDpsLVwOJj7tJ283ez4hx5FGE1pNLnNdSzv783IP14SkZNOiRcw
	 NavatuSL4GkmpfW6850Uolg0buijwrKEgvowW+GzASXXTuJVRiL9vjDdRVPqKfnvKQ
	 k2EIVYq2M8beiCvyETRJeT/wbtpjBUfw9G4X4DkZRtdoNzXV42hIVuw/hvDz+qKITJ
	 jbR9Z+aCGeLMCAMm9AR3Nn2a8QnngunjSFP+PA9i06YbWnZHeHYrr4H1jeP9fedPso
	 dnv9Ep+x8IC+7M83tO8bK7Zh4/IrOJdeZ5lNhdMEMZnzLXjM5JBJE5ewUdUOWbV9Dp
	 sn2lBL5HLpTKg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4crmtY2LNQz4w9Z;
	Wed, 22 Oct 2025 09:19:32 +1100 (AEDT)
Date: Wed, 22 Oct 2025 09:19:31 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnd Bergmann <arnd@arndb.de>, ARM
 <linux-arm-kernel@lists.infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the arm-soc tree
Message-ID: <20251022091931.2127df3c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+JnvjY3+y.0Kt.UwUYl5vfK";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+JnvjY3+y.0Kt.UwUYl5vfK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc-fixes tree as a different
commit (but the same patch):

  3573844359bb ("soc: officially expand maintainership team")

This is commit

  691cde81bc8f ("soc: officially expand maintainership team")

in the arm-soc-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/+JnvjY3+y.0Kt.UwUYl5vfK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj4BvMACgkQAVBC80lX
0GzalAf/fVLE5XTefYwONb7X+YmRChqLyh6z5nti18E6BKRkQJ3Y8hRKPn923uA9
C6cumfcu7yX26ixGbYricN4epU2UttENvWSWQnw1XFRJEkMyjGj3XTb6PyH2uxeD
/hPzDOBUUy+NacZOe9OIVnip6aJ5w7z17c3wndZ6bWM5OHu/ATWC0qM+cPPAO1Xd
xJmzBI24SndVUB+Fswr598IMzEtJPLqg2YMElyW9MBzNu/YxJ+HHc7ViCtKNp+zi
E/1p6C13hfqsuIKnPhMfPW28KFlxmoAIELn/FvNzXUlZ+bga0P/k5EDSUisMxnm5
Ja2KuyED6nNiTShFgC5LN/KMVfUabw==
=xotM
-----END PGP SIGNATURE-----

--Sig_/+JnvjY3+y.0Kt.UwUYl5vfK--

