Return-Path: <linux-next+bounces-4699-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D19669C1453
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2024 03:55:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EC731C2176F
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2024 02:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F53F2F85C;
	Fri,  8 Nov 2024 02:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZTQSOgOl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02F526296;
	Fri,  8 Nov 2024 02:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731034513; cv=none; b=QAcRQFPP7JiYbZV0GuE4jUoLX/kDyDN8TtP+iXn38Tml+rfExtFuf6sU9eky8mT5TGrZzShg+bwP9NB7x70U7hBz91ohCKXdcObMT30PZRmtESuv5zMh5PaBxY0XtUMDoWknPhoXLZT2DFJk+DAWAKyGZFdQjycCPjweJJWpz7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731034513; c=relaxed/simple;
	bh=KGZhlz+5hEHHO6I6j4KPW5c6MWRn1aVLXCtKaL7nWU8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=t4qS/G2Ou8Q0VOu2MUCp5DbPFlx03xxSUaWv/OaOpEpuBuMhTpXhUn/qNIXwbjuFfplZJas56NnXmxufqtgNkGLTKlIP2GuRQnGSAS86F7pnAL0hnn0xhH2JEhwo1x+72IekLjORDEJxPermmQqVTqAOp5apadTjP8kZoD6SSTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ZTQSOgOl; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731034505;
	bh=wpyZi4n8u1qxo1IyXjJG/yWYovnDnC8tisFNsEYBVeg=;
	h=Date:From:To:Cc:Subject:From;
	b=ZTQSOgOlnmXlcnsbjg6EhgQMjD82TEPipF3vWe4CwSC6NlJsJc2Fy3cW+u5mJKJas
	 e7SQykBZeABfkidbiRxu6l+9JMKHs8M8ypyyR64C7dn/8JLct1XSmAG7qO5xkBnne/
	 TOcBz++nEquqby9fMZG1OOj0b9h84vMQp6r3srkYqXuT3VqeGotMAsmz2YqhZe97yv
	 z/Lp81Uls0X3oNIu9GUmAnGD4tMoha8DVZRm5vsp4ThMQjJfAphrekQi+IBQOr3vER
	 9uzwYHQCRhCRDX17cNZnhWYBhC44aAYs00CWktTIvROQxS6kkZdykwm15YDiHvrvSA
	 oPt0KqtKXWwlA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xl3T45TmQz4x6k;
	Fri,  8 Nov 2024 13:55:04 +1100 (AEDT)
Date: Fri, 8 Nov 2024 13:55:04 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Christian Brauner <brauner@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Daniel Xu <dxu@dxuuu.xyz>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>
Subject: linux-next: manual merge of the ftrace tree with the vfs-brauner
 tree
Message-ID: <20241108135504.519ce71e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Bd9X/rYIvsvai3=/+RLfTo9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Bd9X/rYIvsvai3=/+RLfTo9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ftrace tree got a conflict in:

  rust/helpers/helpers.c

between commit:

  851849824bb5 ("rust: file: add Rust abstraction for `struct file`")

from the vfs-brauner tree and commit:

  6e59bcc9c8ad ("rust: add static_branch_unlikely for static_key_false")

from the ftrace tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc rust/helpers/helpers.c
index d553ad9361ce,17e1b60d178f..000000000000
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@@ -11,9 -11,8 +11,10 @@@
  #include "bug.c"
  #include "build_assert.c"
  #include "build_bug.c"
 +#include "cred.c"
  #include "err.c"
 +#include "fs.c"
+ #include "jump_label.c"
  #include "kunit.c"
  #include "mutex.c"
  #include "page.c"

--Sig_/Bd9X/rYIvsvai3=/+RLfTo9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmctfYgACgkQAVBC80lX
0GwBOgf/R3INbJC5aYoje6m6uV6lk6033AResz7S0sQJP7ioOyBKR37mbhiKgBvW
2txVzRBm8ap3rWJviNIf60hSfCIHGrt8DrWn4Nz/zc0uyk19V74FNv6dTIeMKprt
h8p30VLiFSvFY4LcRC89U0BTlx36xHh/3FPGY4VbVb56fynYNkE+HwD/RO/2fQ2x
wqeE/cuck3ZH8Upgf81KW4S00oodGijYi2Aqc0bUvpTcKrGeDbiwXAJm1dQDoJpy
A0x6W3Uo5ziaz8rahY5tPXE64FovvBLLYeCLXfm38rlckp42IG+NRO1wtwOeFMfK
Xeu2v1HTyU8X2UCbVvPS/Ue0co8yjA==
=ghGZ
-----END PGP SIGNATURE-----

--Sig_/Bd9X/rYIvsvai3=/+RLfTo9--

