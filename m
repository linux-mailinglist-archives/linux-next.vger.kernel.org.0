Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFA4626D110
	for <lists+linux-next@lfdr.de>; Thu, 17 Sep 2020 04:23:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgIQCXB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Sep 2020 22:23:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbgIQCXA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Sep 2020 22:23:00 -0400
X-Greylist: delayed 356 seconds by postgrey-1.27 at vger.kernel.org; Wed, 16 Sep 2020 22:23:00 EDT
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35C9FC06174A;
        Wed, 16 Sep 2020 19:17:02 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BsLFP38xGz9sR4;
        Thu, 17 Sep 2020 12:16:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600309018;
        bh=XmnzNHyOMY5V5YvP7hNYdtpvOe/Crgd8oTpWk1u4OPU=;
        h=Date:From:To:Cc:Subject:From;
        b=aCF+gvuagg+fsMR/AtPdE0qdf6XaEzNqqu3lATJkPGQnaY0J+UG21I72F9sf63Rlq
         dg0/AvBHkOPBV8NpZai5pEvg6sAEOxwLFD8Apf2XW+GggY93i2PjAsZGPWn7/B9TGW
         nlO9l7EhSsQa6q6nzwgXifAe53wCFYMlo4DQQ06ymQ+3ZZFH0AKuILc9VuZE5ygWHL
         R+DhUhsHt6ydEJuNKpYXPhCVbI8+fASIzlFxiKhEHQw192IaOdHQ/Kk2oCwKqyQ8IQ
         zYr+QCsUcpEL61yDtVQLvani+aoqtGep9qlfW5GgrTm7zYDxmFPN1Aiw7CKi+SpYgs
         1V36zfvhwsyiw==
Date:   Thu, 17 Sep 2020 12:16:56 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jonathan Corbet <corbet@lwn.net>, Greg KH <greg@kroah.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the jc_docs tree with the spdx tree
Message-ID: <20200917121656.4116529b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/efZTYfB+EgRwI8YjIPr/SZh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/efZTYfB+EgRwI8YjIPr/SZh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the jc_docs tree got a conflict in:

  MAINTAINERS

between commit:

  951f3e9f2086 ("net/qla3xxx: Convert to SPDX license identifiers")

from the spdx tree and commit:

  51652804d018 ("MAINTAINERS: fix location of qlogic/LICENSE.qla3xxx")

from the jc_docs tree.

I fixed it up (I used the former - which removed the line updated by the
latter) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/efZTYfB+EgRwI8YjIPr/SZh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9ixxgACgkQAVBC80lX
0GwL7QgAodsiugJzF2URw56oK7RGFUe9VoL7UAqm8WnwT0ojqIY6+V9IYClwQn7r
OGqvT6yW43VSUH8P6bv+9JpTrnR16orUcvfln8yA+AhVM8RCmUQ1XolfUBv7I74E
mHcV5EIlmxLXMJAh9gQnrAOZC+fErBnZwehDm2CeGxziYikTmlkV4Fw5lgS+beym
QAW/WuzuPi7EDrzr2OalfPhvtfQZvVFDfz2NqMLphydLO4+rP1BQUr3MJPDufXKu
LZCL1jpObw+r5CvIG8Us5c6iPfJ1dwtRGSjenWrjf8GaKDZ8Au4oVpXfsfGBgAxZ
xv5TASjU47RHHsqUawsOXdH6UzyJTA==
=U39a
-----END PGP SIGNATURE-----

--Sig_/efZTYfB+EgRwI8YjIPr/SZh--
