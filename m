Return-Path: <linux-next+bounces-6728-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B943AB4C55
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 08:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1016F19E7E7E
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 06:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E8F1EEA5E;
	Tue, 13 May 2025 06:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZVTifdf8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2321D1EEA27;
	Tue, 13 May 2025 06:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747119284; cv=none; b=PpjSSALhtGSUSqmsiQwmVnbaYyW6jLG0kZ4wxMOfa/aH539od4+UTHwI0h4HQ2MrkpA/3z7X2+CSblsG5pWoraXiBGbq+7NRw0kDksSiRoqzRKzn4PPb2zkfG7SdorbFcXDhkNLcCXL/Dsmy8cvrC0D2aDzj0V4EjU183MQj+Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747119284; c=relaxed/simple;
	bh=3lq2oL9GsVxb1GiLT60wR3AyAvnRalU2RVB6UUD+NzY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=P1A03fkvOu8mTxUrIgYNrgtYL5N93j1O70Zv05RLINCgVwyKvX+MfVawrvH3iv+3Zddl6K6elhWx51Z6gAmDo4FutdasJyUhNOoYH+00Ke85neXXI0cdpPvtKQQOPKufeYycsMMlr2D75NqS9JTji1lUyZxDuc3nOBpn4RapfQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ZVTifdf8; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747119280;
	bh=hvf5ATy0fFe52vTGcnpMAnQ0jfOolBYJyvtWRgw/ocM=;
	h=Date:From:To:Cc:Subject:From;
	b=ZVTifdf8nqWwz5HJSvhfbUwDNl/CsdEq2oL9bY6Gjd7Ca7evlqFzYI7/xjE6LKLKe
	 X6hRI1FtKyD95rQMxoLdtIlpfCvswnRYt5gAEGC2i2KhhLgmVtFNiglr50tKe3/Ier
	 OnIvuahHmJRcR+os9qVGqwCQvxDcFRt2ZJYPyjF9ejuKD6Op6bjLQa5CL55/7laL6n
	 FH9sbkJphEmCqaqGbcytP3R5eQlP13cPwZmSbySH2OFNNZxHncgflG0ZFqfG0gg6jI
	 fF177A+Tu2FiTvW0543kd8No+T+IpF7BvXlx53XQpe/HWP3aCACkvu0hWPOGT7mz8j
	 bDWN2rRJruPKg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZxRzh08b4z4wcr;
	Tue, 13 May 2025 16:54:39 +1000 (AEST)
Date: Tue, 13 May 2025 16:54:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Pawan Gupta
 <pawan.kumar.gupta@linux.intel.com>
Subject: linux-next: manual merge of the tip tree with Linus' tree
Message-ID: <20250513165439.762fd52f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=+.yWPI5UtgeTtcbpifk7Kz";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=+.yWPI5UtgeTtcbpifk7Kz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  include/linux/cpu.h

between commit:

  f4818881c47f ("x86/its: Enable Indirect Target Selection mitigation")

from Linus' tree and commit:

  4e2c719782a8 ("x86/cpu: Help users notice when running old Intel microcod=
e")

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

diff --cc include/linux/cpu.h
index 3aa955102b34,1f5cfc4cc04f..000000000000
--- a/include/linux/cpu.h
+++ b/include/linux/cpu.h
@@@ -78,8 -78,8 +78,10 @@@ extern ssize_t cpu_show_gds(struct devi
  extern ssize_t cpu_show_reg_file_data_sampling(struct device *dev,
  					       struct device_attribute *attr, char *buf);
  extern ssize_t cpu_show_ghostwrite(struct device *dev, struct device_attr=
ibute *attr, char *buf);
 +extern ssize_t cpu_show_indirect_target_selection(struct device *dev,
 +						  struct device_attribute *attr, char *buf);
+ extern ssize_t cpu_show_old_microcode(struct device *dev,
+ 				      struct device_attribute *attr, char *buf);
 =20
  extern __printf(4, 5)
  struct device *cpu_device_create(struct device *parent, void *drvdata,

--Sig_/=+.yWPI5UtgeTtcbpifk7Kz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgi7K8ACgkQAVBC80lX
0GyKLAf7BzpAeBOSCReyAWZNxjYLaG6J+ioHDria6Z1wT8BxObZ/JYZZ7WSvxEZW
kTJEk1Aglt7Xkn+iHRXCZKraOL/A7fi17e4rwUHFlBNjmicmRDN0On3hG/3ugILI
6zzHSAkEqRA7cigX+PQCvoAYpUYN+2gJpN8qgzjJ661Pfjdpcnu4u57zLcz7i2mK
+++hM56ThK28aiFsdfSv0unTO8qz2OKGf18YF+iGnGGhgUP/42rzPe4ULrQDO9y2
5P9jT06dKVwTleyyYNRMEPl9AH2PpcyBj+svk/6SeLAKuJze1LOgxJfI3JcMOjLY
CGfth1SFV9eiWf3X3DQZ/mBMD5+UGw==
=McRj
-----END PGP SIGNATURE-----

--Sig_/=+.yWPI5UtgeTtcbpifk7Kz--

