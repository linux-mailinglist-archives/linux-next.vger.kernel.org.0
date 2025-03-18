Return-Path: <linux-next+bounces-5848-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EF3A66B58
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 08:11:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E908F17AA71
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 07:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 387301E3DD7;
	Tue, 18 Mar 2025 07:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fqOLwDe3"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80941B85D1;
	Tue, 18 Mar 2025 07:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742281872; cv=none; b=ePtPWGyAPNkyQbXdpSBAXkR31lK6xdfG0zmLDHrYKuMWnYi4oJVJcuoD5GIol7lR2XWbqzE6nOA1Hp27rgLoBd8du2RTDil/Sn35BYrk/tVyKI0b+N1b27ZCrTQEn8Ri4iYa9efIGIYzKLfr8zyQxbwwz+pij7Ky8bDDCGESku4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742281872; c=relaxed/simple;
	bh=FIv+NYG9Lb22eW8fPknmLqMqqK0v2RyOgHrYLbufAJM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=J4UN3+0Bdct8i/U6XjTV0eJR9ysrtAmB1T8U8cK7l9+BUUHMKbkMzW9QpcpexAllJ2HMaRsbPJys0rYdYkVM+PGM/WTC+/UpCIwy9CegDrbowFADGR7RIjL3Po43VCneZNbKGJDxki20VMhCIswHvpwDJFkSQpgqdplIoHXCHFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fqOLwDe3; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742281865;
	bh=gsUcKHZ/BIEgj8zFVfJp+KtcRbVeVnFh+xRxib3qkYo=;
	h=Date:From:To:Cc:Subject:From;
	b=fqOLwDe3G2VtqlNyXbBotIR0Atmccvw/SMUoH7x6K2w0dJStkZnkbuZ+6FR2eXizz
	 iVgS22m6xR7+/xmIEaBgGAzlkyUAG2SKq95G+Fc3u8wjXTiSWfPvKEJ6XjcJacbVNh
	 XAv5dNcJi2SW1fXVv7P2zh9Vfh2MEhc8lBznMO1RTYanfgNpVJcvPN1npPig5NWyW9
	 M0lcgKqv8clp4u8iahgPEVjNLGo4f6zhWzuZl9qenBi6922GfSZgujIUM9KQ3TNsXA
	 YrGHrCft/F/vH7q0hc4ebqz43Kh9SSb0kws5xPIB6xtsVYy4nQjjzNc8qY/fZhcWvM
	 WqX8AvM8xnQCg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZH30T2qH8z4x2g;
	Tue, 18 Mar 2025 18:11:04 +1100 (AEDT)
Date: Tue, 18 Mar 2025 18:10:52 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: James Bottomley <James.Bottomley@HansenPartnership.com>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the scsi tree
Message-ID: <20250318181052.299a34df@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RZ0QPAEtb41MhDD3MYc2W/T";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/RZ0QPAEtb41MhDD3MYc2W/T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm-nonmm-stable tree as a different
commit (but the same patch):

  a131f20804d6 ("scsi: lpfc: Convert timeouts to secs_to_jiffies()")

This is commit

  84c34d010587 ("scsi: lpfc: convert timeouts to secs_to_jiffies()")

in the mm-nonmm-stable tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/RZ0QPAEtb41MhDD3MYc2W/T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfZHHwACgkQAVBC80lX
0GyI5wf/aSLvFtARNSLSw0Ri06VCGoVr4t5p/OyH5zrsokXIoiqnPQq84kJ/mZL/
UR6K3UPIzvmw38k/SyiXIclFr0IYZC4o9yT91uNL1JT7VV9Uk8sqeH8QBsqXVdFx
oEKKrDWmoj1cJsnVdX7NL19ncBTN+7pmGZcpZLgtMoQrVaarN3sEM6PAXNro2jXt
TaMddt+p4SZ2Q9SLjyVhNG5NneyDGXmySZi3RTrY2EcrxjRLDTMDxcBwqWeDlzgE
6O7fJS83h/1Lv0gQp/OHjt049yvp7q6AtT1E65Cb62b5x244JuA6zDyaZFEGlgUB
8NzTu0YS1qktma8+PaYh0K+/eMx3kA==
=GwEt
-----END PGP SIGNATURE-----

--Sig_/RZ0QPAEtb41MhDD3MYc2W/T--

