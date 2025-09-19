Return-Path: <linux-next+bounces-8392-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F162B8A2C3
	for <lists+linux-next@lfdr.de>; Fri, 19 Sep 2025 17:06:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C369D189CDBE
	for <lists+linux-next@lfdr.de>; Fri, 19 Sep 2025 15:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEF71257855;
	Fri, 19 Sep 2025 15:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GxR/G3l2"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AF41E3775;
	Fri, 19 Sep 2025 15:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758294363; cv=none; b=J/zX8esLtF19tuHxXWM8wQgdei7ApP0hsLJkI0bsXO8rHHJsi3VgAIhLIP4cZwDpH8Vdraads1qnVpiVSFjutSwpu956P1mX7+db3G/JaT8KRiCLekviTdEu21Q2+3Csy+9akT+HL1kdGh6hWyb+P7hnOCv+H2a6S8fNLp0KfGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758294363; c=relaxed/simple;
	bh=NmJ4k0eAEPY+WFI4QRGF3v1SZjk2WzeguFFKBWe/ro0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ijeddC6KnjOSPfr94St5ka4Rft2EnfL4t6LSTrKrA/8lY30edsTTcdanlh32li/S9F+SZm/QP7g4NHx97ofyKtNJQk8w3+2nUo4Jn5DjuH+AiTlNiOT+yvsPheain1lipMnMH9fJ2EGvQN3hV6jc5NJUXgRyoopFUM6vk3u5cps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GxR/G3l2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55F4DC4CEF0;
	Fri, 19 Sep 2025 15:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758294361;
	bh=NmJ4k0eAEPY+WFI4QRGF3v1SZjk2WzeguFFKBWe/ro0=;
	h=Date:From:To:Cc:Subject:From;
	b=GxR/G3l2kFbUu7RIA2GcWBLlzcU3yePp60z0uG3m8oteYiPaXCUGHnsvjKFT6jL9K
	 uwwz8rg81KQPUmXNyIHpkqd8B/1SQtwxt+0bUMcM2EKYqTt7ch1BlW6k3LerZO59uF
	 oGkEvUKxm4nYgmLsi590pwJvuNlRNDNHZ09KOJeoOzYqPdhOGh8ewA/fCT6gidVvIb
	 tP9yZ9zA6HDoRF+B00ztfmMrFBrSHZS80+rUEKYwysO5pthok4RYXyZVI7jky4YMIG
	 5dJ2K7o1yNJbwq8MoZqiblYlXUlPofKrg4G8EBL2FseSBh3co070RKzKO1neFVsVil
	 8+V4HzDPaIE+Q==
Date: Fri, 19 Sep 2025 16:05:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 19
Message-ID: <aM1xVa_SX3_QFU_q@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jN90vCacN3r3sgFZ"
Content-Disposition: inline


--jN90vCacN3r3sgFZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

There will likely be some missing -next releases Monday to Wednesday
next week, normal operation will resume on Thursday.

Changes since 20250918:

The net-next tree gained a conflict with the rdma tree.

The drm-xe tree gained multiple conflicts with the drm-fixes tree.

The tip tree gained a conflict with the risc-v tree.

The tip tree gained a conflict with the crypto tree.

The kvm-x86 tree gained a conflict with the tip tree.

Non-merge commits (relative to Linus' tree): 9904
 10133 files changed, 469989 insertions(+), 191252 deletions(-)

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
a native build of tools/perf.

Below is a summary of the state of the merge.

I am currently merging 407 trees (counting Linus' and 406 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
Gortmaker for triage and bug fixes.

--jN90vCacN3r3sgFZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjNcVQACgkQJNaLcl1U
h9CnNQf/amCLIN/OkR+zIyiiu/bWmt7miLIluFeBbKJFVPtUUs1ymMmN70fU0ZmY
aQ3wbH7bSskSX3Uqjv1cRhX4m5GbAcInKaqc+oe5p45NiMiM1QBlvej4EPK/pEmZ
7/bitaEO/h4IHOqBXOJ3kO8MF6JsYnXbkes1MqcvjsdJwWl7mdgcqBkrZDFH2I9p
/7Qs3RFARJNCKb548GqOIzdECFcwcA2nn+ObB2K1WnQvA/hccK3C/y0VVrJ5rGD9
IPRC5+jVGS0r67qVGyMOYwGzH8OESGTSLX8k8FL3X/M5k8eiwP01PJfnt+wb9j2Q
KA9vcqTCOHU2aoHvVzgUBlfSBRbBWw==
=fCkY
-----END PGP SIGNATURE-----

--jN90vCacN3r3sgFZ--

