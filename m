Return-Path: <linux-next+bounces-9026-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D71C61DAE
	for <lists+linux-next@lfdr.de>; Sun, 16 Nov 2025 22:43:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 553D24E1034
	for <lists+linux-next@lfdr.de>; Sun, 16 Nov 2025 21:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01ABA26FA4E;
	Sun, 16 Nov 2025 21:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KaTJxF9k"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3105136358;
	Sun, 16 Nov 2025 21:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763329421; cv=none; b=ApHXnoRoU5t4EUiay/2EqIx3z1Hz01NptPgDW681Twc3vUW/IWPY/UmvDuA+om8XBwJF60ky758FsvWVLx5Iu7vRs+rVvuxYC427pdCPf8HeGcFvv12ekkYqcxrLDXyTmNcmJ6gbnNXjJu/FxwebRjbm+9ZBNnbGbMDzltEsKv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763329421; c=relaxed/simple;
	bh=+MchOgaOvauIu9+MLsDcOL/J9MrwqIR7I0fHhRWq1IY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OMIN2NIkfB6gwt8ht+py3mHN+TvDKdpwxeJAeBI3+RZRSLUM/sLLr6OtyVVVoylNJVlv3Y1HLgOUeDb4NfsyYW6n7E3Ln7x1iqlg7WrZLejt5onFO5KgvwgSah6qmxl7IwbnpqBTMmZXIu+E3PXzlUa5+DQ1ZJ13bUtsH7I0bXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=KaTJxF9k; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763329406;
	bh=dcQVvyd8b+BmNmtrkZWwUObAN+vSBUU79a2f10ezcs8=;
	h=Date:From:To:Cc:Subject:From;
	b=KaTJxF9kmTgk8rK0ZWfjfNz9PzkGJLhTWpEXK1dt1ZUYTc9Pz21UzNuv8rsMYcZce
	 ww8X9mlZlrFdZHW97gGiif2yq7bChWjIkeDmolGou11pXVXdr4hbixYWkPsU/zr+OB
	 c61uBL77MKdWDRgolAAtW8RQ7Br993ww8hPcgVHPYh+/yZlt5t4aYenzRAr46MOZj5
	 YpSr7TUkZG8x5of9t1EMIoFIX4FO3PcihrsJolvpDvrQ47uq76BJt4mvW0QfuZkXaT
	 DPJj+8FnM5Q2Z8TC1zzKV2vrkIxQ5E9aCLCoHr2Vmgv0JaMvtT1salXv+wvCd7x1yx
	 OKPQnGoEG8qkA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d8krt6LsJz58bP;
	Mon, 17 Nov 2025 08:43:26 +1100 (AEDT)
Date: Mon, 17 Nov 2025 08:43:26 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Jeff Layton <jlayton@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20251117084326.42c935b0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ikSWbsrSV.DrKbOihKMq.VN";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ikSWbsrSV.DrKbOihKMq.VN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from samples/check-exec/inc.c:16:
usr/include/linux/fcntl.h:88:9: error: unknown type name 'uint32_t'
   88 |         uint32_t        d_flags;        /* Must be 0 */
      |         ^~~~~~~~
usr/include/linux/fcntl.h:7:1: note: 'uint32_t' is defined in header '<stdi=
nt.h>'; this is probably fixable by adding '#include <stdint.h>'
    6 | #include <linux/openat2.h>
  +++ |+#include <stdint.h>
    7 |=20
usr/include/linux/fcntl.h:89:9: error: unknown type name 'uint16_t'
   89 |         uint16_t        d_type;         /* F_RDLCK, F_WRLCK, F_UNLC=
K */
      |         ^~~~~~~~
usr/include/linux/fcntl.h:89:9: note: 'uint16_t' is defined in header '<std=
int.h>'; this is probably fixable by adding '#include <stdint.h>'
usr/include/linux/fcntl.h:90:9: error: unknown type name 'uint16_t'
   90 |         uint16_t        __pad;          /* Must be 0 */
      |         ^~~~~~~~
usr/include/linux/fcntl.h:90:9: note: 'uint16_t' is defined in header '<std=
int.h>'; this is probably fixable by adding '#include <stdint.h>'
In file included from samples/vfs/test-statx.c:23:
usr/include/linux/fcntl.h:88:9: error: unknown type name 'uint32_t'
   88 |         uint32_t        d_flags;        /* Must be 0 */
      |         ^~~~~~~~
