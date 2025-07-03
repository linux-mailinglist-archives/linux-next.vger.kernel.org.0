Return-Path: <linux-next+bounces-7320-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6654AF6918
	for <lists+linux-next@lfdr.de>; Thu,  3 Jul 2025 06:23:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43DEF521C50
	for <lists+linux-next@lfdr.de>; Thu,  3 Jul 2025 04:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18E6028B4EC;
	Thu,  3 Jul 2025 04:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VEQ8k43X"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842C0231853;
	Thu,  3 Jul 2025 04:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751516635; cv=none; b=ZHxQjVQesc8CYI2yEFGEFO/J3WnENBVBZMC/sZDowbv3eoJ2XWsFUoWa1h4Jew5p6nOQkBVg+hIa4oq/THXHoOCtr/f/n3C2gqRYbZ3YU/Yym1KnLIKPaJpoYHgB5BL3MOApwgNGd2D3IEjcJkvOoWh0oEtjatczpnK4/xENlXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751516635; c=relaxed/simple;
	bh=h8ubHZfWMvO31OpGii6hCXa6S0IryvQNPFMME/gZVoY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Qqvt9Np04eiIzS+jFOC+YXTV4LT3ANEtuUkyeWilGJ2al2yNIc8ZOtIcswGTP8VL0vJSjMdIIwvAb9BuGwgb4rB6OX2nhYHCOKAH65G7NUDRXvQ3yFEP3M/dxwFCpZmx/a7NhMGKJfpBumdFoXfr8OyHymoXiRsYNqDHIdHTmLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VEQ8k43X; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751516608;
	bh=OxnkQD9HSmdamZfPeenPLZbQhCDu5AVP47bdzZMRUX8=;
	h=Date:From:To:Cc:Subject:From;
	b=VEQ8k43Xi6oBb8D4bX62GNSaPazf3kIr/vdtYpiZJs4KJJV6N/X27BtdN8VfVjHES
	 pUDE7xOKFBTxhWoga0+t+txkSBO4YVsrw+i6B+d3SJkJO1/DhdCuqWOx7k0/IrbW8Q
	 xk9kYoFO8eW1VeQvfQdele6dU4goF19tm3PrOrVMUpwTPbaEPDplgbUPTQcmnz/v3f
	 9keD2CUBfh9yUTfrSwEdANZO7ywM7fMObQh7rfVPxZMVi5iMJVDPSiV6VDMCqL34hS
	 1OL9tn79lP4YozRwNB+6+xsNaTXEjvYqUoSbkgeY4elKpxQuPLOaY0PjrOrvgSkODW
	 fM45J/EEznPqw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bXkCh24Myz4wcZ;
	Thu,  3 Jul 2025 14:23:28 +1000 (AEST)
Date: Thu, 3 Jul 2025 14:23:48 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lee Jones <lee@kernel.org>
Cc: "Dr. David Alan Gilbert" <linux@treblig.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mfd tree
Message-ID: <20250703142348.45bb8d28@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+Q3zSPK48qtskdh+tyk3YNk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+Q3zSPK48qtskdh+tyk3YNk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mfd tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/media/radio/radio-wl1273.c:12:10: fatal error: linux/mfd/wl1273-cor=
e.h: No such file or directory
   12 | #include <linux/mfd/wl1273-core.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~
sound/soc/codecs/wl1273.c:10:10: fatal error: linux/mfd/wl1273-core.h: No s=
uch file or directory
   10 | #include <linux/mfd/wl1273-core.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  17f5c6fa85e5 ("mfd: wl1273-core: Remove the header")

I have used the mfd tree from next-20250702 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/+Q3zSPK48qtskdh+tyk3YNk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhmBdQACgkQAVBC80lX
0Gwuxwf+MGa23A7TD6GBelgTOIPtcjqi/Cj24KhzZS494z4NiA3A46JEu9TKsPEO
4jiXjmzxtGBIGB8zcM2srUzTLSzo9UP4j5TSfQzeZ890FJizU7BchRemjdgzrmw6
Z8IWXjGPAtlSgpSV7GbqW9kZDzJ7MPs4oLEt7AzBPJAVqN3Wvq/SXM7H+Es4jNvg
oD1dGh6rIGa0tHvhI4Enb1DwbOBYHFUwRF2ZYeTPWprfiVD/jJ3RSDi+T/NNZB17
N9tXhsLp8dQN9eIZHhaC1B6wJvwiWRpKw0Wjgzb33e32I6qoO4M/raylN7rgnyAL
xj25r6qFpFVfcxrpth4raMBRUH7gMA==
=1fMe
-----END PGP SIGNATURE-----

--Sig_/+Q3zSPK48qtskdh+tyk3YNk--

