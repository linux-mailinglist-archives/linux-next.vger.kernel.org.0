Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B01B93FB287
	for <lists+linux-next@lfdr.de>; Mon, 30 Aug 2021 10:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234341AbhH3Iep (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Aug 2021 04:34:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233318AbhH3Iep (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Aug 2021 04:34:45 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF68AC061575;
        Mon, 30 Aug 2021 01:33:51 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GykB4497Wz9sR4;
        Mon, 30 Aug 2021 18:33:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1630312428;
        bh=SZEzIB2RBd1HQbC5lB0qz6HFUscMIGoQqnBzOMVgl90=;
        h=Date:From:To:Cc:Subject:From;
        b=tT+ikdFAwKWa7mVQony9oc4/SuNTKxuvoud61bq4naB1iPmYyV0JveKkqEJsjkE6n
         5nL2EmpK1MVo+L8Vgofu/CkH3k2hiOfCAvC9IABbg3HuZF+UefWtMbylxeg3axnyD5
         WStiQEOu4IJAVJAf+b4HigMDX+IE9rhToChpQrop2gPyZFrWUlgfj/5mAYviwJozJS
         mAmG3ipLhG3YPJx+9dG+WoPI9zFxn47QFAgb6Fqsg8UIZnO3XPka0RMbtwrvYAJxLO
         VFlnPaz3hp28eodTvf1ufHcWyVG08AksOkBeo82hOmDqfo/LD23qYcJnw24UZUcNQh
         6savBqJOqvXDg==
Date:   Mon, 30 Aug 2021 18:33:47 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning in Linus' tree
Message-ID: <20210830183347.6c8a5901@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/K_NaJh.cJphJNJN=ePRlyT4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/K_NaJh.cJphJNJN=ePRlyT4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

When building Linus' tree, today's linux-next build (powerpc
ppc44x_defconfig) produced this warning:

block/mq-deadline.c:274:12: warning: 'dd_queued' defined but not used [-Wun=
used-function]
  274 | static u32 dd_queued(struct deadline_data *dd, enum dd_prio prio)
      |            ^~~~~~~~~

Introduced by commit

  7b05bf771084 ("Revert "block/mq-deadline: Prioritize high-priority reques=
ts"")

--=20
Cheers,
Stephen Rothwell

--Sig_/K_NaJh.cJphJNJN=ePRlyT4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEsl+sACgkQAVBC80lX
0GysTgf8CsxUjrTw2B3tXaL38tlqxAVHkfVnnb3yyoIzOJiRbpOpRnzwDnl3fPwc
if7RnjOm4VMi84NbG1KgOVERkPzdpL4EhepePRE84VUnlY3xZtrVX3knVYCZNxEd
ZOzhe5vKkeUlKFHHgWuyKazEh8MeGYzkIBlUwsu9YDxO08yW3KH4au9n2BxeqN0G
R98FW7z8YX2xAv3fKws+0UEBUr0FBRJEuhyj8SkTqGZphbf683BsFUqmT1D3Hoiz
gF+VwPoVmbPDGy0TcYT9hpppIQrd3bqXMkBN+BPozK0mbHuODI1HNQ5j1rPtLKav
cvuDJSbFGrerGHECUQ/H2k32+0Ni7w==
=0jBq
-----END PGP SIGNATURE-----

--Sig_/K_NaJh.cJphJNJN=ePRlyT4--
