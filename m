Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 526F71CF23E
	for <lists+linux-next@lfdr.de>; Tue, 12 May 2020 12:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbgELKWc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 May 2020 06:22:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726193AbgELKWb (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 May 2020 06:22:31 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD572C061A0C;
        Tue, 12 May 2020 03:22:30 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Lv4g2Rthz9sRR;
        Tue, 12 May 2020 20:22:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589278947;
        bh=/GZZFyB+aFFlCyjr23L7LSS3yMR1k47VEqh349nkQIw=;
        h=Date:From:To:Cc:Subject:From;
        b=UJftmxFjAA8GPsiYmaObEBrJoaar3UudCrxhh5N+KX96sz8W7Rfo1jNbIXpOImao0
         yfTh1KW0ovaznt65LzJTwK/IfW02lK2p/zwbrtzMAPg5KjweXysOJBLqLadiFYi8tX
         F6yeEhWZE2cw10bHo6ubPMGajmILB75Xw2AwAkRhUlqR411rBR9Q8JZ2UIpliJrkyq
         cgnw0oYdaFFy61GMg8j2gPAl+FwYXKZY45ZWRlJdY0xYzX1rZ67BRVqF10iLq25FCW
         xuTx0Z+30lkGmrYyt7DcNadpolcsBOoZORLn+tA3D/L5urfG9e26I+svRwaVBre6uf
         VRYZL7MTUp1Dw==
Date:   Tue, 12 May 2020 20:22:26 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the fsinfo tree
Message-ID: <20200512202226.79191a47@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DpkWlS5_5lCn=ntsZD6cdKc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DpkWlS5_5lCn=ntsZD6cdKc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the fsinfo tree, today's linux-next build (powerpc
allyesconfig) produced this warning:

samples/watch_queue/watch_test.c: In function 'saw_super_change':
samples/watch_queue/watch_test.c:107:21: warning: format '%llx' expects arg=
ument of type 'long long unsigned int', but argument 2 has type '__u64' {ak=
a 'long unsigned int'} [-Wformat=3D]
  107 |  printf("SUPER %08llx change=3D%u[%s]\n",
      |                ~~~~~^
      |                     |
      |                     long long unsigned int
      |                %08lx
  108 |         s->sb_id, n->subtype, super_subtypes[n->subtype]);
      |         ~~~~~~~~    =20
      |          |
      |          __u64 {aka long unsigned int}

Introduced by commit

  6e1617461ab8 ("watch_queue: sample: Display superblock notifications")

--=20
Cheers,
Stephen Rothwell

--Sig_/DpkWlS5_5lCn=ntsZD6cdKc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl66eOIACgkQAVBC80lX
0GyOowf+JHW7zSsZKLVrh5V+7ItvkpGU/ylg4IJgJrtX//MkAJ7wE1ejNvzQZF2P
Q96MJq21YHd/y3e/y9AIHmrpJBVrtN8MjgfnZmFju4BV7AfaCgOi4ZStUNacq9LV
N1cxiG/cypwmNYVqqlSAhj/4YJc7XbUfvP77f1VUvmQsCwJO5iBh8e7uBwGyFneu
V1FA8efmzSlM6efLNmeU9mAzO530qTU2UrokzT8vSha7mDu0LAEtiA9PyLL1DuCw
Lk1UhX7kJfREFUmqk2akP9r9VwZaylcG5V3PxZx1dhm5Finodc6zjTmBEvLAvDYv
Eor2Vo/YSN0WSkUhvCGFlBUV9NYQ+Q==
=2if9
-----END PGP SIGNATURE-----

--Sig_/DpkWlS5_5lCn=ntsZD6cdKc--
