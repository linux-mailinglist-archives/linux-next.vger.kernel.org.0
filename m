Return-Path: <linux-next+bounces-5225-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05496A132EE
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2025 07:05:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20488161B09
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2025 06:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D0147082F;
	Thu, 16 Jan 2025 06:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lQqG+9+l"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974894414;
	Thu, 16 Jan 2025 06:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737007530; cv=none; b=GFOzoxgxaMmw93iDNjWNYuSfqUuPtLHjLUEORMeb2G0ROqrR2of9z1sh3eQ9pDUCgOvnZNvlt6oFulTnPQ+gq1tzNZJpO4S/lk0gykDuBkqcYtZnRr8+z2W9FypkHYtah5743g/UEyYl88o/oBzYkw8mS4E2ciy0tNNjFV1EbkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737007530; c=relaxed/simple;
	bh=Dqy/LrYexWTPVnCc0DbJwNQwj5gH8uUlCep5TBWDhCw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lGyku8tL4ya4GeTdBuI1UZZt6b9/dydibIpB7YEZeJi6H9HpjYBawRRuJY96/kRtbpMBSisr+OLOBliK+Ozsy6r5s7vnT+oTJDXtpmp06rOTy5MaEuhx3R82THOKQDr8yChOEYZONZdwFW8jPMTneYw32gvMtB7Kyl0uy24jCdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lQqG+9+l; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737007516;
	bh=YYWiFMktYTzI4Nn16hXuJY9lgMlDQXG//Bf/rIZ6Wtc=;
	h=Date:From:To:Cc:Subject:From;
	b=lQqG+9+lXyxdF0BJr9B5WuVH8znJsTn2ZIgBggzWjMuvatBB4BPvmOuc7qnRRHCFT
	 hdpW6oNcuV6w5hOZCYrM9XEMsnHsGx0v0r9xyiiMcm3dsIJ8JRF7sX8G6miCu+gK9J
	 Ipion8IVvfd0MvojSM1RkliHU1oVnYBgePIfHu4K793ctnWysgwJS5kzZ1EdY9+9Y1
	 P7bN0hYep1sR/Wwd2OTlxx0oy9TRaUEXoa0H4OhsOll7Qi/csQJHCkofhd7mp3/E1O
	 ZPFw75hEHbcbqsRBF9tIpRWEFrQUWLMB+g8cOYqOGuD5qstKv66UbJ70xMkTbscli8
	 8XhFbcHAgGCpQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YYXQh0HXcz4xRj;
	Thu, 16 Jan 2025 17:05:15 +1100 (AEDT)
Date: Thu, 16 Jan 2025 17:05:22 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Suren Baghdasaryan <surenb@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the mm-stable tree
Message-ID: <20250116170522.23e884d5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/81y7Rw.N_JUbW8ssmRXunN2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/81y7Rw.N_JUbW8ssmRXunN2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm-stable tree, today's linux-next build (htmldocs)
produced this warning:

include/linux/seqlock.h:341: warning: Function parameter or struct member '=
start' not described in 'raw_seqcount_try_begin'

Introduced by commit

  dba4761a3e40 ("seqlock: add raw_seqcount_try_begin")

I seem to have missed this when it was first introduced, sorry.

--=20
Cheers,
Stephen Rothwell

--Sig_/81y7Rw.N_JUbW8ssmRXunN2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeIoaIACgkQAVBC80lX
0GwtcAf3XR6CdeuTBQajgTdfUztQp5BRgqz9X3oE/6zmHKgfdh2XXo7BWUrL4NI4
Sb3hAhHg2HudiWHmMNc0Nj30NkewPqjdCuQ1mwnRzypkVeMqkh3vz0hFB2aSxmyQ
KGV4JsGpXI63E3q4QUA1TjZZoJyHxZamHs6Etaj1p2q4keC967jhtcqOAAqIbCkx
CUG2DzfSRsHhaktrVH9twlJ8E/yQ78bKusBwOKNVPfcJ7J3pshLnAoB1RKgTg4Db
GlZQBxv+nSh32K6jA721zInr8sqIBBFuKJCjIgIQG9F7GWxcFIio8Z6zLqD+3iqi
5NLoEZ/SJJ5Ia66K4IB7CMqSGdj2
=vyEo
-----END PGP SIGNATURE-----

--Sig_/81y7Rw.N_JUbW8ssmRXunN2--

