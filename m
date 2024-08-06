Return-Path: <linux-next+bounces-3235-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4D59486CD
	for <lists+linux-next@lfdr.de>; Tue,  6 Aug 2024 02:58:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A10191C22284
	for <lists+linux-next@lfdr.de>; Tue,  6 Aug 2024 00:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD87625;
	Tue,  6 Aug 2024 00:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CacYpGbc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796473D7A;
	Tue,  6 Aug 2024 00:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722905877; cv=none; b=Q9r+LqZW3nZhH4Rj9Fq2PfK57kkMg+2EY7vncuOEO2c7VBY53AFWVD7NLnr+K8Dz16IXJlUML5DTiThKuU89Ot7Tttp9Uogfh441Y3fXsfhzOTpIQysUAgpLTU8JFrthH+ESRU2Zl+4YxohQIAyjrIA1ZY5EWvmQhYUy+NT2rwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722905877; c=relaxed/simple;
	bh=k3RpyGKl1/D+xkHBS5lknyeFze0giVtQLIWrv7erfKc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qLG+9aITtVgMTvsR2W750QND0FnjTmrplMPYyoNmYs5ro27zY/Z+curPn32FAmsgvPHXp/yp84eJKGJccjX8qtUTw+IaNn2ddQ2CCQzzQvOk6eIklvE5JgtukyTFVWPjJEVIIvU+9jAagVq18ioY6FzTYOjOSS68PD5h/IgrfTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CacYpGbc; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722905871;
	bh=V2B6IP2Xn5UkzqES0ky3SHK03er1O8SRWpu7s94SRSg=;
	h=Date:From:To:Cc:Subject:From;
	b=CacYpGbciy6qt1QBu++SUUG0WpW6cI3GBrxj1vOUJcMUY1puFo6KyYGoC9ByWXL6/
	 LPHz6fFuPs6O/GOBROe7z7Zbvw6TSzIQ0/VacLWqL13Bym2els/g7Koi9AyW7rw3ZJ
	 P7NCut7aXPbkq1iI6qBeo+h+vrIvZX5BBfGoNWGZXiaHglsBuf190aYZzMcGaImAan
	 B/OCNSxRP1lSb8aGUy6NpcXB8HoIWv9pVBW03fAkggi+H7Is0t4PGXPZQJ6iiF3m8i
	 6ZdsOz3yHszdZAvXFXZws1Iopm8jdVfPJJiX9/fn5NeERW9Xl/aN6g15dd4u1gq7iK
	 uI1C2NBHbPBZQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WdFKB4jhxz4w2F;
	Tue,  6 Aug 2024 10:57:50 +1000 (AEST)
Date: Tue, 6 Aug 2024 10:57:49 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Chao Yu
 <chao@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20240806105749.1bd7853c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Xq/.Bi1fzk2tX90mfPc2j0q";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Xq/.Bi1fzk2tX90mfPc2j0q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (x86_64
allmodconfig) failed like this:

fs/f2fs/data.c: In function 'f2fs_write_end':
fs/f2fs/data.c:3735:41: error: 'page' undeclared (first use in this functio=
n)
 3735 |                 set_page_private_atomic(page);
      |                                         ^~~~

Caused by commit

  300dd0fa8e20 ("fs: Convert aops->write_end to take a folio")

interacting with commit

  1a0bd289a5db ("f2fs: atomic: fix to avoid racing w/ GC")

from the f2fs tree.

I have applied the following merge fix patch for today.  This makes it
build, but there is probably a better resolution.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 6 Aug 2024 10:35:46 +1000
Subject: [PATCH] fixup for "fs: Convert aops->write_end to take a folio"

interacting with "f2fs: atomic: fix to avoid racing w/ GC" from the
f2fs tree.
---
 fs/f2fs/data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index bfc81203bd0a..908a836dd1c3 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3732,7 +3732,7 @@ static int f2fs_write_end(struct file *file,
 	folio_mark_dirty(folio);
=20
 	if (f2fs_is_atomic_file(inode))
-		set_page_private_atomic(page);
+		set_page_private_atomic(&folio->page);
=20
 	if (pos + copied > i_size_read(inode) &&
 	    !f2fs_verity_in_progress(inode)) {
--=20
2.43.0

--=20
Cheers,
Stephen Rothwell

--Sig_/Xq/.Bi1fzk2tX90mfPc2j0q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaxdQ0ACgkQAVBC80lX
0GwZGwf/eP3UO9CryTPl8V6wjQkXwJdjJkKArx0f2HmVbRvWnRGZWiwTvpvBpw15
MZSmiI6BFkwJu0fQLYq9tMQQeKZIp3WjxTuYnk9QbqLV7pK6TybmZ5IkFnHpQKR0
MBwo97MfD5uwSojKfbOn7H6FQo8lvMikkcG1mbo7wfS6Ps3BKYmssyF+wSqFU8aO
E3TSjXWKcClZbkeKkm22K3+VKue45Fm3Zlq2YhcoinU6Rcr6HOakj8abwXeqyJqG
T7MlcZyIufLtj6pi6Q4qBviA4Fj2zpZ56K+w69/begLS8xzvpYp4p2dPiRE1DqgD
0tlWubhNmjqDwmHyV2QPwpE74V1uKg==
=zx70
-----END PGP SIGNATURE-----

--Sig_/Xq/.Bi1fzk2tX90mfPc2j0q--

