Return-Path: <linux-next+bounces-8582-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 84025BCCD9D
	for <lists+linux-next@lfdr.de>; Fri, 10 Oct 2025 14:18:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 22424354F28
	for <lists+linux-next@lfdr.de>; Fri, 10 Oct 2025 12:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57AE022688C;
	Fri, 10 Oct 2025 12:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kbUZb0EC"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D23B1D5ABA;
	Fri, 10 Oct 2025 12:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760098718; cv=none; b=aEmx97Uipp/blRWsZsNBaLM2Q1dNgivsvcN2lX3M/6chdoe9Eq5+gNWDbOzaNOJvfD5X5mKpiTe2+aVcQK+bWf+QJ887ACkTcDuGHko3CD1ZkUXHNzVbDK5VAvTq1Yf/kpypUmxN/hm6qhlkHr0p9Za7qeTOQp8E+r9nfmvn7uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760098718; c=relaxed/simple;
	bh=XaAJTzrwKbtCoqFq58OYgCAANIKPdfb9MD4t6CNQYrc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uaQhxFFXHc+zqbpfcXyx0vo1N8lF5PQpt0b2umRWjsfqmOKcy2Sd5tqQoMoL7xSBrHrzHZUeZgDoL9TMHmgw0Qd4qfEu9x46X0oigVYFBIvHioQpYH95L4I5DyweKj342Nl9GxDojqF+tHkle3C2SeG2n2ccvYUJpns177l7UkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kbUZb0EC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED647C4CEF1;
	Fri, 10 Oct 2025 12:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760098717;
	bh=XaAJTzrwKbtCoqFq58OYgCAANIKPdfb9MD4t6CNQYrc=;
	h=Date:From:To:Cc:Subject:From;
	b=kbUZb0EC81TpkrcMN8+s2oNQHCdnLmbefEqcbDB6kX6dlNV5H6zgUVlgGjrv6DiAs
	 FixRWhxLkYo2A2H/ntNxzjDmqlOsDOtQI5Q3bMwvmMYbk3t5SUt925zd4HzLa1syq7
	 9bHyH74ZV6+vCZybPjWDn8liLr3n4EstPpACWFfkvFrhJh/j5o6+NMY/u0KRRtHO6C
	 dRVQ/e+APj59qQRzadKT/QcEXAPP1nG5tL7mYOyMVVW08GYS0zYdrrawQyeBroJ0qD
	 6rBNwG+mjUesHwYxUT/XiV2VHraBLZPFjtkIAdobayOXYJbYKluCRQ9L5NKAxYs2xG
	 3wP3sgfN9pFLQ==
Date: Fri, 10 Oct 2025 13:18:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 10
Message-ID: <aOj5mdv2tExl501B@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l6M2lPFHchf7A9MS"
Content-Disposition: inline


--l6M2lPFHchf7A9MS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20251009:

None!

Non-merge commits (relative to Linus' tree): 717
 732 files changed, 16594 insertions(+), 10340 deletions(-)

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

--l6M2lPFHchf7A9MS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjo+ZkACgkQJNaLcl1U
h9Baygf8DivSMGUfz3hu4lTtlsSbQEafNz2k+JWywfNAH4srF0Ck/FXJc3Uuxa0l
lcYMUKH0sinjWCyY2i8pbFeAPlkIC+m3peDSdA5K39Dhou4VhgflLCICJ4xIDr1z
Xq9/i+VLntEfc/YOm/CC90DbDTaSxyL/A6wspl8f+7fwsZxEJwlWn+eymoUxpDyw
J4FwR5BjwXq6Tf7irnXWaQSoSQnl7bfcUov32vaFzwm+DllgDWk84PM8hrQ0ulWT
zjuVVBGhkGau1xYsmq/Q8T3TTpPkE3fGXX36lWGr+lBLf7Orb+Kc4eHdy1OuilbT
9TIxfoy11Das0WuKrKakY6OiAX8Eug==
=ezF6
-----END PGP SIGNATURE-----

--l6M2lPFHchf7A9MS--

