Return-Path: <linux-next+bounces-5626-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2331CA4B851
	for <lists+linux-next@lfdr.de>; Mon,  3 Mar 2025 08:26:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96CAF3AFF1A
	for <lists+linux-next@lfdr.de>; Mon,  3 Mar 2025 07:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E6A1E9B18;
	Mon,  3 Mar 2025 07:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="eFnYccCO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9531EA7E0;
	Mon,  3 Mar 2025 07:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740986807; cv=none; b=I8FEG/f8MGQpckYgF9084b6A70tIKRF+UC9hSTkH2yhnGIUmSVkYLpwNB8WUiOIzryYK0PzD+0xQTsU0p096N5Egp1WpmfQMXZ/GvN0oHEMoW8pP4QAWHayYLqnYI46KoG3h6kMexMuQ8KsXJy7kGPByAMv4J4AIMdNNjYobW0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740986807; c=relaxed/simple;
	bh=EoEz1sVPNLIdzQ3hYSNoXZm9t9D20YKTd0JlTlLNOK0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=O5qDswy1b4/M0f+4IZi5cQKXv/dHMKl4TguzKySK7gCum+G6uXfI/tHw9sOBmDc0IwzWbdwXnNuBO54hsgEcuVnITGf2r+beA7xqAZLZ3Jhaud3ka3qHXOCrFb2zMPdgRHpcajZ5bxsyhQ0k5hEXtdDQUdZWDU/vR5sRuObNkao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=eFnYccCO; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740986801;
	bh=JYtmQK7z3nhSyi0RYaAxJIUtW1aTo8IqbYRNufPPnFM=;
	h=Date:From:To:Cc:Subject:From;
	b=eFnYccCO7sP4FAvmvadwYkJhNVDQ0y0CDZ/ntq0mSKZhLsOSUDnrziTjyzwRjEmu+
	 MGX5fEWaQN0qj4XykMm1r5G6/LoV6Op1a6f295F+bZl2iuGpj5rSH+Bn2EQ16k4Mk/
	 gKlvBY8aVFwc4yMYxmBZL5Gn3qVp0i/+YcWcLI1VTLOSHJA48AnJW9BFZqMstae6xl
	 gIRO2/Eg6NvPt2L2ubdpO0HsA6L4y/0wZV+jBMtVCC3h8wv1YR+h7y93+T4Ac03znK
	 TV4mD+XfkF4s8oldCLfGHA4DhXE7WZUCSAHidBzBf3kNRsnLx2dDfjA3cZeWScRA97
	 5AIJ6kvzcN+cQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z5r3P1lGKz4wcm;
	Mon,  3 Mar 2025 18:26:41 +1100 (AEDT)
Date: Mon, 3 Mar 2025 18:26:39 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kw@linux.com>
Cc: Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?= <kwilczynski@kernel.org>, Shradha
 Todi <shradha.t@samsung.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the pci tree
Message-ID: <20250303182639.5e920622@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kV2jVTek5sdVoFJKnR6Yt71";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/kV2jVTek5sdVoFJKnR6Yt71
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pci tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/ABI/testing/debugfs-dwc-pcie:15: WARNING: Block quote ends wi=
thout a blank line; unexpected unindent. [docutils]

Introduced by commit

  8562ae832769 ("PCI: dwc: Add debugfs based Error Injection support for DW=
C")

--=20
Cheers,
Stephen Rothwell

--Sig_/kV2jVTek5sdVoFJKnR6Yt71
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfFWa8ACgkQAVBC80lX
0Gyvxwf+IUgj1fFhKvX4Y94ZR3BUXvqn0nfmHRRT5lY8Nq6wnjhFwsrSK0GQ0E1R
S9M210O2YP1AiEmhU79ye0i5hmfuRWa3CVfss5JCwugis7/4Fztdlr+aI65Ta6Ru
0b7C497h5KXP60Zrxtp07wSQV9Px9eVnTuZYoS3xWDovD7GDk2Raz5eCYFw7aqcX
RRwoYiF0tm7TKy/+5FVX0DnhKAzgcuEg7ePKhAkWq6D4qY5RSsAGKbTyxcSwQ5fH
oKMywYYPJgkloXFhtlwBbYhso/qNxhKKBdSbhTN7YuJN0enRBBUTJwSZG0svOgIi
NSXHrSzu2h64LqzG5I78HtMoUozoww==
=s/dP
-----END PGP SIGNATURE-----

--Sig_/kV2jVTek5sdVoFJKnR6Yt71--

