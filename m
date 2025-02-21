Return-Path: <linux-next+bounces-5524-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E27A3EC30
	for <lists+linux-next@lfdr.de>; Fri, 21 Feb 2025 06:19:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BF0C1894FEE
	for <lists+linux-next@lfdr.de>; Fri, 21 Feb 2025 05:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96F6E1F3BB9;
	Fri, 21 Feb 2025 05:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WYal86XH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFA135979;
	Fri, 21 Feb 2025 05:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740115156; cv=none; b=j5s0KI/BtIxFeQnWvhMB+ha1xcxAispV0Qgp3GA2kVg60SBCvJYvOQMd37VeLPorMBWMCG2U3TxX10qMrEGxn8LxZEPfoDL7cbjWZ2ZNQ3y0P5w1mLikZXhG10UYzIxzNv1jzBRMYApjxvNR0i+V6O94q6WdswYMq9TxCf+Ep7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740115156; c=relaxed/simple;
	bh=G2sYFmKDgcmctPUv9LfjwulkfT6rBBfEHb4k8eleh38=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ajgA7wtuZ9znm7WkjogkKXRMJOmJzlqyZ5RKaA5cTpz24edCNkykKIrbR5RHU9oLrQ4cu5yMjAeeH3iV+COhmY34WdI4uYloNoQn/lBFdD/AYrRj0qcMm8XjpinIb4yhbImFZNyMAPczvIsnJVx969zc0ROAQ5cXrVyJUg7l6WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WYal86XH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740115152;
	bh=zZO290pqZ3eV+KphmFe/4i45+1ijsv9z2eQw8XIgRtE=;
	h=Date:From:To:Cc:Subject:From;
	b=WYal86XHOu0bqnAGycsJtttQozU/mK71iGUA4h+PrF/klqJUUkyakRsY/3Ib/T92m
	 37M9wi1sphPP5P3XCYqmrBJ8MNtgOpSUv87Dp71qqkKR9tBDrIGXo8N3+SNRmGE64F
	 eu7PC8TenkKYGHJeBPeyZ11nF6CzuhOC45th/S9jTs27YEcoFY/5YsETLz653muOup
	 hHwNslK1aBwJ6RTrobZ7vTsBxnSOEmEbAP0jY5vPNmLSN8BjtAEr+XdvBC8x+yvqzk
	 3P+5nWWMz2NvqaM9Hi4umT3kBNl2FnG/NapnqgHOEXb3JbH8akmZabZmN+gqW/fRBx
	 QP0+LM6iDRoLQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yzdhw1gvlz4wyw;
	Fri, 21 Feb 2025 16:19:12 +1100 (AEDT)
Date: Fri, 21 Feb 2025 16:19:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Joshua Ashton <joshua@froggi.es>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the bcachefs tree
Message-ID: <20250221161911.2d16138b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/j7mxlMGWIUv963ovUSoKhNs";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/j7mxlMGWIUv963ovUSoKhNs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the bcachefs tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/filesystems/bcachefs/casefolding.rst:84: WARNING: Definition =
list ends without a blank line; unexpected unindent. [docutils]

Introduced by commit

  bc5cc09246c5 ("bcachefs: bcachefs_metadata_version_casefolding")

--=20
Cheers,
Stephen Rothwell

--Sig_/j7mxlMGWIUv963ovUSoKhNs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme4DM8ACgkQAVBC80lX
0GzYMwgAjsEI1u87t5qe3elIbmnvPek2irSMWmmQ9/abCmKun/nkBUOm/8GChSuu
ftZzJ+qCvhFZuoQfvKn1WSawaviDMZeJEWVav/H/j68L0eR0NVSWeUuZAZyQvPuQ
rrQo57EfafHi+DHqiDbxnZtcbF1GKQN53jTj2LYgQbt3p2J8i1lb87noe9jOHL+e
8HwdsYgOuKJW/Pjw2ZNkP5Ln3QwfnvlBbwI6mpfU0qZ179CuX4OMldHSTujc2Yt4
9ioQTjvOMDkLm8X+U9Og8SQ8DrLNzT8LSHeMHOYBgYooEuyCHfjnn2FHKhqGc1GX
vRZOQAGzsCD/nuvCUSLH3BvGnGrftw==
=6S4Q
-----END PGP SIGNATURE-----

--Sig_/j7mxlMGWIUv963ovUSoKhNs--

