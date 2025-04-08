Return-Path: <linux-next+bounces-6181-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C73F0A7F326
	for <lists+linux-next@lfdr.de>; Tue,  8 Apr 2025 05:27:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3FEB18934B0
	for <lists+linux-next@lfdr.de>; Tue,  8 Apr 2025 03:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A8B9253B54;
	Tue,  8 Apr 2025 03:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NvwkrS0C"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0614A1E;
	Tue,  8 Apr 2025 03:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744082858; cv=none; b=C81YQYlLVBw4xhc1nLj2xncR6G5cXjBSuiQudwYldSureQ3kxhbM91Sh3Amqy62hkuJbRvDiQa/QcI2jDyvLVhqL87ulRcl7Z6/z9x2YcIe1wvs/RFaV8nALqlwyCALMinVTACGCH/8JxV4x2bgl+Q8/pqmsq0cHf8M/3We4O8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744082858; c=relaxed/simple;
	bh=QBoHFP0rkCTLN++g+05IHMNfIPqZQxK2EUYy3s9EOrs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KzK49O07Gvg0Ko2O+3bVrvlsPnVOatDAZIzLWFX+cp2GgmNScB1wIaYEgxMR2UBSgeFlAFEgkE93NzkEjVWAkqoJDQOTj2A39T/8Udk9R4Tu51GwoTD2LVWIdSTDiGejh1lHEl/zhkIapyJX6McggzzXjKkfO6CbA1NX7FabP8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=NvwkrS0C; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744082850;
	bh=K2YteJBgFjtwBya1zY/KtJZdKMUSs1MqU9scQWyifhs=;
	h=Date:From:To:Cc:Subject:From;
	b=NvwkrS0CFCyPEPh7aQ1pd2ue7HKzIiad4ccj2yNCcyl9DkqQu42nkMMq+7mTf6zGF
	 SQYc9xVTN3q9MUzMXa2oAKMvTKXHEMi7INlgyiEnO22f1yiH884dmv2zForMQ+ajQJ
	 +7ICsrnIySQYqE3qgspKPFzXQCcOD0s7Cp8rSsKko/ZSXf3Bbi3inMJX+4MMYCdTy6
	 A9MqVs/6bEH7ZKht1x6KIdMndkMPaowOUYDt2BZMVXshY8aZNY/Rdpc1Heasly02Ih
	 oc4hifF8sM9fpW9ccQFrGNBR9s9hDBmpTms/p5YADxrNyF2CktZ7KwoAiHD05CwAQA
	 IECOjbWfp1b1w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZWs2p3TdDz4wby;
	Tue,  8 Apr 2025 13:27:30 +1000 (AEST)
Date: Tue, 8 Apr 2025 13:27:29 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the sound-asoc tree
Message-ID: <20250408132729.78ce049a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Uhb1c._RLftDrcd5VR57jIK";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Uhb1c._RLftDrcd5VR57jIK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the sound tree as a different commit
(but the same patch):

  7288aa73e5cf ("ASoC: loongson: Replace deprecated PCI functions")

This is commit

  a81aca6f8ed8 ("ASoC: loongson: Replace deprecated PCI functions")

in the sound tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Uhb1c._RLftDrcd5VR57jIK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf0l6EACgkQAVBC80lX
0GwwbggAo9W1UVmajRyVPyldCvqXzpcHpIWoijP7XTTJa0xTjOc0LXVn1s4fCe7K
N8GxYfGkIcPNn5QNKI5+IgCVrGSw0ME97D/wZsSoasf6OHyhXV42veoNzjJImORM
273Fm0KvrkXRv3K5orx1nBvz5rXFVxFdDxvsu40vJvAmVINQnwApRWzIeUj02t4B
YX81jIjO00KAqmieUELXYmYuAQMomRRwnrBmnEzeSLVKDfoqVORovtSsO0xeSKGC
vvtKnKPPcKVFjfCvEa3xleW0s+h4bCFlH/+wD/jguYtvdzFCV5W9PQV/qGr/iM9d
usWX2mQPeXFoP9X0bRHsMBO6/AurbQ==
=gvM1
-----END PGP SIGNATURE-----

--Sig_/Uhb1c._RLftDrcd5VR57jIK--

