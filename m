Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2860D2765F5
	for <lists+linux-next@lfdr.de>; Thu, 24 Sep 2020 03:40:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgIXBkn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Sep 2020 21:40:43 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:51983 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725208AbgIXBkm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 23 Sep 2020 21:40:42 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bxd6b1fPhz9ryj;
        Thu, 24 Sep 2020 11:40:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600911655;
        bh=S5moutHrYyrB6oZvEL9lcO+WjqUQlH3yZsiPkhPr52s=;
        h=Date:From:To:Cc:Subject:From;
        b=NaMjZDNpoEbAUAuaL2+KS91oum5hZJ0yu4UbCPjD1geduj6p4Y9Uc0ne/KQKWxsRc
         LsR1ADHSiH5gVMBi3dHfNYVcEyksd7TS05LfsRS0FDrW4JFD349IF6QQVNCnlIOqjL
         jNVuzvWszeFCVQw7L/si8nljQGW6qjRx9RFiF+pU1UOT/VeUsWZvNbFSlxicEQ9Dws
         DrKi18yZCpEhvtBLQYexRnD77sfFIYo3eQdsm8UR+kSBsowo39tn6OUMyjzRaJJy33
         kXi0jVaIqYvkS9Bp01I2FpMCqfrYBqlrhBPX9aaDbSIRIld3GbJa4bzz/1m0H7/7jg
         SUCwoCmlPuSbw==
Date:   Thu, 24 Sep 2020 11:40:50 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Josh Poimboeuf <jpoimboe@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the vfs tree
Message-ID: <20200924114050.3b6f82b4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rpd_KjS5kOdFi5IqGdVryNY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/rpd_KjS5kOdFi5IqGdVryNY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

lib/strnlen_user.o: warning: objtool: strnlen_user()+0xf3: call to do_strnl=
en_user() with UACCESS enabled
lib/strncpy_from_user.o: warning: objtool: strncpy_from_user()+0x188: call =
to do_strncpy_from_user() with UACCESS enabled

Introduced by commit

  e33ea6e5ba6a ("x86/uaccess: Use pointer masking to limit uaccess speculat=
ion")

--=20
Cheers,
Stephen Rothwell

--Sig_/rpd_KjS5kOdFi5IqGdVryNY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9r+SIACgkQAVBC80lX
0Gzl3AgApOZP8f9Ti2J3ZIsieBxMGf90R7IJki2ojiwu+yRTpcmw6awTlJxLuYs8
FeEFMV7hUGzi3RM7Hmu0a4dSqH/fiWWzt+JxCp1heZLfMNCYYg1Kk+t94PxUjI6X
/10f2zh4fm2uGEaOL/ma+edOtjVAKaCV2Ly2O6asUaP1yp4+cejaQ/tlR7vC4/rm
++EeBUVbeTMBBJvU1SijE6qhP0OJwcVATyxfrSvdapYUhHg7WQZsbUm1TPsasLtI
Jnd230nJrWR47mGF8/2hs4D72xWZXieCrFjCrqCh5DRZjFk6z5lJAcWdtjzjM/iW
0my0PDsEo8VdwxBsXks8IJmPlPo1Ug==
=eR7e
-----END PGP SIGNATURE-----

--Sig_/rpd_KjS5kOdFi5IqGdVryNY--
