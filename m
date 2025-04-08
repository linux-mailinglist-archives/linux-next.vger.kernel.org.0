Return-Path: <linux-next+bounces-6176-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 178A4A7F1B5
	for <lists+linux-next@lfdr.de>; Tue,  8 Apr 2025 02:52:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92CC13ADB76
	for <lists+linux-next@lfdr.de>; Tue,  8 Apr 2025 00:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B505225EFB9;
	Tue,  8 Apr 2025 00:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fH3DHDIA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E5A35973;
	Tue,  8 Apr 2025 00:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744073514; cv=none; b=GeE9k08em+ot78VbwaRQfc5tQX4zdy6rgTx0g7kdNgEXgYrvT2y6Y5Kta5V9xSdf7J3hXaMaK2QHFcZWHCut3WbFogwClUTuoeatgs90mib8J0dL9LZ2FQBzqx1BWgFq9NyQ7jDz0Iqo8xaUk50cfeg/fS2EWYGeYcJ6JO7KijM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744073514; c=relaxed/simple;
	bh=ZWT6+rBYoO49saLQZfVHV8q0ZQmRZ/vxByILhRGafKM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=q9ny5pirzjMwmpnp+ueRn041bgkq9SPtCEj6dILjN8h2LMU7G8fv+ttjT1tlvlV2HBKJBn6bsIrBZaUhOuQ6mf551pVPoWjMEqe6zE8S3ROFq1iR+Ugq5k2zCDe/RAbNbBh5OrG+8tKb11c7sCulM406e5jzOhD3CXRZ/Vqf0RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fH3DHDIA; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744073507;
	bh=aOTZzP50siEULUrf5/csQUelECo0W99PmsjoCCM1QfI=;
	h=Date:From:To:Cc:Subject:From;
	b=fH3DHDIAVgDtmrPzwkVPoCd/ZbryzeW4F+snxVdxkS9+d+sFWmy9Q4f2jHVhP++Gj
	 bn6cC3seRDZHxm4YekVGa5myKbFsYJ9+WMVOkf50GZ9sfmIF46Uy8wt5mvOMCrwY6H
	 CyIjLusqF8F/VMNgErXkAlMuHeLUyqtcMr/IGAyN2XIlfv0pvrWMkAf4JYkApRB+vZ
	 se5vedU2YjKiypmDdXcZ7v0GstvUU8LC1Da181zWollgTfI9v6Pbsxd4yo7q8frv3W
	 0qJOhq0j9ZfS3MwXDsGvhn/LFg2KwLvUuejlgDtjON3idU3aX/BRql+aFj1XRdGi8f
	 7KrfTKF+O7mjg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZWnb71gbMz4wc4;
	Tue,  8 Apr 2025 10:51:47 +1000 (AEST)
Date: Tue, 8 Apr 2025 10:51:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: Balamurugan S <quic_bselvara@quicinc.com>, Jeff Johnson
 <jeff.johnson@oss.qualcomm.com>, P Praneesh <quic_ppranees@quicinc.com>,
 Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, Ath10k List
 <ath10k@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the ath-next tree
Message-ID: <20250408105146.459dfcf5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/U4LlY.F_bTv1q3nIDCt2.wy";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/U4LlY.F_bTv1q3nIDCt2.wy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the ath-next tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/net/wireless/ath/ath12k/ahb.c: In function 'ath12k_ahb_stop':
drivers/net/wireless/ath/ath12k/ahb.c:337:9: error: implicit declaration of=
 function 'del_timer_sync'; did you mean 'dev_mc_sync'? [-Wimplicit-functio=
n-declaration]
  337 |         del_timer_sync(&ab->rx_replenish_retry);
      |         ^~~~~~~~~~~~~~
      |         dev_mc_sync

Caused by commit

  6cee30f0da75 ("wifi: ath12k: add AHB driver support for IPQ5332")

I have used the ath-next tree from next-20250407 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/U4LlY.F_bTv1q3nIDCt2.wy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf0cyIACgkQAVBC80lX
0GxGaAf/almYg2cNCpAsxVo4sRFqSBPbvl8F4TJWeA8bXrIUmzAIM9z00YUaSXSy
9HctDk69oV/LLSwacS5+QeyBuvMUZDvFSCg8cEcaynMUfBTaUioDWdVMNYhZEhaW
mG0Pys6YNIZddblWaVFiCyfzyptJKznKCxjEgdIo9RSR98Pvjx0MI8OLUu5KuBgo
BlhA+uajM2zbHlN4ZcpEnL24eXZXOayuiWDcVoaZsFAD20gQBChDvdHJJvTbn86V
Le+RbvPVcLejP9dliPJhaaSUVTmAfjvxch2ZJ1G4eFjUccGOXS0vPubPi+N9ELs7
eVIyDKE/dYw81aLxuUdtRPaErWmR5Q==
=7ypU
-----END PGP SIGNATURE-----

--Sig_/U4LlY.F_bTv1q3nIDCt2.wy--

