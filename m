Return-Path: <linux-next+bounces-9469-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 727A6CCB9BF
	for <lists+linux-next@lfdr.de>; Thu, 18 Dec 2025 12:27:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 66E7E3012CEF
	for <lists+linux-next@lfdr.de>; Thu, 18 Dec 2025 11:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AEA63176E4;
	Thu, 18 Dec 2025 11:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WU75VkO0"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C56313538;
	Thu, 18 Dec 2025 11:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766057250; cv=none; b=bDs6C9sNezP7YVwexjRKh2BJeDgD6wUbvE6vQ+c09xLzKrOu7PVS44FqaQNF7Hh43pSlBzmXmItBmFxQYsEKpIRiOQgDIUlzBosZYmgqy/GzgNMUVaEoc7zZd+IriHGKVkF1kkSon06pOea+QWNZp44HBBDVIOtuNxiXKloGt5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766057250; c=relaxed/simple;
	bh=jj6hx6UJQFOp/NSEeVFLn6p2he7kwyCHePy3EdKzR1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GFIsqzBr8k3AGdNJIR9FatbLDrgIRCvLQRi79MN6Ff4Rtztcn1tN2UbRIZWooVJ4xM3fg8ppSLUPcoVFM4JW+a3BomvOlXgnBDzgE+LShIk4ceqdPjfOGPsfwDNMGvV5oqMz8FISuJQMki1QClJR3Rk+RgqHwsWxKlBlcqvQlxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WU75VkO0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FFF5C4CEFB;
	Thu, 18 Dec 2025 11:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766057250;
	bh=jj6hx6UJQFOp/NSEeVFLn6p2he7kwyCHePy3EdKzR1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WU75VkO0Kr13wp4DlKddkRFwDgBsaIAD+Zr5/ZYezobU+MIUZTiur/1/GMGqV/5F6
	 fjtnB3S+C0agjafRymAi4bQlP6u/bv75GImM3HbcZLba9ZctenL94hTxwlvmBNGBSA
	 XE8UPeCgsErtoIj22vWt7ODQNX7NhH6JNsENg7bs8vWBPaX1z18kbsPDK640QhsCey
	 fcC3Kl6xSDSEko1yxLKbOsX2eyINPaDapZcSY2wGlWJC/2vmI6g2zTwxy+sejFdAad
	 /c3/CrwLu7wB6RFgH3A8NOl2+KaQ/o+Nb23Ez7J4Tj5TXckZBvHLMyV2wCfebfBYxq
	 Kx4IkBBySFN8w==
Date: Thu, 18 Dec 2025 11:27:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Dec 18
Message-ID: <709b0de5-f7c3-415a-9050-d04548731dee@sirena.org.uk>
References: <20251218221259.5a3eec2f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xWNlD52WEddkeX3i"
Content-Disposition: inline
In-Reply-To: <20251218221259.5a3eec2f@canb.auug.org.au>
X-Cookie: Close cover before striking.


--xWNlD52WEddkeX3i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 18, 2025 at 10:12:59PM +1100, Stephen Rothwell wrote:

> News: There will be no linux-next releases between Dec 20, 2025 and Jan 4,
> 2026 inclusive.

I am taking approximately the same holiday so there won't be any cover
=66rom me.

--xWNlD52WEddkeX3i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlD5R4ACgkQJNaLcl1U
h9C9RQf3bHffCtgC8WFiRVKJ8eX9bioXlga3/53jcf1rxLLV6tIAp+QCkv6Z1PkR
h1ly1GYynGazGc/zZFi/fLq27ZBAv8ipNYiMnEBo3ZQbIGSZciMptZPflvPYRKDc
rw5r8l7Mjs5zdOXm/i0UOCHTsT7M6w6ocJKmZRhYoNhoyFbk2njhZnduujFtI7PH
MRRVwctBJcTzUDKXyIFZk9Q/MFArhvpaS1bM5BTNj07MRcIyI7V7iLb41dz5Hix3
6CEuUIevtLFDDwgOd1UzQK90WC4sRoRPJrsrqc3Wt8/Eowa7ePQfkayGCnablSaZ
AfIl4dw+oKH+HmAmEiTDzdrLcRY4
=zGyp
-----END PGP SIGNATURE-----

--xWNlD52WEddkeX3i--

