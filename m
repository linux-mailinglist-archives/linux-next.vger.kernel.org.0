Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B5F839C579
	for <lists+linux-next@lfdr.de>; Sat,  5 Jun 2021 05:27:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbhFED3P (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 4 Jun 2021 23:29:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbhFED3O (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 4 Jun 2021 23:29:14 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4F6AC061766;
        Fri,  4 Jun 2021 20:27:26 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FxlS92X0Mz9sRK;
        Sat,  5 Jun 2021 13:27:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1622863641;
        bh=RS/QWu6MMUc/9DBzbsVm+FvidpuSsUifb4/J30X5ePg=;
        h=Date:From:To:Cc:Subject:From;
        b=UNiV48kfRFaAkdWTaq2M443eXs1PeMbV7DlkQKAUfqKu5WYPUft67FZ+ZEdLckXUf
         c1wkvFl99CQsAdhR/Rkqdq2m1gQA28aMWGcjkIQL1gRGDzYYH3+3shpzQHFEGQkCwZ
         PCOFGfzPwT0QqfrIRECARRwNunX6z7FQJ3DldtoM/b/Uxvgw8SxAhmmds3HVr/+QzL
         Xb7lL+JHUU4SHj2c2j73Fcy2ShVY4MK+ZHAKWBmdtVGIYDGyWX9aYiNmFIFv/l/fW6
         Yg8hn1F4S9eavGIcdRlAQp9ckziQ45+czN26Nn3MyKYzWP/x28euzE/k+bDvZ8WEZc
         0XuoXg3zJTtpw==
Date:   Sat, 5 Jun 2021 13:27:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Dmitry Kasatkin <dmitry.kasatkin@gmail.com>
Cc:     Roberto Sassu <roberto.sassu@huawei.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the integrity tree
Message-ID: <20210605132719.3b984ed0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xtf3KNbqIeheC_hc6NvKSrD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/xtf3KNbqIeheC_hc6NvKSrD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the integrity tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/security/IMA-templates.rst:81: WARNING: Inline substitution_r=
eference start-string without end-string.

Introduced by commit

  8314b6732ae4 ("ima: Define new template fields xattrnames, xattrlengths a=
nd xattrvalues")

--=20
Cheers,
Stephen Rothwell

--Sig_/xtf3KNbqIeheC_hc6NvKSrD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmC67xcACgkQAVBC80lX
0GyOhAf2O7ayn05ou1BnGHCWFiS89a+cWWFb9mBeoJLerNhrn6GegJgtqDesl3WW
zR4HZt98nuJ+dpgj1B1iThcwi2jnIUWd/vydfrUDmn5vvHoOBx81Evcjbfe1WHyi
3PkNNcvJvhXkLW1lGee7SUqFEsMNeJVEvOX/nd/pGUppJy5HsO6/a0JVyFPcCXUf
DrPp3Lt3pMjU9G4U4p5t5hAtXQDfrjlLl44aMFaHn+Yg2T6W6tljew6OTEtvA4tA
v2O2bxrMMYTUc+iCcIvSWHdJ7Y7nzPEhRLlrmkYUTkKf/ZNGYdMxRc3QJ7PwpdGp
ainLPL4suyeJqP/Rq8e0G5xrxEXQ
=15dT
-----END PGP SIGNATURE-----

--Sig_/xtf3KNbqIeheC_hc6NvKSrD--
