Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56ECA3071E5
	for <lists+linux-next@lfdr.de>; Thu, 28 Jan 2021 09:49:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231350AbhA1Iq3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Jan 2021 03:46:29 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:58793 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231377AbhA1IqS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 28 Jan 2021 03:46:18 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DRDbX4gcDz9sVF;
        Thu, 28 Jan 2021 19:46:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611823592;
        bh=I4nxG7IMxLIT36FSu452hCBmTP4QGyNgoR3QBLaSwIc=;
        h=Date:From:To:Cc:Subject:From;
        b=FnRy1OxEIFidI7/4Wq+6r5BZnTq8gaV7UrsY0w4uQ8qi2zxIdyqb9kZLgzttJyxOk
         X9y0nmkr5O9TKA7ASr6cFioRpSm9O2UN7nm36Pgu1mc9kMJ1q0MTMIcWsgaEkI1D6h
         DJt2LqNzKgzIo+0J6GV1Tvb8daXpNdzFq5Jccja0ULPsNwZ+lkgTlsEb0xFUodClFU
         hR7f7taetVDpUQJ7en+/CLX+Wd114/Ksv74z+t8jEV6/tAYbgdtcmNCKOGx8cAsOo7
         wMGl+wOZxJlOoMnQAhj0SvRd3g6J8OfFgqQ2leNaOl0TLVADP1cXlA+fW9zydrX3Cn
         7oxfw1HjxuGtA==
Date:   Thu, 28 Jan 2021 19:46:31 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Vijayanand Jitta <vjitta@codeaurora.org>,
        Vinayak Menon <vinmenon@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the akpm tree
Message-ID: <20210128194631.13e14818@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yAAHW/0L8Nk5t3QC=k5eK+V";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/yAAHW/0L8Nk5t3QC=k5eK+V
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

lib/stackdepot.c: In function 'is_stack_depot_disabled':
lib/stackdepot.c:154:2: warning: ignoring return value of 'kstrtobool' decl=
ared with attribute 'warn_unused_result' [-Wunused-result]
  154 |  kstrtobool(str, &stack_depot_disable);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  b9779abb09a8 ("lib: stackdepot: add support to disable stack depot")

Interestingly, we have 2 declarations of kstrtobool - one in
linux/kernel.h (which has __must_check) and one in linux/strings.h
(which doesn't).

--=20
Cheers,
Stephen Rothwell

--Sig_/yAAHW/0L8Nk5t3QC=k5eK+V
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmASeecACgkQAVBC80lX
0GwzUwf+JHnkAnD5L8UG/gmcYHmmCw1l+2u5bzfriZS5ZTB2Vq3k4/7ZNXPHb+Xs
xweotl4vZAJZu9Fp4cUwn+H8fXGzvEEGBjH0XAc/Swd0Q42ft0PlST1mUWCYGTkO
jtMCinTDs0F+XS2jmMVYqMH8ckD7b1Yd73V5Gi26Nw7q9sdoolrRoSvZtWIdrhk4
EDY9OpatS97PGHV5bwk7AlOAXPgqNzWlFlRh2fcnFr6ZV4uanoT+4PMuOrLnu0xQ
NFQR439O2XRiBSJa0F936J2nMdIB5mxzG253vh0dVzCaJGNRAqjzdQlunPmVxadQ
S0NdxcYw/Yr8lcsC5igDQ29u0cIesw==
=DVIS
-----END PGP SIGNATURE-----

--Sig_/yAAHW/0L8Nk5t3QC=k5eK+V--
