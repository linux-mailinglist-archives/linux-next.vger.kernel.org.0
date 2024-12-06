Return-Path: <linux-next+bounces-4884-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF3B9E6C38
	for <lists+linux-next@lfdr.de>; Fri,  6 Dec 2024 11:29:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4EAB166BD0
	for <lists+linux-next@lfdr.de>; Fri,  6 Dec 2024 10:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0006B1FF5FA;
	Fri,  6 Dec 2024 10:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fK1UkTPs"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D009D1FCF66
	for <linux-next@vger.kernel.org>; Fri,  6 Dec 2024 10:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733480557; cv=none; b=UqkqheIpunbvXezT5v+WG3iSqbRJBZv3A2a1MOlMaqRq6ulpwwGDBeGrgy4P6CHFzh5LNPprwMpb83N6pQFP3gZJk3q6Gywp6CKHOmh4eg2mcg9U4O3VvtqoaesLOamO9Vyslof0ISqv2fTGQjs1Ho5/fDyFpVUTTl4kxkHpu/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733480557; c=relaxed/simple;
	bh=IJLZR3sBG425KAZFnpobc4JM2jCeICvjuNL3yjl0c1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UlebACnLYyvWYTVwqyA3M+q6QBSdYngZ3PJyEPTxH8IcYNwb2qG1hQ8RG85V6gMdonvZuWr6tusX7jgiNCu3KsQCLtMARLcCXgGJ/Gl/6wLhhCQuORmt/bySe/IY0PSGp6CAUxgcUofjgBIRmEP/iVF/wlN1YJq+keRGAKN4VqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fK1UkTPs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3340C4CED1;
	Fri,  6 Dec 2024 10:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733480557;
	bh=IJLZR3sBG425KAZFnpobc4JM2jCeICvjuNL3yjl0c1Y=;
	h=Date:From:To:Cc:Subject:From;
	b=fK1UkTPsTP7hZC3TF/eQzkMVxONjoh8cOGcEP5DBAFXS9cRWrirlYVvhEC29aTgK4
	 wxNYZT4QPV0nnK7yuGLenzMyNw9SUE4DePBxcYuvv3IGeJqIEqOYp6cfT/CvtW4mEr
	 XMa23uuaGH2K0uGKx6SUrLEsJihmahK1KHDa5r7kDnQhOq7+87BlQXx+rRRvWW1hcA
	 Qvj1eyTG5lDNlUsU3wiymN3OHc6u3f+PAEztpv/ZfA8MAVqRAwfHulVLkdMBcULe3k
	 djYXWKTBSI150BJ9LHnKWHA4fak8TXoQnJhvHu8ZT5/2RZ13eep1ZPjF0hOPJBAq4s
	 yynkeer/fS84A==
Date: Fri, 6 Dec 2024 10:22:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Jan Kara <jack@suse.cz>
Cc: linux-next@vger.kernel.org
Subject: Missing signoffs in the ext3 tree
Message-ID: <1175596d-fdaf-4c99-9bf3-4a5f517ef09e@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RRDT52Z3grbGqUG0"
Content-Disposition: inline
X-Cookie: Sales tax applies.


--RRDT52Z3grbGqUG0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Commits

  74094f677916e ("fanotify: don't skip extra event info if no info_mode is set")
  8adc64d022177 ("fs: get rid of __FMODE_NONOTIFY kludge")

are missing a Signed-off-by from their authors.

Thanks,
Mark

--RRDT52Z3grbGqUG0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdS0GYACgkQJNaLcl1U
h9B69Qf/dM21EuuEKQpv0ODMBLj5GQi+3tTRx/2DpvI2cfbJaDdDclgcDdi6rJCu
xQ/3TmyDWGh2qN2Ya7D/FVC7Gwe3ggNWQsXmADD6dt6/5EFZfxuFHLrBuAmswwXb
NSBxpd0wxIBWvFc3yi2aPiMPSrcH8uBBDKFiUYcKWxA8MB14DxQKUtfizK8IUfxw
5J6PBT4hw4cWiGwwc/HRA6v4cOkyYhjXaBJNeG1YZiFyabWlPGmCs8lKw/vgMbeT
TKZ/9BDYWnPxYa4oXtELefJ8lFq//cb2VUKa+wpHXhIUopLnSs+95sTBiETLw/K6
e5WDHhx5brFcburPvvLpvpZZegjT3A==
=SCXj
-----END PGP SIGNATURE-----

--RRDT52Z3grbGqUG0--

