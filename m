Return-Path: <linux-next+bounces-5416-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A47BAA31B03
	for <lists+linux-next@lfdr.de>; Wed, 12 Feb 2025 02:09:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00CFB16812C
	for <lists+linux-next@lfdr.de>; Wed, 12 Feb 2025 01:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D8091CAA4;
	Wed, 12 Feb 2025 01:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VgLRibcW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A71FBF6;
	Wed, 12 Feb 2025 01:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739322577; cv=none; b=tXkSP4wzbFrcvutRNJP3HByGTUWE6RzafBY5b7tNAmTTDoVeCfyE9TCcYMgBDbNaUaLRt2csvtWxfYdy6pD9NhmjDs5C4uKArqQDffSrlGo2TI/XDjqUWrgfr0zTKUaZxh5h3x5CzkNll0onRQ8/P8nteuaUxrhmplZ80K1kMBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739322577; c=relaxed/simple;
	bh=HHz3GI1lvbXLlnRJLfXd5jTpgA/33wSK7eoVwGGge4s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qQlENb4ofzWO4QEfb8nn6SC0svvBe22owNLoy4iZ4Gb5HeiwvAnIuUmJKpT+wAsYEa2LH/BgiS+PRZ98LBXKlG7CmF+egk47yNsxUnFjSyY7gQi5aNEbf+J6jG5fCB3Ov46NMv5IHW3SY0I+R0JYctpj5TwSFdICiTKebR9VmP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VgLRibcW; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739322568;
	bh=ANleMdRWssh1jRRni49uy1GbL9pOqkVVu/j8R3kwECE=;
	h=Date:From:To:Cc:Subject:From;
	b=VgLRibcWhrbCZf3WgaFHmheQPo1d4RcHzK3ofdCgn7oC0/QGbtiypiOmmtWaLfXHW
	 OgV6q+SpSl9lIQnIkWB9hp1c2j8XQTdL72YlbnjhSGjMYY9h7K/sJ9xSCJepodsmLE
	 B0f/9xuKGxLuZEhwwcPGQ3qtrRxW4bUnSGvOapCREiRDmycjy4dMiZpZ11XwdED2hn
	 sRl2OePn3H7cpAqqlzZEbC0uLnT/kgMvyT3w6TazNxWAGG2pCywc8a4RlFFpCQab6P
	 qafnYkLx9Su2ElfllsUTw+/2S5lXfTpNtI5oVmD+JQWqlC+3kJsrHv+yUljWxawtkB
	 V617nElCE+9tg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yt0Zw2m9Qz4wcT;
	Wed, 12 Feb 2025 12:09:28 +1100 (AEDT)
Date: Wed, 12 Feb 2025 12:09:27 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jack Livingood <jacklivingood@comcast.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the sound tree
Message-ID: <20250212120927.40a4d24e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Nwh__4dbeH0+b2Zz9nuW5lo";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Nwh__4dbeH0+b2Zz9nuW5lo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound tree, today's linux-next build (x86_64
allmodconfig) failed like this:

sound/firewire/isight.c: In function 'isight_probe':
sound/firewire/isight.c:647:9: error: implicit declaration of function 'str=
spy'; did you mean 'strspn'? [-Wimplicit-function-declaration]
  647 |         strspy(card->mixername, "iSight");
      |         ^~~~~~
      |         strspn

Caused by commit

  2a91231a78a7 ("ALSA: firewire: isight: changed strcpy to strscpy")

I have used the sound tree from next-20250210 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/Nwh__4dbeH0+b2Zz9nuW5lo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmer9McACgkQAVBC80lX
0GxNcgf/R2wl5P5pK1CHjwfYZnk1MfqFr0dRXGdLap+ID5rKSGhhL///au/8i1wP
RLcstk7Xa/POfRoeHh4eBBEYYXxKK3VxWeb9OLwVChyqN4d/KM1GW02RFaQJtF40
mqD7eALiUg/45CF61fV7rKEIzqQIYW5dCD5oD1YSlXykweuWf+qJix1RQuNnJU62
I5b2UqrlFxDpewW8Z95cmLHaHDrbVs/FdusugCv8TJUBj3jcgi7OK6SLTympQWZ3
Jg7AIOeBUvyjgwABB+toLHvCblatJEWIXzOrw50lDez5peb9AW0E/gCAHReX2B//
5v6jhpQdfnt+urLrcUt9Pb+7FE7nPw==
=w4v7
-----END PGP SIGNATURE-----

--Sig_/Nwh__4dbeH0+b2Zz9nuW5lo--

