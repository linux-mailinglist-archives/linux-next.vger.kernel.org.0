Return-Path: <linux-next+bounces-6179-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 894B3A7F24C
	for <lists+linux-next@lfdr.de>; Tue,  8 Apr 2025 03:39:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF88118995D9
	for <lists+linux-next@lfdr.de>; Tue,  8 Apr 2025 01:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B06025333D;
	Tue,  8 Apr 2025 01:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QBOxgWCG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5E124EA87;
	Tue,  8 Apr 2025 01:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744076273; cv=none; b=INcX5VmLl9AJjjGo7VsTNRLCbMfrERhAzVb83Wj3zjG7vWNdGHkQqyBNm3lY0mBR7LqC6u4nLL1fO5BbgRMGJX7rvuyqzURRPvrjj+7Pxr2HusJEpRW0n4TwsvudPag5ZJt66Terk1FwY1qTLNaMMWHtW63t7i7gB1gEe6CGVIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744076273; c=relaxed/simple;
	bh=SrAi/YcBE+Fo3fFoM3bY+Bo9lqvkwLPyiX0ifJOflEg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EgbnjvocwpH56fyxcvIq71tTtz6PEgltzjJaF3qCWdVpY9TorjWWNZTb/fmQL0iyy1fbjl6GIXcFo96H6QW3sQstkRr7/M6z6dKFdA3nPWEv4gCv705/wCISQ9XtJhtuXhUogebHg4c2vtqPdUy7jcY9ucXy/Zu2Yu8jpfq0hso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=QBOxgWCG; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744076268;
	bh=pry0XYR1bNyVtjgGwwK1T2iqph7egXui1QMVMr15pE4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QBOxgWCGVDM0mYWO28VCIVWVP1Hw1VF8KkrN8UfnnXQXCF/o3+f0Spx7FqUpA3nvQ
	 znMFWNBRGKqO2Qqy8UGMl2+uUBz8VSqYTP5wCe7P8xQcKGqnlwTUrTkZ3gJdM0N28h
	 dkNQLX8X658IsZEaIzPNipKXC+m0XzavPo48+AFBH7GMf2HzqtDTNTcTr+F1PtbDxt
	 oURF5M+zzKYnbLUV+W8bO5yEPGlTNT3UisYNBA6iddu778xeoiJKICqbZ2Lp/8YMR2
	 ODrG2MNQDsSbL/AkAdTV5EH8eBGFEgLa38pu6sd7+R6vh86MDtpFYhm+ARQEaH8eiP
	 lT7bAOKsB2tqA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZWpcD1Nvmz4x8Y;
	Tue,  8 Apr 2025 11:37:47 +1000 (AEST)
Date: Tue, 8 Apr 2025 11:37:47 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 Balamurugan S <quic_bselvara@quicinc.com>, Jeff Johnson
 <jeff.johnson@oss.qualcomm.com>, P Praneesh <quic_ppranees@quicinc.com>,
 Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, Ath10k List
 <ath10k@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the ath-next tree
Message-ID: <20250408113747.3a10275a@canb.auug.org.au>
In-Reply-To: <Z_R2lEVjqn2Y3_sP@gallifrey>
References: <20250408105146.459dfcf5@canb.auug.org.au>
	<Z_R2lEVjqn2Y3_sP@gallifrey>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+gp7kqPae4FJqvCGp=VvsLM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+gp7kqPae4FJqvCGp=VvsLM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Tue, 8 Apr 2025 01:06:28 +0000 "Dr. David Alan Gilbert" <linux@treblig.o=
rg> wrote:
>
> * Stephen Rothwell (sfr@canb.auug.org.au) wrote:
> >=20
> > After merging the ath-next tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >=20
> > drivers/net/wireless/ath/ath12k/ahb.c: In function 'ath12k_ahb_stop':
> > drivers/net/wireless/ath/ath12k/ahb.c:337:9: error: implicit declaratio=
n of function 'del_timer_sync'; did you mean 'dev_mc_sync'? [-Wimplicit-fun=
ction-declaration]
> >   337 |         del_timer_sync(&ab->rx_replenish_retry);
> >       |         ^~~~~~~~~~~~~~
> >       |         dev_mc_sync
> >=20
> > Caused by commit
> >=20
> >   6cee30f0da75 ("wifi: ath12k: add AHB driver support for IPQ5332")
> >=20
> > I have used the ath-next tree from next-20250407 for today. =20
>=20
> I guess a clash with the recent:
> Fixes: 8fa7292fee5c ("treewide: Switch/rename to timer_delete[_sync]()")

I will try that out tomorrow.
--=20
Cheers,
Stephen Rothwell

--Sig_/+gp7kqPae4FJqvCGp=VvsLM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf0fesACgkQAVBC80lX
0GyIFQgAnISd1YyFiTjCOFbapwzs/ZBqzyIaYKnXBnGbnTnv6ZTNeXYaY1EvGsXr
Hlz5cvbtV4JETqIlMCBSfx0/gGBTTka4uqeV+110Grsh+lWSip5jKDEHevtjJehF
7T9dvr6RY6VGlc0sAyT91aWruLlLJzKeuZW8cgdMSkH04FKhIs6HRwpVLGJj0wU1
yU/a+5/8PQiOZZpZY2ZSGfk7rlZRwddzhlV2kFpgMb2fCUWmX/RUiXUVRy8dB9KQ
cWLepciql773B3DLZePmJ0PULy2iLek9m1V8AHn40vNbFHtijjk9dYjKk0e3i1FJ
+4wjUfH15h6KoDDlzRGjMTiePFKfsw==
=Hs2Q
-----END PGP SIGNATURE-----

--Sig_/+gp7kqPae4FJqvCGp=VvsLM--

