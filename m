Return-Path: <linux-next+bounces-8917-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 40430C489A9
	for <lists+linux-next@lfdr.de>; Mon, 10 Nov 2025 19:38:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3C0DD4F5A79
	for <lists+linux-next@lfdr.de>; Mon, 10 Nov 2025 18:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4504531D75D;
	Mon, 10 Nov 2025 18:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IdYG5yJL"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A1631D72D;
	Mon, 10 Nov 2025 18:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762799531; cv=none; b=eBClc9G7OG5TPlFZ8ZCdq/RZABLwZrKrCTxZz4ucIdZqj/G2Hwx7LutLwfnAU6CURY1ygpWKfyy1fzlXSizXa7QzotOlaeo6lHbdLYHcO81DaCVE4xS0hjq9rcjNinRSxN7xv2xjP2b9SljXJeLoBOM2AB6+IjZ6y6pNGyKEyD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762799531; c=relaxed/simple;
	bh=BTRplCCHPczrZhMIDCxF5mqdQYsf+JH2XCbk3qFQ6N0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DwRDj24BB0fSOATHEwoWoLXZfnL0EF3sionnAH0xGEqpKGqD55eVVYyCIW1qCuuZk5CIZEOC5ggnM8qHa+7rAhouAhaI1MWHnbG9t75qiIZurAz54TEVh3pSSFvzycgJ5oZXM+A6D02PqZVMKWlCEi3NZzk/4TT+Jyf4WcAmeZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IdYG5yJL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 520E5C113D0;
	Mon, 10 Nov 2025 18:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762799530;
	bh=BTRplCCHPczrZhMIDCxF5mqdQYsf+JH2XCbk3qFQ6N0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IdYG5yJL3Fz3o7Tdm6oYFGRFwqlvLC6LbCgJwDbFWk7OkYbjnfM/BMxOiD4PNSKvw
	 vnMGjjmgbv088ZqB8U1JoIA+lO5mxPvfFY8UNo5Ixxb6JSOazGOeraJC8VSlGtdGBb
	 ceLVuXdDC8rsGign0NQs/YGzK5BQQMjCDQVZdg7vKZZvFHnLykn9o3BnUrvTmgmQ5E
	 szmaiTchR+NAO/SsMdQrZeBGzQCWxGrbZgOiRBtSNGgGrq7zY6FGgiSOxwUkB64q1u
	 dq1vFgtIjnIEPpqvALYJcDa7uOyKMs4EK8ytUQcMrChxtwHpS9G7biEzA2kcv+toDB
	 cwQ8f1tdPFXkQ==
Date: Mon, 10 Nov 2025 19:32:05 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Daniel Gomez <da.gomez@kernel.org>
Cc: Daniel Gomez <da.gomez@samsung.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Sami Tolvanen <samitolvanen@google.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Michal Wilczynski <m.wilczynski@samsung.com>
Subject: Re: linux-next: manual merge of the pwm tree with the modules tree
Message-ID: <6ydyoh5yfqk3qwha2lysmqohvh3ffhmv52yph4aqzq46eaa7t2@clpm2eqydmpi>
References: <20251104104827.1de36ea0@canb.auug.org.au>
 <20251104105415.68bfb090@canb.auug.org.au>
 <f374sh5rsbxvboowft6xpiimxlzw264i32txgiok53on2vxxu7@lpetaklaofzb>
 <ad9c5b79-8a33-4183-a048-48ba516e6aaf@kernel.org>
 <26c7zdxc4nv3wx25xferlggtjipigtd3tc6fk554g4tmqsuvmr@e6cll772nz2r>
 <2b53a2d1-3e86-4558-ba7f-5ce3b1368f0f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7rfnzqrclml6k2z3"
Content-Disposition: inline
In-Reply-To: <2b53a2d1-3e86-4558-ba7f-5ce3b1368f0f@kernel.org>


--7rfnzqrclml6k2z3
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: linux-next: manual merge of the pwm tree with the modules tree
MIME-Version: 1.0

Hello Daniel,

On Mon, Nov 10, 2025 at 04:54:01PM +0100, Daniel Gomez wrote:
> On 10/11/2025 16.42, Uwe Kleine-K=F6nig wrote:
> > On Mon, Nov 10, 2025 at 02:59:15PM +0100, Daniel Gomez wrote:
> >> On 07/11/2025 17.44, Uwe Kleine-K=F6nig wrote:
> >>> Given that the conflict resolution is non-trivial and we already know
> >>> what to do, I suggest you merge my commit into the modules tree.
> >>
> >> Do you mean creating a separate branch that includes the conflict reso=
lution, to
> >> be used as an example when sending the PR?
> >=20
> > If I were the module maintainer I'd pull
> >=20
> > 	https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git rus=
t-module-namespace
> >=20
> > into my tree and include that into the v6.19-rc1 pull request. That way
> > the merge conflict doesn't happen at all for Linus.
>=20
>=20
> That's not my understanding on how to deal with conflicts:
>=20
> https://docs.kernel.org/maintainer/rebasing-and-merging.html#merging-from=
-sibling-or-upstream-trees

Note the "don't" described in the docs isn't what I suggested to do
here. The rust-module-namespace is a change that belongs into the
modules tree and that I build upon in my tree.

So this is (somewhat) the case "Another reason for doing merges of
upstream or another subsystem tree is to resolve dependencies". Only the
merge direction is wrong because the usual expectation is that a change
to rust/macros/module.rs originates in the modules (or some rust) tree.
But for the justification and also the resulting commit topology that
doesn't matter.

Also "[back merges] will significantly increase your chances of
encountering bugs from elsewhere in the community and make it hard to
ensure that the work you are managing is stable and ready for upstream."
doesn't apply because by merging the suggested tag you only get a single
commit and not my complete pwm tree.

If you want to convince yourself this is in fact quite usual I suggest
looking at https://lore.kernel.org/all/?q=3Ds%3APULL+AND+s%3AImmutable.

Best regards
Uwe

--7rfnzqrclml6k2z3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmkSL6IACgkQj4D7WH0S
/k4FoQgAqzJC4KCpwOTjrF2iXkDPYEi+ohaej7Y7xLMCuKBxGSY38wFFFo/Xov0c
L8spyKy7vezgh6WTxVzLTgaNUdGVgfIycC0fzYiQ4gWn4BUO7I6FhUTCrzLT4uKw
pAYrfYe8pb6+NhyixRMx5DCzru8wAWBLEsXjYs+2mUqcTGCtViRnHR3CJkjYlBda
uill8bZlR2W5xR4gR1TmAbXzjRpf1lVL2ReRcNbk/chgmn6TJH1OwFcw03E+KGIf
jQxy6AgFyLCjGm8QGhFWPIEMudNJmUaHAVHz7DbCp0MrH8ETBTiC43DA1sQ0LSeL
xS2HvQXIKbvHn0LvDqJwy5zaJU1QYA==
=Xd5P
-----END PGP SIGNATURE-----

--7rfnzqrclml6k2z3--

