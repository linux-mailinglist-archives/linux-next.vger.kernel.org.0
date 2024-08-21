Return-Path: <linux-next+bounces-3378-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2563D959366
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2024 05:45:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7C3628448B
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2024 03:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68D3F1CAB8;
	Wed, 21 Aug 2024 03:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="jC/qNMot"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846623C0B;
	Wed, 21 Aug 2024 03:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724211939; cv=none; b=dHtrZystldOw0AafoObR2qxD8o/DMAyLrrMYGCbIsP6ZwYf2IpzqoXgkgdaEG+agLD/lkZMnrAHpTELtFgAhvkreYDl4PeKeessYwmddlvEm6eEj/I4gWs3kvqezFagCrvi/RdPAeHOFNbTKOnBEfdNQBkN+VfwT2m+KNIaqAFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724211939; c=relaxed/simple;
	bh=RotE0u7x6HLN8xX66ryWUmslhsqqC8az5ijq2RLmytM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UqVPn4UeaXR4Rwsr/k09zpzgcQjmyhHvYj0zGazT5PSLkMZ2CG7vhpf8QWif4WI9N0ieJzfuUy6DuJ2wwfAzgotL2om6HPIAI+M2UahFJlX5qYz4W+AGPVFjsW0YYoVbE6bH1sn6VFOSF+ehCa2wlDlBFReDastFvalSgM4VWxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=jC/qNMot; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724211932;
	bh=mAOAQjAO7XB1qfykD/7FcB6Cn/PzpSugKy7+CfdNRhQ=;
	h=Date:From:To:Cc:Subject:From;
	b=jC/qNMotXtIqIal5hFU7vivrWUvfUFdrQJ6UbwOQ5VJO04GwhU0hD9F7lswbpLXTM
	 YSWZNsMc5XdQVCgiBlRxx7kx959+PzEdEgmsLAjeqK4Ah0R1A75a15rwMZNWmtlXjq
	 KSKy8aEA1RXK56z4T8Fmt89WGhMgeQ240ZimtR/2RO5jGuLtN9RCobz23yeKRHiB1j
	 WE1HJpb4KdRR81Z/zcMqgJuKVyJX09ZEnCT6QbaN04guhrYnM6spUL0ylhpy/zRnl7
	 rASLxDIt8Bs20a2hXud4GU6TJFEfdzJJGp4ucmJIt6A0m/3iKlcngHbXIGF0sd5N46
	 rmdhTscZu4N7w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WpXKl5swqz4wbp;
	Wed, 21 Aug 2024 13:45:31 +1000 (AEST)
Date: Wed, 21 Aug 2024 13:45:31 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Tejun Heo <tj@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the workqueues tree
Message-ID: <20240821134531.1da04ae7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aXjOh92j3Bg48spW15qTDol";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/aXjOh92j3Bg48spW15qTDol
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the workqueues tree, today's linux-next build (htmldocs)
produced this warning:

include/linux/workqueue.h:547: warning: Excess function parameter '...' des=
cription in 'alloc_ordered_workqueue_lockdep_map'

Presumably introduced by commit

  9b59a85a84dc ("workqueue: Don't call va_start / va_end twice")

--=20
Cheers,
Stephen Rothwell

--Sig_/aXjOh92j3Bg48spW15qTDol
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbFYtsACgkQAVBC80lX
0GxAWwf+LRGBcpZbLYo9vX1BEuxulJbxe7DE7jmaXPUtxMLJHXxtSJWnjzYZ66J9
M4WVNW9/7N4ZOrcVyfdP/28WFtko3CH7C0No/e6LT8vvPLLScFhVUAfylugX/FGL
X2TdsvPAn9vGNpzI3DP28UeuTYBjwGKIMRMKjTeffUMFFyvvrM53DzK73nf476v9
9Exl/uesv+DGZYiZz/BjB45NNIaX9heURvIFeEiHzCJVtdIpmo93lYyXgSLFY0Cc
5aY3BG8PFIh2I/ae0DAP3kx9TKTKrcHfQLo5uvhwyj4uAkvhaG2Tn8v96LIHkVvb
XoRsi1ScSpmVRsLQ3QTA+FucHxj4nA==
=JcEs
-----END PGP SIGNATURE-----

--Sig_/aXjOh92j3Bg48spW15qTDol--

