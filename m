Return-Path: <linux-next+bounces-6875-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F010EABEBD8
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 08:17:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 341B21B63705
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 06:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8124422D788;
	Wed, 21 May 2025 06:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sVWrXBC2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C417A1A83ED;
	Wed, 21 May 2025 06:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747808226; cv=none; b=gN8t3GvXevEEFYQ6eU6h1FnrSv3FAq32IZaD+Iwzx7CNdqZxcGiSg9n1Z4oKINZBzv5SsHlg7HCimzU8xuXoaM2m/D/3HydAp6dV9v2XvkfF0od20XOXFM+PnxgTwsb4zDghzQxYeqPT8tWNUM/Co41Zm3mDIwhZ8YgC0PjDlm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747808226; c=relaxed/simple;
	bh=N8fS/PrdoLfYNjfVcJkFIYiSWo69y3Qai+YU19Ch5VA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IgmRDuvoJjvbQrE9CUkS+/6rGcF8cqZ6c/3H+eNzI+xxayhWU0gvOmGWg+x7FOxG3cTdahAg51qRHsS6nVcb/oRgjk5UbKb91ldNJ0nImZCYL7d72P1lb135MR4+kJuchGS1LwRHl7/6CTEGmmlQBqF8JVQrG4Mu5srxH/beDZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=sVWrXBC2; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747808219;
	bh=suzT5qmoGe2eGH7zmAVnbRaMOCyy2nfC6Kn9PBY1kSA=;
	h=Date:From:To:Cc:Subject:From;
	b=sVWrXBC2k17QWxCnA92lG181eRDLAzb0/LvFsnCJL64bUqAuXZrq9brZdiDMt3ifx
	 DID4GOBIMrdklZDX6imBofFiNnIdvwgSUk9Ve5I0QlLx5160TmtAoglO4+gak8vt9E
	 pOvEYD1HLUbXf3d3JXC9SFDde56nrdcMsJIHP6G0U+e/SGrSSTIvTJ3O7dDhh43fcH
	 b+LFZDEGrMLe3cDMIAcF0nVcCKdReLRsUhmkdoq1Jr86w4a+4cDJ8awl71a5LIgu3M
	 xPYkCaU9GNQmWs5EiiRXn4fQne1O42js7LvqJBlpWXQK5XKQ1MWsuRYDfRbWLcBghD
	 VKZFxWKkyMiQg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b2LmT3vnBz4x5k;
	Wed, 21 May 2025 16:16:57 +1000 (AEST)
Date: Wed, 21 May 2025 16:16:56 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kwilczynski@kernel.org>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Hector Martin
 <marcan@marcan.st>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>, Marc Zyngier <maz@kernel.org>
Subject: linux-next: manual merge of the tip tree with the pci tree
Message-ID: <20250521161656.429889eb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/S4Ljyc=OH0.WN2a0M5Hj_Eq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/S4Ljyc=OH0.WN2a0M5Hj_Eq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,


Today's linux-next merge of the tip tree got a conflict in:

  drivers/pci/controller/pcie-apple.c

between commit:

  3f1ccd6e85d7 ("PCI: apple: Abstract register offsets via a SoC-specific s=
tructure")

from the pci tree and commit:

  5d627a9484ec ("PCI: apple: Convert to MSI parent infrastructure")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/pci/controller/pcie-apple.c
index c3fb2c1cc103,3d412a931774..000000000000
--- a/drivers/pci/controller/pcie-apple.c
+++ b/drivers/pci/controller/pcie-apple.c
@@@ -183,8 -134,6 +184,7 @@@ struct apple_pcie=20
  	struct mutex		lock;
  	struct device		*dev;
  	void __iomem            *base;
 +	const struct hw_info	*hw;
- 	struct irq_domain	*domain;
  	unsigned long		*bitmap;
  	struct list_head	ports;
  	struct completion	event;

--Sig_/S4Ljyc=OH0.WN2a0M5Hj_Eq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgtb9gACgkQAVBC80lX
0Gy65Af/Y8j+nZb0moCh6IxTVrMyIWt4XBNW72W3j26jUQ5s8FPAK6ophXd/ywOT
tDIyY+Qyz+WYKPHFD9ZJC/5V8g8HDRdkq+S5eg08vk2vh/N5qAcP5KRaltfXCso/
QfZZEjhdAj1X9WlhmqThiueoil+AoJC7MllZcyBKEZOPHiJjLcQF3Y+lXrTYvK34
lqyRXuHJvdga7Oo/IUn+s8iyeedNdKLZhRd1xeyrQTbogrrKVCfeVGmZSYJJKavG
JD8r+6AgdRb5NNhUuAR2pWGiqnVEq5c42/KlWitkKyWyJskUFv8izUwfxEgB9aij
SY4zpYIcFwsgV8zsOtO0ISwV4UIpEg==
=iTLP
-----END PGP SIGNATURE-----

--Sig_/S4Ljyc=OH0.WN2a0M5Hj_Eq--

