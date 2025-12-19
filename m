Return-Path: <linux-next+bounces-9489-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BC9CD0B80
	for <lists+linux-next@lfdr.de>; Fri, 19 Dec 2025 17:04:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 34003304A514
	for <lists+linux-next@lfdr.de>; Fri, 19 Dec 2025 16:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 202A6357A5E;
	Fri, 19 Dec 2025 15:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mdHtXuMJ"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC23A357A5C;
	Fri, 19 Dec 2025 15:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766159357; cv=none; b=I8oxRoZDj1WNdca3pUNc/K3o3WLNVWW46Qps3HRm4n8OFHrdv4kMRiCr+TKTF/MnGNr1NEoE6YTXmmFvQl1ktbPqI4gTQVl1K6N+PgyYS9g/dztXxOKfnpL/lD67QWRNxRExPVChagTaSGPn92VPooAIAU09a/R/MZQ7HDMlKhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766159357; c=relaxed/simple;
	bh=dmYP7jgs40p5MHPJ54Rc1lvqarSb3+CucTYGQZSL7LY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P8YLWLqRSoEPv1OWNP8oVozky3ZpZ60d1YsvYnaRMzqWWGUaHsiPm/ZkJcI30RnWqfpZUg9c71Q//BOBL0irNE6bz5EPLPeWYaU7vVtnraLA4XRhyhwq921JUl11W7QjVKq5UH1tjM9orZPXAK/CJX5FQuOMab5nZHm/IML9UvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mdHtXuMJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A717C4CEF1;
	Fri, 19 Dec 2025 15:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766159356;
	bh=dmYP7jgs40p5MHPJ54Rc1lvqarSb3+CucTYGQZSL7LY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mdHtXuMJqezwRPhKCcBOvQYVgZUYrubtl0MRxxroWYXADDf4zuwShggyudb+aoH3U
	 1I6D/z6Rji3JBrrtBSl4YHg3ipit8cF/fwzTivv1vlm0NU0IMFd4qfwF/eU9QMpmH0
	 swWbBFAA012Zvmn3MbMoHtUrrPSWycpl/Uyl9dCl9Bki8kQEdnoo9Gusr6IfgYRSKI
	 UYO9SGl7nUahZgE9KXV2mRtvt+/Nnz8znIHGiFw5yJ+e7G2Fgmo9dOuYPdWVQ0FXaz
	 W1Gwi/Il2h+/8U+YSSN0GEBxuywmtQzuyhMTtUDADhP7Yi88Bb9xl46mTmFyHf81zl
	 hBUU9S6N20T4A==
Date: Fri, 19 Dec 2025 15:49:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Matthieu Baerts <matttbe@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	MPTCP Linux <mptcp@lists.linux.dev>, linux-next@vger.kernel.org,
	Mat Martineau <martineau@kernel.org>
Subject: Re: MPTCP tree in linux-next
Message-ID: <56a0f49e-b5ab-47f2-a0b2-2ad4e991d056@sirena.org.uk>
References: <f39f437e-7ff9-4f52-bc6f-974f54f42260@kernel.org>
 <38d74d9e-9da0-41b8-9721-3de9aa355c21@sirena.org.uk>
 <09460b1f-ce96-4d8d-a94d-0d0890981cb0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3bm7xhsHdtjN3W/9"
Content-Disposition: inline
In-Reply-To: <09460b1f-ce96-4d8d-a94d-0d0890981cb0@kernel.org>
X-Cookie: Save gas, don't eat beans.


--3bm7xhsHdtjN3W/9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 19, 2025 at 04:31:25PM +0100, Matthieu Baerts wrote:
> On 19/12/2025 15:30, Mark Brown wrote:
> > On Fri, Dec 19, 2025 at 01:35:51PM +0100, Matthieu Baerts wrote:

> If 'linux-next' already contains a merge between 'net' and 'net-next',
> maybe it is fine to merge a branch also containing this merge? But I
> guess that's possibly not recommended if conflicts are solved differently.

Yeah, if the resolution is the same it's not an issue - it's if they
diverge somehow that there's a concern.

> Perhaps it is enough to work in a "best-effort" way and to provide a
> "pending-fixes" branch with only fixes on top of 'net', and "for-next"
> with patches that applies on top of "net-next". Conflicted patches are
> skipped until the next 'net' / 'net-next' sync.

You could always start with that and figure out the complicated stuff
later.

> > If you were to switch to sending a PR of the actual commits in -next
> > that'd make life easier but that'd need you to work out the workflow
> > with whoever you're sending the patches to.  I guess you could adopt a
> > hybrid flow where you use TopGit with regeneration until you send the PR
> > and then freeze the patches included in the PR?  You could use the PR as
> > a base for new stuff while it's in flight.  There are trees that are
> > managed in a patch queues that use a workflow a bit like that.

> Indeed, it might be better to do that. I will check later to put that in
> place. I guess we mainly have to change the way patches are sent.

Sounds good.

--3bm7xhsHdtjN3W/9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlFc/cACgkQJNaLcl1U
h9ASHQgAgZZLiOQ0VI4Isn32CBxAY85Fw11ymgRzMaALyWnHOwXdnQI/9o+aHq/f
4TayfIhoq7b4P1bzSU4HLPauDV/Gs6zvaQLGjl56evSnozrsuTWr/733dzKKN27h
xnrTUXHgmlAIk+b4OG0xijdbLFteGNBlzjjmu8unLjZPT1xY+RD4/o4xaYVPlkbQ
DpF9Lqskqu9c8AetBzHBzi65Wm6zu34xnmEZivZgDYeR44FyXLlKJ5j0Q3svgX4k
ibF2Msa5ocmfx6WyvFidW1/8d3onrz06r+HRrToD9NbX9UMK4zoMQMaLGpgjTi+w
UYzQ1120oQqw8wGaaXuT5K52SjcPCw==
=spfM
-----END PGP SIGNATURE-----

--3bm7xhsHdtjN3W/9--

