Return-Path: <linux-next+bounces-2858-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA0B92B048
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 08:37:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4AB03B21BC0
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 06:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B59B152796;
	Tue,  9 Jul 2024 06:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nBjQqJa9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55B114EC48;
	Tue,  9 Jul 2024 06:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720506793; cv=none; b=A+IcQC3NPni9cFxDdKf0/xX0AvlXWBnd1kOqr9uD6h+lq0bGPXOOirv5ovm1tR5WBay7ReBrGIPtYXLivIxdPDQJRZD+o1xRqPPJDsDppA237XwY9iMdEs7kdWKQllhB6iw8LVe5mmmtxpMLjO5Gto7wLK4ZCFwqJzbG/UtQa34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720506793; c=relaxed/simple;
	bh=aVTOGskcX5zuXlcc7YYXIvjdZm6YDK1kIiwe+ajhYow=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MGjRx/A4iyaJTouywQ6Yr+pBMjnSLbYXxP0WTj51c6HO26Q54paViVlDzVoRti7BritLi/2mNx09R2t5sDsqDMKh6nDSycgf3PWlniPtnfJKmoJF5DI3QedmO91yE8Pq8QiuWOjv+kCo++Ay9kiX5Ot1gkFlVWmtMWrOvk2H7CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nBjQqJa9; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720506787;
	bh=Yt9q8ymMGMBokVBn/AcKjaIpM6e2bOr9t6+KylFaEd4=;
	h=Date:From:To:Cc:Subject:From;
	b=nBjQqJa9+B0SjFVsmfxlEqKA6YgWD9MPrysn54qHIw6XLIckD7otR7EAazbF9oUGL
	 7KEjiKNqy5VeB3wHeqEx4u9KW77inbsNEFwtoApRPSHa1MsppXOnJgBGL/Sjvu7gU8
	 QnSf88YoaXsNRl1EuNqO0el/L8sMCWuzjcKvpemOdPHKUw7TlaW12gTozTYBQfc8RJ
	 xq6W750H9s3oghApfy1q9W+7BgJsvs7y/8UIwjHXRIewUtt4D1RDs+SJmD3GUIcJBr
	 OvuVOFJ1VWtNn7avSPYnxWytInJj/70D9YvRAoh5fa8+PTt5MRKa/+qqCDT70To2cT
	 hDumRPQf00n5g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJB4z1WYVz4wZx;
	Tue,  9 Jul 2024 16:33:06 +1000 (AEST)
Date: Tue, 9 Jul 2024 16:33:05 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Joerg Roedel <joro@8bytes.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?UTF-8?B?V2lsY3p5?=
 =?UTF-8?B?xYRza2k=?= <kw@linux.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the iommu tree
Message-ID: <20240709163305.188b1182@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/b3VQaRT5EBDDwIjA+IZt6xB";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/b3VQaRT5EBDDwIjA+IZt6xB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the pci tree as a different commit
(but the same patch):

  40929e8e5449 ("dt-bindings: PCI: generic: Add ats-supported property")

This is commit

  631b2e7318d4 ("dt-bindings: PCI: generic: Add ats-supported property")

in the pci tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/b3VQaRT5EBDDwIjA+IZt6xB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaM2aEACgkQAVBC80lX
0GyGSAf+Kb1z8rJJsmT9B3/6CyrDBJEr9XNP5Xrz7DYxYV1ApGejCpBouFVMOL1d
QR5YnmNYMWIhINmmKgGpWwx3sWLXB00GvmpyXpMw5vZpM7mBsUkRf27ySbYZlWx0
R0IwdT3a2FdmtUQ1ZgLCCM8sgBPfhWVdZyJvgMMrtJueIwwAh4TeKkoHnzCGo+lM
HsCm5pfqj4Djhb+SmHqHhGlT2c+e09RD2wFat71QPMDx6k8MxFa/v5L5TyOPXoMr
TyWY1NQBzz6txX8mGfdYK0splWEmZu+yFeBn6V/a8jmKDgOGFC7BMGD2qjlxje4A
VGVAd1Rs6BbOsQuR3u3GYm5v9yCBRg==
=RGWI
-----END PGP SIGNATURE-----

--Sig_/b3VQaRT5EBDDwIjA+IZt6xB--

