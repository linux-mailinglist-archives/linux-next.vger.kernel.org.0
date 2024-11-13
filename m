Return-Path: <linux-next+bounces-4767-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4949C68A5
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2024 06:23:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C02128309A
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2024 05:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F16307081F;
	Wed, 13 Nov 2024 05:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tajUrlOF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173BD230984;
	Wed, 13 Nov 2024 05:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731475403; cv=none; b=JpF4/pyT/5gDko2R6qEtSjbvJq6dK200A637PgU2YLEWvYFpdyQFJSZFiokoOdAD/FHOtV/PjldHLwLpsjLCBokbnjDqbz6P8r2gXlHpDmaFk+OAVayLUzWJSBbzlefs+P2HIMoBToc5pTm6+U1tfcVxcGV+/taaAPRDfUuim/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731475403; c=relaxed/simple;
	bh=ZLbcrEZ5jOuWaewX4eNhx+gs5KJStSt+zBdO5zdEh44=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=aGUwHMTfNYWBthz35uU58aJQWKNwoBHVddsEV36kcvsUTToB79J7c6ut2K9UJ7uNGEtNBfmqGQPm5i4Eh9JN+pCZl+IKyg6PP2Ewpv2kzlKw5PcPOMgcOy9hmqYU/IMbWVsfGihlVRuEtM0AsW7QYegmtdO6UZzGaxMMhfkaePY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=tajUrlOF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731475386;
	bh=jmdGgfu1EuBEG70iditR1bT8QN2ACK2JKcyPtlvoCyY=;
	h=Date:From:To:Cc:Subject:From;
	b=tajUrlOFV9PeHhlqWTt+2nJLHnVjVdxsRJMa73zh61wi5LS2fT8Gd/rECC3VnXv16
	 +4ytKUCv+3wmFrYDxcavfLniTWy534chy1mEPbZ9+IATXpLjO+SHN216pLlQlUYQYy
	 GzhJEFYHiYfrctoqvKRTb4U/lsx0QA8ZZu3bOahQHxHLuPuvuUV/ZOFIpytp5EIOk1
	 gcllxxFbXBsyE9hZQq4l5Pp4GBpEWIiW7ARI9+DpgCP7b2WBjDXYwnPcvczslevQhC
	 eZRHKF6XdvZM39uHqBHNoNP2uRKsN7XF0TFHcaKUaYPF5aYOWbJfoSYfivR/i6biGK
	 BNJRW3uQnhmlw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XpBWY5wjRz4wbx;
	Wed, 13 Nov 2024 16:23:05 +1100 (AEDT)
Date: Wed, 13 Nov 2024 16:23:07 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Yiting Deng
 <yiting.deng@amlogic.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the rtc tree
Message-ID: <20241113162307.02c22fb4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ewD7Xhz898v=z7pFLI7j25b";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ewD7Xhz898v=z7pFLI7j25b
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rtc tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/rtc/rtc-amlogic-a4: struct of_device_id is 200 bytes.  The last of =
2 is:
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 =
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 =
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 =
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 =
0x00 0x00 0x00 0x00 0x61 0x6d 0x6c 0x6f 0x67 0x69 0x63 0x2c 0x61 0x35 0x2d =
0x72 0x74 0x63 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 =
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 =
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 =
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 =
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 =
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 =
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 =
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 =
0x00 0x00 0x00 0x00 0x00=20
ERROR: modpost: drivers/rtc/rtc-amlogic-a4: struct of_device_id is not term=
inated with a NULL entry!

Caused by commit

  c89ac9182ee2 ("rtc: support for the Amlogic on-chip RTC")

I have used the rtc tree from next-20241112 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/ewD7Xhz898v=z7pFLI7j25b
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc0N7sACgkQAVBC80lX
0Gz4pQgAodErnv7V2R7liQUA4t+Z75loctvYdVaPRW1N6hD6HoZLvOd+oZFYgbEP
670Iijj9brp+MveWxFgyxwLksYglf7+cL2WKMzkMga8rBhGzHJzpDe7P9h7w3QpE
MaS7QaKrNnHxvrIpX08edJZRM9YU5bIGUP7feqLncS/zQ9V5qAGyFGJ1VYthXbMw
VRC0FiHNdNVAnJz7wBPa9l9FnWqQWeQoXBd2Fb4LGOFrWxTdzzpHihlrmg86HZUr
eZB3UlzKGHGNsNJI2h3baYgshBshvBtE4J6WqenP3uObIxQH5YnxCL/M+MsmNjZY
y+mzfjINmMc271+rLf/MXfSDVaZyFA==
=WeNi
-----END PGP SIGNATURE-----

--Sig_/ewD7Xhz898v=z7pFLI7j25b--

