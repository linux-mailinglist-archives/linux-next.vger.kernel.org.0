Return-Path: <linux-next+bounces-8938-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 301ECC51CA3
	for <lists+linux-next@lfdr.de>; Wed, 12 Nov 2025 11:56:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A347189A06E
	for <lists+linux-next@lfdr.de>; Wed, 12 Nov 2025 10:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D5032ED86E;
	Wed, 12 Nov 2025 10:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KhEe7Eko"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0BF303CB0;
	Wed, 12 Nov 2025 10:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762944947; cv=none; b=pTL5BOXh3wHpMLXxBbSssnSsvL4SQUYn1XPp0Oa3sN2yb5gkUs3ESHlQllxDY3bAXsmbOIYhDJnro9dZcolro/zwPSt8dByEfPTuWbi4/X421+sYZfMB01S5Sa0A0cq370MWFoPZhPSTGFmIu+Fp63GkjFvxk9IQfRIAkVtfmwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762944947; c=relaxed/simple;
	bh=29AH3QD5Y/Pz4brCoYrzKrIGjDJgbJIE3QLOn5b1G4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hDdJPdn4neLtj1ryU3A63UoU1TBn5v5gOlarK4mZZ4igiCCYoXuh7D2SZsYryz6+23fJFsQw+WHQ3Mdx5pMJCw4rWyKxN/Yjq8OKxcYL4/x1ifR0LHMOHt4eTTDtlL6vWYR6i76oKIPwOzAodb9tPE8nugR2W2/4nXIIGmQBXeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=KhEe7Eko; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762944942;
	bh=29AH3QD5Y/Pz4brCoYrzKrIGjDJgbJIE3QLOn5b1G4Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KhEe7EkodPgKjI75sy8GZT8ImjDuO3TpiPykmbQ0HouEbz2NAVcugHYEwGimiiBDA
	 zWT6n9WMgWW7UpTe2dXkYhJIM8bbj+dGr/9OXjXkCTQU7JpS2QLamsXX2rvHo8r2Wq
	 4L4YLVVRaCgmSkHjhiQgcr/11cibds+hVtt+wasZr6xQodl3hI+p0HicZeP0+kktWr
	 DuZ48DQwkfO81iZZu0CnaAF9y7+IksF5wJdcNmFWAtda7KTQpveg+ft4/+nnlbZuv0
	 5RD8LbGj8zCnFgZGCtE3Ud+/hsLRIVgTA+pEy3WebdBlhUw2FTBcJ9+x2rTNWly2zL
	 c/aidVuoEzbew==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d60gL6Fbmz4wBD;
	Wed, 12 Nov 2025 21:55:42 +1100 (AEDT)
Date: Wed, 12 Nov 2025 21:55:41 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the vfs-brauner tree
Message-ID: <20251112215541.049f3ba8@canb.auug.org.au>
In-Reply-To: <CAGudoHEa=4HueuL8Ypfd5VNVyo5fEsfeY2+6c3nA2mvhXNt5Kw@mail.gmail.com>
References: <20251112134242.2608a613@canb.auug.org.au>
	<CAGudoHEa=4HueuL8Ypfd5VNVyo5fEsfeY2+6c3nA2mvhXNt5Kw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/G5ACuKIoBSWJh786K8cN8a7";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/G5ACuKIoBSWJh786K8cN8a7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mateusz,

On Wed, 12 Nov 2025 11:10:59 +0100 Mateusz Guzik <mjguzik@gmail.com> wrote:
>
> That func is a little special and I would argue it should not have
> these documented. Is there a way to exempt it?

Since the function is declared static, it doesn't really need
kernel-doc, so you should start the comment with "/*" instead of "/**".

--=20
Cheers,
Stephen Rothwell

--Sig_/G5ACuKIoBSWJh786K8cN8a7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkUZ60ACgkQAVBC80lX
0Gw+kAgAl/tQjKIsPCkrWXgmV3g3ZeU8SFiArBaVYhgj4G+astslMUv5ktCsk5oh
9VNzQxtQcdNotW0mNAPU5tHWWBqdOdiyn0JJfebPhlgeiwmnMfq1ReVSY14ckjBM
OKBg4rCsttHQYBzsggiqbXtJhDmNkMvfa3GBiFfcN7QGFdOm3YkyCBeGFX0Ow18V
oU3BcuBAKWbJYfOUOQWcDbWZ1xDDE9yHH/iTAyx2VqL5AXaCnULrP8FAF6OcxNiQ
oQ8n2gjyJgLt/Rm9r48mCe/z4R/MrVcWK7VHqg4FbG6n05tf7XKXp8E4xR1/Fdtq
uAGSUgeJJqH1H5ATHgt+8ZOYkarL9A==
=vIxe
-----END PGP SIGNATURE-----

--Sig_/G5ACuKIoBSWJh786K8cN8a7--

