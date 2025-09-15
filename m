Return-Path: <linux-next+bounces-8318-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC28B58809
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 01:10:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3D911AA6F38
	for <lists+linux-next@lfdr.de>; Mon, 15 Sep 2025 23:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E82202C0F64;
	Mon, 15 Sep 2025 23:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qf7otpS3"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD02D2853F9;
	Mon, 15 Sep 2025 23:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757977818; cv=none; b=a6xkJbvsF3TjkG5PZNAOX/hAcWTyS1btDIWaUaOMkJzaCx/FlCPjF0OqEWm4K6YYPmdsC8TUV3Ib7otvOFQtLVuPcH20gTgyLjwWU7tOj5YbZKSwPOwDlAutB20tgdYv1tHf3RJUFDqq/uvXWEnWeSDL9bLOxr4PuxKOtGOrnXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757977818; c=relaxed/simple;
	bh=13MYMiQNNnoaysHdorTcphPwlnf85CNeUdTfjy/nsyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mxKb4BFiU8eZQ47QVovtR0QISdxcy1r/PoevJm/wNhRAAcObtfONvd4ia2laVfJgWxVG8exge8iUtVIZ1IykZVB2OEuXiBoSH/6nCwjIVP/J7NhWVaHNSLIIvDv8cabmNWbK+JmPwgt+yMsP2dlmHpUw2+YCEVlsECsK5KGS5dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qf7otpS3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2143C4CEF1;
	Mon, 15 Sep 2025 23:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757977815;
	bh=13MYMiQNNnoaysHdorTcphPwlnf85CNeUdTfjy/nsyQ=;
	h=Date:From:To:Cc:Subject:From;
	b=Qf7otpS3cGLqR+xxwKG5mTwhIRItqiunGCGUU2fRJljNg23MVAzmc21DKFoJeUuKp
	 AbWr3/X0D4E55TCM9+3/fzJnF7F6O1ienv4W+9AGAz2Jk4pvojm1ieHpvWMtKQwmfV
	 EsVz7+8z4+02vgSs5Wmiu4XP9pDHYWR0Lw8uC27JKfEpS3NPAPyuDHmcMCEV+i8aOP
	 lhbZyf0IlUJFAgFaGwMkiSWsDOwHEvMdzG2XNsoSzqDFCKtu9H1Yq4oAw8n1+nIeDj
	 2H323W383WzaYsuQ+kRE647x3tRTAQSW4FTl0KdsngYVgMvmIjNnr8mbcTo56vNKvn
	 jT0i+9ofou7MQ==
Date: Tue, 16 Sep 2025 00:10:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 15
Message-ID: <aMic01RSsx5oaNhX@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cV2ZPHyEzqbZhFM/"
Content-Disposition: inline


--cV2ZPHyEzqbZhFM/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20250912:

The vfs tree gained multiple conflicts with the vfs-next tree

The rockchip tree gained a conflict with the arm-soc tree.

The fs-next tree gained a conflict with the mm-unstable tree.

The vfs tree gained a build failure for which I applied a patch.

The i2c tree gained a conflict with the arm-soc tree.

The i3c tree gained a build failure, I used the version from 20250912.

The drm-xe tree gained a conflict with Linus' tree.

The tip tree gained a conflict with the block tree.

The bitmap tree gained a conflict with the tip tree.

Non-merge commits (relative to Linus' tree): 8490
 9067 files changed, 394959 insertions(+), 164777 deletions(-)

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

--cV2ZPHyEzqbZhFM/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjInNMACgkQJNaLcl1U
h9AfKQgAgjyvFBBK8pLGrL8DZLD7u9kUQ9OADaMIAP12ouAv6k02L7Bc4DbPWhkF
OPAZySVQ1WjVVczEyil/XbIeXO6OTf+xvQ5+qoEZMrGvD4n5zYrkrNPHoqpkoNLA
0ApLgzMApghiEDg8qDnKFF4PkuZJILagEM6Y7rKY4ByY1XDfT6F3ldw1GLzKHp3H
9X1YErmurjJFEkYvj7mqR/sDL9OenwAktol50yhkr2P8Vogf+p8+dNinHzZ4WWt0
BMtR0iH8nclcvtnxSfp8s9RdwQ5Es4RraZY4ReAwlIER83ul/7UX+swisjbLkmMH
kXF0VKr+paOrVyUInrsMhlEh4eAcSw==
=tWg2
-----END PGP SIGNATURE-----

--cV2ZPHyEzqbZhFM/--

