Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C9FF41405C
	for <lists+linux-next@lfdr.de>; Wed, 22 Sep 2021 06:19:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231418AbhIVEUo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Sep 2021 00:20:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbhIVEUo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Sep 2021 00:20:44 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04110C061574;
        Tue, 21 Sep 2021 21:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632284351;
        bh=FpOQmAQfbrx4naj3vA07UVKWcp9yQfMklG6Z/QyO/NE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=LOad4n4HPbVs7N8RWk35HhxerW6LVhkLmo9mLxah1YmXscFuxMJlrIVoOsWteKow8
         YGZhiuXsvAV8nxM/7vDtNEXOwtE+LromlcZuVssLXXc5dE7rxqz8Bkr1wE4fVVEBNX
         CtHk8tlXM51wTvVyc44zX6DunxSOpz2MCnfJu+/CUURpmYW3PGE+FhhDuib1K32B5s
         qCPo/Ej+Y9StkHJkroPAzO3QsLzEif1P8essqAgg1bxMobiMT7VX1aMt2EdE5m0Fvs
         0lheB87Umca7i7ZJ5eUK8MkPbEMetYd8gph/mw1llv9JoMxBErUFHRlSX+5htnNXfT
         c4zVu0nyYKMRg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HDlRg40LLz9sPf;
        Wed, 22 Sep 2021 14:19:11 +1000 (AEST)
Date:   Wed, 22 Sep 2021 14:19:10 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Matthew Wilcox <willy@infradead.org>,
        David Howells <dhowells@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the folio tree
Message-ID: <20210922141910.778a5a86@canb.auug.org.au>
In-Reply-To: <20210921142628.75ba9ef2@canb.auug.org.au>
References: <20210921142628.75ba9ef2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5=8Zn9c1jr3Xzru1ug9MMqI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/5=8Zn9c1jr3Xzru1ug9MMqI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 21 Sep 2021 14:26:28 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the folio tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> fs/9p/vfs_file.c: In function 'v9fs_vm_page_mkwrite':
> fs/9p/vfs_file.c:557:6: error: implicit declaration of function 'wait_on_=
page_bit_killable'; did you mean 'wait_on_page_locked_killable'? [-Werror=
=3Dimplicit-function-declaration]
>   557 |      wait_on_page_bit_killable(page, PG_writeback) < 0)
>       |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>       |      wait_on_page_locked_killable
>=20
> Caused by commit
>=20
>   be8f72914261 ("mm/filemap: Add folio_wait_bit()")
>=20
> interacting with commit
>=20
>   82766b47b26c ("9p: (untested) Convert to using the netfs helper lib to =
do reads and caching")
>=20
> from the fscache tree.
>=20
> I have applied the following merge fix patch.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 21 Sep 2021 14:18:06 +1000
> Subject: [PATCH] fix up for "9p: (untested) Convert to using the netfs he=
lper
>  lib to do reads and caching"
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  fs/9p/vfs_file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/fs/9p/vfs_file.c b/fs/9p/vfs_file.c
> index 4b617d10cf28..68d05b2aa290 100644
> --- a/fs/9p/vfs_file.c
> +++ b/fs/9p/vfs_file.c
> @@ -554,7 +554,7 @@ v9fs_vm_page_mkwrite(struct vm_fault *vmf)
>  #endif
> =20
>  	if (PageWriteback(page) &&
> -	    wait_on_page_bit_killable(page, PG_writeback) < 0)
> +	    folio_wait_bit_killable(page_folio(page), PG_writeback) < 0)
>  		return VM_FAULT_RETRY;
> =20
>  	/* Update file times before taking page lock */

This fix patch now looks like this:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 22 Sep 2021 14:16:55 +1000
Subject: [PATCH] fix up for "9p: Convert to using the netfs helper lib to d=
o reads and caching"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/9p/vfs_file.c | 4 ++--
 1 file changed, 2 insertion(+), 2 deletion(-)

diff --git a/fs/9p/vfs_file.c b/fs/9p/vfs_file.c
index 7ed76a4c18f1..0f99ec49006e 100644
--- a/fs/9p/vfs_file.c
+++ b/fs/9p/vfs_file.c
@@ -549,12 +549,12 @@ v9fs_vm_page_mkwrite(struct vm_fault *vmf)
 	 */
 #ifdef CONFIG_9P_FSCACHE
 	if (PageFsCache(page) &&
-	    wait_on_page_bit_killable(page, PG_fscache) < 0)
+	    folio_wait_bit_killable(page_folio(page), PG_fscache) < 0)
 		return VM_FAULT_RETRY;
 #endif
=20
 	if (PageWriteback(page) &&
-	    wait_on_page_bit_killable(page, PG_writeback) < 0)
+	    folio_wait_bit_killable(page_folio(page), PG_writeback) < 0)
 		return VM_FAULT_RETRY;
=20
 	/* Update file times before taking page lock */

--=20
Cheers,
Stephen Rothwell

--Sig_/5=8Zn9c1jr3Xzru1ug9MMqI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFKrr4ACgkQAVBC80lX
0GwlNQf+MrgYQexE7drK7CGTJiy9H7sEktu0yEsMlb5nJtACPua9m6orhcXVZfvG
zk+DegmY2oM9tnOJMx+WbmVKTOgopPbAfPTPtN1wvk8lM+6bfsEOdY7PbaVEvGEU
cE83r8030d5cNi7CLiZrcip0y9oFXEkCPMJ24iXhMItWJWEUL5vxNXdTj18qPiX3
OMIQx9Re/UWCMkIlLWWOV+OCIln+gOEBUeQ7x7F9moDBdILmpOSUlyOoydQwLIHA
vqOnE83XwGMgOrMb1DZIi32+1uxpcURs0pacTr69nQqsP3prn5xnU0cfMi0F1Hfs
mqVLU6a6dBhyBIvFzim+IR1zJdoAWQ==
=+0FA
-----END PGP SIGNATURE-----

--Sig_/5=8Zn9c1jr3Xzru1ug9MMqI--
