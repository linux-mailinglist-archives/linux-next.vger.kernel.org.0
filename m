Return-Path: <linux-next+bounces-2478-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C488FDD44
	for <lists+linux-next@lfdr.de>; Thu,  6 Jun 2024 05:20:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CD2F2860C3
	for <lists+linux-next@lfdr.de>; Thu,  6 Jun 2024 03:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D48D440C;
	Thu,  6 Jun 2024 03:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="p7Fnx9XM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AAED2E5;
	Thu,  6 Jun 2024 03:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717644002; cv=none; b=e7uM0Pjg8X+HA8zGfNP6gB9kwQ81TYGiN6oOU2eYIQWjYqLaME7B9Lfnq8uWheBWcE86ZQH+OAYj5/9NzLWect2ApQr4hA83UzsT5KRPnriFMecogm572g55FcBZw91423BID8uOJjfBOpWi0UuRMITE72Gaw25oWjwYpJnOgN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717644002; c=relaxed/simple;
	bh=ZrMPiWxvwy5CarjZpm3ms8Sov2kUQYQ9uFMqqHUGfUU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZS/7OgzXeaRMe8vDOL7FZ4s7GXbjpHnKLRVoibhaSyro36lCiKs9OCMS6+4JwrVyGMweKnek9Jxtfr6VlVDnjJrXncwoFRp1MJ6KbcUjWNIqZbtDkvHgrgropPrgkva3JLGY3H0dXfzzrpjAr5Gn7p/ew77rQhHlu5r18ZJYPRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=p7Fnx9XM; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1717643997;
	bh=09+knktZzC0sqZwcGDI/pVenFhSdqzQR8qpRT/6fu60=;
	h=Date:From:To:Cc:Subject:From;
	b=p7Fnx9XMrM8E2P3t2yLA8PdZGgwL5j4KfRq6xKK0sKtjodK30UTffpP9EGbzMxNR7
	 gw+Cx74E/OMtBDdgAnO2n+m7CbQ4F4i/VOCF2W4j+iVYkieXZ11LsIYIPQB0hI5v/O
	 DDm1BFNkjyqggUhsKGTCc+zFk8GpKU9cfi84mHEDxN2VFgyyi6sFqSv/tKS+mWbH0u
	 kX/Q8LV2NFyWklmZQYCfa5aJMoHPd867hC8KTj/5HZhwPDJcEtYkrC9rqyneZm8sde
	 y+7LeTOP1QgwM1GVFaY+9MtdZpjWG7781/oE18XhN7h5meHWEZ3W2KsxW0ppQhWP4w
	 rX5TC7x+srCUQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VvqMJ16Nbz4wc4;
	Thu,  6 Jun 2024 13:19:55 +1000 (AEST)
Date: Thu, 6 Jun 2024 13:19:54 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the mm tree
Message-ID: <20240606131954.30d0be64@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/O=55nBMs05ljFKC8K7amw7j";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/O=55nBMs05ljFKC8K7amw7j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/core-api/pin_user_pages.rst:200: WARNING: Title underline too=
 short.

folio_maybe_dma_pinned(): the whole point of pinning
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Introduced by commit

  b3d997231b4d ("mm: remove page_maybe_dma_pinned()")

--=20
Cheers,
Stephen Rothwell

--Sig_/O=55nBMs05ljFKC8K7amw7j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZhKtoACgkQAVBC80lX
0Gx45AgAmJhIN6H4V3z8GPcjvjRKP65q6jqSOFACkM1Gref3nf4qwzKbTZ4/zwKT
Hbwo8+75y3KnWf+CbGJV9U0PJO5y8lrorP8OyXWRTBijBz9nLncs2li0NvNlewqZ
Fib5ySqNWpZC9vnksKBCJqShF3yqzvd+K9+C+CI4W1KRPibM/H041KBx8JdUcPms
beZEnHhO1oiM1ep5R/O5ou+HA/KWe9xhrLQT56NeuoXjX4tWn7OS8igvPfLR76Oh
SMOp1TEjGT/0m0DvJ0M6WpexB5GFJkD8+yNzFQ0XUKyIq+5RxhifwZ1E1qwPIKDv
WtZ6zoAfZHRZn9Pc+5foD3zerJNMzA==
=gWND
-----END PGP SIGNATURE-----

--Sig_/O=55nBMs05ljFKC8K7amw7j--

