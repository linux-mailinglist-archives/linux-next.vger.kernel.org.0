Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 900A3431225
	for <lists+linux-next@lfdr.de>; Mon, 18 Oct 2021 10:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbhJRIby (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Oct 2021 04:31:54 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:42743 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229820AbhJRIby (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 Oct 2021 04:31:54 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HXqmj4s4Bz4xbT;
        Mon, 18 Oct 2021 19:29:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634545782;
        bh=It3hFh75EWdaSrblOEeRmbA3hm969xn3FcN5G2/xSpw=;
        h=Date:From:To:Cc:Subject:From;
        b=uua6/4gdBpVMVKwzzawhRkFXJ7qAOsVHyUMi24bqFmaFm2KwmlUIO1QvwgMFmPyez
         7UlRRF/62kOhRiCf4NwaKPGl0NqJ8sPKBfNMAfkM9Y7UEc0nO/Oa6ZnyoeWCWux+ux
         ZrbW3aQ6VdW94P7ZA2XwZ2QyQEC4MLiI8S6uDr5hX61TrvEZZhZVVgSsVbEWK6Nt9r
         6HrdPGa/xB/HP4bcCIkg3kNVUEdVqMagEh/5YIHlI/Hym+gk5vXURpUb/srO5PAZqa
         fPIBi2nhsP21CQL3U+kAHPUtazJ1kLMonne4lx0IdE841Wg/nWA40djf9fCvqV1naX
         /hijtFDf4ITRg==
Date:   Mon, 18 Oct 2021 19:29:40 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Masami Hiramatsu <mhiramat@kernel.org>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20211018192940.3d1d532f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Mt0ujaPJ7AjyfRm5TX1_R6j";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Mt0ujaPJ7AjyfRm5TX1_R6j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (x86_64
allmodconfig) failed like this:

init/main.c: In function 'xbc_make_cmdline':
init/main.c:384:3: error: implicit declaration of function 'memblock_free_p=
tr'; did you mean 'memblock_free_late'? [-Werror=3Dimplicit-function-declar=
ation]
  384 |   memblock_free_ptr(new_cmdline, len + 1);
      |   ^~~~~~~~~~~~~~~~~
      |   memblock_free_late
cc1: all warnings being treated as errors

Caused by commit

  d6e96e5e2e23 ("memblock: use memblock_free for freeing virtual pointers")

interacting with commit

  1ae43851b18a ("bootconfig: init: Fix memblock leak in xbc_make_cmdline()")

from Linus' tree.

I have applied the following merge fix patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 18 Oct 2021 19:25:44 +1100
Subject: [PATCH] fixup for "memblock: use memblock_free for freeing virtual
 pointers"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 init/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/init/main.c b/init/main.c
index 9b7fdd04e8cb..2851ebbe1985 100644
--- a/init/main.c
+++ b/init/main.c
@@ -381,7 +381,7 @@ static char * __init xbc_make_cmdline(const char *key)
 	ret =3D xbc_snprint_cmdline(new_cmdline, len + 1, root);
 	if (ret < 0 || ret > len) {
 		pr_err("Failed to print extra kernel cmdline.\n");
-		memblock_free_ptr(new_cmdline, len + 1);
+		memblock_free(new_cmdline, len + 1);
 		return NULL;
 	}
=20
--=20
2.33.0

--=20
Cheers,
Stephen Rothwell

--Sig_/Mt0ujaPJ7AjyfRm5TX1_R6j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFtMHQACgkQAVBC80lX
0Gw8sgf/XmyJ8lMYquuyjZAGfvEnU6MDmECHMEW3sT2d34rbdLkXRaRuE/PaG8B+
kNYoURrLLm02cAnGrkrvk2AXYPpEJTtclqzd+pf7/quYTK6ixkvPw9Fhfi/LY9vP
QT3qGC8qisEhV64N9DkgyBoCKG2dz5ynKsbpZ+TAmpRza5QutIQ/WR8wFkNKc+OC
1UvkesowvY677SU90pVWCKUfbstGhUR5Ldfwj1LZUMJpF/WadISebZc7YFkF+hHB
rbbbJ19zbozQVjL5RDlJWeMYUuTqPdenlIja6V971sIk3qquNCOt+VR6V/bL5426
Zd2pw6Aj0s+yxB6snvT5Sh1tFyEtgw==
=bMnQ
-----END PGP SIGNATURE-----

--Sig_/Mt0ujaPJ7AjyfRm5TX1_R6j--
