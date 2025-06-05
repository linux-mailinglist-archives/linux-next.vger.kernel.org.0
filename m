Return-Path: <linux-next+bounces-7063-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13813ACE9BE
	for <lists+linux-next@lfdr.de>; Thu,  5 Jun 2025 08:05:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BBE93AB04C
	for <lists+linux-next@lfdr.de>; Thu,  5 Jun 2025 06:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23EDF1C8601;
	Thu,  5 Jun 2025 06:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QGSUpdN0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D7586337;
	Thu,  5 Jun 2025 06:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749103551; cv=none; b=RoR9eNRmTNlaS/+y2WqJS3I52N8IRy/CJOIRLk8Bgiovr3+tqcVxL8h2z8hWMtseysx4npm8h9ah49rQ7F+mOAFlulOJ6XvDeND7eRbVhcIee4bwjJz2WiOgIG/WWGtzCiNRG63I5qq/Jv+bARvhUbktl7wQdFu/iDMQ2stuLO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749103551; c=relaxed/simple;
	bh=sqgDfnN4N0J3wueLo9uBRnQ3TdtwpgSzJhcKSr1k4kk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=i/Upk0ay4/OJlFhkvxuIxtY5Q8XZXIPdyJyjHxbZhytM8/hKmM6t3yXKTTZXLw/erseiQEVt4t6pVXIydOA7Bi3VnxXFQQaVpUlYNwVdxF+qw3oK3/xTGi7qEH34Bgsx4Bg+vSWhrd3mOmSOCAfcKZYyVZTWYRfG0SUL2FjTAbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=QGSUpdN0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1749103541;
	bh=FBf32aloc4DGnuQVM6vOKg22DnQbQHJTGpi+iyZQLjQ=;
	h=Date:From:To:Cc:Subject:From;
	b=QGSUpdN0x93Vhp/ouJLRw8PHZ91FHqR719A/sILSPKBnpGpGTeMKnANd9Vp17umBB
	 hcBBl0/aQ79HG8Z3O/Q73znw3WLkI/GvXwMU/guqgOkEKDC9aFO+ldGDwI4mvKQ42F
	 RQqdGkM9d7AN1PQpCZfiwdj1x5AK0JXHgi0+XxYvc67yQbjfAYvkLgF2BjtnwpbKBR
	 jIqCNAb+3hF7J7m+vwjAZ2r1v/8VChAbE9wdiczvtj/OkdjBYvxO39VSAI79BSlcXl
	 FfQ3qmLjc4ht2/YNcwxORZqtkQdtfLl3g+lR7XSDojQrc7ZEekid66sPaIR+NDGnOF
	 w6vxmlxwadb9Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bCYpY492Sz4x7j;
	Thu,  5 Jun 2025 16:05:41 +1000 (AEST)
Date: Thu, 5 Jun 2025 16:05:40 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steve French <smfrench@gmail.com>
Cc: Meetakshi Setiya <msetiya@microsoft.com>, Steve French
 <stfrench@microsoft.com>, CIFS <linux-cifs@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the cifs tree
Message-ID: <20250605160540.76a4c651@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EX/gxNEihzoWEfJCUPI6oAa";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/EX/gxNEihzoWEfJCUPI6oAa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the cifs tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/filesystems/smb/smbdirect.rst: WARNING: document isn't includ=
ed in any toctree

Introduced by commit

  b94d1b9e07ba ("cifs: add documentation for smbdirect setup")

--=20
Cheers,
Stephen Rothwell

--Sig_/EX/gxNEihzoWEfJCUPI6oAa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhBM7QACgkQAVBC80lX
0GzgPQf/fzMUypV5BngavlSqlHxMFB6N7CcQVD7KhiPDMvA76ZH3tXxK81CWqkO/
T5QP4jrZspJO7HQx7DOFmMX/df/vG7T6Y+9NEDGq/7O9vj6Hzn1w2wkAnnAU6cdG
rJ/V5WKaJQeVh2KroYOz13WttRUz19NP0sHuGVXbmcwUZPNTfE+d8bN2ygssYtx3
9pH8LK/J9IgWlVdmIQl6Zcuzyc0luYd1GcTP2ZlNJur8/eT4VLYylocR0oL6AOsr
Y9f3eZyEVb1r+GC59FVlNvZmJkJMpVJ5XfiS2DDpOvCiRaClJ6ED3dpSJZqNu42I
zw70TaiPDlIfn5h7OP44XStwqZefDQ==
=N/+H
-----END PGP SIGNATURE-----

--Sig_/EX/gxNEihzoWEfJCUPI6oAa--

