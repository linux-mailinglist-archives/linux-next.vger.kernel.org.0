Return-Path: <linux-next+bounces-7003-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7AFAC9E1E
	for <lists+linux-next@lfdr.de>; Sun,  1 Jun 2025 10:28:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6AC9E7A3C63
	for <lists+linux-next@lfdr.de>; Sun,  1 Jun 2025 08:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46BB81917C2;
	Sun,  1 Jun 2025 08:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="FPHOI3FB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A833C13D;
	Sun,  1 Jun 2025 08:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748766506; cv=none; b=Ql83jY291PrKD6wD8DzEiAJOgXFkiRErGz88E3Bsl/xqoU7gR7dJJeWtYlUg0bHmG/Prq34CNUtpuSIkslwR1BSCyMuPh00nM7KLNAfvZomBMvzK/cxtEqvMXGtJTJCl5JGa7I9GWufjUq0vuMccFo/+wPtL03SQMFaaIBqIZNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748766506; c=relaxed/simple;
	bh=2nMCDnnj7b/KOI3Q1YHtXMMRmZlQZLomTLpuClHmhQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HzpkvH9iA/eBfYG33/NIIHThuqm0Y6XFo/AYLNJ3S0Mz2sAeaGcp1mJLe1R9uEbF8SwqLWr7EvjxzSOyMLquCIWhM3Q/hDv7PLj8UxwI+Sq7jLPxDjQq8ivs7PEoifgXRQjaEK0jBcQP+JxWkbnXXktxOzQstz+I1IfVJwJONCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=FPHOI3FB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748766498;
	bh=nDgHRsCwb4BH1XlBRAPbTDeHH+3VXFA6uH3PCQJlarQ=;
	h=Date:From:To:Cc:Subject:From;
	b=FPHOI3FBSTL0LSIILQp+E6KZOQYZLNOwO7GsFrxEhN21C6krNkHAeyvrlif8zJEdJ
	 2AacSqIc0f0eh+Hxyl9fvIdN71newKY0OtrRbf9pjo9tC73w89Lbnqz86J5uy6fHEN
	 JP+AIcKGhsggH8/G+p6lZuRdbadJGqQUSSVppav3tGLb+etJihDjfKnyM8k2QveIEP
	 RbjCpo8jhNY9Zu1gtyRuJy7Pu3bfYA+2rawZ2WAt/ADCgwzOuVg15GqVdIqnkP7mgD
	 ESDZkF2bwECgu1QplBP9VcRGkK7ofEqB2CgQAfi/aOJ90KuXuvLQSzLmzWz/iomujp
	 tAd5KZx0C89lQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b998x70RCz4x5Z;
	Sun,  1 Jun 2025 18:28:17 +1000 (AEST)
Date: Sun, 1 Jun 2025 18:27:44 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kwilczynski@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the pci tree
Message-ID: <20250601182744.534dbe5b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tYMMhm/v_iklDRquV3K+I4E";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/tYMMhm/v_iklDRquV3K+I4E
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  1dcbee3cb18e ("PCI: cadence: Add support to build pcie-cadence library as=
 a kernel module")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/tYMMhm/v_iklDRquV3K+I4E
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg8DwEACgkQAVBC80lX
0GzI9AgAgENBWJexHzqP5wrPCyxp8prcSTTgsXBuYSKGfaPWYhgd2XCv3rP+ZHb7
lwMeNoGqgg75198njh9lojEIh0Sekwk393nI0Hmoh6swp6KqIFWRtpJoy6jQ15t4
CmsKChwWLERebcag/fN2Un6Qkel+J/ID/C4CblodHGzmtuiOP0Rxh6PGVb+RewHn
1kEBCC2LJBJpgHooeSfihJxfj1RVrdFJ9c79VuUxy+mwg/6bvFROO2Gw5DBKXUaC
tdDWiB5jRnmsrTccK2cjCjzLvtm4bxaefgPsrt1bavGizDClTee14wkm/d33Oe/X
HYUA7YSjrrt+ar4wggjUeCcWyX1aWg==
=vzPH
-----END PGP SIGNATURE-----

--Sig_/tYMMhm/v_iklDRquV3K+I4E--

