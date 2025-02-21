Return-Path: <linux-next+bounces-5525-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA57DA3EC34
	for <lists+linux-next@lfdr.de>; Fri, 21 Feb 2025 06:21:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0C3B17F36D
	for <lists+linux-next@lfdr.de>; Fri, 21 Feb 2025 05:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0741F3BB9;
	Fri, 21 Feb 2025 05:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Q2+HoCY+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F3F35979;
	Fri, 21 Feb 2025 05:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740115300; cv=none; b=f/QgiTT46iNKkLXCC4FVVbvMTxoWTj2cIEhg/rD1V9SiEZ6cEBxl3jQ0+R76BsavorY3swPo0gLhlLP2R6sggErbZd3oPn+RACai41M2WBehMn2xzmEIsn0eMNMScXtB0tBQM0ICpidDZr7OTJE0ddT5V04nL4yn30LNbUFg97M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740115300; c=relaxed/simple;
	bh=U5ok9+Hl0z+NIhLLA1WeMXHJyjo3NjG7AW0POg7X2Qo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ix5NbedVybefDl9Kf/JBb3Thy4ZaeQWtOhS74ytqAQ2FWPTb7O2lntNg2UuyX6PcDww/x5VhLONf6EB8zZO9e3Q9jdDr7QAYpsY2t/kFdEtuSg/mylAsc1tZlymJnjtatbFB5vX3Whj644Ei2QWGdQ3iXfE/QAiknK636iaIpfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Q2+HoCY+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740115296;
	bh=bXrISfE5PG8iCBQKsRKQFaUgGTdoKOTDptw/qctsq6c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Q2+HoCY+/CjXmU7wJfyK6wI692EM5VdkdyxsH2Qftv4Mgj4XVc/RX4AukqIX25Ktb
	 cnMe5lLGAl52Wu6fRT20S8o4GP95QtjGgnxake/Jf3tlJJVTv9uUXqH6l8FCwntYLP
	 RX9RlOURa4SJJp8YzR4XHqrtvWNKpWYzwhg46Z8kD/5tbh8QFfG/5OxF5yjxdk2vrd
	 Z4Mr+pbA6vKN23G8YTWGglosLuc9NNIAohHJpag3ag/UsxO3On6dhbPKXp2KFDJPD0
	 5ir7JqkGgsdz/mg4LJ1aYkCZ9WwZKMgMhJn8NVET2GwPRGdA3OrtVTxh8/E5M0AnW8
	 0Ze8dsMoSy9Sw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yzdlh1rhPz4wcT;
	Fri, 21 Feb 2025 16:21:36 +1100 (AEDT)
Date: Fri, 21 Feb 2025 16:21:35 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Joshua Ashton <joshua@froggi.es>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the bcachefs tree
Message-ID: <20250221162135.79be0147@canb.auug.org.au>
In-Reply-To: <20250221161911.2d16138b@canb.auug.org.au>
References: <20250221161911.2d16138b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/W19bp1oPBg5SzBvJrztR9wZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/W19bp1oPBg5SzBvJrztR9wZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 21 Feb 2025 16:19:11 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the bcachefs tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> Documentation/filesystems/bcachefs/casefolding.rst:84: WARNING: Definitio=
n list ends without a blank line; unexpected unindent. [docutils]
>=20
> Introduced by commit
>=20
>   bc5cc09246c5 ("bcachefs: bcachefs_metadata_version_casefolding")

Also:

Documentation/filesystems/bcachefs/casefolding.rst:36: WARNING: Inline inte=
rpreted text or phrase reference start-string without end-string. [docutils]
Documentation/filesystems/bcachefs/casefolding.rst:75: WARNING: Title under=
line too short.

dentry/dcache considerations
--------- [docutils]

--=20
Cheers,
Stephen Rothwell

--Sig_/W19bp1oPBg5SzBvJrztR9wZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme4DV8ACgkQAVBC80lX
0Gzorwf+Mrwtk80kqh9tOrcLEm9yXXvCWIRjb0Slfq1wzcdO7hTKuSZ6s9CXGP0K
ykQKRilT1t3nr++wBxCR0uohAIVwZj041bAIN2Sc1sDEakskcFwiPcfUOzYS/kor
YYbWBrZsUMv7Qpj+FWN6XbXsjVQazMZGBo8k91uNhugXAZ4/Y/ELBqmIYvSk7b+K
2XIaz/CobzAEtJO0/HhGbXZzp4Jv3bKjQcjWpynbEZD6hPzs41dHQh0BzZV2/zuj
5RHhWnAJsOuF3wbrHPVnTTzKWnE3T0G/TzHGZ7S6Kl1BbXpAAvnluMcLl/wqAjH7
pYZL9S4s4QW1712c9NYaJZpEbaEcfQ==
=Jtam
-----END PGP SIGNATURE-----

--Sig_/W19bp1oPBg5SzBvJrztR9wZ--

