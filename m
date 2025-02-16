Return-Path: <linux-next+bounces-5460-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB24A373F7
	for <lists+linux-next@lfdr.de>; Sun, 16 Feb 2025 12:29:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB77B1888707
	for <lists+linux-next@lfdr.de>; Sun, 16 Feb 2025 11:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F2DA18A92D;
	Sun, 16 Feb 2025 11:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="j9M0yrjl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305E015F3FF;
	Sun, 16 Feb 2025 11:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739705364; cv=none; b=iZJjYpCXNyzJPXKns8OCp3lESAcH1FG8WOibM4Jhml9OL7dK9eD9Goc3xpcaybb6Yqe/oa+uCc5u2hYJMKxj+Trhljvl7kbRZ8GL0dOCa4BQjTLGybWUyAcn+RFTWIrVTKTPDZ3bs/FpOREXclkskcNRAw/PHwngW27M6K2fSdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739705364; c=relaxed/simple;
	bh=6Rsd1ROjXGjyIiPIYX2+5CQScJv8RImfIyjhVzbzbFw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PdW289ALN5kVVeuhA+ZuSYRo3EqUMYTUpazsXiLj/2saTsTMu9LURXak0F5MQdlsbwBmfdV7Mu50IwA1KpVqybOQdGRagROv9L8TH3YO5lqfJeAFmuRGH9AqjBdtnB7TZnij6Gnbb4BrIQOzhPCySlctCLMwOg6563gkBZeOqO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=j9M0yrjl; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739705360;
	bh=z7Wy9pUeUdyNda4PLP/zBCveXp0FpYV7SKWfum6Hw+w=;
	h=Date:From:To:Cc:Subject:From;
	b=j9M0yrjlGh9XGDtJKSyq27eMJMtHblsRFisy69eWscaxcSz+31I8VZFzzNkQ5DBCd
	 x6UnR58Q4x6haDvbcFflyZ3TBBqVan/zEgf10au8QzaFFbEFUX4pzTbBaFZbO65/7y
	 VdXZHig0QnfbxmeYINqR3zc+lXotCPsf6kpsHiRBYZ8o9Wpe62i1hg07MJKrKsBt6c
	 9kMvmmTzFXQ/rUdJnQOMJKD9O/niCjadU4IbB0wuCDNKagcrZ0dquyD+bD1QOON+cN
	 wWUhdeRnUK0hKj0eS2cGrspRQXx0tpsInIyD0+P02ycSZmdMWwOJUYr2xSrrquzs24
	 Tz40b//WFMUGQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ywk8J2X8sz4wby;
	Sun, 16 Feb 2025 22:29:20 +1100 (AEDT)
Date: Sun, 16 Feb 2025 22:29:19 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andy Gross <agross@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the qcom tree
Message-ID: <20250216222919.07ea1184@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//g_gIhHd+E=PeXdsbYMI42f";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//g_gIhHd+E=PeXdsbYMI42f
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  329497fb54d8 ("dt-bindings: clock: qcom: Add QCS8300 video clock controll=
er")
  25abbf6b8b9c ("dt-bindings: clock: qcom: Add CAMCC clocks for QCS8300")
  6c9edce7a0e9 ("dt-bindings: clock: qcom: Add GPU clocks for QCS8300")

These are commits

  3e86e57356f0 ("dt-bindings: clock: qcom: Add QCS8300 video clock controll=
er")
  0e193cc558e3 ("dt-bindings: clock: qcom: Add CAMCC clocks for QCS8300")
  f0ada00a9b38 ("dt-bindings: clock: qcom: Add GPU clocks for QCS8300")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_//g_gIhHd+E=PeXdsbYMI42f
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmexzA8ACgkQAVBC80lX
0Gw1OQf+IXX/X4pyGfh30VopjxP9b3qH7eaO89ZdsUBh8US+NudJArRHz4W+SeqN
JbJR3+b27PGm3vSosNTUAkgiMAuReK737kdNNNbdDtj4rgTJeHg6aQyRrlaJLkZV
2xP3ZNriTC86iIPspjmjYgpqXWanTKDuZWD7aJqcVgJcpM2bYRGIGhdDDpkhBJc4
/PVQMBb3YDB5n3Wun/7C6a/+Hahm+RRlqYah3yB3/838gUVhj15SOPQYwAj3eEn+
NaFkzox0eXtvmZgOpEkiPp3Vt4nWDsQWBheuKhVKsx5SSXh3pzqGmUYt2WNyKSEW
ZZ6T/3n0BCuy1ZWhjfLCgSA5kXUaYQ==
=bbMG
-----END PGP SIGNATURE-----

--Sig_//g_gIhHd+E=PeXdsbYMI42f--

