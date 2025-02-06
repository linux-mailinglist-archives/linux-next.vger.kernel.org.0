Return-Path: <linux-next+bounces-5387-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B50A2B664
	for <lists+linux-next@lfdr.de>; Fri,  7 Feb 2025 00:09:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25B1C166E7F
	for <lists+linux-next@lfdr.de>; Thu,  6 Feb 2025 23:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8FE92417FA;
	Thu,  6 Feb 2025 23:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="FGy3IzmX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46ACB2417DB;
	Thu,  6 Feb 2025 23:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738883377; cv=none; b=r9ephxbPmU4dVaPQhCHVp0QaJqkgbRebHWMEOHYTMTc1Jy7UU/l8YCC8j3+/eZTmiNUW4YM8rWsVLwCoN6K+oXmiU3c+8J4beGN8TTU1gh2pfud2Q+UEti0RzdHD8po05XWBWqHlw5fHNdEi9eZ47nCdDYrQx3AzHgsDXAVRlSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738883377; c=relaxed/simple;
	bh=KfxhyXrH38jjr1oqIcH++dTxi7xm/REBXgyIzG8a2dU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cpIoFDvDA5EIlGsyr7TLG7aUEzCLuNyWycvH2wpIO6RhiXKQgGcn0Jx/LxQUioMQzVClSt0BmzPDvSMRCEKvrzQDHgQTbMetvbl7V+WMjuJVMr9jpihJi0j/yUDzqb+ZnzywOa4xFs5AdQPaIM5mH4xdDhwQ7AG0woxbVOUjMGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=FGy3IzmX; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1738883357;
	bh=rGqsljqGMX7xEW53BsyCyCBBe2QrE7QcUxT5WZRLVKg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FGy3IzmXSbGBahEdQPHj8MOOBoyIBKgjssNxyHUAGzxQ3IBBfFYrweun5bKy8FY2q
	 pcyoQB1rUGRsUJC7qqUcewe6qWh/xzyffffT7ERAWFJpr8NVur9s9v0D/YZ7u6Wr0A
	 th+4r0kv3NP8D3IUXQzB8EAmdu1VrideJohu10JqTGyTxCSjnJkL0qGFBGA7WXRJK2
	 u20R8qkxYFdPlcewzV8lM2Hqfqlbs74hpF54U45O7TAPjNQJfRtstMzXfajuSJgGqd
	 YwbfCHPJ4Aj5a9MPbftseQDHr43go9tBqIVpZ87+28Pz1Oiw6IR4FS4XegXgSpj0qq
	 7e9m0Ts0r47xQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ypt8X72l3z4wcl;
	Fri,  7 Feb 2025 10:09:16 +1100 (AEDT)
Date: Fri, 7 Feb 2025 10:09:25 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>
Cc: Benjamin Larsson <benjamin.larsson@genexis.eu>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tty tree
Message-ID: <20250207100925.73f9acba@canb.auug.org.au>
In-Reply-To: <2025020621-feeble-attire-0611@gregkh>
References: <20250206135328.4bad1401@canb.auug.org.au>
	<647d4d6b-615d-4c0c-b001-fab43fb7ab4d@genexis.eu>
	<2025020621-feeble-attire-0611@gregkh>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_fsqgrR7x9TBSqbQS3By+qM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/_fsqgrR7x9TBSqbQS3By+qM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Thu, 6 Feb 2025 09:14:02 +0100 Greg KH <greg@kroah.com> wrote:
>
> No, you should allow COMPILE_TEST to build the code, right?  Odd that I
> can't build it here for some reason, I guess I need to enable OF on my
> test builds...

An allmodconfig build (even on x86_64) will do that ....

--=20
Cheers,
Stephen Rothwell

--Sig_/_fsqgrR7x9TBSqbQS3By+qM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmelQSUACgkQAVBC80lX
0GxqJgf/ZurobKHBqOrwdRzdnGc9u6wqcJv+jwrbiGsn6hMJzxcKSA7y8HKBREQ0
mMn8EmggAprpn1YALkdMqO5A0rmFVPA+UrfLnnScZproEG2CLYXbmWur109aRddL
R8yy4YPRS7cSyMbVqc4CSN+oYOhp3GcHsafBede4bUQVmLzhJJ+PlOLUcWbjreGV
FhsaYZGyao7gHC/tD9880zbgyWdmCVnNryOTxHl9jb8KPHZ+qyO64MwhLSirXd+M
zYfFT9U+niW3EghWUX5qvWAD6ajVZHBlr4H2qe3ADpnQeJ8T3KRWVpaofWnyKV9P
LCW1e6IVSGPWYW4GeMh/06KTB+S12g==
=iqlh
-----END PGP SIGNATURE-----

--Sig_/_fsqgrR7x9TBSqbQS3By+qM--

