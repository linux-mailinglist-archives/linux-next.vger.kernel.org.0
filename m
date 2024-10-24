Return-Path: <linux-next+bounces-4421-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 663D39AF450
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 23:08:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 123CE1F2230D
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 21:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E430E218317;
	Thu, 24 Oct 2024 21:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="e63Cyv2J"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25141AF0B3;
	Thu, 24 Oct 2024 21:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729804086; cv=none; b=c1mqibt691zYx6Kq9pk8d3xz5IBgzIP2QJRFwL9/07oean9Jw+H8SYyEcJaNGmXsG29lJYedDKW8sNg7GI0jIFs5UmofmfY7jONJJUg9sNA+G85hfpHcLByM+NypAliYZGl1ULOlTOhoOerPHQDD7LhBVM1UmhGvwnJCv7aRfVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729804086; c=relaxed/simple;
	bh=1JH0OhTd81Th6YnsFvbQXz8gOXX7imyNbzqu5wNErtU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LcTrqH5bSw/n10voLb7hAa+Ur4sMWDcdFCExDfrODtqQoVrQp2xu1xzeRHVP8MrJYumt56szN8QPlDenKLd/AlapSp7RiNRfdSJDgV0GQehYTU9qCJpjobQ/yCi3kHknyCpeXLWoYKsAyN/Eycuz1k+zoYZ6I7YCIF+fL3rW1K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=e63Cyv2J; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729804080;
	bh=A4rUjKLdoROuQ7OX/9GUqIfPdzelxxLmWjKMyLUB0uU=;
	h=Date:From:To:Cc:Subject:From;
	b=e63Cyv2JsVo05tMWVfbf5r86PXBDtuc192KTnVxNzhzOEdF8WNmJLUml+/IxVgcpo
	 EsWkJ1i9L158ZyaFxwsopjqrNCmPLgAsdEukLLbjUSKgKPtN3ZJX3hDI8y71EjDcUz
	 WRhRt0Wpo9dKXNz/quvChI0g1RifnQCGjlM5KgqzstStiPzqLaVfXX6+CD4FoA85MC
	 JnDQabR58gUWnzMcT5fxWOuavp3RZ9oxSz6bQ8t8xdsn7xE/KNqzHSVvVvauAe9Kgt
	 /KMuua1RMk1aQ/fiMgf/g99FgBBmzbmNMSSO676Us7/DbN9VQQR4HWGUHORTw54JYb
	 ikEEEGq4PH0ew==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XZJR36kKGz4w2N;
	Fri, 25 Oct 2024 08:07:59 +1100 (AEDT)
Date: Fri, 25 Oct 2024 08:08:00 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kw@linux.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the pci tree
Message-ID: <20241025080800.354b7575@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yAXr3v0z6nmTlUHTaHhRIsN";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/yAXr3v0z6nmTlUHTaHhRIsN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  7027b415ff1a ("cpufreq/amd-pstate-ut: Add fix for min freq unit test")

Fixes tag

  Fixes: 642aff3964b0f ("cpufreq/amd-pstate: Set the initial min_freq to lo=
west_nonlinear_freq")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: f2542c904294 ("cpufreq/amd-pstate: Set the initial min_freq to lowes=
t_nonlinear_freq")

--=20
Cheers,
Stephen Rothwell

--Sig_/yAXr3v0z6nmTlUHTaHhRIsN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcatzAACgkQAVBC80lX
0GwkLwf8CsZPMXnCoNLqPzfNkxCvLRxH5uZe4NVns7n6aFFQq7QgkKmy9oNzvQt9
CZE8kUtepIqpHiHZmaMMVXqBNfAlGkpTk46jww25p02zDzjWjpA/avOPLtJotYE5
dE7LzqAKXMDM6jyktDqlJ4zzxr8BQLxR0CLstGoS9nxv8O6ObvtiF7kpYCktr97E
wq1Ln1I4aSaK8MHWExU6u3b2IfKWH3LHI+CUSSAmvHeeVJTrFbhXwkQfVVnImai8
qiA2IkMw0W+C2FMVSZLO7hBn3rw4uCTpjyWE/vOeKc/QcK4gyA2C9l1XbpxOBtAZ
8xkEhAjJkGVjx3hMnJX4mmTGmDWRWg==
=V0jh
-----END PGP SIGNATURE-----

--Sig_/yAXr3v0z6nmTlUHTaHhRIsN--

