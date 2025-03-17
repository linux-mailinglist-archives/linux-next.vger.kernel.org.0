Return-Path: <linux-next+bounces-5825-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AD6A6503A
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 14:07:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D11B18953AD
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 13:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF1123BD1C;
	Mon, 17 Mar 2025 13:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oRLYJj/L"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E69239082;
	Mon, 17 Mar 2025 13:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742216825; cv=none; b=fh1JqhCLQR070S8yoEGCo75XDBrvkQeSuvgcIYnKwL4pGO5pQ35Kp8uLo0aITP53orAYjc0A/Eg3ftsgYptjammjr384NjFHasnX5JeVwX9FIeJu7GZedVJWHbphy97m8BKfUG/6X2V48TjPXBvP6DKiQsp+4absQ60GwpYSJ6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742216825; c=relaxed/simple;
	bh=d9rbuOf6vgt7EmHvbjatGk0egelvFCZkm4hG6GECxxs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AR0RFM96uYza7yprWeC+EjuLuFyezOSLotUTmjqVRa/ubO/VcCD+a37pq2lViiVtLsEytUf3W1x7Lz/3fm6M7fAkeaVKrG+ynfn7pNnuIlNNt1vd5lhBs9ytow9oRCQEVkjsXAKOKuEKM2450CHx4dfjt7+3sOWLLfIjTacK3fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=oRLYJj/L; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742216819;
	bh=RDRxYkn4tMYm22xctKdfHFH1VSCxbjgW7pg1DW734Qg=;
	h=Date:From:To:Cc:Subject:From;
	b=oRLYJj/L2aT09dIfsp2nSc3m052t+MeH7IwSeNXwOXAhfAx7yhIy0RhY6gsVg4bGy
	 tC9DOYP+FKJbflIgo69zKjV/Ehy8XnCSRirp1wnEi2Bqvx1FPtc0go5v5g8rWAb/Sx
	 PKtHwlQ54J1Pk5t0KFm8uCnS3std27Cq5G9taslWoI+JKq2/ZOnpMvxdjr6lEdnOtK
	 rINVc4mjcHKXvzZCt1CrQo2w1LumXqCgh4oIdxuNc/+DD/kAdZSEcnZhFKAjnjRGOm
	 zHxAG/tJ28d2lSNHICu6J8HmszzsS6m5Uf9nFCO4ggahEM8rTDh5Z775mrEDVNDq8u
	 tqFFYsDEQEJ7w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZGZxb450Lz4wcw;
	Tue, 18 Mar 2025 00:06:59 +1100 (AEDT)
Date: Tue, 18 Mar 2025 00:06:58 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the ext4 tree
Message-ID: <20250318000658.29a791b4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uyUNYr3_PcyYGgIeJS9cqIi";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/uyUNYr3_PcyYGgIeJS9cqIi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  400bb71a00da ("ext4: fix out-of-bound read in ext4_xattr_inode_dec_ref_al=
l()")
  4d6eb75d2364 ("ext4: introduce ITAIL helper")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/uyUNYr3_PcyYGgIeJS9cqIi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfYHnIACgkQAVBC80lX
0Gxxpwf8CwL6Ep5AsFjDb55/+Z9/ifXNXV4e3AWyYlLRFdbtPO+RHw07VnTtuGks
8I/NJF8s5E+3sh5ixiQxGlVPpvZdc42Gv86R+jnHTWQ/3jyGlu11fcIAgHy/3P+/
c3ZfSkGJ/nuK0fRxMcQxKAuLER+bCP8kdlBvwsU2X75nHsMMXIQ2VwpwErmTnw9N
umxTyleX4X+vHdmDKi8Pj4jNlDmdx/UbUtZ5BFO3k5LA1X26gJuMX9AH1ruEPvFN
UH+PXb8uMFaq43v7MfcAX1zLnyGQLwefQB8/yMmKnUpxxL4EHaBLsyEbYDT6sgvF
3dJxTOkcFg2XUqY8s3/Qgas1sxzm+g==
=y+40
-----END PGP SIGNATURE-----

--Sig_/uyUNYr3_PcyYGgIeJS9cqIi--

