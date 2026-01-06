Return-Path: <linux-next+bounces-9547-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1E7CF61B4
	for <lists+linux-next@lfdr.de>; Tue, 06 Jan 2026 01:49:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 870863019B47
	for <lists+linux-next@lfdr.de>; Tue,  6 Jan 2026 00:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2355B1B0437;
	Tue,  6 Jan 2026 00:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dIBCiKBc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77640185B48;
	Tue,  6 Jan 2026 00:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767660585; cv=none; b=KnObkb1ejRIOjuBeA21CQHj+iFvYDwM0s9qaMrGXYdyz3DB7wO0yUDDHdvpsk1boB30lkB+abJX4AaUGm1it7mfrZeIEO8q6d083tIWhMy2S6xxMaHRviEh/+kwMhnTdoIPyrLFG8Dsgv1hO+IpoNCiBA863Y+aTsaibTQCTu2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767660585; c=relaxed/simple;
	bh=rwO60ccqrrql9f4wwVxqpHpk5mcCIBClylwsnuhV4HY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dvDqP2sO0d1U736XiZcbjRUGQh4zaCQUn/r3t6choTIjSD+9N9sxbX2jywKvJx/zthoZqA3i3SB9OzBJzuIzA1GKRUnSp6xwtsLsDS7R7/7EzkeXymbSjjJ3KoOcrBCXzRQhGXQvJf/ViRBtWpKhtI8/O6WY8nE6j/bp6i6pRyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=dIBCiKBc; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1767660575;
	bh=JAjvtwR840FbVoR9/sZms9atkzNYHKhYOwMOwVRSsp4=;
	h=Date:From:To:Cc:Subject:From;
	b=dIBCiKBcm2ZQD1Y66Xy/NSHNtohIaDrUJOaKE8o1IX4ZihFtI8CoTlzawvDOrS22l
	 hhFndQgxZ1MqzjQBrMpQTm6y4hEkDoEKR7aGtoW7z3cX+HigYK+k7dR1qbRaqS8mqS
	 pd0nxJTRXQTcwaJT3x3OC8CcQ6HG2sfu2ufUiPKQQDEGIy2AVlHVjFDRiK9kmOAZYX
	 L/5sixod9UPvkoio+F6oYI5IzHBezrOaTySpTYjMAYuv2lf02yPFPFh+Iv4/2zdupl
	 er1/XzQs2wX9PwZfg5f5JG8sr5/EG/KuYC6XlHvOEoPW9Xk0z1aKtvtqgQ+Si05/6m
	 6ZibAaZAqqJWQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dlXcZ3Kxmz4wCp;
	Tue, 06 Jan 2026 11:49:34 +1100 (AEDT)
Date: Tue, 6 Jan 2026 11:49:33 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Jie Gan <jie.gan@oss.qualcomm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the coresight tree
Message-ID: <20260106114933.638b073f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2XfilghzlbS6qrez8LsJ/jc";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/2XfilghzlbS6qrez8LsJ/jc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the coresight tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda:45: ERROR: Unexp=
ected indentation. [docutils]

Introduced by commit

  33f04ead7c49 ("coresight: tpda: add logic to configure TPDA_SYNCR registe=
r")

--=20
Cheers,
Stephen Rothwell

--Sig_/2XfilghzlbS6qrez8LsJ/jc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlcXB0ACgkQAVBC80lX
0GwQQAf/YGLrNMnf6hEuE360X7jGqPhD0qijA49nZ41I5hbcu8EfiPET1tFfFQrM
qq3aN0PWxMY1GNMjvcbO/hZkjl2CP7bPx4Ny5fuR2OhcW9P6obeBpzvXJTGxm+Ev
r9xTA7bywOjot8el2jhGYQfSCulJiykN5CyZAYNOtDMi9pC7Cjs6mmu8wyhj6fmw
AjYF/NMuJM7mezaqX12oewzmOouW37ZLpxFI6V9IyyRvF3LZ5d/5RhK86KKX+9JL
6F7LHQQcXzyEdFXekSEoHnqMk+FzmIPTJcXqO0awFZrxCfDbXidZHh0MzRw3buZc
HnXCI2OZFEaN5+CVcG/P0d/xnE8jUw==
=NDkq
-----END PGP SIGNATURE-----

--Sig_/2XfilghzlbS6qrez8LsJ/jc--

