Return-Path: <linux-next+bounces-2525-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D96904B9A
	for <lists+linux-next@lfdr.de>; Wed, 12 Jun 2024 08:29:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A59F228568A
	for <lists+linux-next@lfdr.de>; Wed, 12 Jun 2024 06:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1F44167D85;
	Wed, 12 Jun 2024 06:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ORKqnWtJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D272913B5B3;
	Wed, 12 Jun 2024 06:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718173734; cv=none; b=ToSGbR17eu22lUqwqfJJA1FuSG2E+9rbGeI0dwpLYiG0yiQ0RnJuZKKKGBH7KYjM1boKvykDhCu5fSPJG39LnMBRNq2vf1+jDCjZqtsl3wHOU02KPSOvsF6CMPNq9cOeZANxPQiuQci9GkIR8UoFRPHq+zgeuIeivRcCnIQs578=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718173734; c=relaxed/simple;
	bh=wPFiUUjqn4KzcGVKC6PaC0Svd/eZOj3rBiN1Cd/O0cA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CWsPSm+tLcQfdq4p7JaMP9v6NHTDzAJOQfUzcMK9IRiW6Cb82z/r0OudOG7ky/mL+mo9k2FGJdEiO7savdCSOMr00UgQv6QAL02w5hcfHfD7o8pCyovS+KWu8vvFlN33Hp56FYJX5b/PvTp5N3+oPpguZfzzBJISCKUBuuCcoBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ORKqnWtJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1718173729;
	bh=y3nLnNe76E9oKMM8n9usOkfzWrEwge+o7ij2TF4+Jwg=;
	h=Date:From:To:Cc:Subject:From;
	b=ORKqnWtJsuIWoVh+rM7HRe53yNInVB2E478Xe7m3D2TkKb1RwQBWDQj+MaWDBhXFK
	 1rsDI1gnGioexUTRWplsqxBOQcUtTFy0I0mrP0CmB0LOn4cpNtZzbWptwmyBcqL/o4
	 sa0KClaWUaKzsw25e+1fLMmXsUxKioR/GqPcRqb6RvYXO08WeobE8WM6AINsRtj/Qn
	 RkXtrEG0DWiM+yaPG1rjAGj8hb4RuohGw7DWO9k2o6ep9wgms4Q8UN+P3UcEBhKjEI
	 xtfGWAlEsWwktCPZu80aAIQs9QO4NWYs+XfY2lu8iTbuFzqcRTdl3nZtuhUlWqDbjk
	 QhszLoQ9tnzuQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VzbGT000zz4wb7;
	Wed, 12 Jun 2024 16:28:48 +1000 (AEST)
Date: Wed, 12 Jun 2024 16:28:48 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, "Rob Herring (Arm)"
 <robh@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the nvmem tree
Message-ID: <20240612162848.2949c33a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7i.uw2g0FWs3Y+025DCppmM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7i.uw2g0FWs3Y+025DCppmM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the devicetree tree as a different
commit (but the same patch):

  89ca7c2d13bf ("dt-bindings: nvmem: mediatek: efuse: add support for MT798=
1")

This is commit

  ee96c0a8d12f ("dt-bindings: nvmem: mediatek: efuse: add support for MT798=
1")

in the devicetree tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/7i.uw2g0FWs3Y+025DCppmM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZpQCAACgkQAVBC80lX
0GxsPAf/dU7mYPHlVkkn0uSAOnx9x0AdAQ6X6E0zncFI1Q4vMW8VM5NBUM1tc8sF
y9M3zTX4Td0MO/Nnaaddh5GkonpoVSofMM14hfLdkBJ/BrJVRCwWoSIheQFKnzJF
iuJjJRfHDD2ImgiirNd4jPHDb/Gt+95wqdwgdmNUEyGPbc7IFvMwhUm0iFLH8eoX
OsTAuyfAD+Tb4BdoqAfx6J1URf41PwXc47Xl4USPKigLAEte7z1ryxujtyCwEc8A
ho4Pp0Tr5nqxjf9Ljc9cDo3iOAOsKmJg9KlQSyWVUo7etA9O0iiMYBmLz1CJ/NTv
0SOAq/1q08TpdoZgvpFj0fWDDb9Bpw==
=Cvid
-----END PGP SIGNATURE-----

--Sig_/7i.uw2g0FWs3Y+025DCppmM--

