Return-Path: <linux-next+bounces-5479-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F8DA39DEC
	for <lists+linux-next@lfdr.de>; Tue, 18 Feb 2025 14:50:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E54E018860A1
	for <lists+linux-next@lfdr.de>; Tue, 18 Feb 2025 13:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB8E269B02;
	Tue, 18 Feb 2025 13:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fekQPKrh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386E1238D42;
	Tue, 18 Feb 2025 13:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739886583; cv=none; b=fEp7nkM5SJwgSsPmwRMYTHug9IGPu8+n0YR+8jjKQq4zM7MLXSzlUM8rFo+lvqjYJ9tO0SOXGCq72qySRc15LY3aVGICnyDdwfsrspliCJtUj0hqDb6/lG4taDPEcVzw1eFIzIPg86zQQjgxSGkN0yIj9m/Tes/gM6g+dOS3Jec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739886583; c=relaxed/simple;
	bh=vRF8JzY74YazteXKwI2mCLdrMdSGMAdrzF1hKbK8Oo8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MWkPCuntn0bPVIUtVV32ckM1hUgfsiMd66P8K9ICmbD3ql0mY6+omLPxPiMulEX1q8wfcUJ1eTAFZOMGaWkZkpWRcrpyKDhTXNSKp9tpnEw+CIpYphTvQKnb/Hfp9oz5G0n7l2IXtiqbc1g4Y9/DIZzoiDLDd4fPwQvmI0TD+D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fekQPKrh; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739886576;
	bh=vRF8JzY74YazteXKwI2mCLdrMdSGMAdrzF1hKbK8Oo8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fekQPKrhIX/5GWCwIXA86FBsps+grinbeUQ87+y38B51FJELe0ca78Th5kBfqedjq
	 Fbr5MZDFxAACtcjYrIvf4RMDKF+hpGxdinpAqMxQSwqUNtTJddRx2VWyi223xeiZL1
	 eV+fXNyTng9SzzjylUlK3W55evWbC705aFKSHSbrSk0YVuZhofAMaaUAmzM4BV6Rn9
	 voOmowWhVb9t2pnU3oqssJReGj8k/GYPGYq0QKzr+pJbRctZuc+s+5xcuWglSLGxIl
	 J9J0TghQLGlBb4Ax2YbF1zCdTQ/VkzoS1//3lto6g8Sk4JCOnfAtOpZ8FXhoWLnjQ9
	 3YIH/Il6KEecw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yy19D2lskz4wbp;
	Wed, 19 Feb 2025 00:49:36 +1100 (AEDT)
Date: Wed, 19 Feb 2025 00:49:34 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Beata Michalska <beata.michalska@arm.com>
Cc: Yury Norov <yury.norov@gmail.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the bitmap tree
Message-ID: <20250219004934.46ace766@canb.auug.org.au>
In-Reply-To: <Z7RiVtunqI9edfK4@arm.com>
References: <20250218160742.49d6ab76@canb.auug.org.au>
	<Z7RiVtunqI9edfK4@arm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9X/Z_Q_W0TZ01fGC.JTefxJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9X/Z_Q_W0TZ01fGC.JTefxJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Beata,

On Tue, 18 Feb 2025 11:35:02 +0100 Beata Michalska <beata.michalska@arm.com=
> wrote:
>
> I'm currently testing a proper fix for that one.
> Should I just send it over as a diff to apply or rather a proper 'fixes' =
patch?

Maybe a proper 'fixes' patch, please, if easy - otherwise a diff is
fine.

--=20
Cheers,
Stephen Rothwell

--Sig_/9X/Z_Q_W0TZ01fGC.JTefxJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme0j+4ACgkQAVBC80lX
0GwXMwgAjDpwWkSJwD9hoUF3HJO8eMHIesZMOJqwSLiNFspJHxiSsB6RHiiBJQVC
9Xz4mUh+VPEQnjshBMpHUyOBkIp+UybxJbgGGnSUhnIoJFmizige5DmheilyCvHA
cZd47lBGTVSdLN/GBEs5tODxjraHnXSCw9bqLgZKYS1GZSpQ7S5CNUGpGB81UkKd
bs1EQ+cdeuyX8o0XTJw2izkzZpunFhwFi7pRxu/7lS57g3SU/+eCzhIBLZAXH3Vt
NRIbtV5aVTFHRFF0RcpuSMNOsRz/VLnVl04/doWZxA5B+6smyssz/IfA8dX8yo6v
k3FqxTSuq3ZiSDKHp+8IlyBot3MTIw==
=1bS+
-----END PGP SIGNATURE-----

--Sig_/9X/Z_Q_W0TZ01fGC.JTefxJ--

