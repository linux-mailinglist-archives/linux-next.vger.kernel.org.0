Return-Path: <linux-next+bounces-7547-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55064B05402
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 10:03:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFB503B2E56
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 08:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14684255F24;
	Tue, 15 Jul 2025 08:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ByWN69qG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5B54A00
	for <linux-next@vger.kernel.org>; Tue, 15 Jul 2025 08:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752566530; cv=none; b=d+FWIpbU1SPLzZK3SZYxXCmgQDS8po6xf4mY3247AsZWgrkUmGaUWud86R96zOlKXFIAfFXBu4Wc/vXekTP+eDkb+N/nCGjFuQWzdXGpfMREEgDYa5hT1VBAlie5CFgG8BYJ9z4G+o1x/56akv9aotYcctRiN2STwjHJ9VUi1SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752566530; c=relaxed/simple;
	bh=bvYZ0SUaeupI17B0It6HTbZEuo0IzIFeRxB9wk5CyKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ilfwtpuSOOyP2GJICqQGB7QBFeIWOiaRoxj7e1O/l6irPCRUjf2ZhbGd/jgbN0LZrvFaPA/uwrDr4+5kJ8uT+pIMrJk0PqmKVoQ51Hq9ZbhlEzdnP/ik9aNwqbH8T5yHQdp0vzLQBE09++OKG7f2pmsmYcSOBsokUjSeGy9VuOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ByWN69qG; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=SrsK
	YGNSlfQSvsh5jb+/BO418EmXot7GGbibR3jnoQQ=; b=ByWN69qGOA1fX+sd4Bc6
	xoMW5I+tuzFAyXnHV2nUNxoh6YxCOW1IpC4p/sll59dnoq2GItLLbfy1j5yN94Z3
	u9IFdkGReRx1EVKXiOqPAvxHUVSzyvSeC/O03Mfrc4hOSp5FWTDdIL+yEXh3hLEy
	4F1QJV04RP5jHWd8niI55f+EYrF6hz2WAW2XSERho9WI4aDsOTRyU39gO11rTHI1
	3H54N9gjLVDDoOg9Y7D2w5RKjCdeAsIKEbzsdB2Sbt4pEEo6VQqEzD24fxXGUt6P
	lDHe2GAbk4w21iDz26ibhox0n9ZdQo6hH6sEwgF4N6/pv64dUdWN+8eBwd9hXaEm
	1A==
Received: (qmail 2790947 invoked from network); 15 Jul 2025 10:01:57 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Jul 2025 10:01:57 +0200
X-UD-Smtp-Session: l3s3148p1@y1m3MPM5AMIgAwDPXx+vAAkEB0lWxGP4
Date: Tue, 15 Jul 2025 10:01:57 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the i2c tree
Message-ID: <aHYK9RWJ7GqTzvY2@shikoro>
References: <20250715130652.5570887f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5MXiyYFJrbtVSoFD"
Content-Disposition: inline
In-Reply-To: <20250715130652.5570887f@canb.auug.org.au>


--5MXiyYFJrbtVSoFD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


>   975b02f641ed ("i2c: stm32f7: unmap DMA mapped buffer")
>   36ae42978569 ("i2c: stm32: fix the device used for the DMA map")
>   cfba2fe76b2b ("i2c: omap: Fix an error handling path in omap_i2c_probe()")
>   7c18e08f4c3a ("i2c: omap: Handle omap_i2c_init() errors in omap_i2c_probe()")

Andi, please do not rebase your host-fixes tree when I already pulled it
but couldn't send it to Linus that week. Please only add to this branch
but do not rebase.


--5MXiyYFJrbtVSoFD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmh2CvEACgkQFA3kzBSg
KbZSRw//eo7V6w61lv4uzkvkMzJVqAldRD+rTyXN//2XCbeRcdJDiECdK3frKdLM
FVGxQ2JH+dEhcErPUCzIarfg6i54FNnr/tn7jTwgr+RKR8r6gxKpGkJrjF/9Z4sr
M4t5lzQmzmSn3SfS5t3MtiL5ds+4LQj2f/LjISBjOKPyZtrHO+DK3ULTyyBYnIZm
8UhOanc2P2w8B0qfEZkpEiAlNZPDYut/NVqBWSu9b4/dk2njYZ8q6QU4LvdP67kQ
mw3CKiI/JQUsvHS/LGac8VC6jcZFXETLqR9EcfWVCULd1/nKz16cDrakqlMEzwKm
1/CR4OeTnQUvnO8Q6aqIUxkYBB6SrHyKwUhW85DD5yADIoSkXafKfGuE5q5KJpBs
zEQgAn43rFlyDB+t1GPSdzmmYrm8LpjPjoM3yCfzhHO6UCyeWf8BR5nIArCkGZAK
eR7ZfunGEaBDRXmQjgMXPFdCxj8EbFKrdNFXcyI+vCzv0NLdDwNQE9LO20ePycPm
T48Eska1E7lOdJFEeiwUArbp9QqA+ZMesJerbDfnhtnXzrBEKpLJriAlUNvFIEiJ
qYJJc9oQAQoPf3jOhvaYaWrh9qagPHDW8Zm9aQ5ltoczJE/a40F+aE46wX/cw01R
nBTj4XeOE86/J8yUsDR90bz9lZ3j61pEOlaIHYTFAvM3UXIRW+I=
=HD30
-----END PGP SIGNATURE-----

--5MXiyYFJrbtVSoFD--

