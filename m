Return-Path: <linux-next+bounces-2427-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F15228D56DB
	for <lists+linux-next@lfdr.de>; Fri, 31 May 2024 02:21:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7C09289CFF
	for <lists+linux-next@lfdr.de>; Fri, 31 May 2024 00:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18DA81103;
	Fri, 31 May 2024 00:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dq7ijHWB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6755FA2D;
	Fri, 31 May 2024 00:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717114898; cv=none; b=DGyyVPY+x19LCZwJgFqEoTiovCqK7vdl4QJfFJujZFb7OmvlStw/wFjY/lcr66ZhtBhfP5gYwJPObr5oqcEjql+UW2n3gMwSKj/RsdDs0qJ5K8CncLSw+a8s1jHJgDPP1CZrnd7yqv1TiL+SciGoDuHu91N/sqD+BxjYkaRvP/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717114898; c=relaxed/simple;
	bh=NOXl7/Ve3EE2bBRgzqep8YBgsCpgg0lI+Bjy7stINs8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b1AXP6CKUn6PMyabyWd3EC8RsqNZ1hIhLAKMS6spWxd7FqmLeXb8lyWCi76uqh+PGRW2R183MbHTP+e1PuZj/zaDh6wkWlcTUvGjqgGYkuvIAcmiZNKqgM7mFMbtqqkgEQZCzp/fi302cuPjx0eHF+vLY2/8pUkVy16QpHKv9Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=dq7ijHWB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1717114889;
	bh=NOXl7/Ve3EE2bBRgzqep8YBgsCpgg0lI+Bjy7stINs8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dq7ijHWBrx9P5qXNc9HcS+/vvWHzKTXSQoDMMBxNv7Dz4O+tWdMRmR2lmrfipXESh
	 n2p1bFYzP4wyfVL8wpoNQ/PRh+PKWyMFyOk7TdRX09N+Q/rbwicjcxTDgrsIynDNQE
	 zuWi8/IaOSiZkYi5wP0YuEbJQCtUrWH630bryafokUAHQNm4ZOL5T3f/Ogq/hfpzde
	 Tn6W5d25a15CV89m9SXgXT0WwuFZvU7tySxJIsv8jGJd6iGg2kR45valJkdfn0235J
	 4I68rxT2r+obDppkbgEDFWjAPeDrPK535PANALOo5Re5J/Eg+VtycdxajVgtIq2fgw
	 oAP5D7Vt4ulig==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vr3h92sb3z4wcl;
	Fri, 31 May 2024 10:21:28 +1000 (AEST)
Date: Fri, 31 May 2024 10:21:28 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: the fetch of the tomoyo tree failed
Message-ID: <20240531102128.6145461e@canb.auug.org.au>
In-Reply-To: <31a20541-d5a2-43c7-8225-adc6d44f6e41@I-love.SAKURA.ne.jp>
References: <20231017163242.62af10b3@canb.auug.org.au>
	<20231114144510.49fd3688@canb.auug.org.au>
	<7c814d59-fd95-40f4-80ba-237bead3de69@I-love.SAKURA.ne.jp>
	<20231114161611.256f0239@canb.auug.org.au>
	<31a20541-d5a2-43c7-8225-adc6d44f6e41@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZRpUpm8Q60DMFY2rWMf7ieB";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ZRpUpm8Q60DMFY2rWMf7ieB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Tetsuo,

On Fri, 31 May 2024 07:06:57 +0900 Tetsuo Handa <penguin-kernel@I-love.SAKU=
RA.ne.jp> wrote:
>
> Since OSDN does not revive, I moved TOMOYO's repository
> to git://git.code.sf.net/p/tomoyo/tomoyo.git .

I have updated where I fetch from.

--=20
Cheers,
Stephen Rothwell

--Sig_/ZRpUpm8Q60DMFY2rWMf7ieB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZZGAgACgkQAVBC80lX
0Gxwwgf/Ti7etITfvpNApcDs16UVDnI22iWWID8NWcCFH/tRWrVGQetVHAnUSoow
i96WMJjtHb/Np3PM0lrOaTdQjcFp3SmQyIZYU+Uu/DTDKdP00oiB1TmTqT2AXVbO
XTxaHdclO7SBXF0bx5IuAsfm7VMI9yqdICZIC6gbMUlE74K2veULDEWqEf7Ar0Lp
+Vdkh3hxkPaMlUrju3e7L1itoJoPEoBJyORd+TDbrQ3PtlNtfeXVMZWUatFXIadg
moQXxULY6pZXzgq0v6HETxMEvJv3vpIZfqt/82KDB6oGTnAWNeOtRSQIewKFFd/M
bhjL8uRg5jOXdSaFj/t720dkDl4gCA==
=U3FJ
-----END PGP SIGNATURE-----

--Sig_/ZRpUpm8Q60DMFY2rWMf7ieB--

