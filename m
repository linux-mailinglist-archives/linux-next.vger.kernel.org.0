Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABDC0390FD6
	for <lists+linux-next@lfdr.de>; Wed, 26 May 2021 06:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbhEZE4W (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 26 May 2021 00:56:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbhEZE4W (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 26 May 2021 00:56:22 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E42CC061574;
        Tue, 25 May 2021 21:54:51 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fqdsj0Jx5z9s1l;
        Wed, 26 May 2021 14:54:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1622004889;
        bh=mky7HqGKTeYNHK+D2DYXfLXJPoLv2WLg+Sik6dMH+s0=;
        h=Date:From:To:Cc:Subject:From;
        b=kHZHgzRnizvbFQgE+E4o0I6I6UKtOVEVX+Q1gTIQZPIYWw/Xe6cExL6B7euTWM0GA
         oppOGyJLyq5KyYWQoW8cwqZRL88UMR6B+9zeFY3KRbwUwKqcHwyuZMdOBq/xcL3eQY
         qamgLWZvIzLp8VMnTOI9CL2NZTB9gBzLr9ce06BlK3GrPxP8XKx31d4rYtkEtg3RfW
         d1FC2YvsT1l8zBh2oRv1J0VMz8c2I3nDCdyI00Se/8ibvJ8UXWIQYU6Sw8YP32OTUz
         WtZ8OSOCTyijGcUHPvp12WrP8/fqNKsyjT6lM87geP++nRk6pqfQW5V2qZWs8ofW0o
         yObgd0i22122A==
Date:   Wed, 26 May 2021 14:54:48 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Alexey Gladkov <legion@kernel.org>,
        Amir Goldstein <amir73il@gmail.com>, Jan Kara <jack@suse.cz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the userns tree with the origin tree
Message-ID: <20210526145448.38544cd6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VjAvu3bSBnh5D5=Qxdd1qE/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/VjAvu3bSBnh5D5=Qxdd1qE/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the userns tree got a conflict in:

  kernel/ucount.c

between commit:

  5b8fea65d197 ("fanotify: configurable limits via sysfs")

from the origin tree and commits:

  21d1c5e386bc ("Reimplement RLIMIT_NPROC on top of ucounts")
  6e52a9f0532f ("Reimplement RLIMIT_MSGQUEUE on top of ucounts")
  d64696905554 ("Reimplement RLIMIT_SIGPENDING on top of ucounts")
  d7c9e99aee48 ("Reimplement RLIMIT_MEMLOCK on top of ucounts")

from the userns tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/ucount.c
index 8d8874f1c35e,df84a2a63926..000000000000
--- a/kernel/ucount.c
+++ b/kernel/ucount.c
@@@ -73,11 -79,11 +79,15 @@@ static struct ctl_table user_table[] =3D=20
  #ifdef CONFIG_INOTIFY_USER
  	UCOUNT_ENTRY("max_inotify_instances"),
  	UCOUNT_ENTRY("max_inotify_watches"),
 +#endif
 +#ifdef CONFIG_FANOTIFY
 +	UCOUNT_ENTRY("max_fanotify_groups"),
 +	UCOUNT_ENTRY("max_fanotify_marks"),
  #endif
+ 	{ },
+ 	{ },
+ 	{ },
+ 	{ },
  	{ }
  };
  #endif /* CONFIG_SYSCTL */

--Sig_/VjAvu3bSBnh5D5=Qxdd1qE/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCt1JgACgkQAVBC80lX
0GwRcwf/SHLS4BHl1YFFvhkEdp6p/daDOvfOss+kz9cXJywjIsRfmMSaL1N5ECZS
q5qmGr1jRgRzCqb5r4jYqU01/v2Pj3g7oAR4R+SudXwWYhZoRNe1d/39nHRxE1LI
KbEAtre09GcXsGpao2VMewTRWinXHmvZMUDYtg5IutWOpUJAcca+Rden6yBNiECI
6WTSGbv+o9Cdv3hOJRKO3vk+ag0KHLCKR1F1dk4E2LI8fKymM+mc1SV/WS1mTAUa
mFs1UANUa1gBuasNjExJXnqKoeTio3IgVWAGeWtyLfFJSB/wdKfqXkHDSzhYR+UC
2AU7b0hAQc7o8ArTAW4W9vEVyrllnQ==
=WGCP
-----END PGP SIGNATURE-----

--Sig_/VjAvu3bSBnh5D5=Qxdd1qE/--
