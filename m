Return-Path: <linux-next+bounces-8476-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 83142B9A4D4
	for <lists+linux-next@lfdr.de>; Wed, 24 Sep 2025 16:41:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 012FA17F32B
	for <lists+linux-next@lfdr.de>; Wed, 24 Sep 2025 14:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 536C7309EEC;
	Wed, 24 Sep 2025 14:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XtGbaatI"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFE6309DBD;
	Wed, 24 Sep 2025 14:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758724863; cv=none; b=c8wXkgYVYDgyl2MNpyuue+kwzLHIu0rHe0BTKIObccn/0az/Y09sMoVVl9IyINpyXVGnnMv3HlRH2oCwofHEqWWNDwpvUoQ71ij/IhEge8xKmxNjuoLnLZFbx8ahFSHlcHkVDYKFkd8/SF9cbetHSQMRqUSBfXEqUPD5M1aDefc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758724863; c=relaxed/simple;
	bh=EFAqs2WX+zBRi51v4+gqnUMaqkhEuXEH+YcQ9V6gCog=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iuqm9hsfpqwjGfIL3faqR8UUyxNyuaApTuKATjfBmg6ASmIOD+JmJ/0qeCeqOVTHwWWY+xGDZSWeG8lbyCDCKyPxAzqFEENFjPiycfo2j0o57gw0U/onv7wiBIMe+WWplFwCG3PL30VyWcsK6kkIIfM/s+wdkKTkn9SGcHGK1+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XtGbaatI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59433C4CEE7;
	Wed, 24 Sep 2025 14:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758724862;
	bh=EFAqs2WX+zBRi51v4+gqnUMaqkhEuXEH+YcQ9V6gCog=;
	h=Date:From:To:Cc:Subject:From;
	b=XtGbaatIzpX1D15VsfcPpcLI3nWjPUZbBmyhKxaYb4YA2RaRBSXrvVCW8R62KB1uy
	 d1RK9z2ZIi+B3QGSE0ZpjhzOM6H35fbSM1ca6u90t69E9GaV1p93reB8OtNxlAbNtn
	 6WRQVgxo9Hvet97qN5G8QHGuDY0rdAGIs+1ntGRPv4M3FqwMLHC1k0HohcalGdh3Zl
	 qVrUlYFtcAhFJAvR9pXT3Pc28NK2vODKwRwd5+FcTfaJNuRexwIURt2hl2XLQzAI3T
	 wu1KWawTZFOojrG3u3WzCdoPCAdCMzI4e77T0FWB9cov9gzDIMwL+DQjPOM32VJjse
	 L3TsYExmkQfNA==
Date: Wed, 24 Sep 2025 16:41:00 +0200
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 24
Message-ID: <aNQC_Nv03iyldOqP@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Gt2UJl1jZJ9IHh8h"
Content-Disposition: inline


--Gt2UJl1jZJ9IHh8h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

There will be no -next releases Tuesday and Wednesday next week, and
it's possible I might run out of time on Monday.

Changes since 20250923:

The vfs tree gained multiple conflicts with the vfs-brauner tree.

The fs-next tree gained a conflict with the mm-stable tree.

The net tree gained a conflit with the net-next tree.

The bpf-next tree gained a conflict with the net-next tree.

Non-merge commits (relative to Linus' tree): 10946
 11023 files changed, 529132 insertions(+), 204086 deletions(-)

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

--Gt2UJl1jZJ9IHh8h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjUAvsACgkQJNaLcl1U
h9C1fgf+Lp5JnZ2HD/7IWLzTwZEcHNgtaeHf4Xs8dKG8QWyZIPCYU+QLYF7CyicZ
Bvrw0mIKbOBTm+ZTAbc2NPRF7ZlxOP33kAoJXOQWnnFo18UdZ+iVpVFoSnNa8lfn
dl2bW326umMWCJ05wqYzfU/4O4aT+u7xWwHSRz3lKIOWLeIdkIH1wZAtHEfTAReG
XxHUO+NWEhNxetbI3nIPMEkxWtIXytoiRDvukeEEi4C+UeKzG6qNz9fwU4q+49kQ
bEBuHEe6bOwP/9B2dy67smPhYpyw2J5PjJdM2Nsptpb0d3eO4h5XqQ4CE8nXYj9e
6ijduqLyPr5iCN0qXGe8U86KALcdOQ==
=w9HB
-----END PGP SIGNATURE-----

--Gt2UJl1jZJ9IHh8h--

