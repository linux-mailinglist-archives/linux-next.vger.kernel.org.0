Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC93243DE62
	for <lists+linux-next@lfdr.de>; Thu, 28 Oct 2021 12:04:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbhJ1KGm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Oct 2021 06:06:42 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:41411 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbhJ1KGm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Oct 2021 06:06:42 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hg1P71w4nz4xbr;
        Thu, 28 Oct 2021 21:04:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635415454;
        bh=JrMqmU487cUglNJPEIYff7aDCaGDRzNchDRG8/UXyBQ=;
        h=Date:From:To:Cc:Subject:From;
        b=gfETxzXi1Q6kCDCAArGJh3nPt73642amUi6mos7tZP4xSuzTF5pNjMqY61rCVbj/u
         dobuFuF1J7HtCzOXsnjcFFNpN15lsmo5MIFQ5awGWwab/wMcf1PFyL6FxzV/HF0xAN
         FII8ni85ECTDPFa9k/SbIRsakJmGODpHMDSKZBDrwnIs/zO9mJF5zLTfKdZY3Ukqu1
         FGMR7YirjEbgS/GzW1eYEwpgEEu/qBrI8JacEksIHj3QWUeyAAUBQ36DzL5lD6rFkq
         d2olSO4i4LxG4gSkzZu6YgWQz3JHk+sxQZ5BrA+0a42OeU1ciBakX3N8X8e/ZJTJpE
         Zk2/CjawQ+Y1w==
Date:   Thu, 28 Oct 2021 21:04:10 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Gabriel Krisman Bertazi <krisman@collabora.com>,
        Jaegeuk Kim <jaegeuk@kernel.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Qing Wang <wangqing@vivo.com>
Subject: linux-next: manual merge of the unicode tree with the f2fs tree
Message-ID: <20211028210410.238f4a5b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rfxz3Vc466dBEjl7m49JB8T";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/rfxz3Vc466dBEjl7m49JB8T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the unicode tree got a conflict in:

  fs/f2fs/sysfs.c

between commit:

  84eab2a899f2 ("f2fs: replace snprintf in show functions with sysfs_emit")

from the f2fs tree and commit:

  a440943e68cd ("unicode: remove the charset field from struct unicode_map")

from the unicode tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/f2fs/sysfs.c
index 7d289249cd7e,650e84398f74..000000000000
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@@ -196,8 -196,7 +196,7 @@@ static ssize_t encoding_show(struct f2f
  	struct super_block *sb =3D sbi->sb;
 =20
  	if (f2fs_sb_has_casefold(sbi))
- 		return sysfs_emit(buf, "%s (%d.%d.%d)\n",
- 			sb->s_encoding->charset,
 -		return snprintf(buf, PAGE_SIZE, "UTF-8 (%d.%d.%d)\n",
++		return sysfs_emit(buf, "UTF-8 (%d.%d.%d)\n",
  			(sb->s_encoding->version >> 16) & 0xff,
  			(sb->s_encoding->version >> 8) & 0xff,
  			sb->s_encoding->version & 0xff);

--Sig_/rfxz3Vc466dBEjl7m49JB8T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF6dZoACgkQAVBC80lX
0GxyXgf+Ia+RbMg/q/50kzkWfZFCQnRHEUhxsySqzGB8v1lZowtrN6J3/RunaOob
C/jSrReZ5ovCtGsAZbZZgKpCLJqSfjqNr7NiF2XJF9+XbBoGuW/EWoDk6rGKicdG
7Ie2JBAlnmqb7vUJosxQiy4NJFKR4eO1W5w+miAxXEhIX+DizFGgnyoDyaUvXYVA
8+1wlBN7+EQkW1ThMzIUcke7B5fV9KJ/bfBSve2ZJW6SfUroT36U0TAua7JLOuEM
zdtvUvXq2nhnR7yHuEEOGl6gHo9PRT5DFu6CZlWewxQVa9Ci9VjhdPbJJaV9jImd
R10KmSU0qxz12J2hV9RtcIXPLBW9Kw==
=F0/x
-----END PGP SIGNATURE-----

--Sig_/rfxz3Vc466dBEjl7m49JB8T--
