Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9FCF3F8364
	for <lists+linux-next@lfdr.de>; Thu, 26 Aug 2021 09:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232223AbhHZHwz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Aug 2021 03:52:55 -0400
Received: from ozlabs.org ([203.11.71.1]:37721 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240273AbhHZHwz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 26 Aug 2021 03:52:55 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GwFRq0F6nz9sXM;
        Thu, 26 Aug 2021 17:52:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629964327;
        bh=a7T2jhuJQ57DkH39P7E81Lj05ckyp8byQPuosTUaWhk=;
        h=Date:From:To:Cc:Subject:From;
        b=P2GxzYgej0lfaVNbeIz6CK79ykFs7GHhSCDAKb5HhT+rewCEFstQQA2g2hgktO6YF
         pITAbwhjWdXwYfZTFImwYBQXyRvEF/vmLy5WF9vereJDZr+d2yyCbQfe3tzKue0lxw
         ZLThzcO8FRHc/exvLlpgObvNF3eOZPwrML4glUWOsb9mMFTe4VZ+0mMsRhiERguE5Y
         hmNOu14GEfqwBAF02LUoNFjwkrZU2kXtnmE/SabhX44KkQ3k5ZRJWpt1+4D4oV0xJZ
         Hv9fjW6XcppNyKKTXEd/fh+tUco3HmgvghOdS06xEOIFmZ3Es8ITIYWT9J8mzLQtcz
         nu33QGQa8LRvQ==
Date:   Thu, 26 Aug 2021 17:52:05 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kees Cook <keescook@chromium.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the kspp tree
Message-ID: <20210826175205.708b88a8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/k2naIcTIng7KWUQ=FaOjvz3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/k2naIcTIng7KWUQ=FaOjvz3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kspp tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from ./usr/include/linux/posix_types.h:5,
                 from ./usr/include/linux/types.h:9,
                 from ./usr/include/rdma/rdma_user_rxe.h:37,
                 from <command-line>:32:
./usr/include/rdma/rdma_user_rxe.h:134:24: error: unknown type name 'u8'
  134 |   __DECLARE_FLEX_ARRAY(u8, inline_data);
      |                        ^~
./usr/include/linux/stddef.h:42:3: note: in definition of macro '__DECLARE_=
FLEX_ARRAY'
   42 |   TYPE NAME[]; \
      |   ^~~~

Caused by commit

  a908f2e5a6d0 ("treewide: Replace open-coded flex arrays in unions")

I have used the kspp tree from next-20210825 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/k2naIcTIng7KWUQ=FaOjvz3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEnSCUACgkQAVBC80lX
0GyEPwgAm6liMUPv9BmUofegduKJAnJixhkl8sPPC28yS2yPI9nwIgzQk3Pn7x/N
OAJrhTFoBZDWY9ads6KfKO+ePKbNyro7ij0kuLy8yxgiUuhUVJPVgrPw2iE+80Qn
6467I/A2uqUOrGPNCLzYPsasmDa+NHcJ7HR8ATR0RA3X4/ptO5Mnsk5S0kk+21EO
I89ftHz7Dc25s1CbIMUfZP8fs+NlgOxSc8hsy1CfGw0B0NkNwMGqA58Niuf2auxy
NvoeTlMj15dzNz6D/VXGigUWJmhE0QLCvVagH6F4gEcEGrBQj2WPmFHFdYmbLemq
LnZ971dvLnXOQARgVjYIRjC+2g/shw==
=vtLw
-----END PGP SIGNATURE-----

--Sig_/k2naIcTIng7KWUQ=FaOjvz3--
