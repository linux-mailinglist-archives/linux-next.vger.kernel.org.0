Return-Path: <linux-next+bounces-8074-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD155B309DE
	for <lists+linux-next@lfdr.de>; Fri, 22 Aug 2025 01:12:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0DC06231E9
	for <lists+linux-next@lfdr.de>; Thu, 21 Aug 2025 23:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C92F528688A;
	Thu, 21 Aug 2025 23:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WjU1LR1u"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9281D22CBD9;
	Thu, 21 Aug 2025 23:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755817938; cv=none; b=A2waMBPi52TctqqyZHkIIe/QEw7Vto4xLOnM+nBFA9OYAG6h0yCrnmp+t8wMQGRKYpO9bRp9Ww4NyDaRSAaV1ResJzPK+5/3hD8KkVw6+y8Vql/SA8f3b9A9ZwWRRSjliQZGVymCD25BxWE8PdH4dNiSHVYo99hJluA+uIWEM3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755817938; c=relaxed/simple;
	bh=1aUZjh4StMRQtWEaqQCeEY8sBf45aaOJklrrMCWl/SM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=e6t6RKHPa2zQTb5e7+k34a9E60K9vgxZb+G0gEYtQPP59quG+NGk4yyllXBMfrm1lJKqouQsgIhN94NAwXTNheoaa6NDyNks5MpZxTw8A32qhTEUk2hm6WRi24Vb95waskbCva/VjUKxH0oPL/tHaIhQMi5x6vp5BS5by2wO4JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WjU1LR1u; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755817927;
	bh=u3rW7fsOqDt2sF93GxMDWx/nLk7zNlbi00Vz+Um3sEQ=;
	h=Date:From:To:Cc:Subject:From;
	b=WjU1LR1uwor3Zz67NaaS5v+ybICtVeDdVavgTIdpgFGJg+sQBdt8R+X5XN7eKWzeJ
	 ihC2XBct+VLiBiHY1T4qDTBlffBpj+J3Fyazk4mn629mXJP0h8qpWuGF1MvCPPW3XD
	 6avOWNeOu6byfntt9GF/zC2bEsOuN1WywaS9F+Wt/FHkHQxa7EyOOsHASQjAdx37It
	 lt3stKmkuieUR1D74MtwzK0CP3cE0pHm2Wjlt+8LfHvhtyGwFlWOaChyJ2oVQDMU74
	 UbCapPH7ObdIQcbm7hTNwASE4F8UZ9NhCNihU3m+8uzmqu4+QvIK+bi/Y8ayiOFce5
	 tbLhPjozM0mUg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c7JxM6B1hz4w1v;
	Fri, 22 Aug 2025 09:12:07 +1000 (AEST)
Date: Fri, 22 Aug 2025 09:12:06 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Rakuram Eswaran <rakuram.e96@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the cxl tree
Message-ID: <20250822091206.7d0d57be@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4zpDzI=CP98mbfJV4j3X0hw";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4zpDzI=CP98mbfJV4j3X0hw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  561c4e30bff9 ("Documentation/driver-api: Fix typo error in cxl")

is missing a Signed-off-by from its author.

There is a SoB line in the original mail, but it is after the '---'
separator.

--=20
Cheers,
Stephen Rothwell

--Sig_/4zpDzI=CP98mbfJV4j3X0hw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAminp8YACgkQAVBC80lX
0GxCIAf9Efts4fB3uAp/gtdJFStnPss9acoNqIqrz3f63aEbqQeyXZoJZWKO08uH
11ZKiNTz5cnuM+t5EugaO6pzQZDYDcqBYkCtzY59ZGbZK2Rye8eeojAp0l/IVhHH
NSwoEKeCvXYP/Nsh5dGewzC1ijXV2Rcq2jRufE+t2COd2JOsFeV5h0bqmml/PgoU
XetGN51dIZJIAHvRgn8Wy/oD7jTO7dTDSLuyyWAx5pMSCNBLXOEU6JmiM4IDtvjX
JHK8hC7smgZ0A9AsTx21dHzPqHoeoBscLFEu3UZ5e9TzowG4SYQq6Co3DtAxVaBt
V7BYsW8/eJ2JfumjGfp+behEEQPrFw==
=5N+X
-----END PGP SIGNATURE-----

--Sig_/4zpDzI=CP98mbfJV4j3X0hw--

