Return-Path: <linux-next+bounces-9658-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 902BFD1CC34
	for <lists+linux-next@lfdr.de>; Wed, 14 Jan 2026 08:04:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AF610300FEDF
	for <lists+linux-next@lfdr.de>; Wed, 14 Jan 2026 07:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E22836CDEF;
	Wed, 14 Jan 2026 07:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="NWueQy3h"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A8E355029
	for <linux-next@vger.kernel.org>; Wed, 14 Jan 2026 07:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768374276; cv=none; b=oA1wBDec/c9MsNX1bbqAtZVHYma0APq6+5uhTY/o5VCAYlLMDbMPVEaYO9zDjlkdG8GMrpnIPIJveaC1YFlj1rnfOk/5Ln+9ewmxVyAWT6h/UTAEolVRh1J84wLvdAnVtIeI7AAainSWMJtXYgl/EexmFDD3Fx+HYF2vIIprVc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768374276; c=relaxed/simple;
	bh=nqCV76Kct16If/x/5hPG3HCoZMSnhr/SvawAkLZ+bJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M0MAoqeQHrVjP0pBuyopKOewiDCWkubSv64aVL6pU171rZ2eAhk+M+9HWDhiVpzNovqzIMIJpaRGomwEuZAVzVMgiBLm36WEidy7eDD7ffRYBWIGYGOQrOti3RFfiVpJZwuFxeIKshWB0eUrzWkuYkOAcCpT3Dw0DCULY0+ilFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=NWueQy3h; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=eYH6
	nZ3zcKAMF3LwGA2zywt5wYpFiNMA/A4ECYYyGAE=; b=NWueQy3h6U0n5oqKDjLv
	NJK/UUCVGJlcfwqUM21Mpk+S1I53vvs5axcLoWRc3k3dzXMe6Xo5GjO7XDoVQLVM
	pBRt7vnT3G7vDy9dbxBuXAsqzTamqV+IWEvJkpPn5FCOzRwOUZzef78B2vc0QD/q
	0+Tf4bQzoyT/83WdPvoPOB3fHqxXs4m9xECxB0QZ/qs7NOOicnEez+XjPw7B62iD
	ARf3akeFqIpD9xrZicHLxcuZ6yUnpuT7uelkgVfC7HWb+ofX/rQMrdYSqFplI9xw
	+8GpTYGdw4g01DleNyZQMGW21Om04CM6rNQDA4cNsn0z+++jYIaaK9IOZH+PUUed
	4A==
Received: (qmail 2021787 invoked from network); 14 Jan 2026 08:04:29 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Jan 2026 08:04:29 +0100
X-UD-Smtp-Session: l3s3148p1@qLcfuFNIqKcujnsM
Date: Wed, 14 Jan 2026 08:04:28 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Wolfram Sang <wsa@kernel.org>,
	Alexandre Torgue <alexandre.torgue@st.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the i2c tree
Message-ID: <aWc__Pcvv4l1TCe7@ninjato>
References: <20260114124053.4769697c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vNF8fUmqjEJpXqfX"
Content-Disposition: inline
In-Reply-To: <20260114124053.4769697c@canb.auug.org.au>


--vNF8fUmqjEJpXqfX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> The following commit is also in the stm32 tree as a different commit
> (but the same patch):
>=20
>   3068b9fa6570 ("dt-bindings: i2c: st,stm32-i2c: add 'power-domains' prop=
erty")

Huh, okay, dropped it from my tree.


--vNF8fUmqjEJpXqfX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmlnP/wACgkQFA3kzBSg
KbZ16A/+LukERS2IY1g8/otYLdZxUQ4vZZqF0PREKG+nE1DP8sceWEc3/EM9gTTE
eQesrM+rW7dkdP8LVbA+kmkvOa0kHD+NrcZgCfvY6AG41b0CQKzRBihQ1Dkroq5L
b4or/R79sRlOMwB30jkqJv7LYj4XhJgx/TWL+/uPQ2Um5BO/s2lZ9VisitkCSGDR
aEuPBvV9zgdb/c/JNZL18vQ5XtWoTO9MIQSWJAXt5r0gqIBlc7kfQ8w5FqPONaMM
x2Pk7Ryy5nTzzLCGBM4BqC3G4S+7CqsgCedznaTJbrLLc8xiXN1E/2+SHdfP+3rW
mfBS6vGgvFGGF1Gi9tTalAWdLP1CmZGbzNZPsEDE4tnguDJpYbDHFjOl3dkepEA5
RwxqHleMId/091NM5ywDzk0KttM1uEw4kFx1x/P45CuuDuASUBnYpvVa/OC+PkOB
5AZQ+zS2+JrAd2gTwVw3t5CPoqqn4HJlHTTgQDnyZvbqnf2P1hRGtCrnNoVn9P+w
2uu1PC0AJLQdDIMxQpNvlSGZ2LYejhNjf/VezXKRTZZAG+GkrvfvIGX8CZCI8yHg
yLxnjShoCyUyopxk/Y5MyAyCHIJy+xESvGyqYezfwVhL+nIBwLEhSLZU0ZmJQ0o+
L8/3ytCMssrK7POnutTdBaqMT9iRvQujV1aB8FhU21bO2Evaa9Q=
=1Fo3
-----END PGP SIGNATURE-----

--vNF8fUmqjEJpXqfX--

