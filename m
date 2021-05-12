Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7451337B576
	for <lists+linux-next@lfdr.de>; Wed, 12 May 2021 07:28:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbhELF3R (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 12 May 2021 01:29:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbhELF3R (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 May 2021 01:29:17 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6F63C061574;
        Tue, 11 May 2021 22:28:09 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fg3Gb2Bcsz9sWQ;
        Wed, 12 May 2021 15:28:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1620797287;
        bh=/5RHAlccoesPiuluK0zBVuYXX3yfB6o1Q+YUTE2t7Iw=;
        h=Date:From:To:Cc:Subject:From;
        b=bcMfL+7r4cxFnfIU0ozLdouT99NW0bObe3cuX2+b8iYGZ0JFozy9O4kiFx7haOd+E
         uERckQwL+zX/FLDPK+5AfCxFT/baatdD++Lg8dpsftbWz87Dnk2wQqos/zvA0iRpbz
         pnf8bGp+UPnAav2C4STXJX9Kr1gxn/kgCwZUEHzG6viG1Y790N+XJdpeRjdSUk0v0N
         c1jrMh2Wykpvy+szkl0jHND1oSca0b1gt+VBy0ovhYqfhUydD8MH6tzZWBO2gHRhmR
         2hpDhriBl0VhAUx4MaK9ZLON+vPyQQ7TvDebJVJijN3HydU3ApcdAaGZmqqkdwl1vP
         nL9nr8FEk0vsg==
Date:   Wed, 12 May 2021 15:28:06 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Waiman Long <longman@redhat.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20210512152806.2492ca42@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/F1zt0=n+hJuHVee60HCOrOk";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/F1zt0=n+hJuHVee60HCOrOk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

As Randy also reported ...

After merging the akpm-current tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

mm/slab_common.c:764:8: error: array index in initializer exceeds array bou=
nds
  764 |  .name[KMALLOC_RECLAIM] =3D "kmalloc-rcl-" #__short_size, \
      |        ^~~~~~~~~~~~~~~
mm/slab_common.c:776:2: note: in expansion of macro 'INIT_KMALLOC_INFO'
  776 |  INIT_KMALLOC_INFO(0, 0),
      |  ^~~~~~~~~~~~~~~~~
mm/slab_common.c:756:39: error: array index in initializer exceeds array bo=
unds
  756 | #define KMALLOC_CGROUP_NAME(sz) .name[KMALLOC_CGROUP] =3D "kmalloc-=
cg-" #sz,
      |                                       ^~~~~~~~~~~~~~
mm/slab_common.c:765:2: note: in expansion of macro 'KMALLOC_CGROUP_NAME'
  765 |  KMALLOC_CGROUP_NAME(__short_size)   \
      |  ^~~~~~~~~~~~~~~~~~~

and more

Caused by commits

  4d57437a3d3c ("mm: memcg/slab: create a new set of kmalloc-cg-<n> caches")
  0727bf117622 ("mm: memcg/slab: don't create kmalloc-cg caches with cgroup=
.memory=3Dnokmem")
  d795c307bd3a ("mm: memcg/slab: disable cache merging for KMALLOC_NORMAL c=
aches")

At least they are the commits I have reverted to fix this.

--=20
Cheers,
Stephen Rothwell

--Sig_/F1zt0=n+hJuHVee60HCOrOk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCbZ2YACgkQAVBC80lX
0Gys6wf4q4v3gIUr32wQ5QvVCfhjPGG+HTPGYErMAvMAeBrt9t72Xrn0zmtFFowu
f4TEJUL9MMnThgZQjIMmRuONQsDhtg+JTbQfkqFvYVvnkCD4sm8tfQiViac92kcU
otBsHCls4sebH8Rqm2RoKnr4LjoHIAMZUeFECGoi321OlI+UoburmkFRsJ1V8l2h
EfEibsKolqkGZFmZ48REnIHSzewRtCTMrJLcNPlVocRLRpgneqPsD8Bs/Z9sHVpd
phcZjLWPXzqVJZimPwMcNM6rzhkfQzyG9rdwqcsgxYd0jwMNVZziz9nXbvfhBpxJ
ugp/olpEsCxNf6R/+8yiQnyLUOnh
=eFg8
-----END PGP SIGNATURE-----

--Sig_/F1zt0=n+hJuHVee60HCOrOk--
