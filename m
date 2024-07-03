Return-Path: <linux-next+bounces-2823-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8916E9253BF
	for <lists+linux-next@lfdr.de>; Wed,  3 Jul 2024 08:33:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4182328536D
	for <lists+linux-next@lfdr.de>; Wed,  3 Jul 2024 06:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C4633D5;
	Wed,  3 Jul 2024 06:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gYB+DTrL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7D541A81;
	Wed,  3 Jul 2024 06:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719988404; cv=none; b=hKWy32+PPJk92U41DPNuxp+iSf/evDaU1S6XntbYhDxrY9RQmxmyBE5rWCvZ0QXZZrHNPEYZOfT8IpEY/FfJAMN718t7CNCpj56veiOyqBq7YaEuQZhxisjdt+QbOKIZ9kZj/BZI0f3Fi76G6ilRQ9bE52oh6rqDSXGoasPBimc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719988404; c=relaxed/simple;
	bh=W9yK1awFPP80k327RaOKyPJFOTrLQ6S/pBHKPuXI3ZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Us1bYEjCzTb03GUkl6w68Qa379/AFymJkkQ/iOlCoGB/uGz2yiMIbOOkmzBxeRf/W2QulCvLXmGvZDeq5gkMpvcvz13qAPMiJDd0ayCE1jF0QG2dPuxfmDDPEoKkRUs9Iq8/hT2aTvd5Sobvwz/izgpA1rmWtY90bjqZ2OMgUWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gYB+DTrL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719988399;
	bh=m/pXZqLdqlvd7+SGdpVt4wrzpnL50rMZ9JF5KTgKK2U=;
	h=Date:From:To:Cc:Subject:From;
	b=gYB+DTrLR+8kmjZO7DtZMn1Tz2QTRTG/LqdCFA7caD17m6Ix+pcq5dsdu4U1CuL2k
	 cA+OODbzQTjIAl+hVB3M00iQcrJhW4TRcaaLkPoJX9FrbkVL/3E604CTozIs1sRj40
	 XnPngiylmTxgsKpayhuYJywsxy5NVi1d6Fogq0EZYcF+KmssqHADqYJArsMw15+eFu
	 SFFAHPCgqDTckYGf8BlB0WCYSkokKXMhQmqp6cj1/ywnICH3jQFuEd5G80swMwoTTk
	 uE7EOBvzMZDUw5Oqx0NSYFQJ0TuAL52LjvFwxXKE1qYcyrbjzW8PlL0xXklvFnv6VY
	 nx22BSTgLjuzg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WDVMy3SQJz4w2M;
	Wed,  3 Jul 2024 16:33:18 +1000 (AEST)
Date: Wed, 3 Jul 2024 16:33:17 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>
Subject: linux-next: Signed-off-by missing for commit in the v4l-dvb-next
 tree
Message-ID: <20240703163317.55618738@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sllqxGHvK/2_IlTb_AweqGh";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/sllqxGHvK/2_IlTb_AweqGh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  57dd8f2f77bc ("Revert "media: stm32: dcmipp: correct error handling in dc=
mipp_create_subdevs"")

is missing a Signed-off-by from its author and committer.

Reverts are commits as well.

--=20
Cheers,
Stephen Rothwell

--Sig_/sllqxGHvK/2_IlTb_AweqGh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaE8K0ACgkQAVBC80lX
0Gz1RQf9Evqf3Y8eZYwZi1nSj5qQqefHXoiBtoaIe5627jR7W+zqJb2dzMwj9VFB
ocY1N/33wo4N9mIN9+WAnVcN32PDEyQR9ei3Y/XwdwyU8b6ewIT6IQfcZJLtgaqI
ejmYPtxoZ5rQ4tv5BFRrA92MNRRT9EQMmTbM4ZRgBVn+uQsWFoO/OgjZH3ZYefvg
MDCC1Svg8Olnv7JxIMLgzUIhvBGj0io5wXOqoLUFKG6UeDIQJN46RT58WavPqamp
FmjIsO2KAsUHCCIXJYY20xj+uyGvXXD+LZooT/JXBZBw3Xno71oKdOqVIBBA0j3e
NTzWlxekN85dkEg4AsaPl2K5a4Q61Q==
=J7fF
-----END PGP SIGNATURE-----

--Sig_/sllqxGHvK/2_IlTb_AweqGh--

