Return-Path: <linux-next+bounces-6669-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF57AB2BA0
	for <lists+linux-next@lfdr.de>; Sun, 11 May 2025 23:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07B29175125
	for <lists+linux-next@lfdr.de>; Sun, 11 May 2025 21:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6397518FDBE;
	Sun, 11 May 2025 21:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WMyIvn9+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F2918DF86;
	Sun, 11 May 2025 21:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746999425; cv=none; b=VPzngw7dplWy204LVJCbxZK7cJleaylNEqAlxdeZ33zAsYzi+Pow6ryfBMtStMczrLv+Ni8wjHB4CisrnFLmHtIbcIUjH3uQ1qDHyBy7pIr3MT3F9hOQgxHTBMxDMtVNSS0gCBA4mhot32kHXUicDPqZYuEl1Q/XteWh7wHQhZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746999425; c=relaxed/simple;
	bh=XY6puTleRTE0vPWEmfeBYwtSeAC25PgWRVGfxhB+/yM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=K/K12z47ycJWZqMgNU7/KluHWe04garoU5bUMo7T74oI+M2XJ29lLm6K+9fiTO0PaxjjEB7Dm6oH6ZEwDvs5ZESOic/oCVXM2hsHsQsD0FfDUqm+ipCb5HVi2g7h3ep3z/PF+Yd2fs/jgYX7SQScoWF9F55BBCMkEcz3JNACBbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WMyIvn9+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746999408;
	bh=I1u8WKK64vMjb/v0HIg2K0hDeLDdc1Vsfqr9bQbBzZI=;
	h=Date:From:To:Cc:Subject:From;
	b=WMyIvn9+FZW8wZFWuVOcGqSaQITCKPAbQ1GUYbXvMY56d8VjnxEqJzzlMUsuiHT0/
	 pCEzBcnVD3CXN988Tu3XSGYQAUVrXvP33/62VLwHBFejsuoQspB8pZy1yW4P/knZRH
	 XMWGc9RaCj0HiOSKwWf/wJFiZiZ2fh+MV7oscZw2dUqRbUSmub8/A95kLtO8uKp/Wu
	 G4VneQlcfCHo5SAbF3JMCRlG05yrTfDhCSsxmhRYNaEGmmVphcJIyjbhFGgInc69Gg
	 99PUzOHcaSEDaaRzmU7deZPE9SvtWaf4hQxzSqYsDaVH+z/x6UDvyfbetp+oTiTkAo
	 8W5nAtrgFytrw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZwbfQ25lKz4wcd;
	Mon, 12 May 2025 07:36:46 +1000 (AEST)
Date: Mon, 12 May 2025 07:36:30 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the risc-v tree
Message-ID: <20250512073630.5ffd7e2c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LSZlVVovxc7xub0Nr/qK.=R";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/LSZlVVovxc7xub0Nr/qK.=R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  7b30b1b04e0d ("riscv: misaligned: Add handling for ZCB instructions")

This is commit

  eb16b3727c05 ("riscv: misaligned: Add handling for ZCB instructions")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/LSZlVVovxc7xub0Nr/qK.=R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmghGF4ACgkQAVBC80lX
0Gy4iggAinZRJ5yyJDWxwHNlzMJ549AZ4A3wINoi4q++IbqFdAV3B07GIMv6Iqtm
WecwUkep+nGJHa+Xkm4YyZZKFj2Q//cZvtabW0YnpTKQVOETH3rYED1Sy2CtUSNJ
+sTXcvLZyUI3K66Xp0x3lc2yTVZZvu7ZY4JBtCzRAu74flHI3vunONhDt7GAqVA3
VNtQeKWg0XAdLCWTKXKT2n8unpOuC3qpJyUlHv6QIrCa53yJ+JAuw0DlCpp2mYmZ
QrLIOJegPY4g5XO39ULvIdBRAukcSZCPTQzJdx1D9CZ6V0b9LLY4AqRCSkImp0jc
Uj7/6fHupBvaWuSWmhmyj4ZbibNdYQ==
=MBqs
-----END PGP SIGNATURE-----

--Sig_/LSZlVVovxc7xub0Nr/qK.=R--

