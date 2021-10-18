Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1597B430DDD
	for <lists+linux-next@lfdr.de>; Mon, 18 Oct 2021 04:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237767AbhJRChy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 17 Oct 2021 22:37:54 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:57085 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234406AbhJRChx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 17 Oct 2021 22:37:53 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HXgwD4C5bz4xbL;
        Mon, 18 Oct 2021 13:35:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634524541;
        bh=ei5+KbAdb1qdjYIroNHcJtk+ULUrHithw8AGM+I+Hes=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=cGquabEpNei/vw8wXdsbaB5JUu95HQ2fw/s8bd905HYskuBtvcvdNRl/JGl4XLjr9
         qxFPlMXuBbG/TryF46sHTIbW4FMqi8PGZScG/7bHw/Vz9rwIoytyjB6ezQSWeI6SYw
         yWIWsfks7hjxYuNSxI1FXlMZr0Iz6q7SVnTwZYdSOVdcD3kSWlRdbKCBTmiYTwMZgc
         oF64LalBmF3dx+LKTlsoKv2LA5Bxe1s8DOB1jnRxd5VFv8Gbv8K565gvlkMrdoLX2m
         HUd58cyFGn231sx7BzrCQOmOipsf0zeKtQs1DG56++JDpF48k5IDIauk6ZuNmBYh8M
         1fTo8eIHULuPA==
Date:   Mon, 18 Oct 2021 13:35:38 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20211018133538.2a0dec43@canb.auug.org.au>
In-Reply-To: <YWl+0PFixaNqgIxb@smile.fi.intel.com>
References: <20211015202908.1c417ae2@canb.auug.org.au>
        <YWl+0PFixaNqgIxb@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7vcLm23FUTr0AN8x54MuUun";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7vcLm23FUTr0AN8x54MuUun
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Fri, 15 Oct 2021 16:14:56 +0300 Andy Shevchenko <andriy.shevchenko@linux=
.intel.com> wrote:
>
> Thanks! As a quick fix looks good, but I think we need a separate header =
for
> those _*_IP_ macros.

Like this (on top of my previous fix - which I assume Andrew will
squash out of existence)?

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 18 Oct 2021 13:27:54 +1100
Subject: [PATCH] kernel.h: split out instrcutions pointer accessors

botton_half.h needs _THIS_IP_ to be standalone, so split that and _RET_IP_
out from kernel.h into the new instruction_pointer.h.  kernel.h directly
needs them, so include it there and replace the include of kernel.h with
this new file in bottom_half.h.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/bottom_half.h         | 2 +-
 include/linux/instruction_pointer.h | 8 ++++++++
 include/linux/kernel.h              | 4 +---
 3 files changed, 10 insertions(+), 4 deletions(-)
 create mode 100644 include/linux/instruction_pointer.h

diff --git a/include/linux/bottom_half.h b/include/linux/bottom_half.h
index 11d107d88d03..fc53e0ad56d9 100644
--- a/include/linux/bottom_half.h
+++ b/include/linux/bottom_half.h
@@ -2,7 +2,7 @@
 #ifndef _LINUX_BH_H
 #define _LINUX_BH_H
=20
-#include <linux/kernel.h>
+#include <linux/instruction_pointer.h>
 #include <linux/preempt.h>
=20
 #if defined(CONFIG_PREEMPT_RT) || defined(CONFIG_TRACE_IRQFLAGS)
diff --git a/include/linux/instruction_pointer.h b/include/linux/instructio=
n_pointer.h
new file mode 100644
index 000000000000..19e979425bda
--- /dev/null
+++ b/include/linux/instruction_pointer.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_INSTRUCTION_POINTER_H
+#define _LINUX_INSTRUCTION_POINTER_H
+
+#define _RET_IP_		(unsigned long)__builtin_return_address(0)
+#define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
+
+#enfif /* _LINUX_INSTRUCTION_POINTER_H */
diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index 973c61ff2ef9..be84ab369650 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -20,6 +20,7 @@
 #include <linux/printk.h>
 #include <linux/build_bug.h>
 #include <linux/static_call_types.h>
+#include <linux/instruction_pointer.h>
 #include <asm/byteorder.h>
=20
 #include <uapi/linux/kernel.h>
@@ -53,9 +54,6 @@
 }					\
 )
=20
-#define _RET_IP_		(unsigned long)__builtin_return_address(0)
-#define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
-
 /**
  * upper_32_bits - return bits 32-63 of a number
  * @n: the number we're accessing
--=20
2.33.0

There are, presumably, other places this new file can be included ...

--=20
Cheers,
Stephen Rothwell

--Sig_/7vcLm23FUTr0AN8x54MuUun
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFs3XoACgkQAVBC80lX
0GxsGQf/QYDOeiXb+RzZNGiZy3/fiIWwphCpUOBuVsFrdX7y0Bt0oQkt3SSEWxuF
XeBiRO/sGINEicmFE3rxBTKVOeZgow3Xhlghr8+n8lOvnwTBK0YVDLNpYMKPVMe6
AN4k3bIe3lar1udAENbwHY4slyGJxWYMgx87XVGDxkgvaTTkLN+Tln3M0c708D+4
DRnaOuit0XIG0lnJVqTLbaaEbuNrergKG5rnKN86hdW16plx2XfWW/02999NykMe
MH/StTcnYJ7nP4OtzgFO2kyz0wYx+/CGHd3IDUU0BcZHgOFRdxk4wPdDPyktjsmB
wrRr+i/c+oU/kX5380sXDjnW71zB/A==
=EyBf
-----END PGP SIGNATURE-----

--Sig_/7vcLm23FUTr0AN8x54MuUun--
