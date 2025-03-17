Return-Path: <linux-next+bounces-5801-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EDFA638B0
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 01:21:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2655F3AD50B
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 00:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CFBBBA3F;
	Mon, 17 Mar 2025 00:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="JIb6UKp1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37058F5C;
	Mon, 17 Mar 2025 00:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742170913; cv=none; b=mmnb+5L4uXj6QcOd5j3v2/QUss2SGAWDnCJXQY45D90Ov0GRWiagQeCy2odifJXN3DbCbrCEssInA2YhmrFk1vTFSXrPqzLkvR2Sh1w1nGGS0HOX3Xs3cFFZXF+xoDmTXU+0GdI7zo/ADhBPMdkeCLyvRBU5jVAFUlv/o+mM81Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742170913; c=relaxed/simple;
	bh=2Rl2UpCsrYTVCRUrb3Ljc5IYQJyZXGQ8hRIG8OqtPwo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=t+g80bz0Z/zD9CwmV/abnhMDi00LvI71fbM4edHSCXgR67wABEQAMVlfnp7oDYKkjQoQ9rUNjdUufFrq7yw2Es8dB0dOnWZPJNSOgThxPNRX9h0s6wr0DH1+A8Pame7mcSNtdd20hQKixZLLlb2lOv3gXSfh0PqcjKx7GRDg5+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=JIb6UKp1; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742170907;
	bh=yX3cebPV/O/8U5aKcQ5iPHa7EGh+ZxW7i1C/uExpGcI=;
	h=Date:From:To:Cc:Subject:From;
	b=JIb6UKp17Y20T9mGYB1z3TbHXrSlHWW/EoH9jkZ+gNU/zpsVjsZFa67La98dlo5Oo
	 /4IZhlX8lQXL1KI2OrS8S+VszWs5amk+GNyKpjTM+MhGt5+CBeWX3S7vby2XHxHce6
	 ZGEPwirLC44qCk6YjAWjb+/hh8tiKrjKLUcMArMwGjLhCWb/y7cA1hhacQORqREkvI
	 RtW68IXpMzz+gmlxjzISmXYN0nAB4lh6nnq95DH4gR4jLOyNEtEtr/8wK1w/6yRwDs
	 +afawsZz5mNHD2EbYKRzeo3qlXycJqM5+m6Npr2KKfP40tO5VusFbRB78clAZkU9rw
	 zPReXl2tuvs2A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZGFyg2pqLz4wcd;
	Mon, 17 Mar 2025 11:21:47 +1100 (AEDT)
Date: Mon, 17 Mar 2025 11:21:46 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the arm-perf tree
Message-ID: <20250317112146.762e2a26@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/w1Ujli5g9b+CJKSk6Noiqgw";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/w1Ujli5g9b+CJKSk6Noiqgw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the arm-perf tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/perf/arm_cspmu/nvidia_cspmu.c: In function 'nv_cspmu_set_ev_filter':
drivers/perf/arm_cspmu/nvidia_cspmu.c:192:9: error: implicit declaration of=
 function 'writel' [-Wimplicit-function-declaration]
  192 |         writel(filter, cspmu->base0 + offset);
      |         ^~~~~~

Caused by commit

  6de0298a3925 ("perf/arm_cspmu: Generalise event filtering")

I have used the arm-perf tree from next-20250314 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/w1Ujli5g9b+CJKSk6Noiqgw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfXaxoACgkQAVBC80lX
0GxIAwf9H3AwPDmJQBIG/hu9jiRqiNlEylrQUL9XTs7U1Mt0+19/XM1RPxzLZdbv
9kKmGcbxIYpf1ceeo6MqRuG90fV1FNxoiWfVmEaTOSaR6dujygzUY+xGMV8+O84/
NV4DwiL4Y0kGhz07X2tkdivY2U7wr5CBneYFaix0juPzoH+nE5n37t9Rqgjkyw9z
DeoiyeBIO9UrdhMU20h+R+dzFI0MDsO1M5HKk52iy0MV9xfmHf4lFfkWJvOIk4At
bnaOgTpEPUrBiUCZiG2nnuMlZaYZPmpEQ1k/vquYkp1LSYibKxrr5L2rO3ma12or
5KSMo4QMz1zARq/oNtBbxArZYTB6ZQ==
=AlTx
-----END PGP SIGNATURE-----

--Sig_/w1Ujli5g9b+CJKSk6Noiqgw--

