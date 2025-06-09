Return-Path: <linux-next+bounces-7110-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13038AD2955
	for <lists+linux-next@lfdr.de>; Tue, 10 Jun 2025 00:20:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBCDD3B44E1
	for <lists+linux-next@lfdr.de>; Mon,  9 Jun 2025 22:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7935F21D587;
	Mon,  9 Jun 2025 22:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="moiwB2FV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DC11E521B;
	Mon,  9 Jun 2025 22:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749507612; cv=none; b=uvsCEynVZFwn4990kXDS+ric0J0J6E8mtDWFvYibUMv+bmoHwdyCnk3RQS4188epMghc3LlAEfL1dJGG7teIoHsNZ9iNtWm4+jZC1Uwl2NBJ61O1vcmfuUS6GL5czljI/uDioe2BWxocp9WUfk64fXHszaJ8n3nkjJawEPxz5KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749507612; c=relaxed/simple;
	bh=JRRK8iijovhtk8qm0ghvzUzeHuYW4w04qlCknulzlnc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Gqle2b+FgTAiR2lt7AlzPMBSDs0mBYvJ58Kd7Dp9hpOLeqyFg8kISCylzZ0u3j9U/8tnlDzSt0BKjZzh7Uu5/MUT9Yqdo0f9ZxXwzy17zSlt6CYrNHmxZUpu/IIiCNb+QYdlr0XYKBAiJeDKenKD44qmQkXv/7vAyNHz2GdyP0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=moiwB2FV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1749507608;
	bh=k5mlF6C5+mA3Q4Ai32Affy2iNO4lJ6nde+LEFo3g4MI=;
	h=Date:From:To:Cc:Subject:From;
	b=moiwB2FVzCj7poHls3C6ZpMCNG1jb++uIutHVrvLWNmz2CyHhqeFUZnXmN5iUqpPk
	 D8TkXHA8Huffl/wngObg7IDGwEc00cU3R4OYn1SXgqbMc0p0Kvilfn1gJGpljdjsAV
	 7npFCACHIvE1ZdyfhvvA6W4d3hjSQrfR2H4jjyZyIOFkS96GBpVUbs0yvyfsPzYPwi
	 HgH+d0vGEp5y16mUXVD1cXjafUtLGQxb6FlzPVAf0sQnxQy09xdf7toMEYxuqEZQS7
	 dRAoJHo/hDZnlN4a0d0nC43WUjvsxtsFBlEyaxzLiXq8ShfQFz0StwTNweUx+Vxen7
	 v2E5jRdAuVgEw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bGRF41w9Bz4wbr;
	Tue, 10 Jun 2025 08:20:08 +1000 (AEST)
Date: Tue, 10 Jun 2025 08:20:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the mmc tree
Message-ID: <20250610082007.507ed3de@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JXUmrIhFxBOteULThvmkEOC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/JXUmrIhFxBOteULThvmkEOC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  e7c3da564d47 ("mmc: sdhci-esdhc-imx: Don't change pinctrl in suspend if w=
akeup source")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/JXUmrIhFxBOteULThvmkEOC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhHXhcACgkQAVBC80lX
0Gzn/ggAmh3ASVvC3UAj5ov+v+vb+L30FmIvNuUpzs4XVY5bPK2f5b07Cl1+rOng
mejGKeEaJGbw63/ihg2WP66v7DMaaPaxjmOO0CFsOpkhpZ24wuXSRwrc2rcmtSck
RcVvrVFViTiadrAIVpzFC6vZJP+DO8hu3AMQlX+YT/K2ypqYPelENoqlSbbPgplt
vBLBTReUUf5VaBsFNgTWgwQATk0hwXTS5Oolwa1limSaOKaKkVr41qwTd767k9F/
KRf8qIfKfmGF66lL328h6K6PQqsLN28gFPMqxS7Rgk/Ha1GiQLLCs+igbIssAcfs
iZ30f25kS4NRuwnkX/gpQNymsrKJIA==
=xfI2
-----END PGP SIGNATURE-----

--Sig_/JXUmrIhFxBOteULThvmkEOC--

