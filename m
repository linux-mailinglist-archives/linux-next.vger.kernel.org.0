Return-Path: <linux-next+bounces-8608-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2920DBE4462
	for <lists+linux-next@lfdr.de>; Thu, 16 Oct 2025 17:36:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F0C73B81C1
	for <lists+linux-next@lfdr.de>; Thu, 16 Oct 2025 15:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 250B034AB0A;
	Thu, 16 Oct 2025 15:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V6swSOMS"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29CF34AB05;
	Thu, 16 Oct 2025 15:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760628710; cv=none; b=W7nU2Z+ULA+QutmkTou2PIkfUYWMXyxmpJrlNeR2ewo1pRorMHP1821UDSMN8YHuug15RMRON+8lL6VHLPRHw9tGFqbd/n3Hy76KWi9L5pUeikroYhRaHTw3gg5LJ6+8iUdrAbA8HSdlqiYGcn4MVz5wlTakWU+1StYmzUH9MjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760628710; c=relaxed/simple;
	bh=fXOp/m+BS3x2gq20s4BnSqHZoXlFUhnNhp56vbeGy74=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DCJPKIUTdlab/csAk9T58s8dcyjzimII7YtFjNLTrlnHb1zHUXPMtxnnVXqrnXyWGjGBmvB5rnEx+zz7jwlwKJPCZCjXCW/35uFicrned0giQr1NDSyBdKhWBWmGxMZXb1yoj+gQGAILhLiQhxCEZc3dOXXsMFgvWMXQUdlXZyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V6swSOMS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF491C4CEF1;
	Thu, 16 Oct 2025 15:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760628709;
	bh=fXOp/m+BS3x2gq20s4BnSqHZoXlFUhnNhp56vbeGy74=;
	h=Date:From:To:Cc:Subject:From;
	b=V6swSOMSvb7TXJ+sdGe+mPjz7z/baCLorrrV9rFqN60jz3yYrPZQH0fpBP6Z9zEM6
	 H4ue+DeGh2IND+eIhqTQx9yWWDumiUOlIY/97a+3vQMam/0dQPBK0yLHdGnDvIVAL1
	 I7+gomQKadJVtESUsCGHli5l72az8h4xxA2D6JjqC3zKl9gqOeGKd5ZvHIjns5DLLV
	 vFcj1cvLZZGTYorR+5x6f29lIkyVzO7SoRKO5khtvI1ugkYfYLG/bLbiAyslEY2UAz
	 koxrtiyzXiiqV0g7iXX460YfB30vRtcuA0K6yMTEubQF2aX2oA3sOx46pflF9qV8jx
	 9WbdsDdpviNfw==
Date: Thu, 16 Oct 2025 16:31:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 16
Message-ID: <aPEP4lIj08M2OcEA@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/To7pIyJj0hNED2U"
Content-Disposition: inline


--/To7pIyJj0hNED2U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20251015:

The drm-intel tree gained a conflict with the drm-intel-fixes tree.

Non-merge commits (relative to Linus' tree): 1772
 1797 files changed, 56678 insertions(+), 26656 deletions(-)

----------------------------------------------------------------------------

I have created today's linux-next tree at
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
are tracking the linux-next tree using git, you should not use "git pull"
to do so as that will try to merge the new linux-next release with the
old one.  You should use "git fetch" and checkout or reset to the new
master.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There is also the merge.log file in the Next
directory.  Between each merge, the tree was built with an arm64
defconfig, an allmodconfig for x86_64, a multi_v7_defconfig for arm and
a native build of tools/perf. After the final fixups (if any), I do an
x86_64 modules_install followed by builds for x86_64 allnoconfig,
powerpc allnoconfig (32 and 64 bit), ppc44x_defconfig, allyesconfig and
pseries_le_defconfig and i386, arm64, s390, sparc and sparc64 defconfig
and htmldocs. And finally, a simple boot test of the powerpc
pseries_le_defconfig kernel in qemu (with and without kvm enabled).

Below is a summary of the state of the merge.

I am currently merging 407 trees (counting Linus' and 406 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
Gortmaker for triage and bug fixes.

--/To7pIyJj0hNED2U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjxD+EACgkQJNaLcl1U
h9AMHAgAgUe+0KwRRhnOMpQO06PJXyUAZwXjuJdGu+qQQ7lVsSn1I2sEJaGo3v2N
ZAiVc/sXJ8tGIoHJerepO0RcmOhHPxGkuhZ87leZs7X5zILO7JXTW83pGsqdqMCR
Qpiiae9xCRfPYuN54UUPWQS50zxGVGMLiBBK2uQD/NIO3oEIvp7affSr6CenAsRQ
vcPQxAq2JUH1JB0VoZW8UZNnKza80o4zTwqsSEXnAdOLF0grQdcBxuyybtHAt5Xj
XjZy9PoodderCZkWU2ULMW8D1loKaOV3sf62eenS8eh/M+Cq/QzW7Bus0pAO0e8u
dvqrQMJ0WseqSpkwTdDgzq/l08zHyA==
=XOMd
-----END PGP SIGNATURE-----

--/To7pIyJj0hNED2U--

