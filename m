Return-Path: <linux-next+bounces-9706-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D774D3B2BD
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 17:56:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50989318B769
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 16:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2AA438E102;
	Mon, 19 Jan 2026 16:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N0tGkDuB"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D2D38BF7C;
	Mon, 19 Jan 2026 16:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768841034; cv=none; b=gpCRhFHb+0ZXEUewzqN11c1CrYaQ3Vk70WRuJ6ThpfxGSe3LQqHEiBe6oU15Ck8MDiqUQdX9NfDIb5YY+6F7LFkWaeldBQCDxeo4czL2j2roIP/MDkLFA3/kfsFpl9hxuJDUWwqrbibg9axrbOVU9ANX5BI1v3xGGgIA7HVF6yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768841034; c=relaxed/simple;
	bh=d8AVeTir0xGV9ekbuo+6Oa0mwklC2KUedQbU35dHluI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ya7RbXIATNPMUfxoV3TdyRKxnpj/aIYRUtKJUlhU3Ln79mNU7+PL6ulNKhAcNiODNXXSyA+EnbmpzCjLUwKZjOPDIaOBUi3VGVGUKu/4VQTrtvTizJK86YQO3WE+3HcrhKFGe2UoDJXKNKpGda0ZwZ4AHAyA7GNrQIHaisSr9Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N0tGkDuB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FF0BC116C6;
	Mon, 19 Jan 2026 16:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768841030;
	bh=d8AVeTir0xGV9ekbuo+6Oa0mwklC2KUedQbU35dHluI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N0tGkDuBQ7fcTEZI/udm/jOL1Hs/C9sTakYbMdGUNLph+QqSjlMgQd/klg4hck6JT
	 4woupGlZ05ULypweEBu+xRJT2zT+27jYfvO8wttcQ7bC+5NOeDLmjP5kneaN+30c6J
	 gfkdOT4UIrmK62v1WZ+bO0x/ssD0Unb3wliD95JpzdrpgoGSlm5TTFPWvMYixea9q3
	 H49KqOFp4M6Ki1eVb7I/mcOLLK7lohR39qd/GM2nJZkTMKrfpipafQZUKQG+QcM2fb
	 g6n3Dpy6GneTfYljGODTiDZEQ/0pfaydofdszC8u/m09Osc2UgoEZ9tXE9LPuZZHej
	 8RmIPOxSQf2Gg==
Date: Mon, 19 Jan 2026 16:43:46 +0000
From: Mark Brown <broonie@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	Namhyung Kim <namhyung@kernel.org>, Leo Yan <leo.yan@arm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the perf tree
Message-ID: <576e6cd1-7009-4823-83e2-bfc66fd786e1@sirena.org.uk>
References: <aW5XSAo88_LBPSYI@sirena.org.uk>
 <25abe5e2-463d-40b1-8f7a-09f845d042ef@linaro.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QNbkedN8a+hDYSao"
Content-Disposition: inline
In-Reply-To: <25abe5e2-463d-40b1-8f7a-09f845d042ef@linaro.org>
X-Cookie: Does not include installation.


--QNbkedN8a+hDYSao
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 19, 2026 at 04:37:12PM +0000, James Clark wrote:
> On 19/01/2026 4:09 pm, Mark Brown wrote:

> > After merging the perf tree, today's linux-next build (arm64 perf)
> > failed like this:

> > Exception processing /tmp/next/perf/pmu-events/arch/arm64/arm/cortex-a510/pmu.json

> Do you have a clean checkout? a66f6242fbf52 removes this file and at the
> same time removes the definition from common-and-microarch.json. I think you
> would get this build error if cortex-a510/pmu.json exists as a stale file
> with that commit applied.

No, all the -next builds are done incrementally so the working tree will
start with whatever the last commit that got built was.  This would also
break bisection cases...

--QNbkedN8a+hDYSao
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmluX0EACgkQJNaLcl1U
h9CEywf+Jt6UX7abWPd7ZrjksCqhtkzKNKZQawqP5116dtiMM63+8/2ulpvW4+Gu
xyYOEr6vLWpEHRRaALDH6UKHJSy2v35QVVXDvJczqjuSsXLvX0/Xl19woBZ6GlSD
R40KhcWOGhK+rpPBkXUaMPfUHNH/EhP+V3DOFCAGh2pyj6q9PnbUqtu2nNRkHnao
aANSM6P0E5O3WYH+KflxQeZgtK1HJhmOfuVCvHvl7AzVY0Bmh4VT7r3q7FHBRu8f
po/MQYe99kaZUUHQsfEkozNuxgJaCAj5hHbIdPvYSv4NuJcd/iArQo4zeMLs9PSo
gZRzlASs+JDCEq5DVrxx128vI/D0xw==
=uQOD
-----END PGP SIGNATURE-----

--QNbkedN8a+hDYSao--

