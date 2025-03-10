Return-Path: <linux-next+bounces-5706-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 043FCA5A60D
	for <lists+linux-next@lfdr.de>; Mon, 10 Mar 2025 22:18:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADAF816AEF9
	for <lists+linux-next@lfdr.de>; Mon, 10 Mar 2025 21:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB7F1DFE36;
	Mon, 10 Mar 2025 21:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bPNu/EJM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07051BDAA0;
	Mon, 10 Mar 2025 21:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741641500; cv=none; b=lT4Jj90K0dkbaJsWou9kJyszewRAIjh6F+X0xJunLXPjViHhTBYY+uxHN/4c1bHuP5lyvldqbwnRHkBYozgSgeADjV05ZUkRVQCmAx2Atxss2fKbQptR4u/xtJFk5hLVG4w6ZjYUMIHhTQJhWONPVzVvNpkI50YwHzBOgHMu4GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741641500; c=relaxed/simple;
	bh=0bxyFOaGTvP63Mq4XfBMuWIjPRapoFse2hXx11wW7W0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Ng0lklYfKk2/eA2pG0cbZVaSEgjxCHF/1WgzB1Ru1Jzq4E/mkiEzJwkBKDgJNE+pSDs5a3fCbjUNMDB/2ysm3a8sHOjIvaLaRrtDJ4RvTrNjiVWQTNnmwi1lYVZ4IAiY39DEJi/eN9gwSP2CtP0tRqwumNVs0rn/Tx8h2L9BCAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=bPNu/EJM; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741641495;
	bh=uzG4Eqlc5yqLdYJiBq4fX0QcN1YrpPlbAYChgJCVySI=;
	h=Date:From:To:Cc:Subject:From;
	b=bPNu/EJMgMHKfbus00MSpcViPNQU1UjvQlhR/GuCo56gQl4qLwBhtmGZtfNNwY78I
	 EMd2M7E7KCreUh/L4WNSiyh0SSRNeMJeTsk4rTC++mZ8K4vzpwx8HnVR1IR3flONCs
	 PiZWA9zJBbuZhIZ0lO/lhjkYVeAMzFYS7cvfLcYh7bJmQhqlr9MPncaLCW+upKGzaG
	 UJm2r+PuqqFppfqK1trknOnvDwMR6x39+tsdx7kQmDMVm5ojb95JTfoyM2iDoWGEsz
	 HOp1gmUqSBcwqR9zQ/bPQln3IlND1WxKGaAL1eckSfOoHtWPggQ41hbQepWBoItrec
	 S5lXVMjQxZlCg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZBV9g1xt9z4wcj;
	Tue, 11 Mar 2025 08:18:15 +1100 (AEDT)
Date: Tue, 11 Mar 2025 08:18:14 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the hmm tree
Message-ID: <20250311081814.6bdf38de@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TXAt7yktbQNwZ5L3JZGkiGo";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TXAt7yktbQNwZ5L3JZGkiGo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  d05c69b64a3a ("debug")
  bda4cde7fa25 ("WIP bnxt additional features")

are missing a Signed-off-by from their committer and author.

Also, linux-next is not a development tree it is for integration testing
after developement, review and unit testing has happened.

--=20
Cheers,
Stephen Rothwell

--Sig_/TXAt7yktbQNwZ5L3JZGkiGo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfPVxYACgkQAVBC80lX
0GxEwggAnLS/VkW7gJuCocbsk1ea4D4A6Wd43ZK8AbzVq3146HCGDN/lUBJ5GHe1
RypEAObRcM2wqX86L6dE8AYLTe+LWv6Tp/JAxXEoC64hGynuPGN6J8Eay46OWR9Q
LmXxzMvbnpwNChqUwCOtumuQDtbfAAGiaFcRhjzqSbBS23psWGbm/otXtmFpXqmF
2nT/kmL39ZmNJ5CwdokHHJC9nOcIjfNsbCz0GXk+REa42gu4heQjecSfHFCsPAoo
5j6rbENnn3hf7fEJLHcNYziusOeOGd1fXObcq4fS1/pTZO/Mp0DM+WQHjkyv3Vj3
V/7ggvQ7TwNoAAiBCeAjGgEEqs382A==
=8NV9
-----END PGP SIGNATURE-----

--Sig_/TXAt7yktbQNwZ5L3JZGkiGo--