usr/include/linux/fcntl.h:7:1: note: 'uint32_t' is defined in header '<stdi=
nt.h>'; this is probably fixable by adding '#include <stdint.h>'
    6 | #include <linux/openat2.h>
  +++ |+#include <stdint.h>
    7 |=20
usr/include/linux/fcntl.h:89:9: error: unknown type name 'uint16_t'
   89 |         uint16_t        d_type;         /* F_RDLCK, F_WRLCK, F_UNLC=
K */
      |         ^~~~~~~~
usr/include/linux/fcntl.h:89:9: note: 'uint16_t' is defined in header '<std=
int.h>'; this is probably fixable by adding '#include <stdint.h>'
usr/include/linux/fcntl.h:90:9: error: unknown type name 'uint16_t'
   90 |         uint16_t        __pad;          /* Must be 0 */
      |         ^~~~~~~~
usr/include/linux/fcntl.h:90:9: note: 'uint16_t' is defined in header '<std=
int.h>'; this is probably fixable by adding '#include <stdint.h>'
In file included from usr/include/linux/watch_queue.h:6,
                 from samples/watch_queue/watch_test.c:19:
usr/include/linux/fcntl.h:88:9: error: unknown type name 'uint32_t'
   88 |         uint32_t        d_flags;        /* Must be 0 */
      |         ^~~~~~~~
usr/include/linux/fcntl.h:7:1: note: 'uint32_t' is defined in header '<stdi=
nt.h>'; this is probably fixable by adding '#include <stdint.h>'
    6 | #include <linux/openat2.h>
  +++ |+#include <stdint.h>
    7 |=20
usr/include/linux/fcntl.h:89:9: error: unknown type name 'uint16_t'
   89 |         uint16_t        d_type;         /* F_RDLCK, F_WRLCK, F_UNLC=
K */
      |         ^~~~~~~~
usr/include/linux/fcntl.h:89:9: note: 'uint16_t' is defined in header '<std=
int.h>'; this is probably fixable by adding '#include <stdint.h>'
usr/include/linux/fcntl.h:90:9: error: unknown type name 'uint16_t'
   90 |         uint16_t        __pad;          /* Must be 0 */
      |         ^~~~~~~~
usr/include/linux/fcntl.h:90:9: note: 'uint16_t' is defined in header '<std=
int.h>'; this is probably fixable by adding '#include <stdint.h>'
In file included from ./usr/include/linux/eventfd.h:5,
                 from <command-line>:
usr/include/linux/fcntl.h:88:9: error: unknown type name 'uint32_t'
   88 |         uint32_t        d_flags;        /* Must be 0 */
      |         ^~~~~~~~
usr/include/linux/fcntl.h:89:9: error: unknown type name 'uint16_t'
   89 |         uint16_t        d_type;         /* F_RDLCK, F_WRLCK, F_UNLC=
K */
      |         ^~~~~~~~
usr/include/linux/fcntl.h:90:9: error: unknown type name 'uint16_t'
   90 |         uint16_t        __pad;          /* Must be 0 */
      |         ^~~~~~~~

Caused by commit

  1602bad16d7d ("vfs: expose delegation support to userland")

I have used the vfs-brauner tree from next-20251114 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/ikSWbsrSV.DrKbOihKMq.VN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkaRX4ACgkQAVBC80lX
0Gxq5wf9F86thXtwrp+x5CGnjoIo3xPwa6d//OpEeRpdy0mN4QgxkC90KfHL8rCZ
armqEHgmPLTxGBISwnwptb+bWX783Bq4iZIhlf1yol67OlHW7DzwN8FFBKq9RNfH
0Hz0H3gLuShByOht4M+751tZ5qR7eOR9CPVQJHd6HLvG4YrCb9NoBsbzFIpMlf9P
dLLGXJWseH9OWzifUt50/9u0vToc7d8ISNmgkfEx7BQhlDnrNDAj+SIL3rLRiiYL
5+fH4mSy5Kpt/lQ2Hjm6GRAWkOL7Qz0GEBqoGOkewgpO/VLztG8aD6TxDL+0dAOW
24zxfFYnMzwGHucCR/sxovT3rYo99Q==
=p6Ij
-----END PGP SIGNATURE-----

--Sig_/ikSWbsrSV.DrKbOihKMq.VN--

