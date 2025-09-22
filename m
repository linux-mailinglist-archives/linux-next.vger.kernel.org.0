Return-Path: <linux-next+bounces-8420-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB58B8FFAA
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 12:22:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E97E5188B2DB
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 10:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFBD12EDD63;
	Mon, 22 Sep 2025 10:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uws9FWpe"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960C127B4FA;
	Mon, 22 Sep 2025 10:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758536550; cv=none; b=JaaYgN4NPznzqFhOYGdIj0a/O44MoZmZpPNjW6JMWNzYs1tSa0nP8NekdMq+Z/XK2ll6ruNWWf5KznnzeWzFAS3n+tyOztpbCiry+7q7fMrE76NFs6zPdqPkx9s3tzxZPoVVfRSbtl5xTuLu+Dj7PmslVZgwhMD1yRGuFo+roTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758536550; c=relaxed/simple;
	bh=xwUv2INjmR8kpAihPDaHIfJemY7XBiU2wOe6ys8W1sY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pk7/EqnLRo91QIj2upO/yJXbpa0W1IkSGxYhIFRXsJKFIUS/9V/kfVX/Mu4sF3DH+/2cW2DT8O8SXGbO+blbq0N3q0f+FvsxyPgMOM5AvpGJjYCx1ATO9nP4NYpTZow1tBF7JoagDKNkXRUCqPmAr0mfQat23t37JtfZToAlLZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uws9FWpe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 833DCC4CEF0;
	Mon, 22 Sep 2025 10:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758536550;
	bh=xwUv2INjmR8kpAihPDaHIfJemY7XBiU2wOe6ys8W1sY=;
	h=Date:From:To:Cc:Subject:From;
	b=Uws9FWpei6QBwqT44uTgff5T98CTbD67XowSgfVjvQ6jUcn5NDZzuFMnMiChkfGM4
	 uoTQVw/ibBQnaFthql3E0HjvqYioOCCDD5p2HgzOhq3CJNutwAFBQPuolDqxVSrsZg
	 uyf/pmFl1PsMGKiHo0x7vehqE6eqqEmfFLjtUqHXE8xgqptCkDlVfjwaVasPM+PmJb
	 WYYGu19xrrJYg48S1hKjHWTNOMHCfcQthFQach4oiAvuiWzOBGTVYrxDJllm4gCJ6D
	 iZ8VKc507zjHMZAyO3NnD0/+7D5VtwjHVY4r/wgPA0IEVzAQ/of/nVDgQz3Zx6H1nf
	 IGPf4SgCidA6g==
Date: Mon, 22 Sep 2025 12:22:26 +0200
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 22
Message-ID: <aNEjYlO0jQdisB3O@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QmJYFMt1xDdAS1I7"
Content-Disposition: inline


--QmJYFMt1xDdAS1I7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

There will likely be some missing -next releases Monday to Wednesday
this week, normal operation will resume on Thursday.

Changes since 20250919:

The vfs tree gained a conflict with the vfs-brauner tree.

The rockchip tree gained a conflict with the arm-soc tree.

The fs-next tree gained a conflict with the arm64 tree.

The bluteooth tree gained a conflict with the origin tree.

The kvm-x86 tree gained a conflict with the tip tree.

The char-misc tree gained a conflict with the drm tree.

The char-misc tree gained a conflict with the tip tree.

The gpio-brgl tree gained a conflict with the mfd tree.

The bitmap tree gained a conflict with the char-misc and drm trees.

Non-merge commits (relative to Linus' tree): 10380
 10610 files changed, 506992 insertions(+), 197129 deletions(-)

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

--QmJYFMt1xDdAS1I7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjRI2EACgkQJNaLcl1U
h9DT1Af/e/0xe6T66bLATK42l5X4tBKjOzkdlGIG01xxb3aTtRZRF3+C/MO2hVU9
JU/u3dZ6E2Om12p3Qq0XKuYY4qEi4sFKc7LBV1srAwF+bumU7U/t2Sqc3LLn9G9j
U/BZB7EHUhZjUDeho9umywJbjZSsPBKhT8B06n8LSk/kFvElJ1Ura6W8XPrqmNXk
I4HbUw8XRP+nZPc/MjhzmaYVfcvbblWmZUByTJ4LxAZDlvqgmRD3f4FZ1a4pBsf/
5eHTaQ4fyN7rbZ0li1inqcqUryQSrlP0N5mZGEvUBy1pSFESX1HApm0ayiPzJHqD
2iNHLNlbWYryNvliyemas4DDge2gcQ==
=bE3m
-----END PGP SIGNATURE-----

--QmJYFMt1xDdAS1I7--

