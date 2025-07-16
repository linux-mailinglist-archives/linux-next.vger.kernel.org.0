Return-Path: <linux-next+bounces-7593-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79751B0806D
	for <lists+linux-next@lfdr.de>; Thu, 17 Jul 2025 00:21:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C13D117A8C7
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 22:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2909286D75;
	Wed, 16 Jul 2025 22:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MEmRfKls"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E6CB660;
	Wed, 16 Jul 2025 22:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752704507; cv=none; b=V4oFSvVJ4lbMxSzsiDutGKWvtbIPJujsq692BS7Z+CHELcHrK/GrqTVnilquatR3HJouR5lYcbwit0r9BArUYItGkzty01itTRIsTLdJVb1wJiXXM5A1jlT4TNC2PMk0ESb1Gs0ZUsDhwudfFxfMWkOOmwR8/Eu15qjhaPmpIH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752704507; c=relaxed/simple;
	bh=dszfnVLWW/rdk6Dmcb9WW9hNtJKGVtIC/jD7MI6EsE4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=iSvp/BEHnWPRasEMDAmblKlswgJKmSajY/P8SJNwOSYpLsFyTqTQDVb9D2qLnfXUmXFrMRmeWpPkF1URTxDCW4RrxTvDn6CkT4ov/LrLG21r93BOboF/5aO3tGYnCe4q3WNN/HNQ1B/YlVNlg1QQGVvwotyAPFE9OVs6K9Mu8D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MEmRfKls; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752704382;
	bh=465DAXPgvhgxIORUdMcN5lTl2oMEAVEI62LPFJCA9o8=;
	h=Date:From:To:Cc:Subject:From;
	b=MEmRfKlsXYPSzsZbuQQmpq4BxSxpwzdRohaPZMRw1isaHVl6EDd9hf6ZPzBgHoQkR
	 3ADtxImyuPO8B0JbzjEwV2mNffmXY4D1l02cFh+sfoLkLxSIDAjQezc3As2yN0uhka
	 ypD8cDC4nIvf2Am0Fzb8c/5uQqnjPz2JkZyRPcA5/xsSq7BPmIgg2lvy0DBQ2cDzBm
	 OwLR3k3xw8pCsCmu/AFjRFLOuJP7pNI0zFmmzrL5dvRVOtg6Og5y5CapmF4VxrDCXB
	 lBEGv6cIt3zGeHXUmR1QYF9zexLN+mxOLVy4o9XFgjMqsfHhB/8QVwfEW5OiLzjPSP
	 H2GUdxlW09L8g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bj9TV5n69z4wbY;
	Thu, 17 Jul 2025 08:19:42 +1000 (AEST)
Date: Thu, 17 Jul 2025 08:21:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the vfs-brauner
 tree
Message-ID: <20250717082141.7b9d8c40@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5HIu51zUm.c3VQmZ4z/.ADx";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/5HIu51zUm.c3VQmZ4z/.ADx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  de747bd023c0 ("poll: rust: allow poll_table ptrs to be null")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/5HIu51zUm.c3VQmZ4z/.ADx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh4JfYACgkQAVBC80lX
0GzTsggAijX1ydD8Kb8eg3PZ1Ak743zW3ydXupE6OLFtC64W4dSRbt/Tc881sjFU
cSnBp6dUVyJkzkAOBkGiwPlRP+FM7qwTXOWpGW8rsBy1ljESH2hHK9wb3vx5cp5p
wok2CbFdk3DTyBtd2wxiwJHJabrSPdxMSXMJhapeY6LTUioSJLuNG0cHFYBKFxqj
kbEw1OnT4H93uiXnO2NfDwMQXysILraha3IFZkK0DpSphRvZMdkCfFsprqVNsG6r
2VTgBI2+CszuNgX6Mhtol4+EnoaGY8+LXYqCmrk9/DKsNlnmev6gh4NmBlUBCy6L
enh3V6XAGKnjnZBMOk3GtSHaUKAkTg==
=TnpO
-----END PGP SIGNATURE-----

--Sig_/5HIu51zUm.c3VQmZ4z/.ADx--

