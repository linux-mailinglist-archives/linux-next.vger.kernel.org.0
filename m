Return-Path: <linux-next+bounces-6344-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D2DA97AF4
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 01:17:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 186233AB23F
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 23:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 668861D54D8;
	Tue, 22 Apr 2025 23:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="AeF5HkBL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC6915098F;
	Tue, 22 Apr 2025 23:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745363823; cv=none; b=LxVRHQVgIzQmfqGvYbx990tIdUiVwEi6FCny67m7exlPdNGux8+xZBR+yjStOFFjkS5kUS848fm4NGfQEOnhW2CK2UdvWo2CwwCaVWIzdDLxWLSxmXpk4OwErd09qsK2MDFQY86Q3klyjM16YvBVjfR8X+ke3anPlmKNiXznfUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745363823; c=relaxed/simple;
	bh=Dtr9Jo42nBgz0mKPLN61HwvNBbCDIjzPXuWQ9Jn/Fak=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JOqEu9LngQzlQzTJmj3oG1rzcDE/3WZwyELDuKe1f4rbEjMR4I7t4cwL5qZc/GLVyf0DKxRY4jvUl0/X9yV+I9jv9fCTuwj3k2SfUXXhmQaXfuY1SKS0q2Q+QCT2+JhSGPB+oLh1WD+J6D6/jMgOQxOvyv9UpHpn2qVWvCCOpKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=AeF5HkBL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745363818;
	bh=Dtr9Jo42nBgz0mKPLN61HwvNBbCDIjzPXuWQ9Jn/Fak=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AeF5HkBLiVSzvti5pFoEXwqzeObw5UjXt/ncFuH+LDaP30LFx3cE35RW0yqy4VNh/
	 4WlJL9EFDnWCCTkb7E5c7XaDdwkgLX1AJvQMtXqkZDA/RMbUkptlphqJULCX1eJWTC
	 7cAOP0J8atGCh/Mradmrsv2Pcl2L+9btYWFuJOG1/5LYXcDj8YnbqveIGYpI88uR8U
	 AmVIzyJM6Xljb9s5OXpdmSICK0nFQ2Y0y3eadBn3tB/fU0mUA2AhMrqq7miBh86DBG
	 x0wma0vpSvFd45JPlL2MdVyDc8fGwlSA9557sm8jFamr/URaWEw9DvIxS/poRqu3NZ
	 BxP1wePuBmMdg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zhymn2TyCz4wnp;
	Wed, 23 Apr 2025 09:16:57 +1000 (AEST)
Date: Wed, 23 Apr 2025 09:16:56 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Libo Chen <libo.chen@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Steven Rostedt
 <rostedt@goodmis.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: runtime warning after merge of the mm-unstable tree
Message-ID: <20250423091656.6068c090@canb.auug.org.au>
In-Reply-To: <5628676b-e1ff-4570-a1ee-c87742e5363c@oracle.com>
References: <20250422205740.02c4893a@canb.auug.org.au>
	<5628676b-e1ff-4570-a1ee-c87742e5363c@oracle.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Sgq1/oGh0bY1r4l_HI7y3ra";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Sgq1/oGh0bY1r4l_HI7y3ra
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Libo,

On Tue, 22 Apr 2025 11:05:10 -0700 Libo Chen <libo.chen@oracle.com> wrote:
>=20
> Just to verify, does the build have commit 'tracing: Verify event
> formats that have "%*p.."'[1] or not? I do see linux-next/master has
> it but just want to first confirm that.=20

Yes, it does have that commit (since it has been in Linus' tree since
April 4).

--=20
Cheers,
Stephen Rothwell

--Sig_/Sgq1/oGh0bY1r4l_HI7y3ra
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgII2gACgkQAVBC80lX
0Gwhswf/UIZFw3L7TPQUVHGUYXO8OwK3fKv2UAsML2MqMW/143Ufs8qVrozwP+vI
75SPkWQsGQu8pWhi7mnVqKti7mBpBwcTbVTzdvDRf8poJbBR5qCXCUpi7g8aUfKk
7S454JMhcbTmOaTt+396RCxIso5KEFsxuay4HIHw1hQWJcVTRkYRSclNTzj36MTi
2Q7f9wo1g+W2buFssVq9VWxpG34Wk2rvG9dJJWf7I0qoZASv/YvqXUzdGrL7c3qw
XzDWsEM6Vkm5cZT0jizFgi/HBQ7YW0+ETagCieiaTHHPZ9tk0v10IwezJGNtj6O8
F74Q41kiEz3i9FbGe0F6AtXYHizxLA==
=U4eI
-----END PGP SIGNATURE-----

--Sig_/Sgq1/oGh0bY1r4l_HI7y3ra--

