Return-Path: <linux-next+bounces-5858-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D75EDA672BB
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 12:30:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 417953B2E5F
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 11:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51B7E207656;
	Tue, 18 Mar 2025 11:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KEjzfi21"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA9E208970;
	Tue, 18 Mar 2025 11:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742297335; cv=none; b=hzn/zKdhxfzKjUP4pplPZTZKQYsFEx8mKW3tCrqXjkJDImSZ0INav5UGlG+YiIjegYjqFd6YeI8e2RxQ0NZXTqJIKGVWrfmFUaQ15+uDRETutCY1naml5MIcSgbN1CQ3eOuSJPpVqqFrB8ocfIvg5oCD6zZrrbIIh2NCyakuKmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742297335; c=relaxed/simple;
	bh=4H/bVePK5xMRySQWTKq3Ot3u5JmZlZci6napiBy7ByI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HjCv2R7phebd6/ua/b7aq1pagY+XH9E756KBb8/gKWIC7w3llrHgXI//rzRwYzUT74qlk/0mqVfWseC86iykkiyewejHh6RAquqW7od1QcKu5WwdCmbHzMswxVXEezGaj/1kFBzcqDFQIbpw+atr+W78pcpr//RAX0r/+8rBY+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=KEjzfi21; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742297326;
	bh=CIFNxvZVVP5z8FauVwww+t488QncdcJcQt/wOQp9hRI=;
	h=Date:From:To:Cc:Subject:From;
	b=KEjzfi218jqRiP4Ag5c7Ex1h+CilWCobmAL2zSuloIY4JjtyDqCeZVMGtYGu6REtn
	 hsPZnwKa8zU0punoRTDTcHHvPXiUJOwDH0kvWuYcRR8y13C10hPccgBbYU4hPcM7O3
	 T9dA/40sR9n/Q3qtTCooQ+Y4JpjSbxKQzCLbvAoB8wrphWG8JznNWV7O5rFVxcgsNH
	 ZbjgUM9BzT/ZlKnmEyjpChpxaqn/SkqYFU6mCErTVKkPz7UbCPsaBCxiihu80UlUSo
	 GAjJUanioG/KjCnOX+l6CC16fHhLkWoko0isPhjM5SFiKB1BPYoMsDNNvYANdEPHMt
	 sQbFi3is3Uhdg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZH8jp05l1z4x8p;
	Tue, 18 Mar 2025 22:28:45 +1100 (AEDT)
Date: Tue, 18 Mar 2025 22:28:45 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the mm tree
Message-ID: <20250318222845.1e16fd1e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/w9bnW.ugc+K9XnsWtNu/JPe";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/w9bnW.ugc+K9XnsWtNu/JPe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  09285baa77a8 ("MAINTAINERS: remove Eric")

from the mm-nonmm-ubstable branch of tge mm tree.

This is commit

  9130945f8161 ("MAINTAINERS: Remove myself")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/w9bnW.ugc+K9XnsWtNu/JPe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfZWO0ACgkQAVBC80lX
0GwwDgf/bhgjFM7bMTN6GWoXWfgSTPEjLlQ6GWxafuGC/kNKRX3Y0paEItDiJhQf
WvUGo2zkPIUmNfJYzb4xW/4piKD4GVmTyW3YNwfyyT0OVCkkRg2UCo313BsMIM0a
295L2v3BAZaLwiKniyo93gJhCEsmhW/dwcxMqDi2DqXxmu+fIAI3OJSzMYgqdn32
UuS6otnuX3IwywCn2SAS9cB3SuVPkaxHPpsusPxDlG3ks8WNsuXIUvTSLjrg3MPl
qdaMeg2Bdn9uPBqMFRPFD2u3qvT5a/khpzOsnXEt8DRxKMzuhEHfOjYTDWud8G7h
oGlQd8eovYa0oeuNo8f3g9Nvlhf8Vw==
=rmv4
-----END PGP SIGNATURE-----

--Sig_/w9bnW.ugc+K9XnsWtNu/JPe--

