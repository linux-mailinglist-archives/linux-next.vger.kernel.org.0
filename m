Return-Path: <linux-next+bounces-5049-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54032A01F3D
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 07:37:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF69B3A3E2B
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 06:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D72235952;
	Mon,  6 Jan 2025 06:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QKKcHxxo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CFB4C98;
	Mon,  6 Jan 2025 06:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736145461; cv=none; b=SEmGSwaNfpVuBaVNIXxadtPQzZKE/XY5XhnlbALeHcuXLRCFxpTM3te2dqvVxwxMAWr0S7lDxhte/XwUqlaqvH5rqNJdoPpbS7Jzca6Ex4y1y9X3OCuVA6rBFBoLR2fTRTZT9t+ozTwImpd/IQmx6qIWckLXLo9WOE+4M4M49Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736145461; c=relaxed/simple;
	bh=sxAGhcs9ta2qm2aDB8yGCzrTi3JTLtXblETOrKfURxU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MWdYPPLyg32qHlzIqgprf9wl8t8WjEXoSiFxqq1wVd2L9oqCftQ9n+tho1cUSg/Mp7jzyvR9pqeJjAKmMyZM+0WqteksHeYgAtZE09/F0C+QTOpWSq2y4YtJNWW9TAgqjN5OjS+X1+byOG6SJw2L8x6AUAnG+JNrFvDomwODMO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=QKKcHxxo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736145448;
	bh=U0xuHfZtcP4ZXWJiqcJUijYfJQkM+DkyhYkdjQ9Wqgc=;
	h=Date:From:To:Cc:Subject:From;
	b=QKKcHxxo8HjpbmUx8IZl9n4xFCPgahu2hDSiNLxLPy6Kd8zkxRPzDRiAJaqPE3UsP
	 41iI9LnHsMrdduVUAS5fhdbSAjSriLZPLjYbSRRXAkbm8OG/JI8vwlNa187e90v0Zy
	 7lOzr1iVML6WqcxPKs1zMQsoDqW3XRFqsiDSapYyLULABzuLPdL8o3qgUx2rpjTgTG
	 aUcebA4deQchN2tOh+YFcY3jkkHm0I/93Yqxeg4l6zhpkXVcCEF4vt3QmEDYlLG5tY
	 /Y9kSIU3kxzSy8K9NVvlZ5XeDpCOOLEH7YECpF083GjauhMQZnvyOrMe4zUIRJZM4i
	 7WV1r6BDJiBRQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YRPcR6gbhz4wxh;
	Mon,  6 Jan 2025 17:37:27 +1100 (AEDT)
Date: Mon, 6 Jan 2025 17:37:33 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: SeongJae Park <sj@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the mm tree
Message-ID: <20250106173733.5da765ac@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pwjs2SHR1Rxvl7Iizb+ooBj";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/pwjs2SHR1Rxvl7Iizb+ooBj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/admin-guide/mm/damon/usage.rst:440: WARNING: undefined label:=
 'damos_stats'

Introduced by commit

  78d2a4747a44 ("Docs/admin-guide/mm/damon/usage: remove DAMON debugfs inte=
rface documentation")

--=20
Cheers,
Stephen Rothwell

--Sig_/pwjs2SHR1Rxvl7Iizb+ooBj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd7ei0ACgkQAVBC80lX
0GxQSwf+NdyM6qaqXbrs1TZikIfW4kjM048wwozRHEqo0D5z07MLA3fhmXa78VEB
oGU4ICnf+fUTYUpNN+TST5/tinzXa8e6Mfu5W2dv4JMHK7RpM8cj5xmOWd945FKE
4ZlhOiGRopdVCsoDulspJyGZibaDO84mRY/SQqoxloSFODvf/mBPt4Sck0HRoImb
dqXYAMiKpUQGSLEu+MqH6WiI7WtWecEG9jMbKwEVo232a3KBJkKVvSLuX1BJ0NZu
oNhYAvu/ocq6jA7xwBBNwXxajHN1+gkVln8JgnYamhaF0vFKlGlg6griQpZt3TQb
SkxcfEJmiplc9kIth2gxuf+zOMKYrg==
=sv2r
-----END PGP SIGNATURE-----

--Sig_/pwjs2SHR1Rxvl7Iizb+ooBj--

