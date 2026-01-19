Return-Path: <linux-next+bounces-9723-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B4BD3B746
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 20:30:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 82B6C30066FF
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 19:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C3A2C1598;
	Mon, 19 Jan 2026 19:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uFJegnuj"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169FE274B5C;
	Mon, 19 Jan 2026 19:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768851003; cv=none; b=d4KdlV5Y6s4tRSw74aXQCGYye9xc3nHNBIyAO5nh2fb4J4v76tajNNf+H4Ni+YfH8ykqFy3OJDqTPOCOPWOLkmuCdP/Hbr3X/Q587WnpDOX1sMgsRkiwqr0ToZEpR3PyHMZlGCy5YTM/vdQQ/hWfVd0HNtH2TkM1Mh8R6pP8O+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768851003; c=relaxed/simple;
	bh=P2A0DS2z28mEambFDxXhMGODuFLp5NKlAC2IerGzDXY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aF2iob9zU9es7sMyQ9kSzUJMBUbd7nYpibgE2f4mXJQmkahrLpjpjD0Ue+4BcIeGR16pbQTNA+BvWoBpslcd3AUqW1H0wDMBCDWQpACCYxvX5qaXbhupcvjvF3nUCUsODgVV+nfrw7q0eGrOtaKajF1Kk13FNrSXg4yt6Bct7Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uFJegnuj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44617C116C6;
	Mon, 19 Jan 2026 19:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768851002;
	bh=P2A0DS2z28mEambFDxXhMGODuFLp5NKlAC2IerGzDXY=;
	h=Date:From:To:Cc:Subject:From;
	b=uFJegnujlTn7a5MnOjeGQkwsTsP/7OBHv8YjrlAtQFNn9DKW32Y1ZJ45fD5KNi2a3
	 h+LfMZDTKBjb71oi6ZkyEpz2a7heFsaseQmfl4LuUAaOM6ophuaQ/s5PG9qO+bQki5
	 MgMbXyWWfjVOn/CxFopCw5JB49LCMc1cAA0tofL29NJ86CiNS7mUDcWheHGaXHcdAj
	 hh98ScMuhZlqeD84fwckpWGySPC+iHJrWQ3HGA6h6fLJgkvR9ZU54Xe/GHjpWcUD91
	 Iyx3CmY35zBouNbTg3aYcvIEemnq77kBvRTI/wsJ0xj3hxQNQcMez0UiP/coxdxjt1
	 YXRSGKH/pfGww==
Date: Mon, 19 Jan 2026 19:29:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>, Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the driver-core tree
Message-ID: <aW6GNvuQVNCUcoy-@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Wgys3AYZIVF80ri7"
Content-Disposition: inline


--Wgys3AYZIVF80ri7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the driver-core tree, today's linux-next build
(x86_64 allmodconfig) failed like this:

ERROR: modpost: missing MODULE_LICENSE() in drivers/base/revocable_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/revocable_test.o

Caused by commit

  cd7693419bb5a (revocable: Add Kunit test cases)

I have used the version from next-20260116 instead.

--Wgys3AYZIVF80ri7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmluhjUACgkQJNaLcl1U
h9A2JAf/WP/ujPwlifH7zA7/JRh8no0ae1RPybvEHuEZIgT4Y9YWiMk7qRsV+Gox
i/77rgJNjkB6ada1205YQwAzz6nXO68a74Dd8lsIpXagVFPcp1mLGSxm6Cs1U7wN
nu4xf13m8oxT2BTBgLcFhHyvPapvlNXPsUgaj50x2IvKCGioZ7kB9lyjbC0V+TYc
pWdPmnK3ra98XhlC4Xh29yine11JQdbqWuKz+C0ZHFkVp8L9jn7uoZz1tb2Q8Wwk
6v3Eat5949jgLbu/C0lOKQgg5m3QcFfALnrf4gcOCtvhrrY27Jptw9MCYxHKctc8
OT7ymoizuREbadQA3uxbvTStsde1Dg==
=lIx5
-----END PGP SIGNATURE-----

--Wgys3AYZIVF80ri7--

