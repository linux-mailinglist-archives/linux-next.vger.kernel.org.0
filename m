Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF260114934
	for <lists+linux-next@lfdr.de>; Thu,  5 Dec 2019 23:25:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729430AbfLEWZU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Dec 2019 17:25:20 -0500
Received: from ozlabs.org ([203.11.71.1]:59863 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729240AbfLEWZU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 5 Dec 2019 17:25:20 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47TVf318Ddz9sP6;
        Fri,  6 Dec 2019 09:25:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1575584716;
        bh=Ejh9iBh3ag+152PoDCF8gcjANJaspPs1uplexIw40sk=;
        h=Date:From:To:Cc:Subject:From;
        b=N9rHPKciPcR3XwIfHTXgRDVe+UA0Vf04c+7N5yUtr+crYrpUI+SD6kCBV8z3aclBF
         dflfXESC9Y8bo9/YC5EC7kFBcLYvt7HjpMvRFxOy8tGEOVqYj3B2qhoxVnkoQYpOhr
         tXp051Sq/UqybHHLMzLxnZV1tok7C5Pzhy/ueiqS+j5J2sAJYTe+tV3o4VH89GSD7s
         IWVHoli75S20jNEepOQ3iPs0Xku1Eg5zcEe8kVkZQ1ovCuaZdvlGh7ebp0UZhwB3HJ
         QPxYE4MoWdsszZs01g02naCPLj91J8aQjAGsWlGw5uZNvF0pIwZdYlJgegjsBELl/t
         WtpmCZqUiMeyw==
Date:   Fri, 6 Dec 2019 09:25:03 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Petr Mladek <pmladek@suse.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: linux-next: build failure after merge of the printk tree
Message-ID: <20191206092503.303d6a57@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XmPSbCkYiN4/ZDkVNyp5qv+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/XmPSbCkYiN4/ZDkVNyp5qv+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the printk tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

kernel/trace/trace.c: In function 'register_tracer':
kernel/trace/trace.c:1892:3: error: implicit declaration of function 'pr_wa=
rning'; did you mean 'pr_warn'? [-Werror=3Dimplicit-function-declaration]
 1892 |   pr_warning("Can not register tracer %s due to lockdown\n",
      |   ^~~~~~~~~~
      |   pr_warn

Caused by commit

  55130ba7f010 ("printk: Drop pr_warning definition")

interacting with commit

  a356646a5685 ("tracing: Do not create directories if lockdown is in affec=
t")

from Linus' tree.

I have applied the following merge fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 6 Dec 2019 09:21:57 +1100
Subject: [PATCH] fix up for "printk: Drop pr_warning definition"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 kernel/trace/ring_buffer.c | 2 +-
 kernel/trace/trace.c       | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 4bf050fcfe3b..3f655371eaf6 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -5070,7 +5070,7 @@ static __init int test_ringbuffer(void)
 	int ret =3D 0;
=20
 	if (security_locked_down(LOCKDOWN_TRACEFS)) {
-		pr_warning("Lockdown is enabled, skipping ring buffer tests\n");
+		pr_warn("Lockdown is enabled, skipping ring buffer tests\n");
 		return 0;
 	}
=20
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 23459d53d576..6c75410f9698 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -1889,7 +1889,7 @@ int __init register_tracer(struct tracer *type)
 	}
=20
 	if (security_locked_down(LOCKDOWN_TRACEFS)) {
-		pr_warning("Can not register tracer %s due to lockdown\n",
+		pr_warn("Can not register tracer %s due to lockdown\n",
 			   type->name);
 		return -EPERM;
 	}
@@ -8796,7 +8796,7 @@ struct dentry *tracing_init_dentry(void)
 	struct trace_array *tr =3D &global_trace;
=20
 	if (security_locked_down(LOCKDOWN_TRACEFS)) {
-		pr_warning("Tracing disabled due to lockdown\n");
+		pr_warn("Tracing disabled due to lockdown\n");
 		return ERR_PTR(-EPERM);
 	}
=20
@@ -9244,7 +9244,7 @@ __init static int tracer_alloc_buffers(void)
=20
=20
 	if (security_locked_down(LOCKDOWN_TRACEFS)) {
-		pr_warning("Tracing disabled due to lockdown\n");
+		pr_warn("Tracing disabled due to lockdown\n");
 		return -EPERM;
 	}
=20
--=20
2.24.0

--=20
Cheers,
Stephen Rothwell

--Sig_/XmPSbCkYiN4/ZDkVNyp5qv+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3pg78ACgkQAVBC80lX
0GyFLgf+KxqtMwAE/qH+G3dZN5VNNta2tlOcS8QJ5BAbSFBnrUDf1mCJ0S79REYa
5OwGJKIS8RB9QmN4lcOPE1zNNqZk9tzvWuB153ranWdwQw4j54c7VljwZGvKEnK6
Ey/JemkvESN7vraP4T4DYpgeMkVnVENbUH0BfbniZllL6moT/yGmrydxVwwLOt/y
CpqDAcYaqBl5laGvU+7GAD30n/L0BPjeF46R7HD0RrjGgH6YTBESfbnIv8Pxy8ak
RM1ebiAwUq2V8KuL7pEkrZw8rAqH/Rdjpd4Up2MWHVmFjZyjnkkRh338p86VBnyV
Ki1f7JB84t3OhBOIJnZa7Tl1UKs4+w==
=IK3o
-----END PGP SIGNATURE-----

--Sig_/XmPSbCkYiN4/ZDkVNyp5qv+--
