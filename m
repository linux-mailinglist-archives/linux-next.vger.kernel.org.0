Return-Path: <linux-next+bounces-6097-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0581CA75D82
	for <lists+linux-next@lfdr.de>; Mon, 31 Mar 2025 03:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26713188A250
	for <lists+linux-next@lfdr.de>; Mon, 31 Mar 2025 01:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F5E2E3390;
	Mon, 31 Mar 2025 01:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mzB6FnyR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECC2BE4E;
	Mon, 31 Mar 2025 01:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743383024; cv=none; b=ON9ymCUMLu0/sdQy1ZYin5x8egWQ3gJLZjua5IyjLynjEJLACRUhVe6cI7AyILNrJ6U5dH9bsGFddXDnX8DeiELZ8w5zoxivNsFBxZHWK5F0hJqm7ik8gC7Zeef6WE7UBm5WX42JL33OBkInv2JxmmChMnnwl40AzGUDYYeBn4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743383024; c=relaxed/simple;
	bh=xxr4kEsgZm5+2+HuzKzeOm+9e2L0bL0d2mUVJDK1eHM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pyqwPK0pdaG91tM0O8oE1uWVjhRi3Z6Rn4/q+nPv+HUveABpullZQXW5dq/iwgFvNqPYmdghqxriqqF7GvIJizkh6iq1Vg0MfhPwMDMT1zupuftWR6Uphix4Bl31b5/96sc52yKd9DEfBgRtJBVAPvzEinjqk9q6gDh5YVAYtY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=mzB6FnyR; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1743383018;
	bh=GONU/CLn5hrNGzoqR4IbD6bUfOKOeQExLbN7yrioLg4=;
	h=Date:From:To:Cc:Subject:From;
	b=mzB6FnyRbtwH64/KQlp7Vni2s/QoH56rrscbCHFXSvKplCg8K65dwgiHcN3uGPGPP
	 m7ndKOcnxSCePnCm4+tKFvAmGC1TjdBBJQDk/WL1P0qEsLgQUar/22388fbt0sMrzI
	 oU0IlJ66F0SUPs/cAxEKp7huaNiPqnvdNSeWmdwvOCAw+AevFmJYbs9yC3tLFqRbPW
	 mw3dMSfFdwoBdpaCkEhcDPSrNZJsVaczEF581HZCv4W3ghe0L7cmimZAPwXTdsdEqZ
	 pjV06fV0kAFylEQe0aW3Cf6MJlUaY7INNdBcF3K7hk5V1He5stOE04WIMl/cgvE0aP
	 d2S1h6JM7Q3JQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZQtDT5xQ8z4wnp;
	Mon, 31 Mar 2025 12:03:37 +1100 (AEDT)
Date: Mon, 31 Mar 2025 12:03:36 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the arm64 tree
Message-ID: <20250331120336.55510248@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/X=Pu4fWI+=pa27.PSgJuglI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/X=Pu4fWI+=pa27.PSgJuglI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm tree as a different commit (but
the same patch):

  0fff2aa96f6b ("arm64: mm: Drop dead code for pud special bit handling")

This is commit

  a4d7be474004 ("mm/arm64: drop dead code for pud special bit handling")

in the mm-unstable branch of the mm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/X=Pu4fWI+=pa27.PSgJuglI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfp6egACgkQAVBC80lX
0Gz2Awf/QdENypPfqLdywpm5xSBSIuFffUHTBERpTOY37GG6tTj4V3On+RUfcjSh
Y0Cx8W7Q4izTNa0+mpEDkHYeLbOikMiBZXLT6Z01MLWZxMvaHNwXm/3YUln47HyL
fZ3+LHtKa8XRA0Bb4kTILBpVtm/T4U/xMEeoN6nqKjglrj7OUYz0PCNVbSI4kTZK
adYTPnbBrEX9TtBxpNzoUv2XjVE+acIuYnlOpHOfYEfY8icRsbFKQ5vx+nksDEeT
IqkNZttU6AcDrMPYN/hWFCJBBQNhprbMdoXqkqD3cye7qtQg7Z1OhJ5hdEd+HVjv
NOPu0Rmylc+KjUcxnoqboSMa/fPK2g==
=pRCF
-----END PGP SIGNATURE-----

--Sig_/X=Pu4fWI+=pa27.PSgJuglI--

