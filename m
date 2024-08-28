Return-Path: <linux-next+bounces-3464-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7202961B02
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2024 02:15:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7194285165
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2024 00:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C8FCD512;
	Wed, 28 Aug 2024 00:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ID54TNth"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28329881E;
	Wed, 28 Aug 2024 00:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724804139; cv=none; b=hwWDNp3T16JLWOnbpozsJe2Gm+gTTTqulGJcIwJhWszqtee3uXN8w5lYz5eub2EB0FFRcalkaD1H5WvlmSXyEfDGPDK1jXSVMiaE+XSnxzVxSUn7seX/sRl1+A/Zebn3JQXfcw1D4OWr3DAd9N/a9nF80oh3gceLk4a4HS+HzF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724804139; c=relaxed/simple;
	bh=vAc67L922pquCXqMV/ERwez5TLatgskOX/9YFro8wE4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Fq3jmTUVsoC0F3vUJY2R7yC8BFZo3bYFl6NIEd5BlKhmBoG5u8sIlNb/+dFHCuuTf9XjyVG/yPwJVSo+gNce4G+YFtozC9mlWJdzuDs3wlbbZ3tBgy5CHeFc6R7Y8RIDOp5HBVcwPLB0EjgniLvV4nv6IQcsbDDdVC0d2mnu5ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ID54TNth; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724804133;
	bh=fHBBpgCjw+HbEkEdqUxAJdXSRkWd/jVGitWn2OU79Ds=;
	h=Date:From:To:Cc:Subject:From;
	b=ID54TNthZYPXo9yuHebXumwkzU5PSSyheKMGiwke1qqtlsIxMJO9sB3Q456JxRq3Y
	 cTAj236wFZ4qQbL028I9dfQ8hgifa+LyKLQnyrSZMbC/RID2SOR48uztH2rGgawWUL
	 CmFpFV/Smf6F7nOM4kWVqjuYPS9GI61ifAIrl5wiRcZt3haWru9RyzYuvyGSyYjrPE
	 B30DaD1GBg2GSAzdM4p36yZ7F+m26rWQ7Dr+KrQrYd5kQcXdYOwqw9KJU9HHxJt+wM
	 PusQWtFUMebBYKy62pRgdM/y00T5D1hhSdKH2QTNrlB/4Kc80SuFTzbkA/grppdKyD
	 51m07femvQ4DA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WtlLD3z9Dz4wc2;
	Wed, 28 Aug 2024 10:15:32 +1000 (AEST)
Date: Wed, 28 Aug 2024 10:15:31 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Peng Fan <peng.fan@nxp.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the scmi tree
Message-ID: <20240828101531.38e633d8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mPpbrMiV_/bpM+xjERTKbcl";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/mPpbrMiV_/bpM+xjERTKbcl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the scmi tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: modpost: missing MODULE_LICENSE() in drivers/firmware/arm_scmi/vendo=
rs/imx/imx-sm-bbm.o
ERROR: modpost: missing MODULE_LICENSE() in drivers/firmware/arm_scmi/vendo=
rs/imx/imx-sm-misc.o

Caused by commit

  00bdb213e944 ("firmware: arm_scmi: add initial support for i.MX MISC prot=
ocol")

I have used the scmi tree from next-20240827 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/mPpbrMiV_/bpM+xjERTKbcl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbObCMACgkQAVBC80lX
0Gzswgf8Cw8UXOSWXKI2uCX3p2Hs5JE6P03KpcnbijPhu9CupUg8EmbQVbSuSmmL
hIRC3mKN+rz94y8aQTm2YEp84PxaF5Z7BO+yBKZZnWITyFNAVEZYlSnj0LJoKlj2
L//cplMgEwbWrv2k2WMrtKwA6D5X2OxnllTJZSHG0G+rEztSk7lt8LTYAxMlpzO9
p/ad/SLb5WuCJqjvkGqu1SMkySE4jwrgZneuGYpadF8l4t3yrI+ANqij1ZnaQjsc
dEwwFVQ4BUVzHCk4k3wZ+SqC0bxqdBXbFyyXE4LXDYDcaFks0HfUatNm2+mMcO/j
IOtlkxnyZWt4EIQgHp82fmgqEVDxdw==
=qGcf
-----END PGP SIGNATURE-----

--Sig_/mPpbrMiV_/bpM+xjERTKbcl--

