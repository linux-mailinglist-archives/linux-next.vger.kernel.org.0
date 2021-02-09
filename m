Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D048D314CB6
	for <lists+linux-next@lfdr.de>; Tue,  9 Feb 2021 11:17:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbhBIKQg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Feb 2021 05:16:36 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:41407 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231239AbhBIKJ1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 9 Feb 2021 05:09:27 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DZdrr4jM0z9sVX;
        Tue,  9 Feb 2021 21:08:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612865324;
        bh=/SoBVY0DwnmgqVEpAvVXXUjz5nrTYZHSVN+Li9R+fZg=;
        h=Date:From:To:Cc:Subject:From;
        b=dSTQ5QbFTlFIRI1ezMy9sqfRM6VE4tWndSudl8BZ7RqinnDyrstn7liHTLVJK0xwx
         /lEyBZRZDCqc/L4C9dfarNTzlToQaTn9hq73fGEKI+T7Id0X6PbQZGPu5mYLtRyX1w
         GRQ6liy42iBgLpB3U6vJ653txUnwRSw3OTM1v6Z3h5Sx1h+g1KZOCbuj7vyi6aythW
         +ftlAmSoNvhVRyrghfGhT0t/0ytByGfX+WFAodvhSy3hSoR0YLVcjj6ECDXB4Ce2+Q
         SK0BBDbbc4MlI2Y7yT0xalzGJYng0xsndGIOfCp++2/rsk5/SRmVuajwjhAWnJPeZh
         PNjtLI6cV3HNg==
Date:   Tue, 9 Feb 2021 21:08:43 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jessica Yu <jeyu@kernel.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the modules tree
Message-ID: <20210209210843.3af66662@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/j9i=zWo53.+8wjPox=w_cyC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/j9i=zWo53.+8wjPox=w_cyC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the modules tree, today's linux-next build (powerpc
allyesconfig) failed like this:

In file included from include/linux/export.h:123,
                 from include/linux/linkage.h:7,
                 from arch/powerpc/include/asm/unistd.h:18,
                 from <stdin>:2:
./include/generated/autoksyms.h:5:9: warning: missing whitespace after the =
macro name
    5 | #define __KSYM_.HT_update_self_and_peer_setting 1
      |         ^~~~~~~
./include/generated/autoksyms.h:6:9: warning: missing whitespace after the =
macro name
    6 | #define __KSYM_.RemovePeerTS 1
      |         ^~~~~~~
./include/generated/autoksyms.h:6: warning: "__KSYM_" redefined
    6 | #define __KSYM_.RemovePeerTS 1
      |=20
./include/generated/autoksyms.h:5: note: this is the location of the previo=
us definition

and on and on :-(

Caused by commit

  367948220fce ("module: remove EXPORT_UNUSED_SYMBOL*")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/j9i=zWo53.+8wjPox=w_cyC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAiXysACgkQAVBC80lX
0GwJTgf9Eb64fcnjZcIlXzRtYKmKfmdlb00alNAxjocUa9bFG01DpfLTVdLo/n5r
kabCE3yqmAU8S0hrLawjDomUd4dMzen7QQpBxapEv7Ah6fSY3eBLCKms8aWZoo/b
+UiJJllO6lZOtYMUBv6jFBlR8ny4CgrpE1pfdtDjvZ+QTTxMMJYcbc9poVzvo9ZP
aWOcNQOI/vt9/QXHUiPIzWIK2Arg+W5ECnT+bLA9S2iOG2c0SkcZwovZAe/i6tff
pNImEJPz2LyKkScDYelCF+0pz7+vODZvvORPlC/gCBxrU0ZXoZV4zP5UvdBRzsxe
jG1kM9AYnVzw/i6o3vaUhQTW84we1A==
=AwX1
-----END PGP SIGNATURE-----

--Sig_/j9i=zWo53.+8wjPox=w_cyC--
