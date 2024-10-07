Return-Path: <linux-next+bounces-4121-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6428D993881
	for <lists+linux-next@lfdr.de>; Mon,  7 Oct 2024 22:47:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DE821F229BB
	for <lists+linux-next@lfdr.de>; Mon,  7 Oct 2024 20:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8182818B491;
	Mon,  7 Oct 2024 20:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UFtsEEPj"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B654617624D;
	Mon,  7 Oct 2024 20:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728334045; cv=none; b=THS/+1/kkPO0E88+ny6UeXJ2SfT7LIBPnAqdpSYJmPL4YNyQMCfCs4550Kyl7suVx2mqBUWrQlddtVho21LUoZPc+c6ngdYQjutjvYDKfO5rT9lDrqfV1QtEiSyZ+8EvgA9LhqH46d4fdl6ELAbWeMA++DlL9swuOULfl1Q/fh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728334045; c=relaxed/simple;
	bh=HtgWF0VOmySERrVUcSUvANN1BWqicwHg8JqRlj1cN3o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lVGlwBeGrHkkMQRkTG95rbExilmktuucbkH/eZJUgkzQ1twgJziauuGEBb7hnRASqfbdUXVNBbM0yJLOKX2yovkwY6AYJsvSAo4kHtzCHgKTZ0NPCGfmUfogi91FN1knrRPwJQg3WaDb24ZzzO877bdm9Seu5CqB2ErhTZqz1fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=UFtsEEPj; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728334041;
	bh=ABU/ZbtAsZ1UpB2N0zb5ZdUtvnjb+cqUhZ3mm90zTpg=;
	h=Date:From:To:Cc:Subject:From;
	b=UFtsEEPjWfD2o49NhVuXo7Ejp829tOJFJF8GL8Wp/b5NIUN6ksJuu1atc1yPiEurf
	 ARUu3NexuGdg1ifaWyDl4UeFbL+hz6MOBsRpPBOVR1bQNKX0xWfCmSNNvjx7tsDWJ7
	 KofNTYdiGlVvKed1Ie8yPh+jKTtiTxMTxCNROqIeEGgx8OzPsOOLpY1CbPqQprWQb0
	 WoeR1w2dcRNoIsOmKTdghtnoYiug2wkJrlauICBPtnUoP+bWO0as9mcovq+MAXoGQX
	 WCyDklXKEM2fNfvC0P9Pz2IuUjNOU3bncVMZJbODguJ1eWju1i7x0CgZe0yhpwoZH5
	 0NyzGNw6lz2XA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XMrn46Mjdz4wc1;
	Tue,  8 Oct 2024 07:47:20 +1100 (AEDT)
Date: Tue, 8 Oct 2024 07:47:20 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Manas <manas18244@iiitd.ac.in>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the mm-hotfixes
 tree
Message-ID: <20241008074720.1a18a325@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Yxi=hwgN/oSr./oYDDOCYSQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Yxi=hwgN/oSr./oYDDOCYSQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  922e46ae7737 ("mm: fix null pointer dereference in pfnmap_lockdep_assert")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/Yxi=hwgN/oSr./oYDDOCYSQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcESNkACgkQAVBC80lX
0GxJgAgAh+Sv6zrZAQy4X2KfD9xtmUv3THC1nCoKjKxdNLztMvz+7cPrhWOkdQeQ
yqp9h4C8ncXvYL7bLl57BoK9HlSb/f7ImurUEwbxVqA7gpEj5/oRGcJuPrkBfJhn
h+5thdnDfaZoXpBro4R0lGr3gHEfWwkIEXGRYS0evfFfmpeL3zd2Nulil2BTxmPZ
39AwvmzdJqt12IS7XlW+dZ10sfEedG3qJCQEuA9rpJGo0kqnVdMxJLnanDHRQDH0
yXcEu6jBgvP9nA7AzDkUAw8/+EdlfLpJuJwo/kV8u/GJOUF+RNucDqt9HlFSzEIl
9Z9D6auzuXQrDYZ7Cfxm6spBCcK9/g==
=CZVT
-----END PGP SIGNATURE-----

--Sig_/Yxi=hwgN/oSr./oYDDOCYSQ--

