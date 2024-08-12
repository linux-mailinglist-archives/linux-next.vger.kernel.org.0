Return-Path: <linux-next+bounces-3294-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 777C394FA4D
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2024 01:32:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 149D01F240BE
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2024 23:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 823F815351C;
	Mon, 12 Aug 2024 23:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="SOr3pMJQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1107E0E8;
	Mon, 12 Aug 2024 23:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723505533; cv=none; b=U27gmhHHkxE6NazBu7BYvIQGQZQjuWNgdl3Lew+8Y8vwHGruYtpKtAt15Ohx/3bDbPHmOdq20SzTF2UCC9BcUKBrXnPxzSpoHXWHBEoUlHdvEEd4/I+xgFKKV/Z5UqbvGjO82O6M5TOMSOTSBdDi8YmK1ePuQGxKEF8gPk2VHco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723505533; c=relaxed/simple;
	bh=W/XX84553grFXbg/NtQTz2++MG0C3PSPeB7K/4e1UVI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=N6AbXHE70ytwCvqG5nsUxEEZwurb2rGZkX8agQ/eHNiajDyGICWATWBBIFfYCqi/oJpfv7D851eieJ+OeOOm+5y1tNkW+drFlx+wniS6Sp2cdWtt+HlMEsTwYja/wx/9iCqEjFKv1AkkfcfUK/Ga6zGBm3riskSeyYoCG1SsN/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=SOr3pMJQ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723505528;
	bh=eAIDKGVnf0mMlP4+my08U5Bt1rMk1xyHUF3WfoB2m+A=;
	h=Date:From:To:Cc:Subject:From;
	b=SOr3pMJQPPUSQ0MnfYJfin4gsug3ZL3UqJP4VLR0Ka/eEh7Qzgg3W8b4RsaQtuj9K
	 SPDJFISs/YVR+no6EAZ+GCyFRRWJa/U+iZSrNvcOF1DVS1r41L78eBXrN6go25zPwS
	 Vrktutw/cmoqboAahKLak+vS/zXBNFChEuKee68k/RRJXjVI9cda4kIssZVyGAKv/d
	 GaZdPpgBvd7kIk4LWV3wcoGY+YI3FfL/fouuEAneWm5bV4Gibj9q0bmMiqq02ejpeH
	 svNemmdvkOcnCErN6HuoIw+MWyDTLt/ooHLgsRFsvuYmOMrYTPckzu0y0yMaVIYUGe
	 hTFI9KHnilpgg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WjW54182Gz4x8N;
	Tue, 13 Aug 2024 09:32:08 +1000 (AEST)
Date: Tue, 13 Aug 2024 09:32:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the powerpc-fixes tree
Message-ID: <20240813093207.77fc03d8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YAXQnHqS60nMiM5HU4yGyTr";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/YAXQnHqS60nMiM5HU4yGyTr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm-hotfixes tree as a different commit
(but the same patch):

  e7a9af8c93aa ("powerpc/mm: Fix size of allocated PGDIR")

This is commit

  6cd04a440f57 ("powerpc/mm: fix size of allocated PGDIR")

in the mm-hot-fixes-unstable branch of the mm-hotfixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/YAXQnHqS60nMiM5HU4yGyTr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma6m3cACgkQAVBC80lX
0Gz5zAf/cN9zUcfFEdmW1rhyExLH2M63KQvepkHJS8FoeUYpKeL3AfF3yZUjDR7K
sMHR4tUDaWe3IGqN5SuV0vZSxlHYrwz0Ll+zRC3P++/UJI/7xquH/LGCr8izwUDr
kUXRrsSKsY8yCweS9A6+AMN6p220gwcXIXEsTCH6mBhqlfO7vIeMLXQTXYlkl0mv
dZX9v5xNB1RzPN2gBeP5mSOFJaf2kmueu2VRBpTN4eUq1AUUGfgQNh2j+GhEvYZ3
dhuMJ9S+nhVlnnUSxJgxCDqW7O7NJMOfKfVvSsCCwV0SGeQ97/uGE/jKmT2emW70
pBCm3jEqp6dWt5GbHm5TkSRVRwpzlw==
=06Ma
-----END PGP SIGNATURE-----

--Sig_/YAXQnHqS60nMiM5HU4yGyTr--

