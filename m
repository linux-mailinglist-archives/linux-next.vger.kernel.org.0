Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 568013131E5
	for <lists+linux-next@lfdr.de>; Mon,  8 Feb 2021 13:13:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbhBHMMR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Feb 2021 07:12:17 -0500
Received: from ozlabs.org ([203.11.71.1]:50333 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229963AbhBHMLr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 8 Feb 2021 07:11:47 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DZ4cJ0CLPz9sSC;
        Mon,  8 Feb 2021 23:10:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612786257;
        bh=FyhNgxQbLQd+3RGhcAmFGJhNxmo9XTA1ZhcChztorps=;
        h=Date:From:To:Cc:Subject:From;
        b=tq82cs1YPQgAkY3Ba3qYo9Y4Ob9HxZUhnXlSNpO4/RkAceU1H5e0FiPc6tQN+nTsn
         4yVAEmXqvhM747U9wOcgoTRj9gX0/OsFh8CdAHBWgOf0BanrlxhMK3WjVKfvSJj8eD
         QIO4+Rxznc4/KffFJ2ZOVOoS7dGcLCK0xqv1KqYCeO2K92ZKHr0Wx7WlT391F8DMc1
         CXkdO0THRRtKwbgEcUBx2IpKoKUQ3UdzEHHBPYNYM200zgDURhZNXNAqpWfQNen8ES
         laFW8PA11EfGxifW/4+cU9AEcrMxtr11fB46GZHP3Up6JDWKxfTjxBIi5sc58pGCjN
         tcSISOKSJ0POA==
Date:   Mon, 8 Feb 2021 23:10:52 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Shaokun Zhang <zhangshaokun@hisilicon.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Yuqi Jin <jinyuqi@huawei.com>
Subject: linux-next: manual merge of the akpm-current tree with Linus' tree
Message-ID: <20210208231052.6af62234@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2oMFJae6H08dtqDjxpdbqvB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2oMFJae6H08dtqDjxpdbqvB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  lib/cpumask.c

between commit:

  2452483d9546 ("Revert "lib: Restrict cpumask_local_spread to houskeeping =
CPUs"")

from Linus' tree and commits:

  9eca9bb9bd98 ("lib: optimize cpumask_local_spread()")
  a7ac26ba236f ("lib-optimize-cpumask_local_spread-v8")

from the akpm-current tree.

I fixed it up (it was sufficiently messy that I just dropped the 2
commits from the akpm-current tree for today) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/2oMFJae6H08dtqDjxpdbqvB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAhKkwACgkQAVBC80lX
0GyvJAf/SresCZL9+IKtWoHDUYGP4TvrsYDcV1YufG043YDlRHv1q/zPlBm7kNEX
+GdbX5jIuuYaJMjgnt3tpWO2T7CIk5BI3rI0HtfGCb4opWwGscEV+iqMh9Z/Cktk
WjhyZDGKnS/vUcgOwMORH0IFOyftSySh6rGXWNEUkN4fS+eHYXxGs3FKb9YeE7R2
FHhGyVbVNAtKcDUi7HvaHq19qg8WPr/xsWsmULn+xHf6rgILtphxz930djEIpwxS
fApwicXN0W1VacD0ymHULyEz9lBo6z3sxQpLTYJPWGIkfuGowupAdujZ9LRrbdto
07uwo8edFqEnrFw/UsbgG15ZCt0cpw==
=MqBB
-----END PGP SIGNATURE-----

--Sig_/2oMFJae6H08dtqDjxpdbqvB--
