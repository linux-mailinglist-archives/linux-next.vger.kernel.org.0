Return-Path: <linux-next+bounces-3081-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2495C9372D5
	for <lists+linux-next@lfdr.de>; Fri, 19 Jul 2024 05:47:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0513B21396
	for <lists+linux-next@lfdr.de>; Fri, 19 Jul 2024 03:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E45755680;
	Fri, 19 Jul 2024 03:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ktVVONXG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E121CA9C;
	Fri, 19 Jul 2024 03:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721360813; cv=none; b=XkT+HtcAC/q28u42T0DQ7s1sdOD0Jq+Sg9d3JxoH1f5IIRwsLgjCQ4py7UpSKX+XvnpHSUBg1veRf0BM3Vb9pMzJ5J3EeB97zkhBKFwQD81rmyw1vs4xiapPqIPAQod2VYeWSk/FGsi7CR7b2JemWrnAGeYYgxO68r7ZOPKKSUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721360813; c=relaxed/simple;
	bh=OiJUFKSQNyPr4DEVhfvScCbVkEt/NilYeeiZtTQWNZo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=oXzGurFGY6oSwaw5txtFUmz8xoRnap1qCykg6/eB54rIDiwd0TsMXgHqoVmxHy1OGWdyA5nEwF0+PYsCoaXG8j221VtHrNNBkJqN3Nw3uS0NforbfgX0Iw1VZ5ef4apKnnTrcRF3EEGdsx8q9Zin3X55OxpTxd48ySuIExv+Q5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ktVVONXG; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721360809;
	bh=gFXClX2Z7YRhtYv7cCWNJDV2sOEmKPjpeirS/v59L38=;
	h=Date:From:To:Cc:Subject:From;
	b=ktVVONXGdN40yi0IkYO7EjkXaotjWeNkV/1OrBXNZ/QKAgvldWAGOPgim5uebb7Qb
	 VjLAjPTym6mIM0kMig4efEc3X4YbMsooT+Fzc6//8knxD0E7ng2Bi/ed6rQCoWPk2m
	 S/SX0rqPsbeKmonPbdvcsxG0xECZkuEvsfxGRvmgNMLXs7j5ix/qMyakwUc9oS/+Cv
	 8t2s9qkrWF8S9W3mtzO+WRi9CtusZexhz4qdGoyKT/Tmn75Is24TsQjM828rNF54y8
	 pdUqUh3qDtplNTu5r7b7RvTQAWiwOGWZMv6QORC+iFAxSWLMBBL4IXhq1rrVT3KwCJ
	 KlFD9z+xdp/Gw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WQFwS6pCZz4wd0;
	Fri, 19 Jul 2024 13:46:48 +1000 (AEST)
Date: Fri, 19 Jul 2024 13:46:48 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Stephen Boyd <sboyd@kernel.org>, Greg KH <greg@kroah.com>, Arnd Bergmann
 <arnd@arndb.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the spmi tree
Message-ID: <20240719134648.78e28600@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AfY=UqlgP/Am4ssn=tlLS8m";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/AfY=UqlgP/Am4ssn=tlLS8m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the char-misc tree as a different commit
(but the same patch):

  41addb6b6044 ("spmi: add missing MODULE_DESCRIPTION() macros")

--=20
Cheers,
Stephen Rothwell

--Sig_/AfY=UqlgP/Am4ssn=tlLS8m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaZ4agACgkQAVBC80lX
0GzUGAf+MWz7aAPYFR9LQnwU24TPwBZZ2RQPg+7+n068nTt0mxmU9eOTCXSZQL3p
VLu4HwrdnFBv4vdAe7JKe8mg5jznH/U/Dgbc/FtDPCV45DAmeI96d/lUFq90XvF2
4jJwH7EXj6RYtxXqzw95F4OzdHt3h2pG7nXYZC9T2Ge7RaK+HfKJkU+K5wSughSf
51eFptklZv8HJOGAyAWnW4Y1kc5N/eBi0tpe0BsbUco1ZNFStjjUpS0lX9iGk+XV
42zK8FsUsy45w6I/LL3oLZH/8WY+7MWVQZ2AuEV3mwj32y4VZiaM1yOmk2wRX4Ia
1/KFKfPt4D0I8hdTyFmOaVrTYtnEVQ==
=vnWf
-----END PGP SIGNATURE-----

--Sig_/AfY=UqlgP/Am4ssn=tlLS8m--

