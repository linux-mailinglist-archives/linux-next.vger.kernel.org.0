Return-Path: <linux-next+bounces-6011-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F00BA70F06
	for <lists+linux-next@lfdr.de>; Wed, 26 Mar 2025 03:29:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEE8217939C
	for <lists+linux-next@lfdr.de>; Wed, 26 Mar 2025 02:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4641B14B965;
	Wed, 26 Mar 2025 02:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gRqJBVOK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A67A142E67;
	Wed, 26 Mar 2025 02:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742956107; cv=none; b=dXdY3HUlq1sAvc/pUpAsPE1t7YUlXxpX+yVm2FTZLo0Wh+rI5rj3d3CxFjyqtSjX+CTk6vle3uiQOUuVhFgjY2mGFe6evqfETDAZsJpT3NEMAfl40yeU/5tv3MiAi8ZpHlg5xxLaE1oL6LmiJs/rHDzqGIu55Empop8CC6+BZGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742956107; c=relaxed/simple;
	bh=ZZtnP1XjxpMRP3yjHyGXTHYfFFGxZvkA1fzvEMigWy0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Vuo/oL9mGtFhw9RXSS1tQUDCwzQQBYNoQQ4xuMIZdEvzpiUZSr9Fr8OmuFViojkjps4GUleM4HHdhZthDnBeR8gTxfGpAoPQ9vanu5KSSxB1cbd0wvXSQf9Ujzb1u4uSU9porjLjvWAoH7vi0ycRGeBs1H4amjmXTIF3htDUgvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gRqJBVOK; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742956100;
	bh=x7S2TV1RuJBApU10U5xfEeWg9V74C+IFyrIBGEv1QS4=;
	h=Date:From:To:Cc:Subject:From;
	b=gRqJBVOKZDQzSGQL7ABKOEIxHxK4vp9cyAgcXGs9J6+W7BYzNOUVwOul+zUJe3HXA
	 4xzAeam0sjFN15bG/+4YTXaNCqrVO+lw5GzI5JmTEc4TObIUCZg4qGsqPf03XiY9Vm
	 W2w31XIe+g4tgz0OhXFbyJy3hQOyfHg9nJG33z4KRjC55rvfRIOoa+mIBSQEPi0qn2
	 u3AxXNrdc+LTibapONK3utCVlyUTVtkRKpIjI+Mfxh6l5lkmOtUwbyBe5iCNvHWoI2
	 D5sQWbA5RK1Ekj+bqEA2HVTYkOU8ALvKS9/jDDZedhOmzMpB4bEwmefZl6s0q+ElgE
	 dApGs1ENP8RZg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZMrLX30Krz4wcr;
	Wed, 26 Mar 2025 13:28:20 +1100 (AEDT)
Date: Wed, 26 Mar 2025 13:28:19 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Uros Bizjak <ubizjak@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the bcachefs tree
Message-ID: <20250326132819.30db65e7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DHZ+CmQzw6AMneIwPqr8EUV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/DHZ+CmQzw6AMneIwPqr8EUV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the bcachefs tree, today's linux-next build (x86_64
allmodconfig) failed like this:

fs/bcachefs/time_stats.c: In function 'bch2_time_stats_reset':
fs/bcachefs/time_stats.c:165:27: error: comparison of pointers to disjoint =
address spaces
  165 |             stats->buffer !=3D TIME_STATS_NONPCPU) {
      |                           ^~
fs/bcachefs/time_stats.c: In function 'bch2_time_stats_exit':
fs/bcachefs/time_stats.c:175:27: error: comparison of pointers to disjoint =
address spaces
  175 |         if (stats->buffer !=3D TIME_STATS_NONPCPU) {
      |                           ^~
fs/bcachefs/time_stats.c: In function 'bch2_time_stats_init_no_pcpu':
fs/bcachefs/time_stats.c:192:23: error: assignment from pointer to non-encl=
osed address space
  192 |         stats->buffer =3D TIME_STATS_NONPCPU;
      |                       ^
fs/bcachefs/time_stats.c:192:23: note: expected '__seg_gs struct time_stat_=
buffer *' but pointer is of type 'struct time_stat_buffer *'

Caused by commit

  5490554cf06f ("bcachefs: bch2_time_stats_init_no_pcpu()")

interacting with commit

  6a367577153a ("percpu/x86: enable strict percpu checks via named AS quali=
fiers")
(or an associated one)

from the mm-stable tree.

I have applied the following merge fix patch for today (but I think it
could just be applied to the bcachefs tree).

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 26 Mar 2025 13:15:00 +1100
Subject: [PATCH] fix up for "bcachefs: bch2_time_stats_init_no_pcpu()"

interacting with "percpu/x86: enable strict percpu checks via named AS qual=
ifiers"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/bcachefs/time_stats.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/bcachefs/time_stats.c b/fs/bcachefs/time_stats.c
index a8382d876835..b16540aa9ca4 100644
--- a/fs/bcachefs/time_stats.c
+++ b/fs/bcachefs/time_stats.c
@@ -11,7 +11,7 @@
 #include "time_stats.h"
=20
 /* disable automatic switching to percpu mode */
-#define TIME_STATS_NONPCPU	((struct time_stat_buffer *) 1)
+#define TIME_STATS_NONPCPU	((struct time_stat_buffer __percpu *) 1)
=20
 static const struct time_unit time_units[] =3D {
 	{ "ns",		1		 },
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/DHZ+CmQzw6AMneIwPqr8EUV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfjZkMACgkQAVBC80lX
0Gxg1Af/YVC+iuASqgc4f5d0zNKiZWJKzhADNrIAC2lXKbDkt/lkZYXOYLYCMm0I
/U7MX3XShd4isgnRYhh/v9AW4xsxKUAxBdnq20XhxOsvs4kxM6TfNgZCAuy1VwI2
JiaieDgYbNbUTsXx7cbSfq5Dre6BAS2h4nBq363lKqyJCAlduO5MQ1blpc08oinc
Jd8I+aTy0+5Y503toSA0UmVqT2GfPADgIjpWuSiYUwrJa1dnP5QRUVp2TKAcSDj6
ru/Ldr47pqYUyhTlh9mPawltTatdi2krVqZrCGe2ygMkgC8pYz34npfkOD41TYxl
+zXEyvGeFJtZGMA12JgGYycIs5wIzQ==
=QlDJ
-----END PGP SIGNATURE-----

--Sig_/DHZ+CmQzw6AMneIwPqr8EUV--

