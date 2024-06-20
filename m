Return-Path: <linux-next+bounces-2608-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 154E4910482
	for <lists+linux-next@lfdr.de>; Thu, 20 Jun 2024 14:50:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89539281D8A
	for <lists+linux-next@lfdr.de>; Thu, 20 Jun 2024 12:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90B261AC45D;
	Thu, 20 Jun 2024 12:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WnmpJxTW"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653161A4F3B;
	Thu, 20 Jun 2024 12:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718887831; cv=none; b=m62t0jZ4RtoAxifKVjnkzZXg2d6R7xN17XOa7XSQIpACjonJV2beHORCg/s8Tb3tN3rvJbcXQpQUknfMnXRoPEeQeGseqAF6e1HEZRKl7mpoHUAYD9WfPBv6jOI7SAimllzO7M2JBFditiCGGQm3+itmoEDF6aTYKCqCJFWjZiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718887831; c=relaxed/simple;
	bh=pnzHV/VL+7issGfjvpn7r2EeeIOdQV7ajaj5sS9hrlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ERh9yTpRkjxBQu6CBMLjNe8FQ0nJagvRD1Vj9sDgvxQhZZvgWpA8Lnwd8+EUwkDO8qYX7wV0ZCSgQ6zVC82BtM0eX0ngo5mpwdQCNWc/z2z+drH/GAXsX6hDJ8Zh0tZolfNUG866i/iYIfqOtW6+uUAhw3yI05vclwNFikMSzKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WnmpJxTW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBD5BC2BD10;
	Thu, 20 Jun 2024 12:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718887831;
	bh=pnzHV/VL+7issGfjvpn7r2EeeIOdQV7ajaj5sS9hrlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WnmpJxTWdOsv+o+wjwPtUtMv4SHQ5BcoaZ2fFBPuPQ7wFg7Iq0rJK2fT0RDDSLq/m
	 vkeDsy+ZEtUIXSLW2I/wZn/Ht/lchOs2u9hLUazLx8DObROExrwYsS/iAQ0KOmLkFI
	 g/1FfSIhjOHOaE/suzLOxkx1O5GOAWVrwHZLlVwNdyKWjR7PYC7waLBIyMDgrABDeq
	 GO71uPOPJyLGBr00wz09uqSQJINS2ipMUB3JE3y55Ps96odNMtOKg1YTlbLNfwAPB+
	 f/Eb26Uz+NIjZcFMJRWQ/qprYK87b4V5prvZxpnysQzeYubPP4WZ60+LAMdNhzURf2
	 8e/jCFmBDOo1A==
Date: Thu, 20 Jun 2024 13:50:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	NeilBrown <neilb@suse.de>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the
 vfs-brauner-fixes tree
Message-ID: <80a7d335-690b-491e-9b55-d0d1f75fda29@sirena.org.uk>
References: <ZnQTtD_d-egGzooR@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zBzHP251PFU9WPg2"
Content-Disposition: inline
In-Reply-To: <ZnQTtD_d-egGzooR@sirena.org.uk>
X-Cookie: You're already carrying the sphere!


--zBzHP251PFU9WPg2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 12:34:17PM +0100, Mark Brown wrote:
> Hi all,
>=20
> Today's linux-next merge of the vfs-brauner tree got a conflict in:
>=20
>   fs/open.c
>=20
> between commit:

Sorry, the scripting got confused and didn't start the merge properly so
this should just be noise.

--zBzHP251PFU9WPg2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ0JZIACgkQJNaLcl1U
h9C+Agf/ajb6KzqTKEo8UJWpqUYyr6nTGRsJVZ8lK1f4b4QMF/hmw6xy8VKrK7Qu
H8XaW/8j8q6EgNXrwtKuxJJH+SlInjJL3YDNLGCvheQ3k/hqTI9dxuV1v/aIGHJE
smP9OyjzMOQ7cm2bD0ThPZdCpWwbEqhZYcv8ecQPhm2hngr4NqjWnGsmVQ/QkpsH
pqvqOLCcyzSSyy0DQUIc8IDcSol1zeSOU0k/atz4NermxYx+Sb7636q6GEG0zw3V
wdR93642keqpGuULXjOWpKUqnaiCNy7k4RIVKF5M8wvGylvT9M0DOvJEp95vpYce
uiOCSHWZ4PQUqj6g8WZG8PM7iFHBDw==
=gYEM
-----END PGP SIGNATURE-----

--zBzHP251PFU9WPg2--

