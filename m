Return-Path: <linux-next+bounces-5160-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2132AA0ABE5
	for <lists+linux-next@lfdr.de>; Sun, 12 Jan 2025 21:51:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA6F97A1D45
	for <lists+linux-next@lfdr.de>; Sun, 12 Jan 2025 20:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 850AA154C0D;
	Sun, 12 Jan 2025 20:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="LnLq5JaQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FFB3C1F;
	Sun, 12 Jan 2025 20:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736715084; cv=none; b=s6mI/3qkvWXfxnY/eBXcgwKgUONqyJ9SBUIRgTRnjVpck7fJBQvqeKC2eEPRifQ8T1t2WW9LYJc/qYthO+3HgeYCdcabzuMDIAICplwz+aibnWXQn3o/QABScPMeqMI/OOBXRpnNdU+l1RVCJQ3wmFeChXxnCl9AA83+WLJzNE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736715084; c=relaxed/simple;
	bh=4DeFWeUUtDpC/nqSBBSPr9bNDlmpJsPZhmj04mnTa4c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gA5X8xEKTyNeQVZY0z2+sx6LLdS1UDVxpnU9p0xaD9mBNiVYa0Mzb2EI3l9t0NBJgxL24o6d8EMWonZvoSR8hHKKuFhoNmLto8YMd5bgHALtpJet1bgK/nhwnSPb+p9H2Wr86LjPW5I/4HIW/McsOYJZAAwEFbd6gRYRepKWNBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=LnLq5JaQ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736715073;
	bh=MnN9XlR7Iy50bhYehV+GA5vZUzQIBA824/+yJmqiCiw=;
	h=Date:From:To:Cc:Subject:From;
	b=LnLq5JaQfVqt4R6PJsimEpZFOLXR3by2IwYYv7blSkAs6qyErCyEn+Z0RDl2hHLAs
	 NePgwdz/SyH5Lz/ZGxFL30avvbF3hbrBM2bV/rfFCPh/gU0E7EycpSDyjggUXMAECu
	 rzjhSehvdAcCRCKZ/Ot9B200fNWhbnZGd3lj4EaOm1om1mOHjg8hSuMIq7WSJ34Gd+
	 Erqv/rg6xCcQiRy8zkZqPjuFVzaVUhwJMvQQiu1WmPKjxwTSFtBB99mGjXbp3p2g/M
	 Q4yF24y5H+dTqL3lolVV/K6E1DgfT1qxQjvPMvDNegltyrRhSnOD/qwjwdUb2xtutY
	 a0g7Brg+8uJZQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YWSGn2MgPz4x3d;
	Mon, 13 Jan 2025 07:51:12 +1100 (AEDT)
Date: Mon, 13 Jan 2025 07:51:19 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>
Cc: Keith Busch <kbusch@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the block tree
Message-ID: <20250113075119.6d1d8177@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BNx1KRXBuGUbG=WlTCZMlJL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/BNx1KRXBuGUbG=WlTCZMlJL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  ae50aa677503 ("nvme-pci: fix comment typo")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/BNx1KRXBuGUbG=WlTCZMlJL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeEK0cACgkQAVBC80lX
0Gz8dgf/YlVWF9NVhDCaZK756gZ9UXnnl8HLXBWpHXxwfhgdAtKNYF+HlVvR3c2J
aZRjlUj9Geqpyz9zLTXKgM4leps0hz+y+K8S7u3KC9jX79jffdW5xeASsakPPlpN
2MJaekxe/FuZxVSrBdtiRj1KnSQEfeJxq4iZApaRDpdJLursOHIZLOLIOAIgxKdf
g9YBA/2nYncyR80iaZ9giVp2UAV6xhqYClRxYPU/6ks88G9mx1rMVEagcHFBCpeX
O+8pLBgisdN7ojEOMQohkmiC1uJN+8SuZNMWM7wxFSfzXVDVqiPLg2445vh/djSt
fowTScECNg59M7ZOkxbKcf8BwpCNRg==
=8caT
-----END PGP SIGNATURE-----

--Sig_/BNx1KRXBuGUbG=WlTCZMlJL--

