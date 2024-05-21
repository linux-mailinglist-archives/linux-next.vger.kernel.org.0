Return-Path: <linux-next+bounces-2376-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E79F8CB644
	for <lists+linux-next@lfdr.de>; Wed, 22 May 2024 01:05:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59CA0283103
	for <lists+linux-next@lfdr.de>; Tue, 21 May 2024 23:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B137785649;
	Tue, 21 May 2024 23:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VXjkqJXq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3767149DF4;
	Tue, 21 May 2024 23:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716332707; cv=none; b=nR5IS4TB5VzapZmGzMnr2ibl1Nkp+APtvMUUVezm5fI8RTFRaiwNvrKj0bOLaHgkK1AH3kX6psxlTPj1/88AERNyJyzUGbQlfqm+8vgKB9ORH0MdL5y4sHTbwDye1v1S1raP412PqTV0vqF05rOVUzl+umBCM9P7JQmrkd0BODU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716332707; c=relaxed/simple;
	bh=WfRXyOImaPHQNHPb7/0FAI4xbderZ/ww8TETfE9BDXY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OkC9bojkk73liuoDr4rB5FDG7ZZc4MdHcV6RmtNBEM1CaIiamPh9Hnh6F+Gw16Y9y9OevgATBHmK+5yQ8rFRX2pTS6PkK5fN4of/oZl5PTOa7y2x4X/nj8cSBnGMJfnQfeGXa+lgKQfClJds8hhGGokcPZYXoxabcu2YUGXaMjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VXjkqJXq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1716332704;
	bh=NctI+0X7v/ngdhnfgy+lNCFS6BCU7nOUJUyOMT0Ix60=;
	h=Date:From:To:Cc:Subject:From;
	b=VXjkqJXqlTPs2TrNw/3IYvSiE7enuyI7bloJs2dSFPvsdm1qRc81SOtJDIvxZYjy6
	 UVgJhJLKelwDyjpS+4mGeiEXLyIyeOsjkOnv4c13Y51pMc+VHQA1Qrv6qvj0Qoq+ts
	 XGutYqsQYGbc6BxROFBYQq+8hbHLRoPfCf8JZBWX4AWPnPeqM1DNbwhPA4VbA2+beZ
	 oc/bjZLkprOFsz1F1NRjzUyQpQfSsu42ZQLVPzntVJxMqrYQPGYjCgCoXhUVhIseJV
	 4bx2+EogbyN7dm/LXp5f5NUYWO0RhG0frOYRA8A8SQN3krwrThmc240VzDFSJmQhMp
	 LaLXnL/n7lkjw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VkVQ80ZVWz4wx5;
	Wed, 22 May 2024 09:05:04 +1000 (AEST)
Date: Wed, 22 May 2024 09:05:03 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the rpmsg tree
Message-ID: <20240522090503.687ea288@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jC7VA8z1Ay0IgHHKPH2_hDK";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/jC7VA8z1Ay0IgHHKPH2_hDK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  59235c487da9 ("dt-bindings: remoteproc: qcom,smd-edge: Mark qcom,ipc as d=
eprecated")
  66d8ccfab13e ("dt-bindings: remoteproc: qcom,msm8996-mss-pil: allow glink=
-edge on msm8996")
  962477e6c362 ("dt-bindings: remoteproc: qcom,qcs404-cdsp-pil: Fix qcom,ha=
lt-regs definition")
  976fbe873a6b ("dt-bindings: remoteproc: qcom,sdm845-adsp-pil: Fix qcom,ha=
lt-regs definition")
  e63e5ba0e0de ("dt-bindings: remoteproc: qcom,sc7280-wpss-pil: Fix qcom,ha=
lt-regs definition")

--=20
Cheers,
Stephen Rothwell

--Sig_/jC7VA8z1Ay0IgHHKPH2_hDK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZNKJ8ACgkQAVBC80lX
0GzBtQf+MTU5N63ZtI8+R/wfnkqdZa2obi4t1WkvAxW3UpbxxGaXpBxzMz7niHEC
YsNTUUK9f842hGfdCRF7MDF0br7WXN8BVxjVN16lFlK8Pjc6E0rmN0cC83x3pc4N
CzQW/YkrbO+HIwSjeMxUjCxsh04qCcGF55RiyEWUKShfpAQmifEoVq9AJ0FHJ978
gDaMy/sVEcvUHPiwdMAKLvAMFamOW4A6ibmbmyFx10Q1W/gzntDg7T8nUrtz2Hux
333VJ/tdrKxPUCRpyd8wvH8AioKOm6OQ7aSlaTCLkIijoJAaIa6hhqWpGb7GEvVH
bX8bffTECWcNYHXhlL7Nvpcaiauxgw==
=1UyW
-----END PGP SIGNATURE-----

--Sig_/jC7VA8z1Ay0IgHHKPH2_hDK--

