Return-Path: <linux-next+bounces-8915-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDA0C47A2B
	for <lists+linux-next@lfdr.de>; Mon, 10 Nov 2025 16:48:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 458EA188F9B8
	for <lists+linux-next@lfdr.de>; Mon, 10 Nov 2025 15:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BDD6257859;
	Mon, 10 Nov 2025 15:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="azUTF718"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C6E21E098;
	Mon, 10 Nov 2025 15:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762789362; cv=none; b=Cv+QN9VJN3ADQiRzit3rSZqcqhvPfoJFGBvkl3x5+PqYIYAF1ZXH8rrP6aEAe4QVMRNWgvR87yc8DL/w+4ax1N3gmxc8sMhL27Rn3cuYFWlz7Im0NfrCyeKIvV+tgAMmpwToOHacTaZ5sD3suLwuXCkRfh2PL9TCSZeJbKlR/Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762789362; c=relaxed/simple;
	bh=+z6nPNDQoci6L+17sEABsPEjN8WBFRZLVVqzzwX8ixw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WvKsQmmHai970+rJVHc7hrruQFsv3Xn1VVrsRWprrb3Yb0piIc1DlifqPLHJOOqIylIoltCwu998p+1OEk6YruWYOZBDbRsQ/0+8Cv5tzP41mAQvy58xj3xThwhX7mDQntP7DMX2KH4S+lpj3SFQpRWO9Ak70wwojk98ePKeYgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=azUTF718; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74B8CC116D0;
	Mon, 10 Nov 2025 15:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762789362;
	bh=+z6nPNDQoci6L+17sEABsPEjN8WBFRZLVVqzzwX8ixw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=azUTF718yb41geT6GhIMIL2hPXrKR7arrdLlwXoAYxhhqQz0qz8tKh0d3wW3Gm1Z6
	 IQ4pQ6NGI0FFBA+ewPeS78RRfdEiPQK6ezZDQsBIu/lJHKNVGpdbu2wW5BmsRPMCJB
	 vLLbS/5k/83f0AOIatH8+9B12TaWX/3/M7618aUtrYy9PuYEi0x2Lz3HM9rPrupBn+
	 gP1Q2/iA49WLe6vcMzd1Y/uJ3MjXKc/OJzvB4YgIM6Wn1XNwfgfDWK8YCtmGjQSaLt
	 ciF96GEMgsbMOwJ13kw/uyMxzYjWSQqStfab0G/YPCG44u98b+s8zy21G5P2Doa7Y9
	 NOIlmQJuv4mog==
Date: Mon, 10 Nov 2025 16:42:39 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Daniel Gomez <da.gomez@kernel.org>
Cc: Daniel Gomez <da.gomez@samsung.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Sami Tolvanen <samitolvanen@google.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Michal Wilczynski <m.wilczynski@samsung.com>
Subject: Re: linux-next: manual merge of the pwm tree with the modules tree
Message-ID: <26c7zdxc4nv3wx25xferlggtjipigtd3tc6fk554g4tmqsuvmr@e6cll772nz2r>
References: <20251104104827.1de36ea0@canb.auug.org.au>
 <20251104105415.68bfb090@canb.auug.org.au>
 <f374sh5rsbxvboowft6xpiimxlzw264i32txgiok53on2vxxu7@lpetaklaofzb>
 <ad9c5b79-8a33-4183-a048-48ba516e6aaf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ylliqf7wpspa7avi"
Content-Disposition: inline
In-Reply-To: <ad9c5b79-8a33-4183-a048-48ba516e6aaf@kernel.org>


--ylliqf7wpspa7avi
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: linux-next: manual merge of the pwm tree with the modules tree
MIME-Version: 1.0

Hello Daniel,

On Mon, Nov 10, 2025 at 02:59:15PM +0100, Daniel Gomez wrote:
> On 07/11/2025 17.44, Uwe Kleine-K=F6nig wrote:
> > Hi Daniel,
> >=20
> > On Tue, Nov 04, 2025 at 10:54:15AM +1100, Stephen Rothwell wrote:
> >> [adding the modules tree contacts]
> >>
> >> On Tue, 4 Nov 2025 10:48:27 +1100 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
> >>>
> >>> Today's linux-next merge of the pwm tree got a conflict in:
> >>>
> >>>   rust/macros/module.rs
> >>>
> >>> between commits:
> >>>
> >>>   3809d7a89fe5 ("rust: module: use a reference in macros::module::mod=
ule")
> >>>   0b24f9740f26 ("rust: module: update the module macro with module pa=
rameter support")
> >>>
> >>> from the modules tree and commit:
> >>>
> >>>   927687809649 ("rust: macros: Add support for 'imports_ns' to module=
!")
> >=20
> > I reshuffled my tree such that the import_ns commit sits directly on top
> > of 6.18-rc1. The new commit-id is 739ad9be61e5.
> >=20
> >>> from the pwm tree.
> >>> [...]
> >>>  -    if let Some(imports) =3D info.imports_ns {
> >>> ++    if let Some(imports) =3D &info.imports_ns {
> >>> +         for ns in imports {
> >>> +             modinfo.emit("import_ns", &ns);
> >>> +         }
> >>> +     }
> >=20
> > Given that the conflict resolution is non-trivial and we already know
> > what to do, I suggest you merge my commit into the modules tree.
>=20
> Do you mean creating a separate branch that includes the conflict resolut=
ion, to
> be used as an example when sending the PR?

If I were the module maintainer I'd pull

	https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git rust-mo=
dule-namespace

into my tree and include that into the v6.19-rc1 pull request. That way
the merge conflict doesn't happen at all for Linus.

Best regards
Uwe

--ylliqf7wpspa7avi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmkSB+wACgkQj4D7WH0S
/k5/1gf9GNyfxrJ5kn+azC98fohuov0UFGmof+1oViNSMxNauOe/5YavGYgUu3NV
npXN5uxmCwwM4DvfnCjDE/XhCGwJf+GcIg0kKNiWLds2dp9uPHKLRICtraMzsmmk
mJl7qJTBnBP+fgsPs0NwwU87VtA9RXS4Wx97ucEehq3QGW7QIl4ofWkm2ebzeFwq
+bg6J0/yhLEfheQ5hy2agpuDR/ICTS825+qjYzR2+YIXHEOuFy1LtkzRrUex/oXG
SaQ28GUFzPBbkzdy1yhdaCUIcB1lqTf/tfO0t8bpI5KP3LyR8f/NrOkcWCFrjD6f
ABQNMdRmA3rN2+UDXaYr/yYfpGxqGg==
=Yg5l
-----END PGP SIGNATURE-----

--ylliqf7wpspa7avi--

