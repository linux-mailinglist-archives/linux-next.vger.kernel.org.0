Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E84F1DC86E
	for <lists+linux-next@lfdr.de>; Thu, 21 May 2020 10:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728481AbgEUIXG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 May 2020 04:23:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728374AbgEUIXG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 May 2020 04:23:06 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D7BAC061A0E;
        Thu, 21 May 2020 01:23:06 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49SN0m0s98z9sPF;
        Thu, 21 May 2020 18:23:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590049384;
        bh=V1tslC8q4Izh34WWpiLdTGo+nLJxNNMp4RgxkaT2r/Q=;
        h=Date:From:To:Cc:Subject:From;
        b=f5PxzU/mebvmxlwtjAvA82va18JReEb3ur1is7WCEGwCaBnr5U3evV2qiHr6pYt+h
         2n5HUHWUqj8UDUL8g/9mvVwuqoTqibpTQNIbuPNGxnT2RBUOo9VDRIGnWq8NV7sPD+
         rgBWXqHr+QoIDqiYZCWQI4RcDExv2S1A95uceyvvC3t9ICrxDC/EaLBPpi1ZacuTvi
         80qX9FiS+IgMstJ3IVb3VVm2Dxi/13UXtoAzNOzOmji44VuVOGszG30Pb9swkKSv72
         79SGX5XTl7bBhUx0FzVabVK7PgJTT1PTnRzxwF85rSbCRKxL8sCQuMtoZdzxbSyHrK
         L3zGaFqfCbBHA==
Date:   Thu, 21 May 2020 18:22:58 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: linux-next: build failure after merge of the userns tree
Message-ID: <20200521182258.23cc75fc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YY_ZyP1cVj=bDZA1v/u9q3I";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/YY_ZyP1cVj=bDZA1v/u9q3I
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the userns tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from init/do_mounts.c:9:
include/linux/security.h: In function 'security_bprm_repopulate_creds':
include/linux/security.h:580:9: error: implicit declaration of function 'ca=
p_bprm_repopluate_creds'; did you mean 'cap_bprm_repopulate_creds'? [-Werro=
r=3Dimplicit-function-declaration]
  580 |  return cap_bprm_repopluate_creds(bprm);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
      |         cap_bprm_repopulate_creds

Caused by commit

  d9d67b76eed6 ("exec: Convert security_bprm_set_creds into security_bprm_r=
epopulate_creds")

I have used the userns tree from next-20200519 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/YY_ZyP1cVj=bDZA1v/u9q3I
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7GOmIACgkQAVBC80lX
0GxUnwf/dNf8RvIq2xAOZfHf1fpvGVrYRti0bz0ctW5zMXm9sHVMuuzLbH3nfOjL
pRWtTYxMskxC5c5KTa8skgH1c95DESkOErRYl+XNNd9CL3Z+J9eSCUdAKSBBhFfF
SkOyBtWZQJP0xoyMdoYLhr1iCbHIprLb9fSQwyOQ7R3AF3hWFyWgGRrBtkCXDz5S
SYh9IPjnP4O6/u8e+4yYsBlhzpKgFzNOcXi9ien1CrdXAH4s3X9CoQBRPnopS/v5
BHqMfT6VqYF5sqDKKyBXNp2Mnc9CLOuTF9m2hm2mu9nyAuVaMmq39A5SmfPWDb88
et24XgU+wBFg9xiDa9iJO4LXJRDfxQ==
=o8tM
-----END PGP SIGNATURE-----

--Sig_/YY_ZyP1cVj=bDZA1v/u9q3I--
