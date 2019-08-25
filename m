Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F13399C3FF
	for <lists+linux-next@lfdr.de>; Sun, 25 Aug 2019 15:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726772AbfHYNbk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 25 Aug 2019 09:31:40 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:44153 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726182AbfHYNbk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 25 Aug 2019 09:31:40 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46GbdL1mTMz9sDQ;
        Sun, 25 Aug 2019 23:31:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566739895;
        bh=kwJeBAHhPJu1xjrfRZy4xtqRda5fmrFs/TKifaaS3Js=;
        h=Date:From:To:Cc:Subject:From;
        b=H+Yq1F8xtbQMMtlWhyz7eNpIHnknoCKQvFv+fK85T5FXh6uah3mz2KShLWevZjVJh
         Qp0uAmJ/G4vK/0sEYBQBfI6hexRxB5ZSMkskjQZ8AibzYBCHFoOL+1Iz/pxFUIZRd2
         PRurse9tWQF/jhCVQ0JtNZJo93PE0oQbwTzq6AGhbHGdqA//Wfa/f2LS3+OwqaPQFs
         FtZUk3QXZxcLpzps4iPqN5K5kfySJcutH+Y0jVmHuVfyMuBL5T67Mmp83eTi2vv8n+
         u3OCZNN2WoKkKoBsNc5aLy6XHPq2u96KsgOyYIcQRg8WfYCl7YzYqtsH+7Z+6zTHgz
         umSpOqyPcMv+g==
Date:   Sun, 25 Aug 2019 23:31:20 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sean Christopherson <sean.j.christopherson@intel.com>
Subject: linux-next: Fixes tag needs some work in the tip tree
Message-ID: <20190825233120.18ac25e4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6RZzrn0CYSO.og73XIcamBb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6RZzrn0CYSO.og73XIcamBb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  b63f20a778c8 ("x86/retpoline: Don't clobber RFLAGS during CALL_NOSPEC on =
i386")

Fixes tag

  Fixes: 776b043848fd2 ("x86/retpoline: Add initial retpoline support")

has these problem(s):

  - Target SHA1 does not exist

Did you mean

Fixes: 76b043848fd2 ("x86/retpoline: Add initial retpoline support")

--=20
Cheers,
Stephen Rothwell

--Sig_/6RZzrn0CYSO.og73XIcamBb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1ijagACgkQAVBC80lX
0GwFeAf+PWKh9IJ45Y2EShMr62m1zES4QolUTkaOLpIdnjcajAn0ZYZKTFHBkFLE
0Z915jY89xHzjyc+hWhdswveF8kvEy724GNRlxEXuao2mMYIKcEmlFUiumYfS7VF
RzOGWtX1MWx9y3Bdon2Cgcou1CbDXXkUlVR+YS8RWLj5yjmr1msrh4vnkbQRv10Q
/rlIxw/v5UHdJkTq9+ES1rIWi+ipcPQZw2+baQCM2cIUPs8ZKfQsQlgjY44JUzP9
0KCkF2yBJgCKJFK4ZIREYH2wfI5r8ExoSErBHIeBcMIXi/MRWKSZZiMaTFm+Jn4S
mRySrsm16Qy8YvY1aua1Xfw+Ctc4qA==
=+Hox
-----END PGP SIGNATURE-----

--Sig_/6RZzrn0CYSO.og73XIcamBb--
