Return-Path: <linux-next+bounces-3324-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E27B89526DE
	for <lists+linux-next@lfdr.de>; Thu, 15 Aug 2024 02:25:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A3AF1F233E5
	for <lists+linux-next@lfdr.de>; Thu, 15 Aug 2024 00:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D22A47;
	Thu, 15 Aug 2024 00:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lR5WY4IW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295D0B644;
	Thu, 15 Aug 2024 00:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723681545; cv=none; b=p1ExN4rQWgbSeM+dA/rFAvuaBJ95UsaN5jd0mDXDYFqwMSzqmXnSR/9Vhu7HN1ONTf74sbBBtD3NoVOu6pNgO3WrtCdR26bQWBjkJXa5JRbG2+yo9iRCRdfGDm38ySkmMdM09VGx58cfovRGL+bdsVgh8l/YPMnW92xmxTDMIqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723681545; c=relaxed/simple;
	bh=HHXO2YiJtghaV42iBrhhRbLPCkPNjmL/F0uqENq6s7k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r7BwCWMfTlVWGlW+3yDHCZ4ndyUlpKYX7hUB2CQm+XmpkuUfOfWshnR4+iaiUTHft/fin8xLZa0jfT0wICXbnQN+KQ3Uzm2Pr27x76a8HO9AdqJOzU/rIztHMhAQ+GMlazUixPgszRjzNdUXJRbAyVqPjZpQy+a2afY4gboZzis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lR5WY4IW; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723681540;
	bh=lzOwZPG+jcFmlYgwBPgqxKFIDVBZbMRrqPEriByAJcU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lR5WY4IWq1xZ9fh4i74NkE1AUiQH4o24ZJmhPUWN2ouHx+ZTtPIW349RPl7yInyhA
	 WFN4oIzFZ/KgOPklHlN0QKGB8UGll5C6y9JWE4wKOpQnCIElyKHs2ii4ajsqrbGDKU
	 pJlwZMxCSHelSXP2U7RQDRzKkdYvaPMFLxx/7PlOK7NpJY+MPFC0vDjZeTjWX6oifm
	 LJTMl5gGULeBKFbLFSvim6winkv12D6EepCG1mAvT+VJH5iViHQjbesE7x/Yz2OiP8
	 m2X1hNysdAIpTKXqwD8c7jm0ePw7Mb32SIvJ4ZGRu4P6O6Qlsqp9m0PMByIN8aqusr
	 W2QbxYIfxG7bA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wkm9w1d91z4wp0;
	Thu, 15 Aug 2024 10:25:40 +1000 (AEST)
Date: Thu, 15 Aug 2024 10:25:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jani Nikula <jani.nikula@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm tree
Message-ID: <20240815102539.725cfeb8@canb.auug.org.au>
In-Reply-To: <20240814170803.d36253ee8657f9f1f19ae5bc@linux-foundation.org>
References: <20240815095734.751c6ec5@canb.auug.org.au>
	<20240814170803.d36253ee8657f9f1f19ae5bc@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/f6e2JSQx_/ku8pa=4iRH/g/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/f6e2JSQx_/ku8pa=4iRH/g/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Wed, 14 Aug 2024 17:08:03 -0700 Andrew Morton <akpm@linux-foundation.org=
> wrote:
>
> Oh.  I think I got all these with
> fault-inject-improve-build-for-config_fault_injection=3Dn-fix.patch.=20
> Maybe that escaped somehow.

I guess it did. :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/f6e2JSQx_/ku8pa=4iRH/g/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma9SwMACgkQAVBC80lX
0GwCPgf/UqvMbxmN/aYcHJsFGYd3Lyny4vDqpS4AqCuTLg+70HbK8I5IvlpJw1aV
mIFTxNxrSzWQF1YDT04tm8zla/BSDnWkXZsXB9vYPmNUD0NOEwmemQNPnKVSc2bK
yO9QZ9VkvZdWyMkxAaney+vX3EaIpzgaSOlCIxpVaL6C4ow13UwXu7nAnJfdJKs+
U2bC85X5TAsIpUfiJx4tmoZlXI08lezM0EOncTtzZ89D1yH8tgqWBWWLnvqaqDgE
5PX+1PCWksKrUFtZ3aRhND8huFNb63tH44HdSVFCqLD4Kss6ZFA/frm9M5GyDvp7
GxmWZB8fxvxzsI7AUbwBbTu2Rp6PjA==
=/zFx
-----END PGP SIGNATURE-----

--Sig_/f6e2JSQx_/ku8pa=4iRH/g/--

