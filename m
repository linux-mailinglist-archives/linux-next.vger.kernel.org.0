Return-Path: <linux-next+bounces-2654-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 608E39156D2
	for <lists+linux-next@lfdr.de>; Mon, 24 Jun 2024 20:58:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EC98284C1A
	for <lists+linux-next@lfdr.de>; Mon, 24 Jun 2024 18:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E142E400;
	Mon, 24 Jun 2024 18:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="npM0qoJf"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6CA2556F;
	Mon, 24 Jun 2024 18:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719255464; cv=none; b=hm8ggD+Dk7+N7r28HHzrs7l8YN2SyMkwS4GZkoqvROMCtbjgqA/Yh6z1F0oe8LqYP1lkcaGQF9vvoUMMXEwmZWvM8Fn+FR6fHeIvRMo7R3lOaPZdZb9ujTAqyuspvdidBTaPW3WQTvdhEKcsA49wmI8C/bOu2/88IOSpzyCsvOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719255464; c=relaxed/simple;
	bh=bScPPyvL6rRULJitXLwAlJhTDbnoWRaAjqNZdFafxMw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u26O+iO5XKhisNFz3AwVpBdpC0DfWW8gSixcyCMMi5qYuU2VeLYTLUDP6/b1UQl6Vk/FPBBjV/MKBqpL9DafqmgADfboyOdPXH/KBYER4ytuZrK35p506Ta/ECECoXDF6UDnk/QtYPXbRIllBGNlHIK5+0IkIi0qZ6YMSBQaDVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=npM0qoJf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CA3DC32789;
	Mon, 24 Jun 2024 18:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719255464;
	bh=bScPPyvL6rRULJitXLwAlJhTDbnoWRaAjqNZdFafxMw=;
	h=Date:From:To:Cc:Subject:From;
	b=npM0qoJflxXpPgr/nmYQvFRZWw18tqiyzzOLUBJtnSyF7H0JVUfSULG40dofd6xF9
	 3Hsh5tNXhjr2QfEEAMSiV/IzMjhLNjpX4HZSCvk77FUDnCLBfIFw6yZoDWRNA+5Ukr
	 yYnU7ZNrc5Sr/A7fJ3XVcclTZAcaRymvambeIVvl+kyvVgb8gT7f4CKoqrTsKOFZSO
	 DV49N7vEyYvb1GQnWbaFQuwc3WbZ1Zjq+flMCki8vGb05r8zpuqB9oZdYYBKpBS3Ud
	 6P/kQAYwRFns/CuyVmN7wJ3P3BM1W5kcViq6XrAYlmCok5fFVlotOWOT4Igr54fRGH
	 7RDsZe25oTszg==
Date: Mon, 24 Jun 2024 19:57:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 24
Message-ID: <ZnnBpPp09R7sON-b@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FPoAcc1pD40vVTwI"
Content-Disposition: inline


--FPoAcc1pD40vVTwI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20240621:

The drm-msm tree gained a conflict with the qcom tree.

The drm-msm-lumag tree gained a build failure, I use the version from
20240621 instead.

The tip tree gained a conflict with the pm tree.

The driver-core tree gained a conflict with the reset tree.

The driver-core tree gained a build failure for which I applied a patch.

The tty tree gained a conflict with the printk tree.

The counter-next tree gained a conflict with the counter-current tree.

Non-merge commits (relative to Linus' tree): 7232
 8069 files changed, 728210 insertions(+), 138737 deletions(-)

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

I am currently merging 378 trees (counting Linus' and 106 trees of bug
fix patches pending for the current merge release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Status of my local build tests will be at
http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
advice about cross compilers/configs that work, we are always open to add
more builds.

Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
Gortmaker for triage and bug fixes.

--FPoAcc1pD40vVTwI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ5waQACgkQJNaLcl1U
h9Av/wgAgMNgWW8V6MGsM7jHlQ4sHJeDNdpsY4hkpyw3mO05pVsu6wee7r5DjWjO
DwAF+9yebpM3Wp7kTaKbwMsFABhCb7ixSC7L8e35Q61wwoSBpzqKTlkLQJHgDQl5
wsYWWk39AHNnqfmjd1amfuGRamztF7wPCxBTdRiwqCDy9F8QaEyAgmDKoAriurtC
WMSIN70Z88pqzZYktv79bkiFxg+6MDGnXGH6Avzwp/yvyqIAAMoXtTINRuV4YGxB
T49ZfMzpaP1APcCOrEQPge9mFwsc17hW8PioetQX0/M72reLslcrxPu8v7e2r4gc
0cVn94avbhQE8Qbw3H9MLYwIGVFMNA==
=hhAB
-----END PGP SIGNATURE-----

--FPoAcc1pD40vVTwI--

