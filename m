Return-Path: <linux-next+bounces-9220-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6313C87C12
	for <lists+linux-next@lfdr.de>; Wed, 26 Nov 2025 02:56:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2C433B2421
	for <lists+linux-next@lfdr.de>; Wed, 26 Nov 2025 01:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AC152F6594;
	Wed, 26 Nov 2025 01:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KZUHzRm0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB33C2DF137;
	Wed, 26 Nov 2025 01:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764122172; cv=none; b=CmAIxzrDVKwn8UZZ0Rur+eMdzbyb/UMBL7zKGLElOj9HJGQN8JHKXqTJBYRpo1hDN5c3nCsMa3r+TojcYn4H9jH/EqW8KaGxp8Hqi0BqrB02sb+FmpD6PUgGBX2Oms1f96AE7C+lMajHi+ejGiwXp1T/mumcVhTqAxgF/1evZrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764122172; c=relaxed/simple;
	bh=/J3kJSB/raeKzQZPIQeAMTfInpSGeNc1R9foJ2z4zD8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dLKx2Ct4iBq8KFQE1DEMuuFdovBPYpRCfrMvVU/WK8Piewg3rH9FRbg64R6oMdWIctSfmDMCObXLGzW4g8merItjBPscgIe0iXk9QcXlbqZ3zVMCqRjlnpiD7MJ+ufc+xITgxdMPtg3U2McXB0RXoPJWC1tO6dliIjzCa1f1Ayk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=KZUHzRm0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764122157;
	bh=lYoQ6ENnfKGXkK06GvMxIXSKuXEMjvdldbVk7tR60kM=;
	h=Date:From:To:Cc:Subject:From;
	b=KZUHzRm0amE6PkByGbI0ivgkZakS9ypeJDxVSV9W8b6hH+fjnG7KtxK/fwODlZ7Xs
	 4KQoNxrXNgfrp2Kzt4gSHUJuxETA6ScgTKbNHJG82pUDlm+xFqIbo0O2EY6/aTj8nC
	 /UvCUf4rKNeMlnnoTCJPq6ptASEBfPn3OTpiPtRsbUuSa706IyhaHE3RBcW43J1ZQi
	 wRHG6jXIg5ij85aDsaX8aaxXThsUpituD8VBiFF4LpEe4g6i4GVZYTU5lxyE5Yv4dn
	 ZCZiFt7PnHINm1+nlShx3CMzqkmfCJcL9R9GMXVQy+5G2xlhdSZGkQLza2BQ214VK7
	 u7RFBxXdEYrlQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dGN2544K0z4w0H;
	Wed, 26 Nov 2025 12:55:57 +1100 (AEDT)
Date: Wed, 26 Nov 2025 12:55:56 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Breno Leitao <leitao@debian.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the mm-nonmm-unstable tree
Message-ID: <20251126125556.1dbda9c9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LYgQTHeRkV0+ZA288014JOv";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/LYgQTHeRkV0+ZA288014JOv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm-nonmm-unstable tree, today's linux-next build
(htmldocs) produced this warning:

Documentation/driver-api/hw-recoverable-errors.rst: WARNING: document isn't=
 included in any toctree [toc.not_included]

Introduced by commit

  c03fb5253a03 ("vmcoreinfo: track and log recoverable hardware errors")

--=20
Cheers,
Stephen Rothwell

--Sig_/LYgQTHeRkV0+ZA288014JOv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkmXiwACgkQAVBC80lX
0GyuWAf+LYf+XmOJmpeo61zwehIS8X0JHRRLAmi3ZCKLQk+pkNurh99lu/Go3mT1
Z/se7jD7kjbbryki5y+qDuOp+vYPRe9LmAFNZGrl1BptPJKQOgiuVb6QKsQ6Hesa
fSHdcr0VMsmJ4Eq4KWkrMNxz4w6lWQlMIhOoge+L0nBXpR2qPYQCa+jtffv7NacE
YGqFUW0hpKb3gJV3GlaJaqggoG3bK6sc5yv5J2JMkdrnyybwSk1BZAxpTd/P9cz3
uCHGixl3M83RcYz/DvHuJZf+qfCxIRatQSrtux/hpGmB4SxC6rExRY3JyKDSMUKa
/M9MIYGrNloWvuTA4HXOFo8RHutpNw==
=RKNa
-----END PGP SIGNATURE-----

--Sig_/LYgQTHeRkV0+ZA288014JOv--

