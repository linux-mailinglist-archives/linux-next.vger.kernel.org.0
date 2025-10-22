Return-Path: <linux-next+bounces-8684-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B4ABFB679
	for <lists+linux-next@lfdr.de>; Wed, 22 Oct 2025 12:29:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACB6C3A3A70
	for <lists+linux-next@lfdr.de>; Wed, 22 Oct 2025 10:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B990F30C35F;
	Wed, 22 Oct 2025 10:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Acn6sGlr"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9C830506E;
	Wed, 22 Oct 2025 10:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761128953; cv=none; b=ATf9rs36Xt301hSqtJhw32PNVM2+qJNuQOa/cA22IS/OfoIVLI5prEWyRNwGbQwaUC02/5xeYSj1y/TeEOWLXMJrjK9kj1X8M3sODjsVQyOsMYWSt5NM2twVt7Yg0uqmJbbrqmQ9K9EgNoA7v2QksBDhFjDlnjFAlFOCQbLWofU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761128953; c=relaxed/simple;
	bh=NURwZ9+yoDJPFK+bG6us+8Lc8UGsuMt4jWZ4VLj4MhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jdH0vCq4lY93n7koKrhC+bUKh93kh/XJ6KZ3MJEoY6oTyNoEGJrA38V/v1WogvqKcRRN8tKO8ooQPb4/S8LoODTwQ0fzYKGfXFbFopYNgG51m47YUGEidN4yhi2HoAVCS1/0JtMvlt2Ccflp6usQoT0oE0aHDvxuo/djYvgiYjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Acn6sGlr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2578C4CEFF;
	Wed, 22 Oct 2025 10:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761128953;
	bh=NURwZ9+yoDJPFK+bG6us+8Lc8UGsuMt4jWZ4VLj4MhM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Acn6sGlrFx4aDqsht8e3eIlbnM+CWMlK4YjskhT+JRU413jhiLjnIcCm1T1t7UFrH
	 kC22xRwb/0rmeWyKsq2dQikJLY+ZCexY/wTze67vIA3AI/FdG1MuoU2yuqmA5kwJFl
	 3ZH8IiYTHHxyBWULyWevaUMqUZ2D3mdEJStsH/Vt4TyQbVOM3YkNMUObnR4rgBln8s
	 p1YSY9GpEetDdB8BOCyar9EgDLRLkFx0LlNB2fvSv9yeD349TbFBOsVLWjb7kSY2aB
	 Z7extq9dGcEEfA6zAVx6sOJN+Zr8+VvGLNZIRDKQ6MwZcLVAvqb4roJOtjI7yp/Dji
	 JGbuP1or1eKyw==
Date: Wed, 22 Oct 2025 11:29:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: add Mark Brown as a maintainer
Message-ID: <82000d1b-480b-46a9-9ff2-787b18893784@sirena.org.uk>
References: <20251022163625.5df7542a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TNAI/aWytIUdFQZo"
Content-Disposition: inline
In-Reply-To: <20251022163625.5df7542a@canb.auug.org.au>
X-Cookie: Remember the... the... uhh.....


--TNAI/aWytIUdFQZo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 04:36:25PM +1100, Stephen Rothwell wrote:
>=20
> Mark has been kindly helping fill in when I have been unavailable over
> the past several years.  Has has also put his hand up to take over
> linux-next maintenance when I finally decide to stop (which may be some
> time yet ;-) ).

Acked-by: Mark Brown <broonie@kernel.org>

--TNAI/aWytIUdFQZo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmj4se8ACgkQJNaLcl1U
h9DbYQf/dHlU9odzrAyvJUCAznXK8EEauz8/iwP1Vzfm+qulle+UumK2wvQAM5HY
N7DudraotnvWPwIcH435BXvjAb4PliUOmCCEH1JUg8LyxakQ9bb6Q1Dd5YNabALD
ZlShEFV8GxLh5f3CFfYclg6PJdJN4lcNxT2T3O9MlbxXgauXP9Uo+E1Vq7+ZW7dc
d7nzXlaLQ6LSHsgoa/PH5flJ4HLd5k3ikptOW2vTBVwYZzE3P9NlsKECWfOtbQpt
y4IqcbLmjnzMLIMXbHLeTNNbBvECou/fQk4xwyqxjsodU2kAHx/D2kEFDs+j2Cpg
mjk5gKtKUQj6iMf8v7xED2R+SHYoKQ==
=Nv5d
-----END PGP SIGNATURE-----

--TNAI/aWytIUdFQZo--

