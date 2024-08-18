Return-Path: <linux-next+bounces-3343-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED38955F83
	for <lists+linux-next@lfdr.de>; Sun, 18 Aug 2024 23:53:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C15561C214AF
	for <lists+linux-next@lfdr.de>; Sun, 18 Aug 2024 21:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 491371552FA;
	Sun, 18 Aug 2024 21:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XIlkjScV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6429A154BEB;
	Sun, 18 Aug 2024 21:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724017928; cv=none; b=sYB9ElaVkfO8Co0Kyd4jZKWf2df7h62xfSiYdeoLSTIBccP3hI17rkkMEXfsDBniPSyS+Az0hjUIWYbocRxJEUiF/VzvJPHqip70ueWvNiml2CH8Ae7qEL4wLxg17CN7WSjDuCY298nDwSJsXWt/NTJs4xdrBfn4e59ZEoBm5Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724017928; c=relaxed/simple;
	bh=BVkxCRNayjoSSRJXVvbQmYXhcB9iu7psqiVvfPvUa0U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qi0yFhy5yMOc+x0u5oBMeyANLB2rAlkdXHP0GM9pvALUT7l+utEh2dVlMA9bm7qfiqyabgCRUFbgxuBrnqB5gOhI7zKGAxDroDI6W163uWeiUoaUWveY2Dp115sq0rA6ywcIO+BAnVSe9MC0I24HisWeEPIfdemdq7y7B6zM+X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=XIlkjScV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724017914;
	bh=Qin9AJ4VmuK8Plx5RWWNmf2t4+jfjua6287pFENd2U0=;
	h=Date:From:To:Cc:Subject:From;
	b=XIlkjScVURTjra3rvJOLEn13lYEIAs1gFElxBHCCMzjO92NFJnjemfpKMhhIDqlxM
	 w12uKnBRaM1WdAuFVTnzOBU7wbtI1uoq8qjDwx3zKJc3sw+e9CV0ApwyxfBqBnMnVn
	 63gOcy8pHZf+NhfRAnujQw+jzaS0nwbidt4ztPB/ErZqWWk2sb6R2P4nFio6Q07BSa
	 JgI8PkhwV6WDoSkaLTHCYYFLjKfj+OI0SVX7JoAx4xeGs0w980tzv6s2ynDVcT1z9k
	 hUoex3a1Qqb1CxyDNPxxCU8k9cQ5gGdnWn9XfNhQcJ2o4Z30VyPVleLer6Nx9LtS96
	 jvVdzl0aPgVcw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wn8Zf60P7z4wc3;
	Mon, 19 Aug 2024 07:51:54 +1000 (AEST)
Date: Mon, 19 Aug 2024 07:51:53 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the bcachefs tree
Message-ID: <20240819075153.2894313a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/a9ITY3GMrMvq7S7cxykMh0c";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/a9ITY3GMrMvq7S7cxykMh0c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  7fd1407ffd5e ("bcachefs: Reallocate table when we're increasing size")

Fixes tag

  Fixes: c2f6e16a67 ("bcachefs: Increase size of cuckoo hash table on too m=
any rehashes")

has these problem(s):

  - SHA1 should be at least 12 digits long
    This can be fixed for the future by setting core.abbrev to 12 (or
    more) or (for git v2.11 or later) just making sure it is not set
    (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/a9ITY3GMrMvq7S7cxykMh0c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbCbPkACgkQAVBC80lX
0GwLKgf/c0cIiOM09NNg/bsVKLBKhcetainDp8P7ljKop5UAhBAHfrkJOIzqmMOb
z8xFMPPSDNUCMGTtdteWjmCRTNYrqB4z0um8nNYDPCW1A+7iFvvoCyNf5tCdMngM
fI/FBCiB3KD614ZIS/yx32t67beSVZ1P4CS/3vuiB05XKqxcwHoysloKg9zMYyAf
bZdDelKqvLPAEnkwfBG9/EZL3szxXSjOE68iYg+GYckkLN689BWXlEeBKN72krOT
Zf+WspsAfXliPkCBnL2Y+za9MsMHvYs023z57bqqqckHWABQd/qbqrblmrvd4CqQ
8c5ADpaYE/vsJgWXDj9iW3w7W8e+ag==
=E2ho
-----END PGP SIGNATURE-----

--Sig_/a9ITY3GMrMvq7S7cxykMh0c--

