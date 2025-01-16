Return-Path: <linux-next+bounces-5238-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8A5A142FF
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2025 21:20:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B578B16342A
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2025 20:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AD23236A8E;
	Thu, 16 Jan 2025 20:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="EnEmHPu/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6B322FDF5;
	Thu, 16 Jan 2025 20:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737058822; cv=none; b=rXeP5Tthlj6+8lJN7twS+ahWInGI/P3ZNHUDakiIAVqn7HC1lmMG8LsplwKtAG0m0a+8HcU+EM5O+0UzF/w4iIYTfE8FUPmSa8zq406D0Sc9uEQOTeOh/1A1VJlWG34JR3NMnSX3A+kpMAFkKZrWH03d6tF4pvxpzv+lyLLrkSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737058822; c=relaxed/simple;
	bh=FgST3/7lYUbQ5tvF0HrHoGvNZwvVQ5cKT4LAec1sVUc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=esHIj5aYc15Fg7QHXZMtQ16Z0GlkSUqNo2hOaQtkobM4TOce6WZT2uvjT8yQMQ9qRPm1MhZzH4UwiJec7VqTnkYwVkV35je2XEPyfLMeN2qvRTsDYWO/LrgT4KaRbH3KSnHW3mqY037PGWDuWaJ4/JeviqB1T+LcJanZo125FHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=EnEmHPu/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737058809;
	bh=6tjHxuQ2YHaxMitie8b6b7W8gOP9Wj7XAt8/u32LjIo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EnEmHPu/iXHsnQJikvJcLxNlaXu5kZkuXhW6bqBeWQUrvrflytNsizaW9jvwHYGIT
	 goNSg25olH4yeT+NVKh7Bpvp4AxDsr4t7jRyy6v8PevfZ5sYl+nGoaGeh6pM9EDKEF
	 uuN6GpZhtV3De9cB0Ok6onUKz/XyGA8XL2ccAw7wdSxvnHUYXvFVJ7ocSWdUQRcdev
	 HOyyB7vRsJIFCfO6C3DMhoOq1fNvT+cllduvLEAOJ5cPF0lsqy6leIXso7JALAaw0U
	 wAuEhZmG9OGckoXszAgd4ZPd7BOIVsSl94Ot7sRLP0JcoXBMyNrBpBUNq8zPQBUh6F
	 xkWOK7UaNwXXQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YYvP50J1Yz4xVD;
	Fri, 17 Jan 2025 07:20:09 +1100 (AEDT)
Date: Fri, 17 Jan 2025 07:20:15 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Bjorn Andersson <andersson@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the qcom tree
Message-ID: <20250117072015.77bf3589@canb.auug.org.au>
In-Reply-To: <20250106064548.0a2b62c3@canb.auug.org.au>
References: <20250106064548.0a2b62c3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tJStpSSM6JR=p9/XBw.Kq60";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/tJStpSSM6JR=p9/XBw.Kq60
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 6 Jan 2025 06:45:48 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Commit
>=20
>   3d0d8c8989d3 ("arm64: dts: qcom: qcs8300: Add watchdog node")
>=20
> is missing a Signed-off-by from its committer.

This commit is now in the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/tJStpSSM6JR=p9/XBw.Kq60
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeJaf8ACgkQAVBC80lX
0GzI7Qf9Eh7g+aSEYJ86BRIkguucoPgGOtopJcNJxDNA4rRdhK7QLu+4lL3+Qibx
VPcnCUWb6X7fEWQJI5gX9XosNBX+eNuIraSFVTmY4LayUaOZRC4UuFNQGuOmKsON
7ON5UaA1RU3ffLhLJjz5KsHnZeiNdIYC9e/AuDHUFlQfbjf3MgbcGByULHJxg5X9
mSUdve7zLjtI1quE1KgkX+q6LhiDbPkA1n5BuROxBeNOTr8h8I7xEyc8Js0/PzTL
Sj858AKvAH5jDZatfW511E62Dszn8RPjCahQN/QVtUnaaiToEPgztCNDRwo2ytk8
a6+nevJiDsva8pJZeAOPZOCukpP1tg==
=Gsaw
-----END PGP SIGNATURE-----

--Sig_/tJStpSSM6JR=p9/XBw.Kq60--

