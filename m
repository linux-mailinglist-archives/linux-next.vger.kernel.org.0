Return-Path: <linux-next+bounces-4932-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C41AC9EA775
	for <lists+linux-next@lfdr.de>; Tue, 10 Dec 2024 06:00:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB28D16534C
	for <lists+linux-next@lfdr.de>; Tue, 10 Dec 2024 05:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C21F04D8CB;
	Tue, 10 Dec 2024 05:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RbAgjo5N"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79BF757FC;
	Tue, 10 Dec 2024 05:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733806822; cv=none; b=B67Pvvu09xAlpMnCz/J4ZYmsy+zArJA3/CTwHkoJlLt8PaNf7eFnB5aWJXr14AsL4uv+JpKL2r9vwiTmp4W6mjCwa6dOkq2dgSCIvTHEvonryLDsu6cBYuTOpRDBputF95nmnRdypQlkHuEmLkVqBUUauXveGrRV5QpJDlJC7TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733806822; c=relaxed/simple;
	bh=upNvgAeXeDuFW2av/wUrWekkHVTfrvHsb6ADmbczgX8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NA/xUttFvtwOIJ1norpOfyB1Umx2sz38uUs6RqZ/T5/BJmDVTIwDdgtuzvjE1xoVp6yQbeYgWea+Q0xElZCZJGUCe3MO29bJLh9289b22z8RxALQOrv4Wj2hZbqlST+uoYhE61FEvxmgJgD4Wy9qMPQwZltyWVNtLpEYBC8yfHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=RbAgjo5N; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1733806808;
	bh=vJJsx5TNLFegwafPTTYrXyHRBKRixuk27osXFNV+MI4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RbAgjo5N7Gyg9gCf8B+ORgxvsiFUcaZPzzaS3d2raJzt6SMCAZ2siU67077vXKv4R
	 jWmmb+/s8SI2yi4lSGriEih4lnF406888WlbIDKf3LKl8hZdMxx51C0u7mKTpO4ZgT
	 IEer7jsiGDI5T7RP6u+VvcBVM1vdhB6HTfWjFoMrjXbmyhYCHojLqCUvrmmvgcJspW
	 zsh9d5PwX7Anx5jqnrOWGpGzfh/Ntx+Ze0Kt8Utisicah2beLj3A07EFT0jXQacfWz
	 j4C5MSRMSQO77DPRTXPsxoVMaUjNIkjDMsOPo5ktkcn6MSHVaH8BiUyzs1Tw+9mmGH
	 zHliTRzWnAL1Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Y6mkc1JVFz4wbx;
	Tue, 10 Dec 2024 16:00:08 +1100 (AEDT)
Date: Tue, 10 Dec 2024 16:00:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Suren Baghdasaryan <surenb@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, SeongJae Park <sj@kernel.org>
Subject: Re: linux-next: build failure after merge of the mm tree
Message-ID: <20241210160011.00c3dcd0@canb.auug.org.au>
In-Reply-To: <20241209182557.8794e5b886e4ca91994ed0d7@linux-foundation.org>
References: <20241209170829.11311e70@canb.auug.org.au>
	<20241209182557.8794e5b886e4ca91994ed0d7@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0NPnQ33xPq8kYt_rj1oR_f3";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0NPnQ33xPq8kYt_rj1oR_f3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Mon, 9 Dec 2024 18:25:57 -0800 Andrew Morton <akpm@linux-foundation.org>=
 wrote:
>
> How about this?

Unfortunately:

In file included from mm/damon/vaddr.c:736:
mm/damon/tests/vaddr-kunit.h: In function 'damon_test_three_regions_in_vmas=
':
mm/damon/tests/vaddr-kunit.h:81:36: error: passing argument 2 of '__link_vm=
as' discards 'const' qualifier from pointer target type [-Werror=3Ddiscarde=
d-qualifiers]
   81 |         if (__link_vmas(&mm.mm_mt, vmas, ARRAY_SIZE(vmas)))
      |                                    ^~~~
mm/damon/tests/vaddr-kunit.h:17:70: note: expected 'struct vm_area_struct *=
' but argument is of type 'const struct vm_area_struct *'
   17 | static int __link_vmas(struct maple_tree *mt, struct vm_area_struct=
 *vmas,
      |                                               ~~~~~~~~~~~~~~~~~~~~~=
~~^~~~

--=20
Cheers,
Stephen Rothwell

--Sig_/0NPnQ33xPq8kYt_rj1oR_f3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdXytsACgkQAVBC80lX
0GzqEQgAjsRA4+IHiIbo7UZL5K8GrkTwl6kIzpj+7dzfdwe5Ee3TGsXZV/jrirKH
WOYGC8FuiKGQUSGtZJub/TggKgtpQk0OKgYwbSTg7LyaoHJ/tc3RA/OArl6FW3OE
OEHvaoTtGAyqjYPJPFALm29EpF/r0ITL1pPMQOl2w6OKu3BZWkUVCfYyP1BohtFp
0dH4VdNodopgyKYm+snqmMwDKKnCfb4pYtsFGlcbwUKHZy8BmwKfnctxbWEo796J
uvLYDZWUPWgcZCUyuP2Jl+jhF1F/p6P1HsgPupmnhkv7i211KDS+LDJIbbZ2tFZ/
iXnu+IdeF00jX4bkn70fIQs6wuDFQw==
=0c+7
-----END PGP SIGNATURE-----

--Sig_/0NPnQ33xPq8kYt_rj1oR_f3--

