Return-Path: <linux-next+bounces-2995-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EA1930C38
	for <lists+linux-next@lfdr.de>; Mon, 15 Jul 2024 02:16:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 292881C20BA1
	for <lists+linux-next@lfdr.de>; Mon, 15 Jul 2024 00:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8486211C;
	Mon, 15 Jul 2024 00:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="I6rQuogJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552637F6;
	Mon, 15 Jul 2024 00:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721002559; cv=none; b=Jfn5c9nme38ckwuSlknWg2cZPx9rFbaBowtFfFUgPidsA/uGLUe7d99cUg+y9lDVsa+jik+kkXPB8HsI/zCtcilTAP6AzxXuKQojcj5WBSMIDMy3qClLQiCIZaeJqHWck4Wpik02HzFHbCH6sLbrK14Cm8asTBDY/oiFTCKF2SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721002559; c=relaxed/simple;
	bh=s1MsD3M/dCmTyKvgupwur/8qwRkrhAr+4c54tl63yXY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AWxVjoYEgqi8i5WObeaFnBVujIoNcQKRdDsvWn3I465FEqlEDoLjVIMeJLXIPO4AVIfAfNVW/emAlW9UQTMPmF7Uk4bxfkV+I43Xpq9hvQfU0/utJ9jxV51trvva+9/Gvt78P/93gMnqXtdgNnPZlSk+t0GlgQGikyP2l96Nl7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=I6rQuogJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721002552;
	bh=PEKO63b6y4QU3PxdgEZpfzvIApcBC3HRVaGSoPQ+YD4=;
	h=Date:From:To:Cc:Subject:From;
	b=I6rQuogJLXLctpjdZuDJLmHgdpe2NxrY04ij7exccQtM/ZYqFgPa8mzWTa8uqOTV0
	 +XWMOmyUPH/tBBEv7k/jjXX0/ZP3lU9nvgYCf+d+pv2VZBBzuFQllMOGZU3fp7RBKW
	 krJ8+GHVMUqyqVskKFRblirZYeqIAiv3vJT/mY32BsBId69zIq0cyjxqIdiyWPd/1S
	 8+NpVgZXxrJ8XDqq2WQwxe099FsoqWKH0cgZDM+XAgEsFsjv8oVdtJWncWvALYpSuN
	 2P665t+P0MwqRv6zZH0G31MfqAJzxqKuggoTXfuPqkFu3ZayG18YeSw765UNT1W8ab
	 vW+X9ynp6rBWQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WMjQw5lCzz4w2Q;
	Mon, 15 Jul 2024 10:15:52 +1000 (AEST)
Date: Mon, 15 Jul 2024 10:15:51 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steve French <smfrench@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, Steve French
 <stfrench@microsoft.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the ksmbd tree
Message-ID: <20240715101551.29fd8268@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WBoZkH0EgxRuPP2UYmF_13U";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/WBoZkH0EgxRuPP2UYmF_13U
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the ksmbd tree, today's linux-next build (x86_64
allmodconfig) failed like this:

fs/smb/server/vfs_cache.c:39:27: error: 'dh_task' defined but not used [-We=
rror=3Dunused-variable]
   39 | static struct task_struc *dh_task;
      |                           ^~~~~~~
cc1: all warnings being treated as errors

Caused by commit

  e70f0abc77e8 ("ksmbd: add durable scavenger timer")

I have applied the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 15 Jul 2024 09:55:23 +1000
Subject: [PATCH] fixup for "ksmbd: add durable scavenger timer"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/smb/server/vfs_cache.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/smb/server/vfs_cache.c b/fs/smb/server/vfs_cache.c
index 2b1a5a3ebf42..4d4ee696e37c 100644
--- a/fs/smb/server/vfs_cache.c
+++ b/fs/smb/server/vfs_cache.c
@@ -36,7 +36,6 @@ static struct kmem_cache *filp_cache;
=20
 static bool durable_scavenger_running;
 static DEFINE_MUTEX(durable_scavenger_lock);
-static struct task_struc *dh_task;
 static wait_queue_head_t dh_wq;
=20
 void ksmbd_set_fd_limit(unsigned long limit)
--=20
2.43.0

--=20
Cheers,
Stephen Rothwell

--Sig_/WBoZkH0EgxRuPP2UYmF_13U
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaUajgACgkQAVBC80lX
0Gwrawf/QVlXB2OTgiLlr8CbwaxQ1w6Asxgt9KpfjF1dPMDyrpPFXNbzUkuAt+78
uTeHjPjF+0FEeTGjX41KsrOU+xmjBKAez50on9qXVSiw2fGx8KwdVeLhG7CmnLqm
XOc7h7W7Cq47AwqH+P1Cbv98FSsIODVeFMbpI+zecVPgwu5+WdMBnJyj2Pj7/AHu
MsVwQ+HvYJLp43qbk03jqpK1QOYT3v0E0ijl33xhDf2LZaIOx/U84BEzjnbbLWrB
h/FgchXouXbc2rRnreVM5oF0L4sUS5ZiytaIO47zdLTQ4v3sdvN417FM45qQPbpP
Icn/ujjlprLJ7K5MlP5GaMFKN/y7Tg==
=jDtt
-----END PGP SIGNATURE-----

--Sig_/WBoZkH0EgxRuPP2UYmF_13U--

