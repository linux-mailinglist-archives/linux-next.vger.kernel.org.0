Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE291299E28
	for <lists+linux-next@lfdr.de>; Tue, 27 Oct 2020 01:12:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439392AbgJ0AMp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Oct 2020 20:12:45 -0400
Received: from ozlabs.org ([203.11.71.1]:35651 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2439323AbgJ0AMW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Oct 2020 20:12:22 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CKsb753RSz9sVT;
        Tue, 27 Oct 2020 11:12:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1603757540;
        bh=2uQWtpk1d3w4NLAVkJ1dfEy1vrn1+0wRhtKeMeY3fVE=;
        h=Date:From:To:Cc:Subject:From;
        b=gTchjeLcs/0nvT6PN6T4727Ea8NvoZIt/lxD/4WNkLxSCgf9SY2d4yNBcJqajPwxp
         ZkjkjdzTitSokqIyWeU2PqxHG9PrAar2D1LGUqYArmVqJgDdbWtc9KZd14HxPXuRti
         K9bVc71hU9bUK/rkhEtL0iDzu9/LgK1TG+4dXOG9k6TSk1rgjJ1yTALjtIOfgQ6mu9
         if4fUQNy+TtiIUqyfb+WNICaFWEI+8IjHXw9eXOK9n+xxEsiaox1YN6gL2e+kUkGUW
         ltulcfn3UxEIFIEGOsaDky/mcqCLebMDW8pf8cACT7xqTwy3lE7H7mcDa8Dt2ZLjHU
         /QudTY0srN2Ug==
Date:   Tue, 27 Oct 2020 11:12:18 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Brendan Higgins <brendanhiggins@google.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: linux-next: manual merge of the v4l-dvb-next tree with the
 kunit-fixes tree
Message-ID: <20201027111218.7c34f762@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.zF+VO=Br7nGQJf4Vft05Rw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.zF+VO=Br7nGQJf4Vft05Rw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the v4l-dvb-next tree got a conflict in:

  include/kunit/test.h

between commit:

  7f32b10c6b46 ("kunit: test: fix remaining kernel-doc warnings")

from the kunit-fixes tree and commit:

  21f4ea01b15d ("kunit: test: fix remaining kernel-doc warnings")

from the v4l-dvb-next tree.

I fixed it up (I used the former one since it did not have an extra space
before a tab) and can carry the fix as necessary. This is now fixed as
far as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/.zF+VO=Br7nGQJf4Vft05Rw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+XZeIACgkQAVBC80lX
0Gz9Zgf9H6J0UeExGeY/6P6g9mpQwvYrYfex/y58UiwWotCF0DjMmWTM4G2q3peo
LW83k4nwWb2XQRFWzPbOcVFzTYMRpbgBNfaFQkbEFeMLsPInKBruMxM9oUK3ZLPm
u9Gj2lzy8hNnvB/efUQXG5iwR8KZuE3vg1ZcN0JEPh/d7re09Cl+/TUnBORyxwtL
uAnG/S6dt2NsyKbwo/5kVubF2xua5byqmHKAuTyZICj4YJwlDM8MMlPU0S304nKO
UMSCGsaidqkusFRsSrVup3ymAQacgts0JnjOr3rq3tJp3slycV/kF6Y+ax53Bk7g
83DaVqg6Nr/AwJ3/E82ExEXs6RofTA==
=BhFz
-----END PGP SIGNATURE-----

--Sig_/.zF+VO=Br7nGQJf4Vft05Rw--
