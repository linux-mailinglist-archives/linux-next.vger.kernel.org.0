Return-Path: <linux-next+bounces-2365-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBAA8CA767
	for <lists+linux-next@lfdr.de>; Tue, 21 May 2024 06:34:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D91892822E6
	for <lists+linux-next@lfdr.de>; Tue, 21 May 2024 04:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFA1B219FD;
	Tue, 21 May 2024 04:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="F3zmpwHL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5B72B9A4;
	Tue, 21 May 2024 04:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716266056; cv=none; b=CJQfFdHRoLjkWbcNqj1dJB2trVO1kRf8PB5D8qnZaZXUcXvKgCWJsKvDWctIugQRNVkkpp7EFizXqeO57trYJpqXMI7xUWVYy00O23G4DONczjWWvbrC+UGqd526rhGz7mTzxEPb/SY3RaE73ttQM8G/ki57tGcgSb8DK6vY4BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716266056; c=relaxed/simple;
	bh=phgYWEoYKUDAmqDP7qb0dw0LkAb8TMzVIYP5bCEMiMg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=keVXgdA3/U5seg9Q1UpDNeCum09TU3Z7c7WqhGukZKLx1sZoiNUNDBH3RXYrdNpldzfwHrTqxjRc9NB2HPfXECjkYF+Ag2lb2wr6miPvfrrqOhR3DVpcn1CEb2me6TnzBEhoFRX8BBdjCrNEjEUWMGqXWX3MJsmvQ6Ws8qfdLUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=F3zmpwHL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1716266052;
	bh=rse4PD/BKugNaYHX+KKZnrDNdWJCLgP4raVPc0nBlGo=;
	h=Date:From:To:Cc:Subject:From;
	b=F3zmpwHLn5Q3uXu9oTHQb+gVfOkhEGhr1rmtJ21L6OnWM5bm7wQkut9ZVdmauvJGF
	 bxpI0kXzCIgP8hFxYNRAWxoFDCDmirYmOm5uwLjjuoUlksF4Gd5vY66qgyhwaQfFIe
	 g62EVGluEdw0vPVbZQchOBUhdtGAzN2hdxAPiUKP+0nfaCHpcOpij/dA7QyqnrD2oE
	 +lFLniRREoBzXXiIav0n4EMVHKsd3Z3Iur41zWzfrpowOZ6WCbbyhnP4a0cv6Ykr3U
	 N370XMMSN15ohKN61y6cxoON1kATt/YKgiDO9OLccVQQK3M4/ka6r0vKvfjKSB+1nr
	 d3xVlMTmf573g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vk1mN4Dnkz4wcg;
	Tue, 21 May 2024 14:34:12 +1000 (AEST)
Date: Tue, 21 May 2024 14:34:11 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Trond Myklebust <trondmy@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the nfs tree
Message-ID: <20240521143411.20003fd8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//E9M9.ik_Ke+m+BjxMYPvl7";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//E9M9.ik_Ke+m+BjxMYPvl7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit =
(but the same patch):

  345efd008b5a ("SUNRPC: Fix gss_free_in_token_pages()")

This is commit

  bafa6b4d95d9 ("SUNRPC: Fix gss_free_in_token_pages()")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_//E9M9.ik_Ke+m+BjxMYPvl7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZMJEMACgkQAVBC80lX
0GxW4QgAg/4A6DJsSM3KAi4Fk0v+9AfKHm1RJecq90yq4E/SteBtruzOOg6Stwt2
G7LWmPMeGd8Q0c0x9YJIfqxjpGeWOF2SilwgoeYOmzQ55tpxrZM2z8Bk/xGR7qnt
4Q+AGxLnbidNi4HIG4nGL2iGPK4UEz567Hed3EZcw5lEKaSYhHtks6nufVfM/oUm
8HIish5Gsvji/0TCjh0NiPw8LBxpQBLfOjLngI9k+OKVXjR4y98mcJmoao/XF47f
D5dnTtpOflxZt0FfcB4AInApvF4b+o/cIDeiL4r14j1EZMXGNqkT+O7LYMG4twsN
vo2yZPK1CcphrcNB3q2o0Rz0HmeDeQ==
=8WsE
-----END PGP SIGNATURE-----

--Sig_//E9M9.ik_Ke+m+BjxMYPvl7--

