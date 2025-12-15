Return-Path: <linux-next+bounces-9399-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 401C7CBCD78
	for <lists+linux-next@lfdr.de>; Mon, 15 Dec 2025 08:51:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39F7230141C4
	for <lists+linux-next@lfdr.de>; Mon, 15 Dec 2025 07:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA54132824F;
	Mon, 15 Dec 2025 07:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XG3svguU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601ED2C0F7D;
	Mon, 15 Dec 2025 07:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765784498; cv=none; b=aRDUj4vRCHITsvuP4ZohmW0U9KEK9gA8p+dbpvN83Rzcz+Dr6rnv93aHxz2EnZVlNAkb03j6NPhXlHJsD03xw6JFCdD9ZaBCLEDZvBD8NGl3GNCmynQpSf9AahRH5olpmx2E72jvwzG+LOoxm5aghLw+rAZUiIrTnT/HxmHihtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765784498; c=relaxed/simple;
	bh=F0fetOTHgarIh5yasgmbjLIrQCG2inO96tkwiCuvW+E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dQfaKCqKrbkgifIrhDZjvAjaH5tHVTFMh4OK14bd4Z47SyK0o0XBBax2RkiiMCpChH41W+Xh8GDF7Z8HeEx9CuVLBwL6Weh6m3zSYGOrOIizCF9nCyoXP1WpveWmB3w94K98AIHra9xLiO+I9S193E7W1llrIdByoi0z5y6OS8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=XG3svguU; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1765784490;
	bh=dU+Kjl3BzGIHlnxgQ9fgHup99mSyXv7h8yrMPR1uMZ8=;
	h=Date:From:To:Cc:Subject:From;
	b=XG3svguUZ6L8xtho7IQmPxzEj5JUe+yz6SPaMo+ZHQZ/fPsahjdh0Da+/xHMUWJeV
	 zjcG73t6dcFf4W+tsetXB9KnBs0NTk1nPYZKbLElJq+Wn5ET7Z7KwM3BxH2JjHUx+Y
	 Au/AGhbUta1BdKyQe4vzTcCWBa/OF1HXAkW7vRc4KH8qZ+/GdIv4VxJdDhqNuSRfM6
	 QBnU6SVxRrvosC3uKs3Klbt1MJfEEwWOU3bKdI0aRIrLXvvu6MQK4ZElB7UboNGXlR
	 YktCMT3/KF8C/1GdSz3An45m5gonBv6U3yrrfrs8qr8ncnvhIbWkSBVZHUa39QaRZV
	 jpmC3mmJz3PcA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dVBny6gqgz4w23;
	Mon, 15 Dec 2025 18:41:26 +1100 (AEDT)
Date: Mon, 15 Dec 2025 18:41:26 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andreas
 Larsson <andreas@gaisler.com>, Christoph Lameter <cl@linux-foundation.org>,
 Chuck Lever <chuck.lever@oracle.com>, Dennis Zhou <dennis@kernel.org>,
 Dipen Patel <dipenp@nvidia.com>, Gabriel Krisman Bertazi
 <krisman@collabora.com>, Ingo Molnar <mingo@kernel.org>, Jean Delvare
 <jdelvare@suse.de>, Lee Jones <lee@kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Matthew Wilcox <willy@infradead.org>, Miguel Ojeda
 <ojeda@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, Tejun Heo <tj@kernel.org>, Tyler Hicks
 <code@tyhicks.com>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <ukleinek@kernel.org>
Subject: linux-next: trees being removed
Message-ID: <20251215184126.39dae2c7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7ct7/K2xy.EDZl3m/pvFgII";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7ct7/K2xy.EDZl3m/pvFgII
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following trees are going to be removed from linux-next because they
have not been updated in more than a year.  If you want a tree kept,
please just reply and let me know (and update its branch).  If you want
a tree restored after it has been removed, just let me know (and update
its branch).

Tree			Last commit date
  URL
  comits (if any)
----			----------------
accel			2024-05-03 11:00:53 +1000
  https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git#habanal=
abs-next
clang-format		2024-08-02 13:20:31 +0200
  https://github.com/ojeda/linux.git#clang-format
compiler-attributes	2024-09-15 16:57:56 +0200
  https://github.com/ojeda/linux.git#compiler-attributes
dmi			2024-05-14 11:23:02 +0200
  https://git.kernel.org/pub/scm/linux/kernel/git/jdelvare/staging.git#dmi-=
for-next
ecryptfs		2024-10-21 01:47:22 -0500
  https://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs.git#next
  b06c72107980 ("ecryptfs: keystore: Fix typo 'the the' in comment")
  da22e0dc323c ("fs: ecryptfs: comment typo fix")
  68c119aecdcd ("ecryptfs: Fix packet format comment in parse_tag_67_packet=
()")
  fba133a34118 ("ecryptfs: Remove unused declartion ecryptfs_fill_zeros()")
exportfs		2024-11-17 14:15:08 -0800
  https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git#exportfs-ne=
xt
hte			2024-06-19 12:24:03 -0700
  https://git.kernel.org/pub/scm/linux/kernel/git/pateldipen1984/linux.git#=
for-next
percpu			2024-10-07 11:33:26 -0700
  https://git.kernel.org/pub/scm/linux/kernel/git/dennis/percpu.git#for-next
siox			2024-03-08 22:01:10 +0100
  https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git#siox/f=
or-next
unicode			2024-10-11 15:02:41 -0400
  https://git.kernel.org/pub/scm/linux/kernel/git/krisman/unicode.git#for-n=
ext
xarray			2024-09-23 15:16:41 -0400
  git://git.infradead.org/users/willy/xarray.git#main
  c88414f56c37 ("XArray: Prevent node leaks in xas_alloc()")
  6684aba0780d ("XArray: Add extra debugging check to xas_lock and friends")


These trees of fixes will be kept in any case (please let me know if
they should go):

backlight-fixes		2024-05-26 15:20:12 -0700
  https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git#for-bac=
klight-fixes
sparc-fixes		2024-01-21 14:11:32 -0800
  https://git.kernel.org/pub/scm/linux/kernel/git/alarsson/linux-sparc.git#=
for-linus
tracefs-fixes		2024-11-01 08:57:55 -0400
  https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git#tra=
cefs/fixes

--=20
Cheers,
Stephen Rothwell

--Sig_/7ct7/K2xy.EDZl3m/pvFgII
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmk/u6YACgkQAVBC80lX
0Gztcgf8DXJNQeDZcTNbYKXFX8IYoCTzmY7rE8cuPiH5J74ygkW3dxVvzwBWGp5k
UmmlBAG4FtlB1/+gXEHFqkdygu5mkGu7Prmg61nb1gOLyITJJNNn1YqumxLRE5d7
VvdS4MrfFZYOzcY4NQFwrrUGFJYcmeRK4GXhQfkHuXhqo0NX/+SYWLbqXSiZLTzB
PMJLI0eCgOcAHJ7l/CR2AKWZFnbA65c2mL3skFOvSLfpfIRlcsTO+foIMoYc96Yx
ZQuPnxpnAdy6E+8QaRxGiyICRrqy1n+MvXzqLXHvrsQilBFSyuloHDWwSloKwY+x
RQ6qEB0+mOj/HeBN4k3fBPYNs1e+1w==
=GHch
-----END PGP SIGNATURE-----

--Sig_/7ct7/K2xy.EDZl3m/pvFgII--

