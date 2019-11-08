Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61055F3FFD
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2019 06:31:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725372AbfKHFbN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 Nov 2019 00:31:13 -0500
Received: from ozlabs.org ([203.11.71.1]:38671 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726149AbfKHFbN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 8 Nov 2019 00:31:13 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 478TQR0GF3z9sP3;
        Fri,  8 Nov 2019 16:31:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573191071;
        bh=WX1xar34mugjR8hwWAsNRl8JjX4ByCNHgvHj3Fqxa4w=;
        h=Date:From:To:Cc:Subject:From;
        b=abEsFAeaoTIJ4WjjXP7ipPYlz3AtR1YaUHOKhmsrJGeQgcmnaXciiWkoU609jlh5O
         o5abaZc0Hyz8tyy3BuBFjPZLJRWXDGSt9EviWj/dIEevR5+3UzmagvzqhoK6fse3Uj
         lZtZGii65EjqjKtu+uKMcBESrPhAl2M277/PLzJ2RR2TsWpRDvnF7yIExozoi+Jhx5
         tbe5hhHreLyuWgKn7dE0882/lBziGBNwMpdgm4gJVgNaIou7IdfAcCHIo+V9iijhl+
         XMI1BzPs8vYeNtC9W4yFO3ML9ZnDfQuPGXX54druTwywVRHQVSaOZgP27XdSQYp+/R
         6L+02r9P/epTg==
Date:   Fri, 8 Nov 2019 16:31:10 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
        Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: linux-next: build failure after merge of the amdgpu tree
Message-ID: <20191108163110.32c19752@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/A6rr2udD1QpJwlja/idWAq5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/A6rr2udD1QpJwlja/idWAq5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (powerpc
allyesconfig) failed like this:

In file included from <command-line>:
include/drm/gpu_scheduler.h:98:21: error: field 'entity_idle' has incomplet=
e type
   98 |  struct completion  entity_idle;
      |                     ^~~~~~~~~~~

followed by lots of similar errors.

Caused by commit

  83a7772ba223 ("drm/sched: Use completion to wait for sched->thread idle v=
2.")

I added the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 8 Nov 2019 16:21:32 +1100
Subject: [PATCH] drm/sched: struct completion requires linux/completion.h
 inclusion

Fixes: 83a7772ba223 ("drm/sched: Use completion to wait for sched->thread i=
dle v2.")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/drm/gpu_scheduler.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 6619d2ac6fa3..684692a8ed76 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -26,6 +26,7 @@
=20
 #include <drm/spsc_queue.h>
 #include <linux/dma-fence.h>
+#include <linux/completion.h>
=20
 #define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
=20
--=20
Cheers,
Stephen Rothwell

--Sig_/A6rr2udD1QpJwlja/idWAq5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3E/Z4ACgkQAVBC80lX
0GyIRwf/TncAN2VRdRFXpqn8Dzh1BKK3wdL57BS939CAtVGWsRneQDXPuVYXF06/
A8cr6bru5QjdrPpK0vhVOBTg0oVA6G9BDhKYcnOr6bQeXanJaEz3+5sL5XaZ87rg
XKY/EgAYhEwWeEDBS1c6TKhGd47YYVE5nib+ogj9h81YwlL33b2KTwJZ4QJ39tSu
NTZQAR1Ui2pEpZmcZ1VovwM179pWYP/gHLeM3PCapY562sLeWB9hegUIA6dGOSmf
iegxZbaVX87WRL786ILsUVgUbRRBqsLLLsXa5J+FrFyvai1cwHnO+bY8TU3qGdEO
cc58UnqRL6gx48QinUjvRCbyVx1JBw==
=iGUD
-----END PGP SIGNATURE-----

--Sig_/A6rr2udD1QpJwlja/idWAq5--
