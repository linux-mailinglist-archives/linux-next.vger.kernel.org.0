Return-Path: <linux-next+bounces-2850-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 342A292ADC9
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 03:25:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCEA01F22919
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 01:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 570BC286A6;
	Tue,  9 Jul 2024 01:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tcIiGSOM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D211F28366;
	Tue,  9 Jul 2024 01:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720488353; cv=none; b=P1euojm6sg0rKLUPM4ZyC/R7w0IMDfcxSk/WIxaqVyO3Iu2t3PEtXSPcBHfK+2w6U6EkD5BzpwjoTPZqNKsZ+YVMJGEYQh4xuZpy82hg7WYrWz2BEM7FkfeYdZY2ZQImjrbtVncFybLqD920XJGrhvk7RCuzxjhETGZYso5QGnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720488353; c=relaxed/simple;
	bh=jOKwpX73FcCYIAYPoH8+LQo4CGM5eNnYpK5fKeEybuE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Eq/g2J/M7nnIV1tCPN5LJtC37vYKmT5ygrnvQAJQfXW49oKGrj6fRft/vYtRPswKXEGuAc0Xg15l552ggBnQvk0CS6EjxH+H2hciJ/AlyLocoqRP3cL035chTPV8qwE4TI8sLKRsNP55KWsdUGhxDet+Q3fSbDueVmzADNdpr8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=tcIiGSOM; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720488346;
	bh=TC5JRjDGSmcZZJ4dgD4NGdJD+9jxfQSq9YP7zYZBSbo=;
	h=Date:From:To:Cc:Subject:From;
	b=tcIiGSOMK5tyZXcTu+tQVA02W3/hmI9hVwgZ0bMSp6cqO9qn6FEG7eyY1Ti4JkRpz
	 FB89XtJgOcNueH/TXbtY2PXMkscYpoJm7uxhyj37ekUvJH3ofmuJAeUx170evtNMev
	 EMqHnJq/hS3i9973CdrnOaOOebTUThc7bQ+4s4THJeEMDEqBhR0OdshnF2Dsk04dSJ
	 WlCseqTSvgbqMrTziUf7S4WYu77remgZGq5D/nROiXsd6tfmeWffbxKCxH3uhjm04h
	 +uSrOiNIOEArJnu+A7ilOUDhNooibiUdsgH8oCwmA97Agqau43dG399dHNyZ0ffQks
	 xKehW5UIuexrQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJ3GK3QLPz4w2N;
	Tue,  9 Jul 2024 11:25:45 +1000 (AEST)
Date: Tue, 9 Jul 2024 11:25:44 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires
 <benjamin.tissoires@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Suren Baghdasaryan <surenb@google.com>
Subject: linux-next: manual merge of the hid tree with the mm tree
Message-ID: <20240709112544.190ffda4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NAVrAfdl4p6hXZzxs31WWAi";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/NAVrAfdl4p6hXZzxs31WWAi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the hid tree got a conflict in:

  include/linux/hid_bpf.h

between commit:

  bad8443fbbca ("mm: add comments for allocation helpers explaining why the=
y are macros")

from the mm-unstable branch of the mm tree and commit:

  6cd735f0e57a ("HID: bpf: protect HID-BPF prog_list access by a SRCU")

from the hid tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/hid_bpf.h
index 99a3edb6cf07,9ca96fc90449..000000000000
--- a/include/linux/hid_bpf.h
+++ b/include/linux/hid_bpf.h
@@@ -151,12 -227,7 +227,12 @@@ static inline int dispatch_hid_bpf_outp
  static inline int hid_bpf_connect_device(struct hid_device *hdev) { retur=
n 0; }
  static inline void hid_bpf_disconnect_device(struct hid_device *hdev) {}
  static inline void hid_bpf_destroy_device(struct hid_device *hid) {}
- static inline void hid_bpf_device_init(struct hid_device *hid) {}
+ static inline int hid_bpf_device_init(struct hid_device *hid) { return 0;=
 }
 +/*
 + * This specialized allocator has to be a macro for its allocations to be
 + * accounted separately (to have a separate alloc_tag). The typecast is
 + * intentional to enforce typesafety.
 + */
  #define call_hid_bpf_rdesc_fixup(_hdev, _rdesc, _size)	\
  		((u8 *)kmemdup(_rdesc, *(_size), GFP_KERNEL))
 =20

--Sig_/NAVrAfdl4p6hXZzxs31WWAi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaMkZgACgkQAVBC80lX
0GwhXAf/R4CzLIOh2qhlhRwz/o6XJpfm54jmwD1728EsE7aJO6F90p4or3F5Nxw9
3GfOJJACY7iffkQJqB7/u0BI5qGl5ZaaO1TzJgrX3Wbz/4snzfCoR7WXxcx0QXwp
1q7TeQn1hIRi9SaRycqOqeXN1dJX9VI2J4OMg+UpTWdTvm1iQA08DOwIs+KE9hEB
9W+SjbfybpPvfwHiDzN+K0x7jkxJDUfdoTYgVeQ92kPIrSaq05BeHhRnizQ4SdTE
+Wv27yTRxy3nSYKfEejr+N4AbYfWL/0ydEoxYi1VJRY2yxWzI5/lX15h1E5HaWaU
2IROVCneh6teWhlch8YzCEBIV6giOQ==
=Zrzc
-----END PGP SIGNATURE-----

--Sig_/NAVrAfdl4p6hXZzxs31WWAi--

