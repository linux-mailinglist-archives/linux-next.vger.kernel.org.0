Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A7B539D8AE
	for <lists+linux-next@lfdr.de>; Mon,  7 Jun 2021 11:25:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229966AbhFGJ1I (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Jun 2021 05:27:08 -0400
Received: from ozlabs.org ([203.11.71.1]:60513 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230245AbhFGJ1I (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 7 Jun 2021 05:27:08 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fz7JC6R35z9sVt;
        Mon,  7 Jun 2021 19:25:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623057916;
        bh=bNqIFMJPc+04k7q2Gwt3wp1dT/xvraql9Gx6txMSa6w=;
        h=Date:From:To:Cc:Subject:From;
        b=ahfP8ozGM6Ic3dHf1EknXpyWBU8UfDitLmW048j9WXxqHpXXoN1hoKkdBBgn5y64Z
         ZnoPcnKd1M69TqRjvI9cNeC91JxpDt/yUnLPkkL/fv43ESh6j6k7O8Dp5C+LDogwtC
         YglJKd7xdHRS9OsjHw7ogaIhlE2mu/w8f0v1RQmkP8enD1dYc+grEp5yrfYDdFkFR0
         14FzQdXOnUvaea7BhVIDz9RXiDLp3xRVWWYyO2uNZfmmdASlG1voMFwNdYiScSAls8
         qcxQFoDN3OPADT69JHs5qRc4SnMLAo9/qHnrYzKfmpXCJHtcHy93xJsAa7wywIBdgp
         KVQ+riq6Ju8ug==
Date:   Mon, 7 Jun 2021 19:25:13 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Peter Collingbourne <pcc@google.com>
Subject: linux-next: manual merge of the akpm tree with the arm64 tree
Message-ID: <20210607192513.466770c0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WY_B+bXhS_lbP6S+0QLPZZx";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/WY_B+bXhS_lbP6S+0QLPZZx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/arm64/include/asm/page.h

between commits:

  92638b4e1b47 ("mm: arch: remove indirection level in alloc_zeroed_user_hi=
ghpage_movable()")
  7a3b83537188 ("kasan: use separate (un)poison implementation for integrat=
ed init")
  013bb59dbb7c ("arm64: mte: handle tags zeroing at page allocation time")
  c275c5c6d50a ("kasan: disable freed user page poisoning with HW tags")

from the arm64 tree and (more or less) duplicated patches in the akpm tree.

I fixed it up (I dropped the patches form the akpm tree) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/WY_B+bXhS_lbP6S+0QLPZZx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmC95fkACgkQAVBC80lX
0GwZzQf8Ck5o30nv5rxU7w/a2WLyZgrtziSaD/aYX5uV2dI3FpPbO+RxWOuFSD5D
1e2oE+N3Deda2NgHkOJ1IYX81Iqdaw+JVEYcbe1fJfsRmypeqT8HKclDNiKAWxYS
GoCjYUXOmDERnfY4uQtnymYwA/AQ6QwOhyELVJywIdRWTzwzUlhGP1T+VK0hZliv
X4a1I4Z1ONn7lTCT52sFREX7gAA+xbhrwCdUH+t6fGdEf/Q52URN2sAbIivjxSCN
x8QP0L+s8DIow1DU376O5tYyu+/gqSlivXywKOHIdR6FEhgS2pa5d80LYcex2PI+
nSKUa1G/5iEXuT3QqJ6sNVoDWH4kfQ==
=afjR
-----END PGP SIGNATURE-----

--Sig_/WY_B+bXhS_lbP6S+0QLPZZx--
