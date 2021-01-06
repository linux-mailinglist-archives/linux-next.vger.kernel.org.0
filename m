Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E493E2EC6A8
	for <lists+linux-next@lfdr.de>; Thu,  7 Jan 2021 00:16:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727136AbhAFXQ1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Jan 2021 18:16:27 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:60945 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726449AbhAFXQ1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 6 Jan 2021 18:16:27 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DB4wd5Fk7z9sVm;
        Thu,  7 Jan 2021 10:15:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1609974945;
        bh=hhb42+3r30dgguSUrIG0v7hh9TznE7SYcmCkuQPPfy8=;
        h=Date:From:To:Cc:Subject:From;
        b=hEQeX3ekhB8sl3BrD4SMo2PaDu1c0IBgGr8k8uOu2zCEfJNuAgN2sNjgOzSNZmbIR
         Mwjz2KrZ10SwYGfwudTSeNxGwKQB2tS/u8z/24yf9u7nixdvbl63fKRM9Skzq92GNA
         XrMeuI161PHfdkftGo4jYqtR2iXoYeuqWTEXoOBAEIi0R2OLq59WcNyBmHHYqqdMXH
         COEjEwx/8Lq0nuJDvNzvrrQFEBsdUdROZ9G8lXNpI1fq19hLlRXQ1H90PnVrFwlzGZ
         Ifa7oahIek7t4YiHWz3hKXi2O1qzD2CqKckDzol/huJPuJf1UtQP+tMsj/ZFuVKCmZ
         2rdkm9GrVIyWQ==
Date:   Thu, 7 Jan 2021 10:15:44 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the vfs tree
Message-ID: <20210107101544.68bdd395@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/p_/hmkyYWBCIHY50hXBferM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/p_/hmkyYWBCIHY50hXBferM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

In file included from fs/erofs/xattr.h:10,
                 from fs/erofs/namei.c:7:
fs/erofs/namei.c: In function 'erofs_lookup':
fs/erofs/internal.h:23:21: warning: format '%s' expects argument of type 'c=
har *', but argument 4 has type 'struct dentry *' [-Wformat=3D]
   23 | #define pr_fmt(fmt) "erofs: " fmt
      |                     ^~~~~~~~~
include/linux/dynamic_debug.h:129:15: note: in expansion of macro 'pr_fmt'
  129 |   func(&id, ##__VA_ARGS__);  \
      |               ^~~~~~~~~~~
include/linux/dynamic_debug.h:147:2: note: in expansion of macro '__dynamic=
_func_call'
  147 |  __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
      |  ^~~~~~~~~~~~~~~~~~~
include/linux/dynamic_debug.h:157:2: note: in expansion of macro '_dynamic_=
func_call'
  157 |  _dynamic_func_call(fmt, __dynamic_pr_debug,  \
      |  ^~~~~~~~~~~~~~~~~~
include/linux/printk.h:424:2: note: in expansion of macro 'dynamic_pr_debug'
  424 |  dynamic_pr_debug(fmt, ##__VA_ARGS__)
      |  ^~~~~~~~~~~~~~~~
fs/erofs/internal.h:34:33: note: in expansion of macro 'pr_debug'
   34 | #define erofs_dbg(x, ...)       pr_debug(x "\n", ##__VA_ARGS__)
      |                                 ^~~~~~~~
fs/erofs/namei.c:237:3: note: in expansion of macro 'erofs_dbg'
  237 |   erofs_dbg("%pd, %s (nid %llu) found, d_type %u", __func__,
      |   ^~~~~~~~~

Introduced by commit

  879d4376533c ("erofs: use %pd instead of messing with ->d_name")

--=20
Cheers,
Stephen Rothwell

--Sig_/p_/hmkyYWBCIHY50hXBferM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/2RKAACgkQAVBC80lX
0GzU5gf+OD18YwDbbT94D/YnDHDab7jRjP74OVQLS90yvaDxWzpDHtxfTgng6fJQ
mnYfBXrIz6TGDm70hy9BETLmA9CB9ZtWjQ6qmfwQh1ecFWaOnqTsM/KPlPQgwuyt
YGebOcZ55bzBkZV+h3PrNaZdzx7Ulj0Q7z5YpkWC4TWB9RRNDV1MpAXnm9/69EsP
v6Bti4w7MY6m+Y1J6h7n93DjuLseV+YSwMoWDVCFOcTbMB2l/N6PWa0h8mwXjtdS
HAwS2jneM3Qo4u3wKfE7sVmIAHvX8oKhutdTPhd7bKIM0DF5H2P4C5V/7XomO5kf
8jCNAhkIk5qQQGDtX+KXJlEOqdF7MQ==
=0YgP
-----END PGP SIGNATURE-----

--Sig_/p_/hmkyYWBCIHY50hXBferM--
