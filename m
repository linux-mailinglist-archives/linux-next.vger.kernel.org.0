Return-Path: <linux-next+bounces-5108-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07966A06D05
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2025 05:29:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E44C7A32E5
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2025 04:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A280158218;
	Thu,  9 Jan 2025 04:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Elpv7yRS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F323713E02D;
	Thu,  9 Jan 2025 04:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736396883; cv=none; b=q3De+3ky0eVia6NtimVMIb1aplpFr5z4M3g+Oe75yjYAkmX9qp/5zY2c0mJErUjWMU3q4L9D4vU1HCt6tMa9p02TYbspUhm4KBzuEq5SkfOrbb9a4wrlCr6IWNxysp87rjIUDipYcBgtFyaIl//9Rl5KoCYEGQmJUy8jB0UfKXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736396883; c=relaxed/simple;
	bh=J6X+7D/BC8fgEIsFa4MrEDcmiwy95wf6BHgX+LGxF54=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=av2Vz4KTGDGFjNPrpIP9A/Rdl1FkGN64hmKa7PFh7StgcKB17ES/NBKwkYK+BMi8NXzILW5Ra728COVCb1LO3ioObqihbDZEFuyqoSiWPSA6TnGpmTnhQr04/9x8AW5qQ3ntCaLYel9rAWdyu8VCZeBQzqR1mOJxyRNLOkDbXi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Elpv7yRS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736396873;
	bh=FR9hmF/IR6poMpnHmTo0HFeP/UrdbbHwE4Y6OmfZhxY=;
	h=Date:From:To:Cc:Subject:From;
	b=Elpv7yRSfLH11yEix40URvzBuK9Bry1TFVCGDmrOMUnLJiIQkX84VgawYlj0X4uLQ
	 uA8lzZh4c6NbsM9GePP2GRYhcJJNCHfnpOkBy0boQwSpzEdvOmoicrFcV+oH6p0Fpr
	 vaaVEETfUVzdwcbMzuLWmyVphqGfzI/JgU/WdjToBfuum4NkEtDbKysT8wd0eFyVDj
	 xxFV9T2SXMnIIhvWJVmgScG8g4vMEa84Cduwm5Lj24U1W0t4NKwHXPZ33icbg78Qwg
	 Js+HvQ3N+VEztc0vmhGe8qvVIPXFIyp+3MBSQGLmFuFaQy55p+crNpcLiMAJTJry63
	 /9ySmcnBuSxqw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YTBbY0qxhz4wcj;
	Thu,  9 Jan 2025 15:27:53 +1100 (AEDT)
Date: Thu, 9 Jan 2025 15:27:59 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alistair Popple <apopple@nvidia.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the mm tree
Message-ID: <20250109152759.107559ca@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jOKUJJ0lDn6FzHdcdN2Xtt8";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/jOKUJJ0lDn6FzHdcdN2Xtt8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (htmldocs) produced
this warning:

include/linux/mm_types.h:409: warning: Function parameter or struct member =
'share' not described in 'folio'

Introduced by commit

  9c4409f51aa3 ("fs/dax: properly refcount fs dax pages")

--=20
Cheers,
Stephen Rothwell

--Sig_/jOKUJJ0lDn6FzHdcdN2Xtt8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd/UE8ACgkQAVBC80lX
0GwQkAf/U3gjBpT0UKNeEKYHA6FxfKKEEbUm5Une4iQrzWBSIKgq3qRvuz/tX/Uk
kyi/4XlFZsKzAQ1P2A4VfoEiKNf52n4nZp0Hp/rIpDZJ/eK67ICIB+Sa9EbTnmxq
af4bZB/TbpWlR9FbjZa8YZfpl2FEnrl9T2VTqsbDqQJ9cZrZk+ohZB5yMcrz/cXJ
6mi0cRxCsGgKeyDXDdi2jznwiC1VP9yqUbzgEQitSr9OJt+Cn8thSDHH3KIYMKL8
L8XCUkjcrP+Bzsy8hXbpi5skq9N+qDaIG8ZeJ4GvZfCB2gyQKVfXP6WwZXY2cu+D
Wbd6ncmoakHGA2RZZMUVQQJDdS8UBA==
=79nS
-----END PGP SIGNATURE-----

--Sig_/jOKUJJ0lDn6FzHdcdN2Xtt8--

