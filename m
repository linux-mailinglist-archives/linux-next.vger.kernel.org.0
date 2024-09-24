Return-Path: <linux-next+bounces-3951-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDCA983AB3
	for <lists+linux-next@lfdr.de>; Tue, 24 Sep 2024 03:16:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68D8EB21DDD
	for <lists+linux-next@lfdr.de>; Tue, 24 Sep 2024 01:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90AC41B85CA;
	Tue, 24 Sep 2024 01:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="F28Uj+P5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D3115C0;
	Tue, 24 Sep 2024 01:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727140574; cv=none; b=eIEdd5rznIggOo2mG6kCt6drg2INLGGyuGsDxNXChsrWy2zpCZRbjRQCocA3TIcUCWKravq5wZnySvnHs+rJTfFmWeUimH8aJh5f0CbtV6L9Rf9okDhIPEzhwALP5c8CjqloJJ8dJ50Wo2nSgQWnFvYdLDyfm3kI4VkRLq41W0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727140574; c=relaxed/simple;
	bh=sm2dd8whEynmUjU6kvZVsECGrncqIrP2AFo8ReSAfnY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PLF44T1CDmEf/N9YLiZgQfBoR2aTj1RNEvGVbt9SsL7cOpdCv5/hEAg643jLkIufwwUFg3CYXLDxqDZbvtjH6Avvd/Y1+W/2VrhxEC8UuM2WPUWNd5Ar2J2xe+AOxBBs6u1Zx8t5MNe10jND9AE5ihYwKgfJqnoV3S21mxouUI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=F28Uj+P5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727140569;
	bh=GTzTcF5p7fHn5PrsfwcQIM+xt2Fj73bwHDfgUD1EbPk=;
	h=Date:From:To:Cc:Subject:From;
	b=F28Uj+P5PR4AK6Tx2bGGjnXiFIAo2MDTSacLbbW/ptA9XWYoUTZqT/eWpdSTEU7oX
	 tt8LLvOKC+33QUVSsM4r+eGPEwWWyEIhX3k/Q8nDwZAZKVXVVxk/7/8p0Bt1q+BY9b
	 s5lzWuDhv3K0kQ8MTGOTiW1aF61U1Swrygvba/jGXxG8pZFqbyly9pCigSsvsmhnVV
	 j12sFDUhMRnAZ4Ewirc7NAzTQNQdDA5xH4sSgKyzPUrcDQ2aO4+tcK4cMEf2yWFaGn
	 REXAqmnJMIzfIGQ5wMQbwEqAgJR1w/XaRA97VSP4zjTUtCtBXsA50QhsNYcGu/zSrO
	 gdpvtdbcrnJIw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XCMPh31yYz4x7B;
	Tue, 24 Sep 2024 11:16:07 +1000 (AEST)
Date: Tue, 24 Sep 2024 11:16:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Helge Deller <deller@gmx.de>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Ville =?UTF-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
Subject: linux-next: manual merge of the fbdev tree with Linus' tree
Message-ID: <20240924111607.75ffc555@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gXEHa8kejhuggOxsJ5FPseg";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gXEHa8kejhuggOxsJ5FPseg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fbdev tree got a conflict in:

  drivers/video/fbdev/core/fbcon.c

between commits:

  d20a9f568f99 ("fbcon: Add an option to disable fbcon in panic")
  1c1ed27ee117 ("fbcon: Use oops_in_progress instead of panic_cpu")

from Linus' tree and commit:

  4baa6a5e164b ("fbcon: fbcon_is_inactive() -> fbcon_is_active()")

from the fbdev tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/video/fbdev/core/fbcon.c
index 2e093535884b,7e6be2a8850b..000000000000
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@@ -272,19 -267,7 +269,19 @@@ static int fbcon_get_rotate(struct fb_i
  	return (ops) ? ops->rotate : 0;
  }
 =20
 +static bool fbcon_skip_panic(struct fb_info *info)
 +{
 +/* panic_cpu is not exported, and can't be used if built as module. Use
 + * oops_in_progress instead, but non-fatal oops won't be printed.
 + */
 +#if defined(MODULE)
 +	return (info->skip_panic && unlikely(oops_in_progress));
 +#else
 +	return (info->skip_panic && unlikely(atomic_read(&panic_cpu) !=3D PANIC_=
CPU_INVALID));
 +#endif
 +}
 +
- static inline int fbcon_is_inactive(struct vc_data *vc, struct fb_info *i=
nfo)
+ static inline bool fbcon_is_active(struct vc_data *vc, struct fb_info *in=
fo)
  {
  	struct fbcon_ops *ops =3D info->fbcon_par;
 =20

--Sig_/gXEHa8kejhuggOxsJ5FPseg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbyEtcACgkQAVBC80lX
0Gzk3Qf/Z7/CpYlQVwd9M5YKDfISasuvwi9nwwKgxlwkyL7Ss4iNbRRUCr8KRxi6
sQk3AwfgS8IfY5NG/jBx4PO9xVJLAQGxPekw8NrudAfd41bpGqsmrPeuwr86AoNi
icDv1Max0sEotm5jn5ER5NS9iJwFRLwc6v7+rzag6iDR9D8I90PiiMZXugPw2kwT
/muWAnKpEsQpknrpBL7iMrtAsR0VKvUvNgoFSXApyakV1d+D9RR6ZrOySgmKrPZe
e9tKahSHNf7WsqbJ0CtbBCsFmpOMMeOyXCttlM7aBAQsQ2bvhUxcGdLRyuvip+tM
7+H0Kfj7Qcg91HdMBw7ER+mCt4I1ag==
=U21D
-----END PGP SIGNATURE-----

--Sig_/gXEHa8kejhuggOxsJ5FPseg--

