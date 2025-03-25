Return-Path: <linux-next+bounces-5993-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0099BA6E99B
	for <lists+linux-next@lfdr.de>; Tue, 25 Mar 2025 07:31:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A6417A45AF
	for <lists+linux-next@lfdr.de>; Tue, 25 Mar 2025 06:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5052418FDB2;
	Tue, 25 Mar 2025 06:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="FJjj4vYg"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35800A93D;
	Tue, 25 Mar 2025 06:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742884300; cv=none; b=fv3bC3IIDvnHjOBuWjzxZ5+Q+ZGOEMOyTfjlgxQ7gzmj0vuJmDnxO2oBlrRuZ3+Lgyptxg439Y8RDrfVWmopcJbKhWs1HYUEf6cI00wVbbKXAZ0tc6zPW+4XB9jBOKYUXjCucOuTpTVKnMnjN3gH7ux64l8THdGIigqSUQWX11Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742884300; c=relaxed/simple;
	bh=cttr1/KFZDIZutYQYTLl8Bw8DM/sNP/l3CLxorD2SbY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GxcipIFC6Hll0y6JpKzme2flN74uem2t2BnhK1BzziXcQilK/RE7S+KcORUUUzCBoeqevD7O+0ILOpMcrdC61qvY0xN2+tf9uIYXayc+/XgGd3jSfurbPPKUeSVWwPFyO1tGH0Bc8zyJF9nSNZbvIPrz3NgiWNfwHmL8LmFmeYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=FJjj4vYg; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742884295;
	bh=fUIMA4dvwZSFOqGnu7ejtgqBYd1Ah6uTmd6wu3IxIZo=;
	h=Date:From:To:Cc:Subject:From;
	b=FJjj4vYgDGIR4/7yfStLOHKLflTwv/lMW6/dryOgel152COr4bL3/AQ6UQNmQMIMV
	 UnPy9/Uy1Ai2NoRD29Vj91FPtkl9hAFlKps3QjHLbn0WsE12fWVQqZR2OjbU/PwHEz
	 JKCCMqkfB4RHf+lEUkehg4BSeo4G4AqCRPP+C7ljSlaT8bOqPM2UGTpgyUJTOSht9R
	 moCtZLZMiX5GTzBcYmOk4MdPVXGd+01goGxkRysbhx4tkFrDq6yHXvnuM7hb9jFxV4
	 I3JD0mXZ7yVqsfZHVTMvqbC2NQ3htzGtaWnMfS4K3C3hvbB3RHFeR09hvpG4DXtf8I
	 xtqR3IPhGPLIw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZMKnf2xjxz4x2c;
	Tue, 25 Mar 2025 17:31:34 +1100 (AEDT)
Date: Tue, 25 Mar 2025 17:31:33 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, David Miller <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the tty tree
Message-ID: <20250325173133.7dd68fb1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Pyg32kY157P7ZscQ4i_Ieu5";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Pyg32kY157P7ZscQ4i_Ieu5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the net-next tree as a different commit
(but the same patch):

  3c3cede051cd ("tty: caif: removed unused function debugfs_tx()")

This is commit

  29abdf662597 ("tty: caif: removed unused function debugfs_tx()")

in the net-next tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Pyg32kY157P7ZscQ4i_Ieu5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfiTcUACgkQAVBC80lX
0GwTtAf9HoR8cOVbJLcyJpMyXjF0TvprmAfyewhMGDdV6hqID612RSmawieuryqp
ZwgVC/xr7CNBTShgE7GPT2czgKMpyv3K7sNf3eZbs6fG0yVEBiBljPTnwRk70v5u
r6T58gDvP/jBSy0pvKV2oqGQzV3L+u1iMjB6ENxt8PGFfUhYUhglzEaBg3Cbl6rN
7D0PMemwpXLYySDqKb+q2dGqUkDTAc/2O+Yt6+uhXBWRYIb8FI+ZbUiVewNsobw1
6BoT4YGISL8eDNK5qfv44xnaI/DQ7HryW0MQ9Ee1YRCHETtQ6Ar25JA45wgOPqh5
aHW4jbaJ7olQ8ssXHrKrtpYsUNskeQ==
=9dZv
-----END PGP SIGNATURE-----

--Sig_/Pyg32kY157P7ZscQ4i_Ieu5--

