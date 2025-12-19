Return-Path: <linux-next+bounces-9487-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4979CD0438
	for <lists+linux-next@lfdr.de>; Fri, 19 Dec 2025 15:30:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 63FA2300B907
	for <lists+linux-next@lfdr.de>; Fri, 19 Dec 2025 14:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43D13333426;
	Fri, 19 Dec 2025 14:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hUeuMJXL"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11715332ED8;
	Fri, 19 Dec 2025 14:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766154640; cv=none; b=NGCyGSyAt2nJXnUkOAhsFBnpmEFWKlVwRw3xdfTXk7Jopcyhf+1XW/MpWVL8i1/UgJ2XookxVNTsWnKPyZZGmaF4ysris0k0crnTob1B+opj88ScbsBCFW43gjKPWVa/g02e4zahLsSvXKcGVgGtJ9ljERTYfUd3LtqztPgX0qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766154640; c=relaxed/simple;
	bh=xH/ACPQUzXF3BARnso6it1/yOonAFXPzNdFt00iZ3uE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jwttieS6eGxlycFpbPoknIKa4Gz2EAulyurtkdZIBA5Z4Ru74FFqgRs5QJtRx6OcfR9EHZgis5orDTHKB73ikSX3uSvYWBaF8x6znV9KCXEyhs+TvO4uHlImwo8wcQvkmXq++XkfYFNlurELOTwLfW28pMtuNyasUd+65wL63NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hUeuMJXL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77924C4CEF1;
	Fri, 19 Dec 2025 14:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766154639;
	bh=xH/ACPQUzXF3BARnso6it1/yOonAFXPzNdFt00iZ3uE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hUeuMJXLLzCtaR7HjU1pGcFe4yhrQq/bvN0X+4m6ioRuwqp8Lvw7Lfj28uylKQKpp
	 vwlgk9U1jqitcbyxZi/6FUaDlCCCjou+fJw4PNORZg0yezehLkV4+9KqJSrmQMeVeB
	 Siodp/+W7+w+RbSrijwoWnznTZgqB0L9LMZUcFpH4AA5sO6paWB4zzTkE/qHRihZGs
	 5R5oIRy2rNQgdNLRz5snu4WSmStvcktpzGeIoogMToGgbhKNWa3t5ON7p/L/LVoKCM
	 HU88Y2dltnJI+sdJAc0WA1elTNIZXsaZTM9W6ecR9ij52XZm6krqeCDWHZ9ShpDAQp
	 GyegyvGIoe6wQ==
Date: Fri, 19 Dec 2025 14:30:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Matthieu Baerts <matttbe@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	MPTCP Linux <mptcp@lists.linux.dev>, linux-next@vger.kernel.org,
	Mat Martineau <martineau@kernel.org>
Subject: Re: MPTCP tree in linux-next
Message-ID: <38d74d9e-9da0-41b8-9721-3de9aa355c21@sirena.org.uk>
References: <f39f437e-7ff9-4f52-bc6f-974f54f42260@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O2BBUHuEsBdZksOq"
Content-Disposition: inline
In-Reply-To: <f39f437e-7ff9-4f52-bc6f-974f54f42260@kernel.org>
X-Cookie: Save gas, don't eat beans.


--O2BBUHuEsBdZksOq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 19, 2025 at 01:35:51PM +0100, Matthieu Baerts wrote:

> Currently, we "export" commits from the TopGit tree in two branches:
> 'export' and 'export-net':

> - 'export-net' is on top of 'net', but it also contains patches that are
> useful for our CI: fixes from other trees, temp workarounds, instruction
> files for the CI, extra debugging, etc.

> - 'export' is on top of 'net-next' and 'export-net', so with the extra
> commits for the CI.

> For linux-next, I guess we should remove these extra commits for the CI,
> right?

Right, we only want changes that are intended to go to Linus.

> Would it be OK to add one new branch containing both the fixes (for
> 'net') and the new features (for 'net-next') on top of 'net-next'?
> Sometimes, we have new features that depend on fixes that are not in
> 'net' yet. Having one branch should help here.

One branch is certainly OK, though it is desirable to have fixes
separately since as well as the main -next branch we also build
pending-fixes which includes only fixes, the goal being to validate that
there's no unintended dependencies on non-fix changes.  That's not
essential though.

> With one branch on top of 'net-next', we might still have issues if some
> of our fixes for 'net' cannot be applied on top of 'net-next'. A
> solution would be to have our branch on top of 'net' and containing:

> - MPTCP fixes
> - a merge commit with 'net-next'
> - MPTCP features

> Would that also work for you? Or do you prefer having only the MPTCP
> commits on top of 'net-next'? Or two branches, one on top of 'net' and
> one on top of 'net-next' (without the patches that depends on the ones
> in 'net', not in 'net-next' yet)?

We generally don't want that merge unless it'd get sent to Linus
eventually so your second option feels like a better choice here for my
money (Stephen might have a better idea here though?).  I don't know how
promptly net-next gets the fixes merged up, or how often dependencies on
fixes is an issue.  Do other net subtrees have workflows for this, I'd
imagine they run into similar issues?

> - Our patches are currently sent as "patches", not in a pull request, so
> patches will be applied with a different SHA.

The main issue with that would be that it would create work with the
duplicate commit detection and reporting we do which would get annoying
for all concerned.  I suspect the actual merges would mostly end up
fine, git tends to figure this stuff out fairly well.

> We can certainly easily change both points if that would help you: when
> the sync is done, and send PR instead of patches. I guess we could have
> situations where when 'linux-next' is rebuilt, a patch would appear in
> both Networking and MPTCP trees, which can confuse Git. Maybe changing
> our workflow can help to prevent such issues.

If you were to switch to sending a PR of the actual commits in -next
that'd make life easier but that'd need you to work out the workflow
with whoever you're sending the patches to.  I guess you could adopt a
hybrid flow where you use TopGit with regeneration until you send the PR
and then freeze the patches included in the PR?  You could use the PR as
a base for new stuff while it's in flight.  There are trees that are
managed in a patch queues that use a workflow a bit like that.

--O2BBUHuEsBdZksOq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlFYYsACgkQJNaLcl1U
h9Aqsgf+KCNzeCnO7+FBEkyu5vWMXcgmr6wWvdHVCFpGWyx+vYBdQKOM2pIKU++R
7xMcUvGxNsUrmlHiq+WwwPHYkmobhbS5ejBUnyi1PZguoi9leOa99ZhePiPDIj++
G/DwSXfdhhNp2meT4njOf3NSjJgzfxZ5uRisjtm1o2+/EJqxoCD2MWH8nqQX2i9r
8jRwRTCqoKlrH/LbFM5nmQeH+4S3riA5XkH+KoRkQiqjI+zx1EQvlblUcTakkfAV
JwsHuuNT4/6eN7LzL4ZwzvqQ4hc47V19UGdBNAakh/NwFuvYjRCGOLBbRG/Nl8Er
cfh6VPqhXaYjOQLgMMExdtlCdIcbLw==
=ujer
-----END PGP SIGNATURE-----

--O2BBUHuEsBdZksOq--

