Return-Path: <linux-next+bounces-6287-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C161A91411
	for <lists+linux-next@lfdr.de>; Thu, 17 Apr 2025 08:29:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D047C190688F
	for <lists+linux-next@lfdr.de>; Thu, 17 Apr 2025 06:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53471FBCB5;
	Thu, 17 Apr 2025 06:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="p/qLc0V/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61721C862A;
	Thu, 17 Apr 2025 06:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744871344; cv=none; b=VVzGJx1A3viuAa378qIl6r941zr4YW+pjLMbOWgUlIJ9X7RidCSNFtR24s4ipP43OE5QCONNsBy8JjNR64yEVlLBDKaMRQnpT9oQJ9dSUj+/jG9xJNpE5BhQp8W0j6By1wfNHA47KLPXFHRDEIyRb0Fdjpe4qPOw316wefmLsUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744871344; c=relaxed/simple;
	bh=i+zhERq24lt5DHfhxqQolfBUE02g5vofrhI9I22p9Gc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nwqJ8trC0MRYYZx058Fnlh6ogOipXRq9NvnU2w8xLIFZYXr1apFz99YKBWXCysjm1z6giZCO8MCoerJL3wzmLeSuPyrbR9WUcvIYH2Qd3yA25LOjIQoHGrYFOV6RjRXDTROul1MsGmRvLhux1Vs4DAD17CFjRvmTPeQwG1dq/MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=p/qLc0V/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744871339;
	bh=7z/Yz2xDYYYqyb7v7dZHlQPt4fBCBqqWQkXkLlctg7g=;
	h=Date:From:To:Cc:Subject:From;
	b=p/qLc0V/qh3ZpEVYtPqdrLL3wJisaumR36B84LCm+Biy24p9duDe7Zk5E7Vc9jz6K
	 cVt3wM4HjoG3RpMklNTVj/B++p4rEG4PVxPc2JEjD0MMrIMF0T2TuLm4dOQTE1apjE
	 Pc4fcVANFS7iul+02xWdh+eNsdSR4ZYbwDGduaR2zKZo4UKxE2xiLB8OO9ozuusPSw
	 PSvGjvFRb3t5P78PydfqrxAakxMdvuA5rm7vy2wFv7itlXgT6CLkn0Ru5/oVSsvsxh
	 0qOnpF4TUedV0AeM9rnyIbwasbK30WwN1PosrrR/Fm7jJcn6AulCVBsfnkXa0/9Thc
	 XEBvyZmZzm2ug==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZdSf36BmKz4xQm;
	Thu, 17 Apr 2025 16:28:59 +1000 (AEST)
Date: Thu, 17 Apr 2025 16:28:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the bcachefs tree
Message-ID: <20250417162859.5a69f695@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rY0D1kEKCt8sPbXp4XDd2Tj";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/rY0D1kEKCt8sPbXp4XDd2Tj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the bcachefs tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/filesystems/bcachefs/future/idle_work.rst:75: ERROR: Unexpect=
ed indentation. [docutils]
Documentation/filesystems/bcachefs/future/idle_work.rst:76: WARNING: Block =
quote ends without a blank line; unexpected unindent. [docutils]

Introduced by commit

  b2dcbe2613ad ("docs: bcachefs: idle work scheduling design doc")

--=20
Cheers,
Stephen Rothwell

--Sig_/rY0D1kEKCt8sPbXp4XDd2Tj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgAn6sACgkQAVBC80lX
0GwHWAf/WFxf3Q+Ke29x4GMs75xJnxzGWUJEwAo03ePNGvd3nwxQaVgJwvWxRKDl
NCux5CtuvzOACsLAL3ftOmYeDSvPk+m5saJj+eYKjsrwx324YFRXIHew86l7ckO8
/1Ogj/bQEGxIHmGGndA6+2aHsltWz7U2VlavOInqfDb34GXfiEKI0Cm2NXKaFJAL
0ppkWQuF24XmTM5QOyfIEyMql6SiBbxRd9qUKPlsL6/68rBrloezoRkIN3Ogdb+3
tvIdyjaCfMBhO803ZgHIBrXRDSaWWOkOD80ZUM8bNi6hhuWjQmW8G3lDA6zFQvmk
Q+PMcTmTnOEDQA0V8ecb7UM1vHh5GA==
=smTq
-----END PGP SIGNATURE-----

--Sig_/rY0D1kEKCt8sPbXp4XDd2Tj--

