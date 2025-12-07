Return-Path: <linux-next+bounces-9370-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12138CABA19
	for <lists+linux-next@lfdr.de>; Sun, 07 Dec 2025 22:35:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCBAB30142C1
	for <lists+linux-next@lfdr.de>; Sun,  7 Dec 2025 21:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FE17246BB2;
	Sun,  7 Dec 2025 21:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NO9XXrKy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F15722173D;
	Sun,  7 Dec 2025 21:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765143327; cv=none; b=qXxjRq0RnPAPFL2yCsOM7zYb2/WZwKt08kEEZZ/3XaI+882vr/LXKGp/ZDU+oa4/MiSQ63mKw41Non8OvWpds4KD92rhEWupHs7mpDAuKXR/4FJmC0hBJYFDwOztQRwV02/bwpv5nQADHpVUMYjC9Up79bQdRpTPRYI8UAJwtz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765143327; c=relaxed/simple;
	bh=9GNOlvVC9agtAvRTCw0woLqh6y4k89CpbFCe7tACn7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hHo8j/KaTFdUnai6QuBqs0P+44zgEEdNvQJruhS2f8gf19+1xS9XRZ38FCw63h71VPKx3sBoM47CCqc9U4qI3CninaUbZ+e9vM7wqkx+kixgwEB3VzVrqqJGzJmEHGXkIsMNVqDmS2NGW8qwmNQ02KuZNSyLYWTSyiEZ0YQlImA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=NO9XXrKy; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1765143312;
	bh=/4cNmOlP3N1MM6WMET4vScazPML/doqaGPiPKBn1Us8=;
	h=Date:From:To:Cc:Subject:From;
	b=NO9XXrKyPPfsC67RkukCb/YLJhbFf/NH5sbKeWgFLi4ET0knFWpYrdyuPW9ggXLsg
	 TK9wEy3CGYW5CbZGh0AC+4Ll7j0MRmTVXjXetE5N2c/zN/VPZkqEUEUD5FEnygEQOd
	 M+GB3w8PDXm6bUoFLFdjrlsEn2bkms5HfzK6gW/B70kCAO45Wb8w/Nq5SwGg8JG4Wv
	 hVhkQeId8LVvxjRFNuqzneSHu7QXrbqQS8bDPDq0zhkKHckPTMOgjYKTLtio/+7L7Q
	 wDENQfaUblN60GDPzJtPbdlF7GkL5kN8mF3//0F62VxriqPx0Orn/l/XbLEU29IBJo
	 bymx3oaVfY/IA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dPdgh0TqTz4wD1;
	Mon, 08 Dec 2025 08:35:12 +1100 (AEDT)
Date: Mon, 8 Dec 2025 08:35:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mm-hotfixes tree
Message-ID: <20251208083511.6dc45509@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7XSMcqyt=qM1=e9ydmdPmIi";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7XSMcqyt=qM1=e9ydmdPmIi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm-hotfixes tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from arch/x86/include/asm/bug.h:193,
                 from include/linux/bug.h:5,
                 from include/linux/kasan.h:5,
                 from mm/kasan/common.c:14:
mm/kasan/common.c: In function '__kasan_unpoison_vmap_areas':
mm/kasan/common.c:594:34: error: 'KASAN_VMALLOC_KEEP_TAG' undeclared (first=
 use in this function); did you mean 'KASAN_VMALLOC_PAGE_RANGE'?
  594 |         if (WARN_ON_ONCE(flags & KASAN_VMALLOC_KEEP_TAG))
      |                                  ^~~~~~~~~~~~~~~~~~~~~~
include/asm-generic/bug.h:120:32: note: in definition of macro 'WARN_ON_ONC=
E'
  120 |         int __ret_warn_on =3D !!(condition);                       =
       \
      |                                ^~~~~~~~~
mm/kasan/common.c:594:34: note: each undeclared identifier is reported only=
 once for each function it appears in
  594 |         if (WARN_ON_ONCE(flags & KASAN_VMALLOC_KEEP_TAG))
      |                                  ^~~~~~~~~~~~~~~~~~~~~~
include/asm-generic/bug.h:120:32: note: in definition of macro 'WARN_ON_ONC=
E'
  120 |         int __ret_warn_on =3D !!(condition);                       =
       \
      |                                ^~~~~~~~~

Caused by commit

  6b83afdcfa93 ("kasan: unpoison vms[area] addresses with a common tag")

I have reverted that commit (and the following 2 fixes) for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/7XSMcqyt=qM1=e9ydmdPmIi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmk18w8ACgkQAVBC80lX
0GyO7AgAkWJBz5laS6Wp6IGv94Fbf0GJ/TDtImk/nPLcPlrK1Cu0QxBLopJKKIWt
kyd4MfVh7CGqyNo21fZ366App83Xkw2pCpYANvfnOqbNf0MGtN00j91K8AuLM0iB
HcmDdBNmD4b35gNwAY/o7bVQiNkQjA6/Iz60jA7CjkeEM8HrMH0R+M4hqkbw0oG8
fDlofDHOitVJchPtIqtGriMcMhQ0da2nyAVfS/zTaC8vVRctPbF514wur3remSl0
hzySiS8yziAKRHCwOntmyCjyzp0d7w7hobbqgN2tgEZtuLFIhukzzBaC40ftoinA
ZQYe3qzoVuipdw0mdsUI9P3EYn0Wbw==
=3+qc
-----END PGP SIGNATURE-----

--Sig_/7XSMcqyt=qM1=e9ydmdPmIi--

