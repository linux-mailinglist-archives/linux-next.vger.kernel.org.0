Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05A3A1C9FCC
	for <lists+linux-next@lfdr.de>; Fri,  8 May 2020 02:47:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbgEHArZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 May 2020 20:47:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726470AbgEHArZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 7 May 2020 20:47:25 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAB20C05BD43;
        Thu,  7 May 2020 17:47:24 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49JBVz0N4lz9sPF;
        Fri,  8 May 2020 10:47:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588898843;
        bh=Sru0SU7UziI8B/5HJP5reha3IJ1qcfyy07IpBlawwvI=;
        h=Date:From:To:Cc:Subject:From;
        b=p77wP1IT79SXzozt69RTp8dNAiU008XViZuFgeF5IPEkncTmwxhVc2u/Lv/WAqwow
         lSpDrVVj2vo+5UFUhK9ANnLLemMMnrBZ+qhgcbCQGG6E7O3PgtMMZTz1+ARGKyDmg9
         FyIbBmkwn4+r4o6TTTUQq+z2WxwanSGziOkJ2T7HaZTzU9lvcUi5rNWop1Nkx92+hy
         9Qz45P03q9HdYfUgojWja0dXaf2qSxJMEwelu1jM/JY1KajnBfluKm01fwm/dKu/N3
         K+/0gW995Xd8qyyPhEKxpqBBcFkHBjAnkwMV/tPhfh6Xqn+WHqQjjS8K+BYZulThLQ
         ii40WZa/S2eTg==
Date:   Fri, 8 May 2020 10:47:20 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "J. Bruce Fields" <bfields@fieldses.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the nfsd tree
Message-ID: <20200508104720.5c7f72a5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/47Xwc3.kga22M=IgcKZ_CGU";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/47Xwc3.kga22M=IgcKZ_CGU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the nfsd tree, today's linux-next build (x86_64
allmodconfig) failed like this:

kernel/trace/trace_hwlat.c:329:12: error: conflicting types for 'kthread_fn'
  329 | static int kthread_fn(void *data)
      |            ^~~~~~~~~~
In file included from kernel/trace/trace_hwlat.c:40:
include/linux/kthread.h:60:7: note: previous declaration of 'kthread_fn' wa=
s here
   60 | void *kthread_fn(struct task_struct *k);
      |       ^~~~~~~~~~

Caused by commit

  7df082e85764 ("kthread: save thread function")

I have used the nfsd tree from next-20200507 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/47Xwc3.kga22M=IgcKZ_CGU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl60rBgACgkQAVBC80lX
0GxZvQf/d5tNT2G+QHIRnp0WtQqMaMA6jY9pkvVDdcr3sPHplddTnzvwmAJc5jN7
f1zugUsifO445Esb243fZaukl7hNsWbGjs24pFqRcsLLs26NLL1RswDF7Qgis6qV
8Uo6VjIzYed7hIySjjnWzCblIdBCKK6Pqh0gWq/cQz2gMq0o2hqa3ekFsDoZ/rzQ
r4Pe+aT3E8Wxm+h3cU3p2axorqlhqe0PvU0lQvGEvtXOR1PaRAENsfqntJ1B50GJ
cbNzfCBTexKvQfvHm5X29yy8RxctvItm1rmiNhhzRB0utsXU0MhMmqUZwPdXDieo
zzdhd+m1ZtpYaVufkKhpinFVxsWwSQ==
=6At+
-----END PGP SIGNATURE-----

--Sig_/47Xwc3.kga22M=IgcKZ_CGU--
