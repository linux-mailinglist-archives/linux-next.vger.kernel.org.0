Return-Path: <linux-next+bounces-5298-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3E5A19A94
	for <lists+linux-next@lfdr.de>; Wed, 22 Jan 2025 22:57:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C90F93A925F
	for <lists+linux-next@lfdr.de>; Wed, 22 Jan 2025 21:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D50CD1C5D7A;
	Wed, 22 Jan 2025 21:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HQ7sREUR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62D01C5D74;
	Wed, 22 Jan 2025 21:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737583030; cv=none; b=Qj+KxooxJlB1RfGWagdZvrz/N0Y5EGVzq8cJQFuBVamFx0lBfJ/KFSbInksFS1v0SkZkXnJleI3ugLA1TpMcPPxsl2XyTudgzW7THwMv4e2guDHcqN06umOnAz/clpeoYHS/7YtVQz3zR6oe649/Azxy3HyN3vLu6s0yJJVM8RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737583030; c=relaxed/simple;
	bh=002sIJCTxpszw1r8onww3iHHoDWr7q9C+cyz9Nyiqzc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cKg36ovUWG6UeWUF9BOXq3KePQtLKICiEV1xjpia2UuCX8B6KqPJOpl04i6pu95xWHKGqRaGIv62OVxfe+bojxOn216JPjezc2W1NU639P5EKqxIFEuFhQTuYUE2wsqugpOuBKX349VMaCgSj4qHsQxEboiRL2RKrKFvkx7MTLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HQ7sREUR; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737583014;
	bh=gJOPT1zlMmMVHPTETDbsLJwtWhbtDpKiYkIqDsFmmAE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HQ7sREURTKYPj/qVeW6AcCv/sHRNsBisfArRnhIwbHFD2leCFvJVgGucNkbItOOse
	 jm9yWT4uf1n7dwa0NFktEQ3EJprOd8tzzXfCrgp2FiHbbTttcW6u+TDvFKpiDYZfjk
	 9V45X4u48hg8wPchRfFk4zhHnkinH1rQyswVAzYzoJ/gBnZ6NlB1TRHpVyllNRd4vU
	 Xz9MTjL8LJEC0eXCsnAnR6MjKZ/QGy/MLsM+VNvpfFp6peNFNf7AiIrgz7BawEWTEW
	 4EAXHGsCSRY1rJHF07w4YWu9qMmU6Lq6M77QYQts7aj4ZgBioRcSCvb5rBNnMj9Dvp
	 DZ+jufWrK8bVw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YddFy3tvdz4x04;
	Thu, 23 Jan 2025 08:56:54 +1100 (AEDT)
Date: Thu, 23 Jan 2025 08:57:01 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: bhelgaas@google.com, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, mchehab+samsung@kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: linux-next: build warning after merge of the origin tree
Message-ID: <20250123085701.11f1dbc5@canb.auug.org.au>
In-Reply-To: <07507296-a37b-4543-97cb-0560ef7fb7b8@gmail.com>
References: <20250122170335.148a23b0@canb.auug.org.au>
	<07507296-a37b-4543-97cb-0560ef7fb7b8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/C46d+hILz.+u5j1uzH3M7Co";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/C46d+hILz.+u5j1uzH3M7Co
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Akira,

On Wed, 22 Jan 2025 19:00:43 +0900 Akira Yokosawa <akiyks@gmail.com> wrote:
>
> Stephen, fhve you upgraded your Sphinx recently?

Yes, I did.  So that explains this report, I guess.  I also have some
left over warnings that appeared before I started reporting them (and
while I have taken vacation).

--=20
Cheers,
Stephen Rothwell

--Sig_/C46d+hILz.+u5j1uzH3M7Co
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeRaa4ACgkQAVBC80lX
0GzhiQgAknqMDLBfIcRB0WYqfgH+YepFTYY3pLY/d8AQRpJqeqaYy5mocoQpxLwx
VByQkm7oZMvsh3ktlqSIZzciPCGZoCUaOsxBO9DSItL+GHSqb6prD6BDJkhNY3vc
tmiN5agfURXrdZOi88i9Jn+KWk5MdbZSTGRqv5W9drUaj4kWMK+rjdjlh2ASjjVs
aNT15pmHbpplRokj5TfMKSILzLGOpe2QBB/NFhQQ8He7XgLenrGKwslXORThtOaO
ZRSQo3su+LjC+jlcmCp2L/yp2BCyyz7Fskmwcko3tiLUcAoIXi2V2oM9kakvs8m6
cC8jV48uHuCPssuAEuYsJ9hI0JRzFw==
=WkvY
-----END PGP SIGNATURE-----

--Sig_/C46d+hILz.+u5j1uzH3M7Co--

