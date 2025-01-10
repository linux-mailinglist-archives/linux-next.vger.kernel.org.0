Return-Path: <linux-next+bounces-5133-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E65A08683
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 06:28:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9FF03A8E41
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 05:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5F2E205AA3;
	Fri, 10 Jan 2025 05:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cQDSAn9y"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4411E25F4;
	Fri, 10 Jan 2025 05:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736486919; cv=none; b=ljLBwu6fQnE7wfgSbeTl+MADG/ZuxH7QOY/qe6o8UIAIYkl4zKFcmqTDM8ixbvpHON1E36nxVW04uVoW9Bpzimq3A0sgPM71PD/7M+uo7q74bX0A6a099MHSQ2ysR+YhjG/GqutTdLOHnlIMw4MbKlnL7atn0H9nY2S88Q3b3hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736486919; c=relaxed/simple;
	bh=JiQDJux3cFYMrZHF+67FS2AeeoLBQ5OysziBsth+wyk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Qqjr/Fj9yW/IL5xFGpd7jcs2JEOEiBrAnbQ33jokWscKviv6NYny9h/D5CFLee6eNm7zQfCxYh+9Mw/yUVbJy4bCZBL3/TKo3/pGIjaPsJ/uQUEFYNTbpftXg0dQVrX+rH22LQ43xd0tmhS/44cb7WMrzZGq646BIJIezVMB9cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cQDSAn9y; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736486903;
	bh=DVZc04H2hZ+bvmVM/0X6UdZoa8+jNm8ytt9jQEqe7pA=;
	h=Date:From:To:Cc:Subject:From;
	b=cQDSAn9y5m/adnl5+6wkI+ZJCNaCWcJlt/NM2UKG17vkZ5GKufeuHYzRckstodUV6
	 smeJpczHvfZL2pv23+zWlG3cogcadkqqzjvqwSvvyCvfbXCM+OeTDfLrGA1l+JRUZL
	 DS/N6C02RxIdBcc1Swl/X/NUAtVZdIykeGnqYGIoWI/Ze6nkW7TkY7+wHio9G2QX38
	 GRX7h85IR7SXmetPL1jVy6JkGV3ciTveK+8i6aI5ovM80FJJPyBp7bk3qpBfZ3xegS
	 flV1QwWQ9LcNOiRAmGQwFOnhE1ks/Je3jJuZ/ktnRVvxBU8asd3u+5e7R2d0SPzjBH
	 7N06oUUjoYzXg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YTqtv2Q66z4w2M;
	Fri, 10 Jan 2025 16:28:23 +1100 (AEDT)
Date: Fri, 10 Jan 2025 16:28:28 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the rust tree
Message-ID: <20250110162828.38614c1b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FLMJiQraDsO9LrMzVIjnUwy";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/FLMJiQraDsO9LrMzVIjnUwy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rust tree, today's linux-next build (x86_64
allmodconfig) failed like this:

error[E0423]: expected function, found macro `kernel::build_error`
   --> rust/kernel/miscdevice.rs:159:9
    |
159 |         kernel::build_error(VTABLE_DEFAULT_ERROR)
    |         ^^^^^^^^^^^^^^^^^^^ not a function
    |
help: use `!` to invoke the macro
    |
159 |         kernel::build_error!(VTABLE_DEFAULT_ERROR)
    |                            +
help: consider importing one of these functions instead
    |
11  + use crate::build_assert::build_error;
    |
11  + use build_error::build_error;
    |
help: if you import `build_error`, refer to it directly
    |
159 -         kernel::build_error(VTABLE_DEFAULT_ERROR)
159 +         build_error(VTABLE_DEFAULT_ERROR)
    |

error: aborting due to 1 previous error

For more information about this error, try `rustc --explain E0423`.

Caused by commit

  614724e780f5 ("rust: kernel: move `build_error` hidden function to preven=
t mistakes")

interacting with commit

  5bcc8bfe841b ("rust: miscdevice: add fops->show_fdinfo() hook")

from the driver-core tree.

I have added the following merge resolution patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 10 Jan 2025 16:02:19 +1100
Subject: [PATCH] fix up for "rust: kernel: move `build_error` hidden functi=
on
 to prevent mistakes"

interacting with commit

  5bcc8bfe841b ("rust: miscdevice: add fops->show_fdinfo() hook")

from the driver-core tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 rust/kernel/miscdevice.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index 9685e50b100d..3ba018651bc0 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -156,7 +156,7 @@ fn show_fdinfo(
         _m: &SeqFile,
         _file: &File,
     ) {
-        kernel::build_error(VTABLE_DEFAULT_ERROR)
+        build_error!(VTABLE_DEFAULT_ERROR)
     }
 }
=20
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/FLMJiQraDsO9LrMzVIjnUwy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeAr/wACgkQAVBC80lX
0GyBFwgAoAYlH0ASkHoCxssFk/mD8ZZE58g4BMppzLVGNf0wY11Z+iHtKRGtrl2k
Ii6B+ks5Y8WL4ThbsjId7dsgyDCLC0e6e9P/NBCe2AAkGvbqkAcEkr6y9DgO7a/4
Rjo4Ggk8owTL9tCEa726kMxWFGxR4U41YvKW0XTAWPps57ldSPDnWOQ3WfxL429s
7+uc+4W7X/fweDEmjjqO3ypvzRgnhI4CSHqKquP0PRnxTej0FxskpdyKxXf/wIHr
ZCAxNZRHUzOnLStW6jwF3FcGb0j/kJHCteDm28/JfwcTgm1lExmM+xBpF7P5VIPB
6oTSXug46Ue6blOFWeGWBFJi0+vOpw==
=aQfH
-----END PGP SIGNATURE-----

--Sig_/FLMJiQraDsO9LrMzVIjnUwy--

