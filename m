Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE904FCF29
	for <lists+linux-next@lfdr.de>; Thu, 14 Nov 2019 21:09:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbfKNUJW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Nov 2019 15:09:22 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:55357 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726598AbfKNUJW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 Nov 2019 15:09:22 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47DXcw25v0z9sPk;
        Fri, 15 Nov 2019 07:09:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573762160;
        bh=bdJLJ8n8B3iy9G5pdI2/+XUYJW0xzcp5evCU8AQ7rj4=;
        h=Date:From:To:Cc:Subject:From;
        b=F/QpxQ3DCpMMEGS5JJ2c3Fosa/muU0A/MrS8AFtXjILDK2BREqiATo5lZR8yZTIu5
         YqKZQm3bkw59dvpcgWVzc1FAtO5p32VMJpQymbHAUdXbvz9tblCrLmegYvp9jDi8nw
         LJyNgUqcw3MO7GgKU+ydGdIWmHLMBRvMstjH0h1Wv3AyiuqnTqUqz1OMkalu/KbssR
         W/0CRnJ8/hSTCEqI2crOZdMOfBZxa5FUAqZCkkT7AFbwUWcTgIlKADMDtacK7DouJL
         ZElj3S59ZJ5OdAJ4bTZ6n6XRlI+XrUVmHggmvOs0kRDiXpEZvcv5tgk5CfqQ6ejzZa
         0F3JS8FvJO6NQ==
Date:   Fri, 15 Nov 2019 07:09:08 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Max Filippov <jcmvbkbc@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the xtensa tree
Message-ID: <20191115070908.01d8e46d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xGlx0V20Mwg+3DLkp+GR69I";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/xGlx0V20Mwg+3DLkp+GR69I
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  29ba235590d1 ("xtensa: use MEMBLOCK_ALLOC_ANYWHERE for KASAN shadow map")

Fixes tag

  Fixes: f240ec09bb8a ("memblock: replace memblock_alloc_base(ANYWHERE)

has these problem(s):

  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/xGlx0V20Mwg+3DLkp+GR69I
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3NtGQACgkQAVBC80lX
0GwDEQgAjGOvfrTiq+L95CKjTn/ucQUtYKdf37fqcbdS/WsKdVvrWIvB6JJnTMCR
Zl6KVJiMEw3YXRELxaUGYFSQCin/iGlM4lXaky7FZrEaa3H+epYkT4PsOCsk+jfF
X6Cz2Z6t7RhbYtWSmWMbud7Xk/dS5Jq52RE9C96QQpF/6OeTePk22e4kUb0UvLNW
wDUingJHwnXGRqlCvOxh/VRsSn+jggK/2CyzIc++OtZXQ5Ed/kZ3N00De3BvqLF9
IN4sS1vYNNJp3yJ57ET4aK+mawrcF/Q2/TvJWrKvyseOalcPkbQRQq+/p2JJOGpr
o5QVIL4rrLqlC1KFXfvU8K0OD/XEbw==
=JRUF
-----END PGP SIGNATURE-----

--Sig_/xGlx0V20Mwg+3DLkp+GR69I--
