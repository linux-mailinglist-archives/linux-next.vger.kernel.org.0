Return-Path: <linux-next+bounces-4533-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BD29B5AA3
	for <lists+linux-next@lfdr.de>; Wed, 30 Oct 2024 05:21:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E60E91C210D3
	for <lists+linux-next@lfdr.de>; Wed, 30 Oct 2024 04:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73EF0193081;
	Wed, 30 Oct 2024 04:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QlkuTNGJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD148125DF;
	Wed, 30 Oct 2024 04:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730262069; cv=none; b=TZroMeThn+6mgzp3zdu3Bi8OYAEiL7v/WboI2GYVxXNMTvlXI2RQSh5QxFkpEGz5ednmuPp9yelBORw4Fu0rwec1LLk8gSjlVWP7RlWKniRV1SnfFQQL2DCE55vlTSanIFKn88BB6R+5vZxmjnWW6ESgYtpHMhx8sf/h/1bLrEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730262069; c=relaxed/simple;
	bh=ocKBOq02nWYFlgEMZYNQgC/l3LziC8HLQ8hpHXtRsaY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VAcjAk9dV17NSWoX1aLcZxsxmAqTb4wo4bQ4VaoHstFDeUmr75GUYu6rIiuRvVaVMVB56ntwr3JOMuoT2RKIvvHxzCKXdw1wL+GMeC1qObqlOfCgrtCWHDbIZxNeAFJFq6BxbKCqNyVO1xlj+k9Zuk1zPaVa4hRmXQ7Fze1+h1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=QlkuTNGJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730262062;
	bh=L4z91zLemGNcr/9x+VRry7uNhRhK0ommhKHLUmHYLmA=;
	h=Date:From:To:Cc:Subject:From;
	b=QlkuTNGJw1wndnqOUxKYphUUM0LvLkDTW77fDUsMCGx2JJI/Qt0ILZMpbj9f3ylEn
	 FzcIG9F5XlugQIVOEG7sjAXZR4f7cJtwEero8OnMxRvLq24Z1YR5IESCb5AkaJv/N5
	 I1eqpUn+1hinZkE2s83l9n3nkqUb0itaoqBq+6sJkB1YDkNtn97yd2dr7+WXHcfWtx
	 F7JfeeiCjqqY1kvarRytD/pLIkZep3qz/nNrkUZhABXtPSmaikcTYsqOJUUzWyzTRv
	 nriRHB6EaDS0KKiwKWKuz8yGCifpsJsnJgPS5EPbNeSr4jGuS0imJ7PvjZz5ER7uUA
	 WOjyoKASwKOiw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XdYpP6p5Gz4wb7;
	Wed, 30 Oct 2024 15:21:01 +1100 (AEDT)
Date: Wed, 30 Oct 2024 15:21:03 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Joerg Roedel <joro@8bytes.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the rpmsg tree
Message-ID: <20241030152103.52e99b0b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/okqWhp5edbcUI1s5RKj/iFX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/okqWhp5edbcUI1s5RKj/iFX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the iommu tree as a different commit
(but the same patch):

  8a8622b7c206 ("remoteproc: Use iommu_paging_domain_alloc()")

This is commit

  fae93d8da6b9 ("remoteproc: Use iommu_paging_domain_alloc()")

in the iommu tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/okqWhp5edbcUI1s5RKj/iFX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmchtC8ACgkQAVBC80lX
0GyHcwf+L5TMsiv3cx5Sw2l+1ShxJmHUVAGza6EHBew5q2ItsakoQ/YbIj9l8KMs
EHGvWeEyNN9VygIqG5HZ/Bfm4kup4SG1B+9UVh2iZ3+oWXeEE8wQDafCmL/cPHr1
7yL0kSZS0PI4bC6fx7FIsrXaXEpsNghChf1fr2rm5PKKe7GgAZM2A70Ma7Rrtf3o
gj9H7iJQnmgV5vSgy3vga8MieRi5Jx0WchWZerT87H+BaLRexUf30mezO+18xtVH
J7xVXYQ+/RtKHZIickz/EmzXuBMfomwSsyjeuO6JHHciWDjG/WtF3MZYW2LMxdjE
5s20Ffz2/EXPjCTeaC6i0o0rttSIOg==
=8ykq
-----END PGP SIGNATURE-----

--Sig_/okqWhp5edbcUI1s5RKj/iFX--

