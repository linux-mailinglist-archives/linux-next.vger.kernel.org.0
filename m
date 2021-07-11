Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 196BF3C39ED
	for <lists+linux-next@lfdr.de>; Sun, 11 Jul 2021 05:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbhGKDEA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 10 Jul 2021 23:04:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229846AbhGKDEA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 10 Jul 2021 23:04:00 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C34CEC0613DD;
        Sat, 10 Jul 2021 20:01:09 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GMs9G2qhNz9sV8;
        Sun, 11 Jul 2021 13:01:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1625972466;
        bh=61+xf+y3QCnjmUbsvZ0vucb6hl5pACPymDQpZPxUosM=;
        h=Date:From:To:Cc:Subject:From;
        b=hoIDtJs80l8fqAFla+xcImIkFFEFMMUyPTomnKMiAy5mld50446LOO6AQbrF/utHe
         X3inHWfAT3O2xzkcLsQTvkBOnL5yf5/LPYer3zc5AwS7tNUUkz60CBlGU4AFWZalrB
         1xJlpTfkAGyCU6uf8lD6NNpk++f9icdMPcoqKJ0doD6L83UDOMYGTanOpSMQ/fLhJo
         Fpj77vqz1q3rexsG355DktBrYesWblSJU+v/xhlVsiWZCI7b1XyjfFFrUUY1nVqLcz
         ShzMXq25elD4aeIw1DWbbU60mMyk9e1VXnZUeaFNyShYi+sjQxZsJTEpx7Bpdt0LQw
         JA0kDpRxEo6Rg==
Date:   Sun, 11 Jul 2021 13:01:04 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Petr Mladek <pmladek@suse.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the printk tree
Message-ID: <20210711130104.25df8d2d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Iv+v9RjNd3o=jfM6yHmNbM4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Iv+v9RjNd3o=jfM6yHmNbM4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  11e4b63abbe2 ("printk/console: Check consistent sequence number when hand=
ling race in console_unlock()")

Fixes tag

  Fixes: commit 996e966640ddea7b535c ("printk: remove logbuf_lock")

has these problem(s):

  - leading word 'commit' unexpected

Not worth rebasing to fix, but please remember for the future.

--=20
Cheers,
Stephen Rothwell

--Sig_/Iv+v9RjNd3o=jfM6yHmNbM4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDqXvAACgkQAVBC80lX
0GwG1AgAmDiWBkS+1GbRjEJqCT0wByVLKq38uurFeuCe9IGDj9yAfgCx5GbLOR5r
6zjz0KBmexEzfa3vkLQjwc4SRhgVjOb2SESQYJhDXhCYlzy7LGRHF0IJ2Dyy/5kt
HO5EyahjnYuQZtfwI8H5vfGZilO3CD4oHVIWOt7eAS0bm2qBf3H774pIdgOid1eZ
lfEDSyRB6r/Q6qDzVrCRreMYRE9xdbBtUmhz8p2Bo/6f2PJ81ATBMDsPKIudVCPK
rrSxc1LxzsmNz7JJG4Dw6URA+T9OyWriV6n3IR3zKeY90VFMk3H1sZX4vON0mdhe
06cYuCX1zw+ZFyQIJPTtXXtDuhlx+A==
=IYqR
-----END PGP SIGNATURE-----

--Sig_/Iv+v9RjNd3o=jfM6yHmNbM4--
