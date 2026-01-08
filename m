Return-Path: <linux-next+bounces-9590-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4452ED068EC
	for <lists+linux-next@lfdr.de>; Fri, 09 Jan 2026 00:41:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5265C3030394
	for <lists+linux-next@lfdr.de>; Thu,  8 Jan 2026 23:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A74335542;
	Thu,  8 Jan 2026 23:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="i0VbZ6Ok"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890F2330B3B;
	Thu,  8 Jan 2026 23:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767915689; cv=none; b=ACm9gsuhK55/aXlg8VLgVfwucTLkQH2o9Qn0wKaxMJRMhJ20l1JbHh8RecDKMhWFM6aKOmUvRrwwO05w6voZTUCmiSTjBV7pI4BfQdk1vQbWvKRyOxXlgDaYTz7BT0Dp6jBe8862bWTPbk2hR9Rw7BVJ8evzA13LM7LJIIB5NLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767915689; c=relaxed/simple;
	bh=i2SawnJU11y4g+ohZA+Oz3wrMeSxHpfLgz6Dn+kIY8A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TXGykSqGtm02m/T/ushwJ7kWL5VvqUtV79WfKmN8tI+a6iOavxKY8n1VN1qj2qspDbOtFf4arZEm5zUppzni59HopQ1SY/nzYLelYJ9IEe/+vzdiSkTsAeB0myr9f3KadyVAD5cIsGFgfwWdi8dwUioJWnEQemDWsRCseS3UfG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=i0VbZ6Ok; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1767915683;
	bh=IDuGkC+47lUBqTcdMlPDxNlMMyC93/sIcgLY4fR8Y9Q=;
	h=Date:From:To:Cc:Subject:From;
	b=i0VbZ6OkANIX04k1lUs3iaBqrA1Nar7COTkhwGWa8J4QS6RlVJD1OlLvFGTvtEEeA
	 DsHu6rXZ0MNHxutRzQjWCS7izcystdiUh+k2TwTxp/rDIGy5jRPa1q7R+TRHGRjJW8
	 mP6GZh6BWEsLPHURQuod8GBeg0QOlu2OlejBv1oFGhkNM1yB+5pd7phYBOyOfiKk30
	 VTCI/JbrZRzkv1P3SNrWUnOrwm4h2jI6GnKttRnai8e88VLnHN6WTDZzrl1Uxe/6AR
	 nGrlw6IYmo31BLaEVdzhFG9OYWTOnE/TT864pImKVT5/kPJxUqq0JMAO9PvbQ3zvvA
	 A3Gw6CHK1Pn+w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dnLyW0c0hz4w2R;
	Fri, 09 Jan 2026 10:41:23 +1100 (AEDT)
Date: Fri, 9 Jan 2026 10:41:21 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andy Gross <agross@kernel.org>, Hector Martin <marcan@marcan.st>
Cc: Bjorn Andersson <andersson@kernel.org>, Janne Grunau <j@jannau.net>,
 Krzysztof Kozlowski <krzk@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Sven Peter <sven@kernel.org>
Subject: linux-next: manual merge of the qcom tree with the asahi-soc tree
Message-ID: <20260109104121.3f56ed64@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jkQLXJTeJQ8+hcwPVOiHeyI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/jkQLXJTeJQ8+hcwPVOiHeyI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the qcom tree got a conflict in:

  arch/arm64/configs/defconfig

between commit:

  8c7a1d258d88 ("arm64: defconfig: Enable Apple Silicon drivers")

from the asahi-soc tree and commit:

  9f262627a90c ("arm64: defconfig: Enable EC drivers for Qualcomm-based lap=
tops")

from the qcom tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/configs/defconfig
index b68588559e2c,b260202c2480..000000000000
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@@ -1381,7 -1364,10 +1383,11 @@@ CONFIG_CROS_EC_RPMSG=3D
  CONFIG_CROS_EC_SPI=3Dy
  CONFIG_CROS_KBD_LED_BACKLIGHT=3Dm
  CONFIG_CROS_EC_CHARDEV=3Dm
+ CONFIG_EC_ACER_ASPIRE1=3Dm
+ CONFIG_EC_HUAWEI_GAOKUN=3Dm
+ CONFIG_EC_LENOVO_YOGA_C630=3Dm
+ CONFIG_EC_LENOVO_THINKPAD_T14S=3Dm
 +CONFIG_COMMON_CLK_APPLE_NCO=3Dm
  CONFIG_COMMON_CLK_RK808=3Dy
  CONFIG_COMMON_CLK_SCMI=3Dy
  CONFIG_COMMON_CLK_SCPI=3Dy

--Sig_/jkQLXJTeJQ8+hcwPVOiHeyI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlgQKEACgkQAVBC80lX
0GyO0gf/aE1auNR0yV/VrMJWDHU0L3rj2R9fauTKfv4Cv6ujtIWYYtFEowZhsKAD
BNcHqdmcY44oTatBstPBluLVbjttLDuXqZkCZAiVnlyhOmzMDqmyb0W0Y0rCeoCW
yi+qqcTrwwZZDdDIVOouAliWtCyA19TLgz2TvW3SlVSuPc5JSXi+BShDHpm/XHlR
/RZZfC13RwjHc1LO9/tDWR4/ggAePA1E2sh1EYR9WilacvCa0eXxWVKLF9zIXEsk
09HNILSC4wwm5aP4hHvvTIQxMtty+qzomATrMgu3hrWVT6pyqk3ogHyZyqcxr8v2
2u3B4T/PaWesCVoQfM8TIwvPHs1A2Q==
=+Pw8
-----END PGP SIGNATURE-----

--Sig_/jkQLXJTeJQ8+hcwPVOiHeyI--

