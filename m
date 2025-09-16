Return-Path: <linux-next+bounces-8339-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C489B5982B
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 15:51:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CF2D483B1B
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 13:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 382C431C56C;
	Tue, 16 Sep 2025 13:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P51l/XyH"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1011731B829;
	Tue, 16 Sep 2025 13:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758030660; cv=none; b=ZRKVTNVj31k2egBIQSQ4P0x48XtcXC87FtucoNxmQnivbGCJGyJIekt8jBVnnMyklusyle6ZAeVF9E+0Ha98v/o62likIh1AG9inkJqpWHVAvK2spAq/xFbBvHGLsIcvTi9Bmx78kMfI5sa1nyKR+6Qwf1iEw0tMDOjWvRz/GGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758030660; c=relaxed/simple;
	bh=69o/EQ95fpN67w8vCWm+seoJ3IrbD43o/4ph9YriKHA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CrNTKmpp2ppEgoKmw6HIeqkEEqDfkkJ/kgncrf/Ge4E+hlzVZOjyHYUYJBG3pFrdyjQFYKnlnbn6pwYCKoCOJcktF3bfB16fN30/05vusHQA3Tft3ocxRVJKq7iwK/onMlzmTzqWVUUXYVdlZMJjunptq8rcLdJdnYeeG+UqDuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P51l/XyH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02679C4CEEB;
	Tue, 16 Sep 2025 13:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758030659;
	bh=69o/EQ95fpN67w8vCWm+seoJ3IrbD43o/4ph9YriKHA=;
	h=Date:From:To:Cc:Subject:From;
	b=P51l/XyHroRRYYGM2aEb5DMU5tITsm0pUf2cKD9Oo0zHtYj+Q4ZjFVzCLJvFZUoW8
	 lHOK6nji5GA9x+IOQIJ8kmetws+ZNGwEAKsup56+uXNQCcuqPMi19UnVR1xztFyODQ
	 D9mg4naXUGzGjvAYR3vARWTg1AvcYjWVOAAhxrNlVWwtQXezUBzqTR38qJlX9JMBw4
	 njSFsALYlM2Wf6it346pbeDP5KSsdZICeNeL5az1pinQotTRUvwdetXboQbvLSteIi
	 fDs8t5K61yPpoFWkcNoo+csWwHPGL6OMM56KeCEngNhgWEjgabkOuv6F9ZmOrqffkb
	 r4gya48QSZACA==
Date: Tue, 16 Sep 2025 14:50:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 16
Message-ID: <aMlrQOiK7wMzShfj@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+W39VgG/fvd5wkxW"
Content-Disposition: inline


--+W39VgG/fvd5wkxW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20250915:

The iwlwifi-next tree gained a conflict with Linus' tree.

The kvm-x86 tree gained a conflict with the tip-fixes tree.

The vhost tree gained a build failure, I used the version from 20250915.

The rust tree gained a conflict with the drm-rust tree.

The rust tree gained a conflict with the drm-nova tree.

The rust tree gained a conflict with the block tree.

The rust tree gained a conflict with the vfs-brauner tree.

Non-merge commits (relative to Linus' tree): 8703
 9268 files changed, 401106 insertions(+), 166666 deletions(-)

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

--+W39VgG/fvd5wkxW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjJaz8ACgkQJNaLcl1U
h9DW3Af9FMQjwqKxXJnCFuppTMvdXc3XQyywT8nqmne6JDAaOGGbRmjKNzigNGSX
xTYNwDnfmLGWWqJHOSTOFQEUlVrlDGBDwUi8LwzxhdRY7vzoTVIsDV4HAmz87Mm5
CDg43GiPF3KtDNfqm5HRgt66ys5+Hga31f//i+FNGRnN/EMkurfKcL0BrQw8DMdB
5Jus0DcrUOkRyoj8z8YJeKybQFb9NJUUzEpH3cKyq8+DfVN+6rFk45Y8dhqCAfRx
dvTj96/Q09n51i37IvCwGlUgz+9GkVle5Ja5OmsCv2SRGsyRUcpMB2ezxaPmlKMi
JCe6PtlaMjzoq8bQW3rAxMhi+H68jQ==
=M2BR
-----END PGP SIGNATURE-----

--+W39VgG/fvd5wkxW--

