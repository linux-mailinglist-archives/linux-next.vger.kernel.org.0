Return-Path: <linux-next+bounces-2574-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF4990BC64
	for <lists+linux-next@lfdr.de>; Mon, 17 Jun 2024 22:52:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 822281C231ED
	for <lists+linux-next@lfdr.de>; Mon, 17 Jun 2024 20:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58772190485;
	Mon, 17 Jun 2024 20:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PiANdjUx"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FABA8480;
	Mon, 17 Jun 2024 20:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718657568; cv=none; b=uAntL4xQMrkQKAPHxRtIFHKMN5tDBc6ql+xhT87m36wKuZTfDNUGQkSQH0KNyBsFQSYSHZ049IIjxrVgZF2YuLF/SfUhDpglrK3Oi3iCvVZXbxnKTpkwA4oz5azIfZ1yatVHgFOAet445sNJCaq/3j6JO4fBJdeLjVVHTNJk7hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718657568; c=relaxed/simple;
	bh=41kUU0X3uj/PQa8YNRMM/LLRAtAkRSHSW+Q4ltWkpjU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PwkVeygm273yVj4Yn113YtooqY6jVB8BU8N/wQqAk3kdOGZFJa75RKvsvof3ZW0MLcTJYmF7NXx3SGqH9NcJ4c8JCnBpJ+ociSYtm8M5Hoy3Sb7el+p8Lk/x04UWBUV6FrwG81A40NPi3dekvK0aIWTwhoihskcjpurxXNepjDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PiANdjUx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05B8AC4AF1A;
	Mon, 17 Jun 2024 20:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718657567;
	bh=41kUU0X3uj/PQa8YNRMM/LLRAtAkRSHSW+Q4ltWkpjU=;
	h=Date:From:To:Cc:Subject:From;
	b=PiANdjUxcbSqbGqA2964YxPFc9zh8NTEqQLV3tq9yoRYjh5H1QcqfUsl0wSWrJDI2
	 moY08cdv/W7nS11JtB9yFLomkeYCdxEXywoYZaNEwUcI/MmZPklZyb4xnl6sr6cf3H
	 UiT7XbqRHT7RWc7FHsntxTV8TMb3+oL5fsW8+tu5EBOQxKp95I61hyxwKUmlJifsgy
	 VsYxpXsKPVhEqQWBwb4SDXFn2yQiE4N0Gp9zSYsjd+hG2SI8oQO0b2AeIJpLzLGvWW
	 5hU8nmKyXJWw32vlpBsbq/uspCXjkRQ25cs9mETxL35XOWJdWGAYOh1jA0Xf0i9Scm
	 tL4fmOFN/xggg==
Date: Mon, 17 Jun 2024 21:52:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 17
Message-ID: <ZnCiHDFcYWAfirtK@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n5pUkQIiS77fy4uS"
Content-Disposition: inline


--n5pUkQIiS77fy4uS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20240613:

The perf tree gained a conflict with the origin tree.

The mediatek tree gained a build failure, I used the version from
20240613 instead.

The vfs-brauner tree gained a conflict with the bcachefs tree.

The bpf tree gained a build failure for which I applied a workaround.

The drm tree gained a conflict with the drm-intel-fixes tree.

The amdgpu tree gained a conflict with Linus' tree.

The char-misc tree gained a conflict with the qcom tree.

Non-merge commits (relative to Linus' tree): 5971
 6460 files changed, 575656 insertions(+), 113366 deletions(-)

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
directory.  Between each merge, the tree was built with a defconfig
for arm64, an allmodconfig for x86_64, a multi_v7_defconfig for arm
and a native build of tools/perf.

Below is a summary of the state of the merge.

I am currently merging 377 trees (counting Linus' and 106 trees of bug
fix patches pending for the current merge release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Status of my local build tests will be at
http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
advice about cross compilers/configs that work, we are always open to add
more builds.

Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
Gortmaker for triage and bug fixes.

--n5pUkQIiS77fy4uS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZwohsACgkQJNaLcl1U
h9Dr7AgAhQuxGaxw3DmGVNVZhWqHDUzmB41VY42UcUtLb49Y/K+F5Y7oYK6NLmFs
ucybzWKDLKZAkqE6EhyB923VJTFCE7t9MI+X2q75e8p6kCAduT6apZZAaHF/B1hJ
H3QBgI7Hd+jy+IvH7BMMe52NCvAanaI3uJTsEzksl9XAeuJ/Z6x5CE3RLGrm0Blu
vM2WiwmYATuA6mdYCZIOZRC/EU2IEqFLIOKLBAKOgTyqhDGAWEwefLu/Oq1G82A0
HyP0X1rRD8U+/QZ2/wU3tOHfo8nhgZ/UOS3tzVA9JNf/9A0rMec3hTBecy5P2Xgt
CiNXMz2unE/HmvZj41FvsmCzl42Euw==
=ymvE
-----END PGP SIGNATURE-----

--n5pUkQIiS77fy4uS--

