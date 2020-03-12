Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F8EA1829BC
	for <lists+linux-next@lfdr.de>; Thu, 12 Mar 2020 08:27:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388086AbgCLH1n (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Mar 2020 03:27:43 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:36763 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387898AbgCLH1n (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 12 Mar 2020 03:27:43 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48dL582Qy8z9sP7;
        Thu, 12 Mar 2020 18:27:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583998060;
        bh=c+rAYHbp+CWwrpwAgZbZp1cZ0QKLCcf5lW53irVv3PI=;
        h=Date:From:To:Cc:Subject:From;
        b=OzGXpN/7wXBQU6t1aFaQaVvZO+aL1CGyxX0Uui0vFCpb7+8QLws07oX+UgD1SBIfI
         VKxJ4huhnbN/rZAy1UhMyA8uJvgjkjC8EUzz6ps+v+4VWWCRurrsRTsbeFDJkinHcz
         uxukrM8bx21Ciicge6j2Gl89GfbEJYmIxZ2/GNClVa2CmrGFwaszk7Qz1weyrYTHcR
         j6Q4FKdDxMGmTBIWvEiWWfks5ivC1jfEm7rI53U4gYrtNLFrQzW/stEoCiicMthUC+
         A1Cl/4x3T8yMgu3ObF0K+gacLPof8r5pPLIk/Q9md0MNOkeCzdXofpwf09BltQyqxL
         NMQ+pu4J8gwOQ==
Date:   Thu, 12 Mar 2020 18:27:25 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>
Subject: linux-next: build warning after merge of the akpm-current tree
Message-ID: <20200312182725.618ca518@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6AnB0cUAvhJeWDf2gBGAu8J";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6AnB0cUAvhJeWDf2gBGAu8J
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

mm/gup.c:119:13: warning: 'put_compound_head' defined but not used [-Wunuse=
d-function]
  119 | static void put_compound_head(struct page *page, int refs, unsigned=
 int flags)
      |             ^~~~~~~~~~~~~~~~~

Introduced by commit

  6379e529ebe4 ("mm/gup: fixup for 9947ea2c1e608e32 "mm/gup: track FOLL_PIN=
 pages"")

--=20
Cheers,
Stephen Rothwell

--Sig_/6AnB0cUAvhJeWDf2gBGAu8J
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5p5F0ACgkQAVBC80lX
0GwjOAf/cdZH8I0YAlg+3Fy/ktiK28PhLGJWZjcUtuSZKv50dP9+cxAvTFjwBUtw
d13vEwqe5JugAadgw5coPwam6SczTs6QPtG+Pya9REV81Pau93UKzNpGk/sPbi5d
AMTOOAf+PYaQAETGRO0+VD85xi4Dk7Eh6X6rFV1FiLnem0y7WEA5ejpvLIJJZ3mv
h/660GsYR8dO05THCqp7EftGIUjaDHLsXrx3Tt+ZQSVHsoPh/e5iSnrRqIkQMQCA
+9RjbZwe76AeyP41UXfEML21JCo2LKARnjIH67ecuhMW+mEmWMDFdYkrPaB+PGz2
KulttTHAVjcvuuMtWrc83IDi7jpQWQ==
=IB4z
-----END PGP SIGNATURE-----

--Sig_/6AnB0cUAvhJeWDf2gBGAu8J--
