Return-Path: <linux-next+bounces-9761-lists+linux-next=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-next@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Og3IOzOb2mgMQAAu9opvQ
	(envelope-from <linux-next+bounces-9761-lists+linux-next=lfdr.de@vger.kernel.org>)
	for <lists+linux-next@lfdr.de>; Tue, 20 Jan 2026 19:52:28 +0100
X-Original-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B2649D1B
	for <lists+linux-next@lfdr.de>; Tue, 20 Jan 2026 19:52:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1C5EA78C303
	for <lists+linux-next@lfdr.de>; Tue, 20 Jan 2026 16:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9336A322B64;
	Tue, 20 Jan 2026 16:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IdBub+Rd"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685EC314B62;
	Tue, 20 Jan 2026 16:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768927796; cv=none; b=GLTdbh7CyuParGGwqdRsg4Q4BL9/NbsxWQb0I709IVXaWfQZ57lpXeJfy6l/060AKTZ/5hUrkgdkmJ8mkoYZhPu9rw1nmapMUjIBx/X/xRqbW9BkQ4Vu3n/f+PVv7OsVhZbeyFUPJVZzow2Ws+qlQsY+hum33XcVzujjPhH6uSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768927796; c=relaxed/simple;
	bh=A0IOVveeWsqo96f2qRaoq4F8LbJEl+r0/mwWgcZPNHo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wd6G7ntuEXloKEsIJ7rg6ZZP7r+ekk5ybHgtdlgIKKch2uchXRfSp63rbDcWPl1YrOfmZ31ophngNpMHCOQPte0GL8r7x8BB0qacUGAA9bKvKj2KLQDWam7lnsqJqW7mC683PB80nTbF5t4OUFVaoRvvgTvi4C2Nm9JcX4M+UQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IdBub+Rd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4796AC16AAE;
	Tue, 20 Jan 2026 16:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768927795;
	bh=A0IOVveeWsqo96f2qRaoq4F8LbJEl+r0/mwWgcZPNHo=;
	h=Date:From:To:Cc:Subject:From;
	b=IdBub+Rd/gdSOJqmtfvDbLBvmVHmt52lT8Y/j2y6umBYoabpl//rQC9SkvGCs/15B
	 PNxUVeYN5mu/+SYQ/bJTUGG46NbKPNSlI81sD9cexCU03lpAySiNcLFyVtTmmsunij
	 2dwloQktmBHeB87C+PVb5LqFfugcsxtw1cNaQtxI4bwd03T5LywQIZPvtOVCTNHNaH
	 PgBvqOklvYbXEbe58kf/6hdEeO4NxmTKcNQQmjjmwQw/DbPjva/bFjsFq52oigrw1q
	 GkMWSQ0tRV8obC0TyylW7dU7/zQexdzv/p4F7E3DTpJbfsF5pyF6VmEczQYG0q7Uvo
	 q3r3AHXHduyZA==
Date: Tue, 20 Jan 2026 16:49:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jan 20
Message-ID: <aW-yMOW8SibeqyDy@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jrYKkKLfusiPT7CK"
Content-Disposition: inline
X-Spamd-Result: default: False [-4.06 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-9761-lists,linux-next=lfdr.de];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-next@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-next];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 54B2649D1B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--jrYKkKLfusiPT7CK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260119:

The btrfs-fixes tree gained a build failure, I used the version from
20260119.

The mm-unstable tree gained a conflict with the spdx tree.

The drm tree gained a conflict with the drm-misc tree.

The iio tree gained a conflict with the iio-fixes tree.

Non-merge commits (relative to Linus' tree): 7582
 7402 files changed, 442087 insertions(+), 151268 deletions(-)

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
for arm64, an allmodconfig for x86_64, a multi_v7_defconfig for arm,
an arm64 build of various kselftests and a native build of tools/perf.
After the final fixups (if any), I do an x86_64 modules_install followed
by builds for x86_64 allnoconfig, arm64 allyesconfig, powerpc
allnoconfig (32 and 64 bit), ppc44x_defconfig and pseries_le_defconfig
and i386, s390, sparc and sparc64 defconfig and htmldocs. And finally, a
simple boot test of the powerpc pseries_le_defconfig kernel in qemu
(with and without kvm enabled).

Below is a summary of the state of the merge.

I am currently merging 404 trees (counting Linus' and 121 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--jrYKkKLfusiPT7CK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlvsi8ACgkQJNaLcl1U
h9Bf6Af/aUoqLfdv0R8GefGQg3JECmpaM19DqAfPiZb7vFU48sjcYQqabKUCK1zo
EY5XSrG07b+DGqeKGojOegO3YHSlZRKzdBclrczaPjVaCgAhPGzLqN3wdF9kSxwr
nrmyY8cL8cisznKnDUwFRyGpE5lXOLjpq7nXDr1VV9gjyZumMp2I9pN8YVD3Gq7U
yO+eY+qaMVBRkq9ytekEPiR+Pm3NEGIbdnVifJG7z0bYh91o1fAHMUBn5Z6WJx6H
pIqt8yQlUOch4eG5RWexWKhQ3x/qTAyOe/DzXoBZ0yLvgRtxDCAG76M8VfslDxaE
b9Hxa0kxOEu+4P4V+3OU7PuT3AEKLA==
=E75r
-----END PGP SIGNATURE-----

--jrYKkKLfusiPT7CK--

