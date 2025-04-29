Return-Path: <linux-next+bounces-6443-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE6FAA3BCF
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 00:56:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F69F7B3DF8
	for <lists+linux-next@lfdr.de>; Tue, 29 Apr 2025 22:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E88B12BCF7E;
	Tue, 29 Apr 2025 22:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PZIziWJo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B5C2BCF6F;
	Tue, 29 Apr 2025 22:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745967350; cv=none; b=L5OHFRButuuK/a1oSE5hEk48eFOEwVNDt7bJIFQynkqP+J2+T/UAb6IfEWi0Z5KSoz4leXKveDFvpJXYw6k1/1SVo4IZp4G2nZSMBS0i2K5FGe9/BHDTPbD3WXU/J/OsbOVU53VIbsivJlqW4/8aqXuvM5kTUfQwozNQbV6PssY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745967350; c=relaxed/simple;
	bh=cmDD9nZkKiuvoeAoctremY+s4vI9owYTLd0fLgS3suM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=T+yj7VpAUcJaiziz8VSNbdaUxo8ArV0U8xySMew0dMz7VADuEggHYHY6JKxYl8YUAjEe1D2Zf0+AwJGV1c7C90rkQZ6xNLXvW/fpHgACakxM0jTew+FzJc6CXC28o44XuNrVYsrx7eniLZa8aGpWp2d9pHJhoScTEUTd+AhpwpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PZIziWJo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745967346;
	bh=E7X0PsI1cNSqC+zIK0Zagf58PwciAh49hlXlAKQyDi8=;
	h=Date:From:To:Cc:Subject:From;
	b=PZIziWJoaELc3LYT/Elfz8M3eYnqzBFCnt5RLByyVpO6IEDt6ve34M8weC/g1AuSz
	 UE2ZXPSbgpqVG1qVZ49OLXQlbgxpkcs7X/43yZe1jxYrdIa02wi4iMjNQVql5ty4Kh
	 dO38czgzZu3k+4dfzjXgH/OU4+fGalv4fXT6bLlRsSxjGe2J9tClLjihzVhKESpMaD
	 oIrL514f916dMIU3lQc484ihsrc7slLH4xHe2NiaJnAnU4vOFa1KtyrmEpvKXA5XaX
	 zIWE/zFSV3L9tax3CrEvbNPfqZeTdh9ns0Qlsc+1sd4jmt6DNYhkvMexCH1zxrRfHD
	 1PdBSD4zXBnWQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZnFz54kZqz4wcd;
	Wed, 30 Apr 2025 08:55:45 +1000 (AEST)
Date: Wed, 30 Apr 2025 08:55:44 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: gldrk <me@rarity.fan>, Kees Cook <kees@kernel.org>, Tamir Duberstein
 <tamird@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the pm tree
Message-ID: <20250430085544.12800bdd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/v50sv44HBJeM_HZahlnDO+m";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/v50sv44HBJeM_HZahlnDO+m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  9eef70365d71 ("ACPICA: Introduce ACPI_NONSTRING")
  ac9334785c75 ("ACPICA: utilities: Fix overflow check in vsnprintf()")
  5de20bc939b0 ("ACPICA: Apply pack(1) to union aml_resource")

are missing a Signed-off-by from their authors.

--=20
Cheers,
Stephen Rothwell

--Sig_/v50sv44HBJeM_HZahlnDO+m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgRWPEACgkQAVBC80lX
0GwCmwf9E0964nVOKWtxwGwQmhRA93tvzKUbToG+qw/k6yEvxP9Xdb9sJqzo2qyG
tcs/eA0z3K2QoOjeYMOv8ydtYOD9bBofMyy1lyLbkCowJLTMbaqKiI03Y5kL/Mdq
NlziiLV5TNUU6PuZyoLMdtBuTRt1qh8E3hGAmmtG5GYMB/cv+g9TlY6cF7EJa4ep
Kzzm4T7z+N4lB19RA2A0KiXsOhR2vVfuBbENXqQEtvbC/AMKB1FI6xByvYAO9hPL
rP+Ke89j+3XOawa7iXvoUnmswRV1A+uVmoOB7KyONxBuIAnXJyUuIRNit96Pi78d
1KjRawJurOhfoq3fIAfDi6LKry61bg==
=XzVW
-----END PGP SIGNATURE-----

--Sig_/v50sv44HBJeM_HZahlnDO+m--

