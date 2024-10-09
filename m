Return-Path: <linux-next+bounces-4166-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FE0995FC7
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 08:29:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B24B1C2163F
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 06:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E1515FD01;
	Wed,  9 Oct 2024 06:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="JHIFRZkm"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C80A1DA5F;
	Wed,  9 Oct 2024 06:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728455383; cv=none; b=oRK7Dqo74kG0BfjbaphlJQ2vOHdKKz+iqpv6hovx73J+NkFIOL8M05Hdf20ZzH8yzli4U7wmyWmOp9E/tx4cpOKdDepTpccTTGKY4jGjeSKFCwYNw+m8dis4x9pcEta8paY9n6y0+CSmc3BLTUvN6NyNKfGt+5kjBCYqqh4JN8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728455383; c=relaxed/simple;
	bh=EkN8nB/RV2HO5PsxrleWoRdYVR/l25CZbPbRbsudFLU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DqVV0pavFtedn724LEp0LiEkk+xjDh0HXRVoN8Um6Lw6r3t6cgCTLzezt17+WYZL4j53YwqgrLJy8eIJaHBy5yJY+KW8tC+eBCvcZAYewKYUiE5Ck0JqmefHnAKrryIxjYfsbRh5b4FimQ0JnxA96FOmcL3zB4gd0OyPATfJZGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=JHIFRZkm; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728455377;
	bh=Z2qCcrE2qaLQyyAA7Xwo5YAAD9M/bn4ehZcB8NLn+qs=;
	h=Date:From:To:Cc:Subject:From;
	b=JHIFRZkm2iqI1f/E8z6iPHw1FfV/lIdixt5q1IU/Zy8q8NOp6HqfJBsUq1QHqVj/+
	 xqLu9Za06M5Jhz5TjOn9c81mjbotKNPHFEuH9FuY6Lad8NZ4FcGBNJDRna491tfiDX
	 kSrdVl7oUABcf+JB8GmFJJKpsYI8Zmd2s6n5XkebYsi9R5PmoOKuP/+wh/PtGTqS62
	 LJYD/15Ttelb3LW83sro3rwmy+p5QqpagQWH36t+glfgQUTSoVYtKgfWRZX0O7R5Vp
	 lFrMHs6vMqQcJ0it2XUiJbsvJrPssUGFMEXlNdXMdsRZ+o+7DnbdreBZNcbVOpd0/A
	 kMCkb/zV11aLQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XNjfT5wBPz4wc3;
	Wed,  9 Oct 2024 17:29:37 +1100 (AEDT)
Date: Wed, 9 Oct 2024 17:29:38 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the vfs-brauner tree
Message-ID: <20241009172938.05d5fae9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HWY60nHikvs57PwI25fr9rN";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/HWY60nHikvs57PwI25fr9rN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (htmldocs)
produced these warnings:

include/linux/fs.h:1071: warning: Function parameter or struct member 'f_re=
f' not described in 'file'
include/linux/fs.h:1071: warning: Excess struct member 'f_count' descriptio=
n in 'file'

Introduced by commit

  3488e37e1059 ("fs: port files to file_ref")

--=20
Cheers,
Stephen Rothwell

--Sig_/HWY60nHikvs57PwI25fr9rN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcGItIACgkQAVBC80lX
0GwbJwf+KijX58yTBh2RyQ3toES7Iq9R2j58L1NLj4MayG3YwAFNjzPmKAGI3Vxm
wK0zjTuM4fTCIZyEIqWV+E5GIoeAJYVJQQHvqOSuCM5XiKFU85alaHkJqtn2TcEw
o2xKszqRrRzntawG8ZTyVKvIXNgDaavuagkNucyM4/IhWsLtgfWoHAffW/jEj2Bv
SAeYa1fg2gzW5Qx8fixdQvE8qNShOdJTEBMGTlXEWxQMqqCkalyeyK4GlNwxUHgT
jHzwFW+aMSfBDDh5lXCx5OdTdnEHsFRGIbYqk/CnAS/1bAPAyrcnHueFymPnKR1v
8snhw3kgaDNRtD18KC5GuRZz6eGSCQ==
=SPFl
-----END PGP SIGNATURE-----

--Sig_/HWY60nHikvs57PwI25fr9rN--

