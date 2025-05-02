Return-Path: <linux-next+bounces-6501-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEFAAA6DC7
	for <lists+linux-next@lfdr.de>; Fri,  2 May 2025 11:11:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2ED549E0722
	for <lists+linux-next@lfdr.de>; Fri,  2 May 2025 09:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F6EC23182E;
	Fri,  2 May 2025 09:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Z+tMKMcf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82743231846;
	Fri,  2 May 2025 09:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746176889; cv=none; b=NfT3wiwvhsFrpBehySnKxTm26KEZTT6f2HfOe1KeZ5FiyyCK3xm2UWyz9n583jIUOyDHb9NN9N71BSZ/EQKm6XyUaOyM5PDwrydq2H/9ZxVKEe+OptUCpdBT+1xoLojBLRW8EN2zTiRJ8ROfOio89Wsnu92kop7UFjrpqaj2HLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746176889; c=relaxed/simple;
	bh=R/f/0PpRRl12uL9hXEC0Bh2MUCLLMpgVcEN+eY3c5Ds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qAw4qOQUVbFMC1T5O9jcGzAUoeWl1I2c835cS/xqXAX/aqaV2npu+i627q3gyRFJnxu3sIfeTDdKhTl+VJZKxlC26fv0RP/dZu4zch4o3qLeIuqD/NpIfvQRVR6aHwxH4xoXr4OkYyHUc986it12Q/YhSn+NW1e3wNLmw2pUO2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Z+tMKMcf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746176877;
	bh=pbmq+7IGU9/SNSn7Fm2+UuynPvmmeana33Zi7tIiSYc=;
	h=Date:From:To:Cc:Subject:From;
	b=Z+tMKMcf1GeW6OARiz+SoAWuDXF4qJcYp7TxFDu9IGsBCS2z9JZqTFPH3yaRBuMEN
	 6jePCjQP5DMBK7TZ6H8xb1kg6MK/rW0g2hQbBuFXiJGyTCudLEuF4cTSjWvS32Uh9X
	 urNtKAMys8RHQrj/oEKs1N1/NbhQ0ZXbECSorbQ2swicsvmF4GN99VSB8Mhp5DIjuu
	 WLmfgjagsfITBhQbpH7vuzVExrGK4UGjnxez2rIbIKmb2HUS9op+Z80xlOBBOF0LGV
	 yghuRdaNjcqQWdEVKZx77U/r9lRsgtm657GltHMBeyVyzHNNXURE9SF5uvPNCw+Tue
	 HFVvgQH+JWWow==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZplSX71WXz4x3J;
	Fri,  2 May 2025 19:07:56 +1000 (AEST)
Date: Fri, 2 May 2025 19:07:55 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui
 <rui.zhang@intel.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the thermal tree
Message-ID: <20250502190755.31379819@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LO937PrQosqz_Q5CBT7T5YT";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/LO937PrQosqz_Q5CBT7T5YT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the thermal tree, today's linux-next build (arm64 defconfig)
produced this warning:

drivers/thermal/mediatek/lvts_thermal.c:266:13: warning: 'lvts_debugfs_exit=
' defined but not used [-Wunused-function]
  266 | static void lvts_debugfs_exit(struct lvts_domain *lvts_td) { }
      |             ^~~~~~~~~~~~~~~~~

Introduced by commit

  ef280c17a840 ("thermal/drivers/mediatek/lvts: Fix debugfs unregister on f=
ailure")

--=20
Cheers,
Stephen Rothwell

--Sig_/LO937PrQosqz_Q5CBT7T5YT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgUi2sACgkQAVBC80lX
0GzwdQf7BKkrPp72zXuEI5SWYga1G9m5xLj00pAFUA3AFaTvXExoV4zqN0YD2Vcy
o5RY5vhxhnCKwI7Dvkxy6L7GmAGuvLqOQD4zFr6xGKMOHVVZGIPUZFcc+0qaiF6S
RLG2WQaIA/dYdr/yX/3vvcmaEuD1xB4CTIIjrB+jFBMFnE1xcj/iObvoZl4RuzQW
2/W26yHC1jbZq1kOJwJR0oiozi3NJ3S/9R1VuMs0UF7sAx+kdvj0bpnlr00QHbPi
ojL6zMKbyVGchYCo5HXLUWHe3O9o+XrWxxrDb2zJPC6rdcRGEcRscsLba0TZh8el
F8d8/IeWDf2rhRWC4OKO4dJseeP8Wg==
=Z/fD
-----END PGP SIGNATURE-----

--Sig_/LO937PrQosqz_Q5CBT7T5YT--

