Return-Path: <linux-next+bounces-9654-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 31073D1C532
	for <lists+linux-next@lfdr.de>; Wed, 14 Jan 2026 05:13:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4B5E30155D9
	for <lists+linux-next@lfdr.de>; Wed, 14 Jan 2026 04:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A43279DC2;
	Wed, 14 Jan 2026 04:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fOqYM2LF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F419381C4;
	Wed, 14 Jan 2026 04:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768364033; cv=none; b=tBUTyESLJvqwtlrfX7hz8ikeakfMgjxzMg2byh3MQlrbuH5Vhqu0mA1sSjw+Pd5bHpCV/SiLvYG6ICd+I1h/Buc3GmA8PAXDefgMYnvxTSW6YJxA5FsBx6nGBYPdbKF9Ofee2J+Nf07X8Z6ftocLrJXDvsmdLceKWvzN/QIA9RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768364033; c=relaxed/simple;
	bh=y7D5YIiNN266+j34vIEx71roy2B1jzU4r1qiZS08X8E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BkS2B1AFEZZpP32Hzq7BA8UHi+jM7+40DC/bMfulW+Vd5TweYwkvYXls0RkC/PzUTfO3ztqbQLj6efZN/CzIM5Pvbti7w/aoWM/p7NbJlcVlzcjWG55z+xFRfmhRF7njLjeIRKosa4myXzk9zkYDWo8Tj61WtqJq7cWojc2Y1Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fOqYM2LF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1768364027;
	bh=LmO3tERu7Pb0qCA4bitFpiwrSeN+wp9YKjZxpBdhGhg=;
	h=Date:From:To:Cc:Subject:From;
	b=fOqYM2LFKNRx0wN2X/GmB4S+Ux83aX1xF4+pZFxs8sRo6XrwfvV5VDbZs8g0TQXST
	 AHrbxOg80jDMV2IGnT3UjtO8+aeXB1Z7gibqyO9NM4AFLcjwBeomEjI5FRa06K6MTN
	 rPwxQqGWG9rBGSp/fBjkwMixqDXISTLGqYQ1ioVmwQtKn26OLCJP7fjC0EjrfgTe0o
	 ckqS1B758OqJHh3VUrstHOlcCbKGvmMWT+dEBn1rKWE5e8nVWVM3inPdtJ6EhCFOOM
	 mv4GKvBzyclC6EWS81mc3HdI5GxIbeVRQWSKg4Sev07NvVqkDa74A9xVvsMz4qF6l4
	 KDJ2fSJW3LvPg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4drXmV6ZRcz4wHX;
	Wed, 14 Jan 2026 15:13:46 +1100 (AEDT)
Date: Wed, 14 Jan 2026 15:13:45 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Harry Yoo <harry.yoo@oracle.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the slab tree
Message-ID: <20260114151345.5069eda3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ecFOWowR5qE.HnXnqPgC4vq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ecFOWowR5qE.HnXnqPgC4vq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the slab tree, today's linux-next build (htmldocs) produced
this warning:

WARNING: mm/slub.c:7088 function parameter 'objp' not described in 'ksize'

Introduced by commit

  1e8eb4117f27 ("mm/slab: move [__]ksize and slab_ksize() to mm/slub.c")

--=20
Cheers,
Stephen Rothwell

--Sig_/ecFOWowR5qE.HnXnqPgC4vq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlnF/kACgkQAVBC80lX
0GwSFwf+NbfusySnqcaRILXakqiyb6JjXt6cfGpOlvPyNCPdLfvxZJwiB7lm10dj
yNbBrSwRn9mPT+OkEGgzhAAYmPQXAQAJWuGSnlYPQvdR/uaWxQpnV8ZS+ytzPWf3
BPYD5c1uQHDfB6+AttRvgj7QLSJ68xopV2XHr/NIBL3kBg1V6csef21z67t2P+ud
HAaVs7rTuA6XA5ONdMN8r+mTIAM+M16/5NKMApoHvMzZETtpw57If5FDSWcdowhx
00A7/n6ZDh+Bf0XFQcz4n5zjQLLTi2WSXv1G4TRBycdM8bFExMHiuZ0WITRiNqk6
k1RJbErLsCWr0fTim6frauP5W1XLaw==
=KUPq
-----END PGP SIGNATURE-----

--Sig_/ecFOWowR5qE.HnXnqPgC4vq--

