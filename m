Return-Path: <linux-next+bounces-7272-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC25DAED135
	for <lists+linux-next@lfdr.de>; Sun, 29 Jun 2025 23:25:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAF5F3B3CCB
	for <lists+linux-next@lfdr.de>; Sun, 29 Jun 2025 21:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0E4020B7F4;
	Sun, 29 Jun 2025 21:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bJ3Of0z6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8620F1C863B;
	Sun, 29 Jun 2025 21:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751232323; cv=none; b=hEJqYGtCcauUT5FAv+26C+ENnZOkq1GOd1roz0FhRFYzHhNQYwLzBYcMm/zTaaJEr/9IJeLRV9bPr7ns4xo3EmupgAgwGs4dlm2F0zWSss0Vy/K0XbAh9ZrFBfKmDxm5hN8uFYn4PxlSQqsrRs8TJsLs4rTyun6BEYBPQ/kJjaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751232323; c=relaxed/simple;
	bh=yIuKeD9GMw3ynFAls1/K5EWPjTSWC8Y7IauEsJ52aO8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ff2l6QFdDiasonVPxZjr9kk8qr1ReqnJ2L9AuVWGSNL8Pz1F3SHXwcXJG0uKmkJe38MtKwod7b6MQ6v4v7KkDUbTRyMLfaXMVqRLGsyP/Pj3N42VoU4a6QNH254YbKzrMzhFwdayoFYpsGFBUXZfb1rm9B0YaJ1aAHFaE+YpNm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=bJ3Of0z6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751232314;
	bh=bk3MCRhYCzgNEJxs1YFeYXov95DCqfL3aqNie88rL+s=;
	h=Date:From:To:Cc:Subject:From;
	b=bJ3Of0z6cUF2BlkokOU6aLLHCzn7qVMi2srnKwGZK13WPiSvKKN47gXqRteHtp1to
	 TkY0CHDhCtCP6gPWwtn+3Nww7uLGJ6VKImab8zIYEepIr0QqrlB4Ed5o66rTgmD6lU
	 D6VrUrPLJD2dAhlFYejDtST3uNrCrcKS6EIKcHylHkoBhZtNZsQc/Iv+WBMV39/+wn
	 ARbDYQ++EOZb3/plJug8j0FECHNcCdu8Wtg1Z8jctrOWpdBfPYgWRZE5id2ByRmolz
	 jFFyzauJu9Kle/KOCvYn/i6JCR8NO1Ih8KunHcimQ2yCHTyYjJlXoCdDjaffGrWyYU
	 0xdR4Af+9SZSg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bVj4V68Hbz4wbn;
	Mon, 30 Jun 2025 07:25:14 +1000 (AEST)
Date: Mon, 30 Jun 2025 07:24:22 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Drew Fustini <drew@pdp7.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the thead-clk tree
Message-ID: <20250630072422.4d30412f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LmYNbBgl_39+VyEMK6R=htD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/LmYNbBgl_39+VyEMK6R=htD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  7bb23e0bdb6c ("clk: thead: Mark essential bus clocks as CLK_IGNORE_UNUSED=
")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/LmYNbBgl_39+VyEMK6R=htD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhhrwYACgkQAVBC80lX
0GxapQf+N8jXuKUKcd5kM3FVJ2yiLxPB6lk56GQ1SvMMwlh0FGyjtMJJ9i5v2KeZ
WMjOeRm2McWAN5DQmPW6UVYYEJVfgm4/5IsjwCWfUMDnWY1u6tbfiB8QTRy3LaYr
CuZr6QKq+N9vvMtitTCUlSdOcMqI4Wz4PVEu+0rL432mn3wTaA/CN8ZL6de44e/2
9Antm2LOr2DU5z9UNmVbpwyFRVECjAr9wO0ZOqTvKu3KCtCJhpBMXgoIPZJxk1du
ndicO0/52jQ9wOirwRivvnNkINUcQkksyovKkpE68cKpzgBKVkMc+Kt9Yxh3w1B0
wQQM4mSwCltQmW3gIYaroT9X0CXCNA==
=TK5X
-----END PGP SIGNATURE-----

--Sig_/LmYNbBgl_39+VyEMK6R=htD--

