Return-Path: <linux-next+bounces-5393-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D56A2DB57
	for <lists+linux-next@lfdr.de>; Sun,  9 Feb 2025 07:34:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCBE71886D41
	for <lists+linux-next@lfdr.de>; Sun,  9 Feb 2025 06:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAF353D994;
	Sun,  9 Feb 2025 06:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="EJhdgoYp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779F64C9F;
	Sun,  9 Feb 2025 06:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739082892; cv=none; b=SQEYHJRFcqIR5MFUbQhT21v8r9pX09gBjkhynu3angq6LGmaxSR2gQC/8KrlKHN3CI261rpKo16plubiBorgeY9+ap2mgTWdn1z38QH9bu8kIwqx9p+1hPpFE5fTtfPA268DDviEJ+DGox9JUDIdykGo7TmO4tUAe3jBwj4ERGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739082892; c=relaxed/simple;
	bh=Vfk6qdeg6zLye0mSfQ2hA4kzjMGlU7OMABMdCdWA7N8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ceMVKjs4KTaQs7PDJyWQdwwkQWZ6FdyzBSRGXL8RsL+uSgWynFzI8btDM988hjvefY/45kyRAlA0zc7ThUsszQ5E1H9NfFc7c7JCTtrN+SvWD6w0rliS3+YTpsH8l9ywhgFrEylvQLxLVCvOUgKSF5BI+Jx2j3eNS/IFQTaMXxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=EJhdgoYp; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739082887;
	bh=6VNiOMq/TgkSTKWTAHEpQnLqpvZiW6bD0F9a5usyJHM=;
	h=Date:From:To:Cc:Subject:From;
	b=EJhdgoYpJxutkUEo+VTyH6Q7JDRxe00//ea7GZ32tRv55bumD1UBGDhRQETeqY5d2
	 oZxs52heBKdmGxRBZ/bkvGf3Q7Bh7/T7cSnwpKQB9X0hlyfUHZc34OCgSGXMy6Ifje
	 d46ycSrf/cghZjgDd/llVbaFmwUXhn83dE7SXTU6hOqSWoL9jjy9nvl6Cp5/iyraMx
	 5QZiTAIfA3T62eF7SdoXFETwJMJzFE1PUrcOGuVSi2HUU02K8Y7ZfrvKD6G6ch+ICO
	 4EKFZLGeokodXj1+LezK8fZPEYKBz8E8rwBy+UdILKkIoBFOLttBCfixtXSEIpRhCL
	 CfKgO91fEdzaQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YrHxg43pXz4wcT;
	Sun,  9 Feb 2025 17:34:47 +1100 (AEDT)
Date: Sun, 9 Feb 2025 17:34:46 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Antoni Pokusinski <apokusinski01@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the iio tree
Message-ID: <20250209173446.19590956@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cx6kQz1YJIji9dl5WvCs8sI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/cx6kQz1YJIji9dl5WvCs8sI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  3e2a7cb538ec ("iio: magnetometer: si7210: fix magnetic field measurement =
scale")

Fixes tag

  Fixes: cb29542a178f ("iio: magnetometer: si7210: add driver for Si7210")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: e0f5349ba881 ("iio: magnetometer: si7210: add driver for Si7210")

--=20
Cheers,
Stephen Rothwell

--Sig_/cx6kQz1YJIji9dl5WvCs8sI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeoTIYACgkQAVBC80lX
0GzmWwf/fbsmrm5Wra441SFxmp0r27DbDwfbOnAZLm4G2+NbqmVgtxq5u8da9Icm
VLjR62yMHq1IUpbMhQQB0ogABite1xMLw1iqed4kBuk4kuAD5dC4Hn+tVWkyiO4o
U7DoVT4B4cA30SV/S1oCEMdpf6sfwHycSZSh6C3TzseM9jfrUl2ot4Q11QIWliBm
I472tQ9IArhWkFStiKlw0s5wI2/99FPileNKuoTbU2XOF/H/sDmtizQR7fASCjys
WO+qbGNxQEBWrFOttbrugokQdYSWHLTHV/24uiyl4Npipz9cJrm6/VJA3KLnMdmk
v80CMJ5uRdO9DioYUMeu9/QsdNXYtw==
=HYfz
-----END PGP SIGNATURE-----

--Sig_/cx6kQz1YJIji9dl5WvCs8sI--

