Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAEF929E298
	for <lists+linux-next@lfdr.de>; Thu, 29 Oct 2020 03:28:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391063AbgJ2C2B (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Oct 2020 22:28:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726741AbgJ2C1Q (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 28 Oct 2020 22:27:16 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DB1DC0613D1;
        Wed, 28 Oct 2020 19:27:16 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CM8Tt0y8qz9sSP;
        Thu, 29 Oct 2020 13:27:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1603938434;
        bh=qqhYDfTujJwdVBXaSSb2YFQC0S6Q2q23ysK48Vkck80=;
        h=Date:From:To:Cc:Subject:From;
        b=lEwzBWmj9fwf3iaILLAOtwoQVQxRiKkCX7/L4ZxRIrlSliPvqR1VV4PIa1SPSjbqT
         WgCnFEZYw8G5spRZaV+tqw1BgQLJQzTd3aM3wmNNWXmFTFZoZG+AMoPNQsUA9KUVtk
         wYInj4SesakrV2ZTsegYszSlE8ta5huLhQF/WtGkDG5lg5tk/cke6JhbowLvAsdUb3
         ioGfETJ1BtFeT+fXJJQovTJv2ewJc+MEDFKN/zP8ax2x22acADcFHSVu8UWW5ddjRr
         yKL+P3aeAebR/0+zA3ie4rw0GRN1dJdSse69ef2VKTnPAmrpen+A1T2MuYSNk8/zQc
         ovidjQQY1x5Ww==
Date:   Thu, 29 Oct 2020 13:27:13 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Shuah Khan <shuah@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Tommi Rantala <tommi.t.rantala@nokia.com>
Subject: linux-next: manual merge of the staging tree with the
 kselftest-fixes tree
Message-ID: <20201029132713.3a41c80b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/d35kO8jI.RSkMpiDUkf20Rm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/d35kO8jI.RSkMpiDUkf20Rm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the staging tree got conflicts in:

  tools/testing/selftests/android/ion/ipcsocket.c
  tools/testing/selftests/android/ion/ipcsocket.h

between commit:

  08c5d41130e5 ("selftests: android: fix multiple definition of sock_name")

from the kselftest-fixes tree and commit:

  e722a295cf49 ("staging: ion: remove from the tree")

from the staging tree.

I fixed it up (I just removed the files) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/d35kO8jI.RSkMpiDUkf20Rm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+aKIEACgkQAVBC80lX
0Gzl3Qf/bQ2nHI9Ym7iXOSoKjZendsvnZAqNwk9DyU/tCvAqwbD1B7fklU9AVAnQ
gAMpMkXWd9PLIMdmF2hlRg8b2VSBbnuryD1neOJRGUN5XkkbSFwuLOLSwqCxp4ME
kuSESzPHRc3Ll03VUMehUfACk5rd9Dp9xKqzHDs7+1bb7RyDlZxjar2IABlp248+
+wlfX80RJa2FayyDxt9zUopRq7GTeTb9LqZS00pdyi2hxpeSq+xCgbDH/xL6bG8o
slv0CKdTMKtsMXn8ij+aIXJ4k0tEq8JknNxiXtSkEqFK7DVOVFTtPwnNWuVNwTwS
pTKPAVH1sQspbzbqWmsGf05DaxsTfg==
=k/7X
-----END PGP SIGNATURE-----

--Sig_/d35kO8jI.RSkMpiDUkf20Rm--
