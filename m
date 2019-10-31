Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65C46EAA70
	for <lists+linux-next@lfdr.de>; Thu, 31 Oct 2019 06:43:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbfJaFnl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 31 Oct 2019 01:43:41 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:44701 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726321AbfJaFnl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 31 Oct 2019 01:43:41 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 473Z4S3hWXz9sCJ;
        Thu, 31 Oct 2019 16:43:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1572500617;
        bh=4tX0YNHPXUIIEYJsc1hzCYM22rQSJ6RboQ5s8rNjCWQ=;
        h=Date:From:To:Cc:Subject:From;
        b=eupzgewXX5mD6Kz3omiK4fgj0wlKxSsYyv6eRESUT0qLKRp0PBLTMtmefm6uatUeB
         jK0ul6HqYVPThRsF4QpWbBQFYzjjh9a8LDOy3vod6b2I/3IrlNMtrvDj6GR9JWDMZC
         1OCLaVXo2n/hrtwm1PgvFNhS85a7c8vUUGi15UmHhNdC0Em94ThCYCQhWMNJe8qoOH
         tdG4M/vFtVoNRkN0CfmM9Oira1Z0griK42TcRHk+NXtOI3/U2mRVhyfnXYjUpkVu66
         Yb6KO815eaowDuKl0Sn6HCOYICOV+HevtEPA2zy3BxUz0Z7Loa17PYQxUQg+YzFoiI
         GtuoZrL8DIAYA==
Date:   Thu, 31 Oct 2019 16:43:23 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Julien Grall <julien.grall@arm.com>
Subject: linux-next: manual merge of the akpm-current tree with the tip tree
Message-ID: <20191031164323.67a3414e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Lxfq+_MFYUV4qymGCEE4Skq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Lxfq+_MFYUV4qymGCEE4Skq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  lib/ubsan.c

between commit:

  9a50dcaf0416 ("ubsan, x86: Annotate and allow __ubsan_handle_shift_out_of=
_bounds() in uaccess regions")

from the tip tree and commit:

  edbefc568464 ("lib/ubsan: don't serialize UBSAN report")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc lib/ubsan.c
index 0c4681118fcd,39d5952c4273..000000000000
--- a/lib/ubsan.c
+++ b/lib/ubsan.c
@@@ -374,12 -359,11 +359,12 @@@ void __ubsan_handle_shift_out_of_bounds
  	struct type_descriptor *lhs_type =3D data->lhs_type;
  	char rhs_str[VALUE_LENGTH];
  	char lhs_str[VALUE_LENGTH];
 +	unsigned long ua_flags =3D user_access_save();
 =20
  	if (suppress_report(&data->location))
 -		return;
 +		goto out;
 =20
- 	ubsan_prologue(&data->location, &flags);
+ 	ubsan_prologue(&data->location);
 =20
  	val_to_string(rhs_str, sizeof(rhs_str), rhs_type, rhs);
  	val_to_string(lhs_str, sizeof(lhs_str), lhs_type, lhs);
@@@ -402,9 -386,7 +387,9 @@@
  			lhs_str, rhs_str,
  			lhs_type->type_name);
 =20
- 	ubsan_epilogue(&flags);
+ 	ubsan_epilogue();
 +out:
 +	user_access_restore(ua_flags);
  }
  EXPORT_SYMBOL(__ubsan_handle_shift_out_of_bounds);
 =20

--Sig_/Lxfq+_MFYUV4qymGCEE4Skq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl26dHsACgkQAVBC80lX
0GwMHAgAmfLeQgjWZxcFDyZUhIN6o0S5dxwaOfHfx5TDc4MjgODz5D+X+G6/Qs8y
MP6h44zinuOtix1aHAYpWCvIW6B5gCeBfzsk6kMKzbgsUVL32jva50CDzGx1xZRU
sKB34TqB1cPPo6bN6MBhw4KuIrn4e1v0zeFsxUPjsr0Nvh3lEzdW2GyKgVW/OgJF
Gh7TaKYsXZ4h67s7Wp3nuQ8Jdel7E/TW+OIf3eQA6XhAsffcScTm65QanSexZwvY
LpbveSDwJxlpynYdRFNKzAaHpHvW5rCxOdyOV1+aeFC8SPwfpCWAEtkfjJS9ejEf
l1ao4kd6USkUHVj/c8HQg2IFo9YWdA==
=846c
-----END PGP SIGNATURE-----

--Sig_/Lxfq+_MFYUV4qymGCEE4Skq--
