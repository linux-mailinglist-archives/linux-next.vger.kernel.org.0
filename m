Return-Path: <linux-next+bounces-5077-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01ACCA037A7
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2025 07:08:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FADF3A46F4
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2025 06:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFE611DA0E0;
	Tue,  7 Jan 2025 06:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="e2eCrUUx"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64B1165F1F;
	Tue,  7 Jan 2025 06:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736230116; cv=none; b=WruvL10iH3xTPoBtokFAc8bQiK6w7IUSm6dIUOyPH2WBGoegZbis590rD9/da0DbzXO9UMybex7npF4yM98Rp3Mk/5lkbN71PrynoQS25Tf7ApT9zZUAAOGa4Xz0mZoqb9O46AwWFEkdOF5peiEto9K5GRlZvQxivUZQrLULUwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736230116; c=relaxed/simple;
	bh=nb2iTUxNGmvZF9i6ReAt0Rpe62oWX23NU9V2j/KCT60=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KOQQe3EsttzXSk8Gizyp/38C0dB10gh+0ptZOIZ7r/kp6jSqo8xwmuOvZx9w+lDEEGkNEv4ut2AiZOfBD/gqi4HsA/7yRaNHvxFwdwSzoaGEyGEl8OZyHkOl7NaBQ8rFlVlpozU5ztBEYYUqEfGv/j8c7ZSCetELArVqjpe8gWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=e2eCrUUx; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736230104;
	bh=EFJIFBj9BPOrNBjjfSCf3/4hkFH7cVDiHYFsKlEnPSY=;
	h=Date:From:To:Cc:Subject:From;
	b=e2eCrUUxo3ghOuUgoPdj9H+WLFkW1i4F0fRu0leFF9wi8aJus+67CC+DrfCdrWNLO
	 arNYmJqnoN2s8XOJQM9UlSvzdMUuAa+1D0oYis51UUT5p2FRpNKC/JqR6Jg4J0kZOx
	 OPD4NTuTpiI++vSRP3/8UAmpP/TbG4v7kL5AwpmuKVut5jDoMFgNHAp+abtF4dhs7D
	 rfI+1Vb/JAImWPnKuZEXfurfNNruCCa35oacOtRN6wzB/+FoWBaaUtKtle04OMvbER
	 YyhJ59l9bWQXhWmsk/VhUOnIDseasEvX+qQNtsk0LilWxdcfCsNveuzmsZRyqA0KuV
	 +/P+s78kfTgqA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YS0wS3RLXz4wvc;
	Tue,  7 Jan 2025 17:08:24 +1100 (AEDT)
Date: Tue, 7 Jan 2025 17:08:30 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the mm-hotfixes tree
Message-ID: <20250107170830.6c986c9f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FiCnXjU+LU0UgbDpfLEltfL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/FiCnXjU+LU0UgbDpfLEltfL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  b95a22c1f85e ("revert "vmstat: disable vmstat_work on vmstat_cpu_down_pre=
p()"")

from the mm-hotfixes-unstable branch of the mm-hotfixes tree.  This is
commit

  cd6313beaeae ("Revert "vmstat: disable vmstat_work on vmstat_cpu_down_pre=
p()"")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/FiCnXjU+LU0UgbDpfLEltfL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd8xN4ACgkQAVBC80lX
0GxHawf/SWCG1CtI+HnuAUi9tqHkK3lB0zTgchS8td8hb3vMpag70yYiy33IzsTr
msHlfrY+d/w6rz2lO41r8khd1HdcWT/g4BuYEIIBMXWUV3eYazUM6KN3EMl8YASZ
FHvZBvxw3YwHZsVMXInQs0DowiB3pqRpE5kRPon2RFI7IVuK2D593AlA2+VV1Ggd
dvql3Q7DQ76+ofBMoSGu9LWZgi6Ol7NatmvesAEbmWa1YiMrM1HiacklDpr6u8oT
S1m9gvjjrSbs1AQ9MhV0GY/+ldCYPJ/NeRKIeF6w/+EDJUx0rmYX2pQoPllE3271
tEMZR2bCASV7pcuWhE2Vs7RNTuCBMA==
=cTUH
-----END PGP SIGNATURE-----

--Sig_/FiCnXjU+LU0UgbDpfLEltfL--

