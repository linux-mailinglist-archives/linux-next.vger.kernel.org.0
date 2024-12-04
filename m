Return-Path: <linux-next+bounces-4880-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E8C9E3C85
	for <lists+linux-next@lfdr.de>; Wed,  4 Dec 2024 15:18:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6E8328174D
	for <lists+linux-next@lfdr.de>; Wed,  4 Dec 2024 14:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E9981FBEBF;
	Wed,  4 Dec 2024 14:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kw9UZ11H"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689061FA844;
	Wed,  4 Dec 2024 14:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733321923; cv=none; b=Ls/hen5XB9uts/50qXB8r/MIbgxFPsNJlrXG/nXP69WADCpWQzrJUWE6hfMDJs827ydSHA8K6ZkIRyYCQfNve1jn6vJp7DOKzxHTsTi0VGNQAdAsn2QXJFy9axiVT23Dt0C3aCAHOVfI8kep2A2/7fHofocL5jn0YTCJlFjgSVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733321923; c=relaxed/simple;
	bh=3ayiCYKdCeeZmDby0tpBL5OzMxBMtlsn6IKrJFlYFh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cfQI3KrA3xDNbiDqIYLjbL8w13mPrIEnSPJ1Y32U5Thsut/VYBStsWayrR67k8bIWTLVeJojSR6sojXxNp2gZzNqXGgbZL+QetZK1PZ8ChER7JQxrg11L5C97Cdh0a6xYLhUdtQR6BpoYoID3ngB50vM3enTgfIY90fffRfSFgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kw9UZ11H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B357C4CED1;
	Wed,  4 Dec 2024 14:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733321923;
	bh=3ayiCYKdCeeZmDby0tpBL5OzMxBMtlsn6IKrJFlYFh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kw9UZ11HUAYdBJsMifrjAa18mRMEzktZVajukp5KWD1M/sJZqoDg7RnW72ILEALMY
	 F2SWNKiRXX9JJKKrnRoF7e6gZGPtczMgMKSfH+7j0NUtOJ5QCGQR1m6hR2Q4+TnL9P
	 mpHnImPpxFldkkOyTRcjj3ut/SdR2avsohwkxNLaiIU9ezE7mN5oKHW1ELRhqPDIqQ
	 OefV3uorVMNUXC7gpuG1qVurnXsi3Ifn71NUskkw3HQ8PRgoDjJ0VAbNclVgdULTdI
	 G1aQak+i3rWPWJVOBSNQ0R6Idcomt8V1xv2Zcuu5w75aROZoHYZsqVBZzGZfWAzi+7
	 l1oyXeZQcFPoA==
Date: Wed, 4 Dec 2024 14:18:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	DRM XE List <intel-xe@lists.freedesktop.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Dave Airlie <airlied@redhat.com>,
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: linux-next: build failure after merge of the drm-xe tree
Message-ID: <57279266-d844-47d7-9c53-17fdae080b9e@sirena.org.uk>
References: <Z1BawrcFMsj0ByLk@sirena.org.uk>
 <87a5db36j6.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IurF841KVjN5RdcV"
Content-Disposition: inline
In-Reply-To: <87a5db36j6.fsf@intel.com>
X-Cookie: My mind is a potato field ...


--IurF841KVjN5RdcV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 04, 2024 at 03:46:21PM +0200, Jani Nikula wrote:
> On Wed, 04 Dec 2024, Mark Brown <broonie@kernel.org> wrote:

> > You need to merge up cdd30ebb1b9f36159d66f088b61aee264e649d7a ("module:
> > Convert symbol namespace to string literal") from mainline and fix up
> > for the changes in MODULE_IMPORT_NS.  I'll apply a fixup for now.

> Commit cdd30ebb1b9f ("module: Convert symbol namespace to string
> literal") isn't even in a tagged release yet. We'll get it when -rc1 is
> out *and* backmerged to drm-next.

Yes, it's very disruptive :(

--IurF841KVjN5RdcV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdQZL0ACgkQJNaLcl1U
h9BNaQf/RRCVZDUfBV8IMrJHgZV8/JM2OJEoX30BUV0DsnX7wU7pvL3TJ4wH2utQ
bdg5p6bDnd0vxPhzxqy/rKu/r2frXWAI93t9PZe5B43W7rwp2Mi3b9qLAPEHY+fj
1MnVqlc4GCA4sCsdXp4RceARIrlCOFVYYdBv7ob3DyAwoxHSrbw32uoYIdFdmbGw
Q3VALlrenY5pbwmqBjolHcufNvuI1V5RcZxV70MBhf7aw1zBNSQWFo3SkC6g/tfx
InqGiM0XDRygIA0NLS6OaOJG+K+Ot4xcNTv5x/GhmMSMiYXSOaUNdKZUSmQS2iRL
aXihEaCvS3E1NlqoEB4UJfzT/R8fiQ==
=vMto
-----END PGP SIGNATURE-----

--IurF841KVjN5RdcV--

