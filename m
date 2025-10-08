Return-Path: <linux-next+bounces-8577-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B99DBC4ADE
	for <lists+linux-next@lfdr.de>; Wed, 08 Oct 2025 14:02:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C77C23A27C8
	for <lists+linux-next@lfdr.de>; Wed,  8 Oct 2025 12:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A54142EC568;
	Wed,  8 Oct 2025 12:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S1U3OHjj"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E03A1A76DE;
	Wed,  8 Oct 2025 12:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759924920; cv=none; b=k0e55o5jIBDYtscIU02XBLiUjEfE7zwfY7rCJWC0NiaC14v+AJ3W2JMN8zxOdUvjGGEm0Wx4OExBOXCUXjfaZqZJ0XQCcpyAP6SqMdQ9O3IbY+qF7bT1otE/CNWTFpdL2DMXMJYJopqjv/LRZZAjaYSY5aPUfQ+4ZxoTinj9Scc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759924920; c=relaxed/simple;
	bh=pCGFR2WQyd0jfnxCID5yVMjr66ww/UuCU8U4K4rM7zI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r87fK34SjOWXCqeLYq4vTMNzShJNIxUdBvoudMH65KeIO+CYdnIk/I9GS7FkbvNk4FGD3ymg2J8nJsXg3LipfI8hOhh8KPeBnQHXQWVwXZUADyT2xku39iIFzOTaJMFv+bLaPjlBZry6BwQ8Wgk/Cf2R9GBEtuGwN9ueKbt1Pss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S1U3OHjj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8035C4CEF4;
	Wed,  8 Oct 2025 12:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759924920;
	bh=pCGFR2WQyd0jfnxCID5yVMjr66ww/UuCU8U4K4rM7zI=;
	h=Date:From:To:Cc:Subject:From;
	b=S1U3OHjjcVZNK6xyE4nwquKhjhPV+i4RGjLvwcAhVDQpF3/EOVblsNyJY5XQYAPwQ
	 OyXKImO4DeqV6eCFOpt9NBFfo2iE7foJdkz4Kx7lDT0jKtRtAA1WFTfqseT3IpG7/K
	 ZNJoomGGMMODY6f1xQX0SNW3K2k4UdiZggon6RzplDcG4c8KhDofkK3TzLnKNBcGjm
	 63xwERthRjAcQJUjmimIhZce7PfS75Rx4hoE8EBlKf8+RCnGnhrWj2gixJW6OTac99
	 5OFX7FetfsDJoae1+1L4cRyi9iNJPWGCSH9yB6OsTciR1szFiJLDKYIxUe9AGuI4MX
	 Sbxgi0YVTQuww==
Date: Wed, 8 Oct 2025 13:01:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 8
Message-ID: <aOZStXckQPBdDyGh@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L2L4lxyZv2PKYsAR"
Content-Disposition: inline


--L2L4lxyZv2PKYsAR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20251007:

The drm-xe tree gained a conflict with the drm tree.

Non-merge commits (relative to Linus' tree): 911
 1122 files changed, 33511 insertions(+), 17309 deletions(-)

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

--L2L4lxyZv2PKYsAR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjmUrQACgkQJNaLcl1U
h9Cl3Af+PmYqpXF1h4YMfQ8m3a6fTeUL7U91mgE0k0JU23+C4BHnyspB/H405ybR
1kI9sokGTH+65IZbedf3q0ACxkASEn2zKWKnweAN7ALThydSPyEs3H5WJmlDStLx
os0kOTKN0Mdmsc+TgUFu71XJ7Gs6jY76xzL+ud79s/DvTMQCrmMCvclXUkqKNyHF
iSnjmcy+UMdrdR2a5ditFCwRX8FAVXzVr79RtJKnwhmIT9GbGWo1GBdPCiWWtBxe
uBMIf67nhC0gA16UPC9S61POCMYJhJt7K8ccOmf9BsLfUMdv+I2Z3FVnOK6nCRks
2+cUZtNTAT+VJmrSYCSM67670LGgrg==
=R2aq
-----END PGP SIGNATURE-----

--L2L4lxyZv2PKYsAR--

