Return-Path: <linux-next+bounces-6718-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84128AB492E
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 04:06:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 894508C4748
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 02:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5683F1991BF;
	Tue, 13 May 2025 02:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PR7WWy/p"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9061D1991B6;
	Tue, 13 May 2025 02:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747101831; cv=none; b=ekBZ9q1BgKuuARMmwC8xVhpkTfW1baiXmvgTy5sUsFEgBNcR96nQiD+s17RTjwfNhqr7CEWSyeUVIHVVhWxq2hciryBA/lVm+FC3jhAhWXo8SO8MqzG+GJ+zffL+uQqhr5Xjbi+TXlwy9x5VZHJHBdk0Iy5dIw59O56S81pBYcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747101831; c=relaxed/simple;
	bh=XYskIFC2tOBYmejTzdGp9nF7259cG3gviinn5sZH5cY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Ek/I0mpCDlchpywAZHnNw+j8436hzlSbO4C8GmFhntW14losWJ15MhzQ8YU///fF709zp6NDwqqS1poybMo+u5JMU3J7Fz6neIBPOKS7dkZlO/f+o2JU7mO6YDwZ5qM7WX+2g3jG/yTYWR8lUDhv+FxpijpPWY3HvtDcE3r6ouA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PR7WWy/p; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747101823;
	bh=b+Bp2oHxj5LLFKHbv1vZUzjEF5UmkR6Oe+dWbBhT9vQ=;
	h=Date:From:To:Cc:Subject:From;
	b=PR7WWy/poxJwqMw0Bni2Zk6Br0NsooAWzvyanwB2lxmfoiV4GKSTOWSrBNbLCUzM6
	 w+w5/xgebHQp2C02TqB5yU0jrOHz4PyFUwXM/Md87xTZ9pjzkJbOzlSHoXnflZJO70
	 JhQLKdgLs+NRHF1xKvKWc8TKyTF4e++5O/1Fy3843v6ySdj2QsdahIiVNug92RlP6W
	 nO8t9elCpwnIo5wSrZDBXl4tIlgE7a8QLtTbLuKtQ+eCBo3+uk9dTr3Y/G+zI6kdyK
	 i2iROyGsosl3hiC20wB/vtG0bdV4P4SgafFWoeXgW9igZoNl3/hytaLEOkc+suaq5/
	 PEKOv3X41XIuA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZxKWz2czdz4wbY;
	Tue, 13 May 2025 12:03:43 +1000 (AEST)
Date: Tue, 13 May 2025 12:03:42 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Viresh Kumar <viresh.kumar@linaro.org>, Andreas Hindborg
 <a.hindborg@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the cpufreq-arm tree with the configfs
 tree
Message-ID: <20250513120342.10988bf5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//0duqlb9+NPldqUWC0E4f/o";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//0duqlb9+NPldqUWC0E4f/o
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the cpufreq-arm tree got conflicts in:

  rust/bindings/bindings_helper.h
  rust/kernel/lib.rs

between commit:

  446cafc295bf ("rust: configfs: introduce rust support for configfs")

from the configfs tree and commits:

  6fa5ce832520 ("rust: cpumask: Add initial abstractions")
  5feb286e16f4 ("rust: clk: Add helpers for Rust code")
  3044627e1494 ("rust: cpu: Add from_cpu()")
  254df142ab42 ("rust: cpufreq: Add initial abstractions for cpufreq framew=
ork")

from the cpufreq-arm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc rust/bindings/bindings_helper.h
index 1a532b83a9af,7c1d78f68076..000000000000
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@@ -10,7 -10,9 +10,10 @@@
  #include <linux/blk-mq.h>
  #include <linux/blk_types.h>
  #include <linux/blkdev.h>
+ #include <linux/clk.h>
 +#include <linux/configfs.h>
+ #include <linux/cpu.h>
+ #include <linux/cpufreq.h>
  #include <linux/cpumask.h>
  #include <linux/cred.h>
  #include <linux/device/faux.h>
diff --cc rust/kernel/lib.rs
index 354eb1605194,871fcdc09b35..000000000000
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@@ -42,8 -42,12 +42,14 @@@ pub mod alloc
  pub mod block;
  #[doc(hidden)]
  pub mod build_assert;
+ #[cfg(CONFIG_COMMON_CLK)]
+ pub mod clk;
 +#[cfg(CONFIG_CONFIGFS_FS)]
 +pub mod configfs;
+ pub mod cpu;
+ #[cfg(CONFIG_CPU_FREQ)]
+ pub mod cpufreq;
+ pub mod cpumask;
  pub mod cred;
  pub mod device;
  pub mod device_id;

--Sig_//0duqlb9+NPldqUWC0E4f/o
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgiqH4ACgkQAVBC80lX
0GyS6wf+KaPN0h31fN1rGKePx2NBAj/vVmw1vbXI2UyaYqZR9hdoADluO3iEXzy0
rMG26hx2AiF0xgYWN7Wq5Tr4PBtvo9ocImKlbTiWvtV426m9numc53649XwcatpB
Ro9Tg6nSbPrj9QKApLC4XDJHxjJ0jq1flE3Mzm9YVeptHVdqYkgxLsEs8AcCscyj
FUOkWHCZ2+wj1GBqRGZhvP1vxy7VIADCdBJGWf43KUJZ0XmfPX8Ma89JQB4LA9PJ
dXxdEiXTqMfJfcRG+BBcDPrwkBnz9QLIMIb0h5cvQqfG45XeACRO5kn1tBuqrwoV
wguVzLJqIjeXqDU0LRxN81BPnJM5Sw==
=yVzb
-----END PGP SIGNATURE-----

--Sig_//0duqlb9+NPldqUWC0E4f/o--

