Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B42BA3B41C9
	for <lists+linux-next@lfdr.de>; Fri, 25 Jun 2021 12:37:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230436AbhFYKjw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 25 Jun 2021 06:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbhFYKjv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 25 Jun 2021 06:39:51 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19E9FC061574;
        Fri, 25 Jun 2021 03:37:31 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GBD3C1SqGz9sTD;
        Fri, 25 Jun 2021 20:37:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624617448;
        bh=MDs1d5OjuVPEzQFRdOecd263uXy8HZ/JFlAGkDJbExE=;
        h=Date:From:To:Cc:Subject:From;
        b=CbJMU2natuEevX5cJvgjSN9XNW/vylUIQIQES1OuZi3zBuIiA7oO8MSyyn6WcU+Xe
         jfPrNugDSf3wyQHu49nRlnKnbCtlxjq8KxODlx9S7GuvZToA0krAXOGswXjOYY88qF
         dh3lF1bZGwhHY51qfKyClYpgBNVUG2ClCqOPtMj3Ltnt26zcfi2hI0rNbhaCgjMswO
         YsOzvNCWcRoZ/1ufRPh4Ypu5/hRjJoWODfw1C9CR5vW2X4/cIqdFsm1+j1h+1DFLCh
         1b2WT7L7FI17kZarShBhDD0hFyjrn17uTH1V7FZPIsrFGTrQGe50YoLlLEHrU16vAI
         SeqxbOLPyjLuQ==
Date:   Fri, 25 Jun 2021 20:37:26 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Marco Elver <elver@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: linux-next: manual merge of the akpm-current tree with the kspp
 tree
Message-ID: <20210625203726.00383b81@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VL.Owz5Z8OaqqHp6NGWG/RF";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/VL.Owz5Z8OaqqHp6NGWG/RF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  include/linux/compiler_types.h

between commit:

  380d53c45ff2 ("compiler_attributes.h: define __no_profile, add to noinstr=
")

from the kspp tree and commit:

  120ae5440ef0 ("kcov: add __no_sanitize_coverage to fix noinstr for all ar=
chitectures")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/compiler_types.h
index d509169860f1,cc2bee7f0977..000000000000
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@@ -210,7 -210,7 +210,7 @@@ struct ftrace_likely_data=20
  /* Section for code which can't be instrumented at all */
  #define noinstr								\
  	noinline notrace __attribute((__section__(".noinstr.text")))	\
- 	__no_kcsan __no_sanitize_address __no_profile
 -	__no_kcsan __no_sanitize_address __no_sanitize_coverage
++	__no_kcsan __no_sanitize_address __no_sanitize_coverage __no_profile
 =20
  #endif /* __KERNEL__ */
 =20

--Sig_/VL.Owz5Z8OaqqHp6NGWG/RF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDVseYACgkQAVBC80lX
0GzTUQf+MTBe1mmGtC1LnO9LUdqYlwlTTjZ+z0m9XE2Sva+2xNuv+9Sj6/sEvTyp
tYdp0Ee093elOXbOiFTM298A9ipDl/0mrzZZgq2j6aVo5y0GlnRCTfbDnZZzZle0
xEHNtTTAqANg3CoR4VO3ZS8fUNtkGPuQaTB/PV6K91hbskHfpmWRnlgjH9bcc1Wb
2jXezluqlwEDX7jv5ZsGbvntjEEcqBkpwXLjsS5jdoVN2AbclNgH9u+kwoekvleg
kq9SiCnHXL4J6BoNtf0QDC6u+j/ROOCajruW0RHaS5kRtIMb0caVxqK5eDEo0SPC
Ze6fCmQALCR+PCxBXmqcF0Jm6Kdc4g==
=M2ug
-----END PGP SIGNATURE-----

--Sig_/VL.Owz5Z8OaqqHp6NGWG/RF--
