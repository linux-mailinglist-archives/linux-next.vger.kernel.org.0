Return-Path: <linux-next+bounces-4726-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 625289C34BB
	for <lists+linux-next@lfdr.de>; Sun, 10 Nov 2024 22:11:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3E6C282104
	for <lists+linux-next@lfdr.de>; Sun, 10 Nov 2024 21:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C73AF155757;
	Sun, 10 Nov 2024 21:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PB5S4dZg"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963C613B5B3;
	Sun, 10 Nov 2024 21:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731273108; cv=none; b=HJ8FXt2SvSYOrp3/ezeF/f3aQLrYa1S7CPjfyuDsNZ25emfFEkP7ANg9lsUrb+CJ1KLjMyqcK44F/P3ptFnQFL8rEjj6X7/9IUjpcTwPHvZi2yT9ZsVZiMgVsr5YHd7+bdP3cW90yf4YsRaESG16QnI8O0XsxSrOV7bszDg5lNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731273108; c=relaxed/simple;
	bh=a4J7uo9TxeW8FtDXJbmPSbLXFQS3I9mjnOfhjSrfSxw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=D7QJ/Pu7CNXt6l3bs4QI5r9RrEdaIDihC3zbu7EPWKI3lM3U6JbMQ4BiRFn98L0evcdffdR+VB1P+4qQc7wvQH5Qryp3VA4xCq8P8n+6hBf0f9SfzImJ47SvpTogXtWJa46io5oGnEekOyZ3dtIjP1043Ef5lv6RBN3Zv5/++Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PB5S4dZg; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731273102;
	bh=VtMuTVScREL3afjvScqlfgfzGi41bOMCt+hjmun4zBs=;
	h=Date:From:To:Cc:Subject:From;
	b=PB5S4dZge4f1SMRDJr7mAvisVU8f8MUx+FvAwSfQ+DJkYoeox7PO6VpwO7bK1s5sf
	 y8rbkKIzupaQaDaNfAznoclyUXyJkBMPoO4/7clgi90SZyWxO0ksn/UVelSdr7wydj
	 B9trlUalZYb0tWLXA//tf2yEeBUZUhZ6QcviDOsmurg7vjxDvwKqUjbkPXSUH87Iz1
	 ruF1cuGK9yjl4elwLoPA1cJBWdYV4EagdlmfvvlAdUnHxWOG0dEzpihU4vm+exKKFn
	 7N5J1DnvPsBt6PwT4hrL/Apa5BS8z+eKmqDXgQnlBcp8VoNWcC6N1ek8LSt/rJywmx
	 ZZHGs5n5hUIJw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XmljV0z8sz4wc2;
	Mon, 11 Nov 2024 08:11:41 +1100 (AEDT)
Date: Mon, 11 Nov 2024 08:11:43 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bcachefs tree
Message-ID: <20241111081143.43a59204@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HL7tMPx6yFE+eL_kP6ZMw7m";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/HL7tMPx6yFE+eL_kP6ZMw7m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  aaf086c1ee35 ("bcachefs: btree_cache.freeable list fixes")
  55fcef1f90d8 ("bcachefs: check the invalid parameter for perf test")
  52dc307cb782 ("bcachefs: add check NULL return of bio_kmalloc in journal_=
read_bucket")
  83c67792c91b ("bcachefs: Ensure BCH_FS_may_go_rw is set before exiting re=
covery")
  85a62009bd05 ("bcachefs: Fix topology errors on split after merge")
  88f16c7b82a8 ("bcachefs: Ancient versions with bad bkey_formats are no lo=
nger supported")
  9d3e24c46b19 ("bcachefs: Fix error handling in bch2_btree_node_prefetch()=
")
  dccaf5e5a6cd ("bcachefs: Fix null ptr deref in bucket_gen_get()")

These are commits

  baefd3f849ed ("bcachefs: btree_cache.freeable list fixes")
  9bb33852f5cc ("bcachefs: check the invalid parameter for perf test")
  93d53f1caf2c ("bcachefs: add check NULL return of bio_kmalloc in journal_=
read_bucket")
  ef4f6c322bf4 ("bcachefs: Ensure BCH_FS_may_go_rw is set before exiting re=
covery")
  cec136d348e0 ("bcachefs: Fix topology errors on split after merge")
  d335bb3fd3a4 ("bcachefs: Ancient versions with bad bkey_formats are no lo=
nger supported")
  72acab3a7c5a ("bcachefs: Fix error handling in bch2_btree_node_prefetch()=
")
  fd00045f383f ("bcachefs: Fix null ptr deref in bucket_gen_get()")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/HL7tMPx6yFE+eL_kP6ZMw7m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcxIY8ACgkQAVBC80lX
0Gy+Ngf/ZcV7c32IeF+Nlvcut4voByccSWbqUE5eARx7xMFCN+g8hNfmQjw5AGIb
i9kkvplty7naljth32WA+k6EFY72P/2+iq3TGgEhsyZVl7ndjnMn8DisudTjLklm
z8PInhRCV5zUAlKJW1TITkTSNoPmOXbcHCarCFsZ1WPkX1nkrbcezlQU/nlOWBuW
UT0ZhFlNeZCM333UaLgnPyWmPVKY7wuB8tOw7JZRmb3BQsYSTqTlMXyYhNNvQW94
P8BouV4IXprk5YTEN6P5EsNv14/a/HCtbpIngcIKRleew2CZLkyFipVVlBzdt/TW
yLWNMhbV5grIRA0CECgNxUnobWPbnA==
=07C2
-----END PGP SIGNATURE-----

--Sig_/HL7tMPx6yFE+eL_kP6ZMw7m--

