Return-Path: <linux-next+bounces-9621-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 201E2D16A50
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 05:58:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E027B30222E5
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 04:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D805E2F6594;
	Tue, 13 Jan 2026 04:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ACXOcMcG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12FE187346;
	Tue, 13 Jan 2026 04:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768280310; cv=none; b=iuUElrTFjznCvSGXl+7gofZx3ro6LXucJ6ZXdL0jbTEM9V03EGChCm2mCpGu1bMH/VNElLr1vgNOm2VckTl6lNPXXX6aNitCvR7h8wJERHM8qkiWFV8bCm8KZY+P9cqqbyaK4vmRmY+4+aNfWJ+UyJaLzbEUdxwkDy+RXwmNC3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768280310; c=relaxed/simple;
	bh=+VCA0YU+usBnZ2AcGshYAgos3o31//cD+pAbaVgNYKU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kE4H8Gm2F5xMaL8J5hu4EFGYcrpH+23FSlqp4cVf0A0JfpetA+UNaD9vHLbnTXapXEyfjR5i1Wo6PbRW/RoG5tbLU/71Qw18tP8BAIQRIPNMb2rru4lZoV3WJVjZOeUyblcnMTnK8C2ZCcSrqQFVu3Gv9VMMZGYNCQBdA9NAmHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ACXOcMcG; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1768280307;
	bh=4u3pspFlgcaXKhutWcIos/VUBnlSbw1Dn39Wj3fUL8s=;
	h=Date:From:To:Cc:Subject:From;
	b=ACXOcMcGuZmWqQeLr3i6ALkfiDlVGvqCBze1Fos6+DOJ8IUW7n4rcxq6oK1Q/avtE
	 V5faVMpjwuonetp4skA84jramNT+4zBcjUXZza/MRQBCsrE3fPpX6CSeE20vRAJ6Cg
	 VpIVo6AwB7yWxL/cudSf/JV7Kc4NxBw7qy3uBGo/whnYypPnKNLugUKKWySwHXOsvj
	 OxNhHkFjwQCRT++i2ugrPGkVI0C/TkFYUx89qntfujQeiCYBPVWVgYgM5imQVK0L1Q
	 HwRClSD8A/P4BBYUoaY8z4zx+tuIyqngsg2P03goFcDvsOKRDnyKgmGXBmJmn2UGbN
	 MxQ6zCDLeuxCw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dqxpV49pcz4wDk;
	Tue, 13 Jan 2026 15:58:26 +1100 (AEDT)
Date: Tue, 13 Jan 2026 15:58:25 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Chinner <david@fromorbit.com>, Carlos Maiolino <cem@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, <linux-xfs@vger.kernel.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the xfs tree
Message-ID: <20260113155825.1ae96221@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SNTPKE0tnOhf+fhz56TxZb+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/SNTPKE0tnOhf+fhz56TxZb+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the xfs tree, today's linux-next build (htmldocs) produced
this warning:

block/bio.c:329 function parameter 'bio' not described in 'bio_reuse'

Introduced by commit

  8b7b3fa4c5df ("block: add a bio_reuse helper")

--=20
Cheers,
Stephen Rothwell

--Sig_/SNTPKE0tnOhf+fhz56TxZb+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmll0PEACgkQAVBC80lX
0GzLtggAgOv9smL+E++5cD8ZR014wOZyfTP+e0HziVmfarYKS2UP+FojRbfkNx/i
AYth3ORIkAXgoBvp+k53sacjaVcOvlRpr7xA4mdLAFckA7Kv5LJjbDnJm8a5rgGo
mxiyhHcjKkv0/vEiMXWnngsJyb+5pX52XcQRfnixDUvfCupaR5JFeYUpYQeBBvYV
nmQufUpvwBMc9xPZJ3hfIEOD7FM5Am3Jvnz6FnQW/qAksriERLXYL1Lf7BUYWB2q
Yu7UnZ4d+eK+eqtBeyEDeGajBp9mi3R4dPqAePH2Gl1xQ3H6088y3+9ySnXgrwWq
MA/KaQc7NzBQfbcNxnQepgamLcjO0g==
=wArr
-----END PGP SIGNATURE-----

--Sig_/SNTPKE0tnOhf+fhz56TxZb+--

