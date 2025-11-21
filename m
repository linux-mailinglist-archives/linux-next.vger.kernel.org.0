Return-Path: <linux-next+bounces-9122-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B5476C76D65
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 02:06:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ADD294E62EC
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 01:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F4577261E;
	Fri, 21 Nov 2025 01:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MlfIvjAi"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C8035958;
	Fri, 21 Nov 2025 01:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763687052; cv=none; b=DLx3r8AAVYYRr4MXtauOv+0RsmQoDyql6lFSzn0pejdmTbYD8GqSlmNQmimx6qwUNYqmFn9I1jLjV6b7kiLJSCrf2FqUn7DlX7vfcfmLDU/Q67rROHG61bxt7OydzNsTVFyrOsbcGoR5aU/GYbn/F1O5iZB+UomYxvPrLjRnoFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763687052; c=relaxed/simple;
	bh=aSq79Fjoo7TBYk1xlF7rQlvZSiO55zUe+vJhqPq7vXU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SZ2TjP5OSCoq29eNJ5OaCvYpWHKtmp42h5BoQuAdPby5L7Ff4iGA7yu4U+NLyvyQ5WYZufY4p8Rh+eOACSmqoPEUv5L+16+DAgqOf3QaOsmQEBbvt0D2QOshJosuB8RxXTPwy+jdYVeOdrC6gGdtOj4ATWjPOwHT3O9za0ykrY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MlfIvjAi; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763687046;
	bh=AgPwvIiuzOraH3S15+vZMA0gpj87eRe5Fdpi1glRsc0=;
	h=Date:From:To:Cc:Subject:From;
	b=MlfIvjAi2EKZ+lLcGMdAQT8/u5TwScXQsDme64y9DNBgJ5lVQ5pgEt8rmLfnn5Ri0
	 mI0AreXj/LQWcsdKkgAWCE4IOW58q60/QnUJ46NivjCCS2doKJxCY2Sedc2hnKBPAh
	 4UWhjT3tb7hj6M1szr+AfJYc4HMeihei8EMBnsUhjhGMckZG2EebFV/gcCCkfJRy89
	 IWm+cGdCqb6f15W+rlibPG0Y2HoScJ+OGUD1R2A0vmI3RJN9ku3hn67/w9hB4tUhPC
	 KR90FQ1zZglVC18r12MF70G9Gg77PAo0iz6j9Yd/GTUzTuRrIs4V3Gtli2uRF/Sf9e
	 LojdlzAhd7JhA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dCH6Z3CPGz4wH7;
	Fri, 21 Nov 2025 12:04:06 +1100 (AEDT)
Date: Fri, 21 Nov 2025 12:04:05 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the cpufreq-arm tree
Message-ID: <20251121120405.50954add@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/K1Cp10Cs5=VS.KkG9MG4AON";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/K1Cp10Cs5=VS.KkG9MG4AON
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the cpufreq-arm tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

WARNING: modpost: vmlinux: section mismatch in reference: qcom_cpufreq_ipq8=
064_name_version+0x140 (section: .text) -> qcom_cpufreq_ipq806x_match_list =
(section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qcom_cpufreq_ipq8=
064_name_version+0x144 (section: .text) -> qcom_cpufreq_ipq806x_match_list =
(section: .init.rodata)

Introduced by commit

  0194066ac1ca ("cpufreq: qcom-nvmem: fix compilation warning for qcom_cpuf=
req_ipq806x_match_list")

--=20
Cheers,
Stephen Rothwell

--Sig_/K1Cp10Cs5=VS.KkG9MG4AON
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkfuoUACgkQAVBC80lX
0GwgQQf/fszsNG7OdazMuHS6gL3uDYdFfIwoMydEsg1W/Z4Syyvlubf8PYo3Rmlk
6MJadI2Nl/b6zKjaEhBUAFJU6DgJ/pjZkWl4eoVKkkeMU3Sv+nhJf0Mx/fvIkRVm
+zp6+P4Q7QMhROOlP4owWlBrVrmm0m5YepjGnMGE/iPQPsEJjWv740fUbCRUYGPx
zLfzou7bm1/qCgC55bZZxlYcKKeJG/mI6GIz5tPyBsCXyurAzbtZq89186uH2OL9
JkwYCT6e9YB3u2gpAjT8+UyrXzKcrbOTdVMcKX9WzqjZNAlMEAbUtYBmJEO8IS9o
699TPFwTJ7z9I2QfsGLsWEYV3v31/Q==
=TPeB
-----END PGP SIGNATURE-----

--Sig_/K1Cp10Cs5=VS.KkG9MG4AON--

