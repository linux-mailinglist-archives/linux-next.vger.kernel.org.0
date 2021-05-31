Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C75FF396979
	for <lists+linux-next@lfdr.de>; Mon, 31 May 2021 23:57:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232207AbhEaV7J (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 31 May 2021 17:59:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232057AbhEaV7E (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 31 May 2021 17:59:04 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5635C061574;
        Mon, 31 May 2021 14:57:19 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fv8K82rn4z9sSn;
        Tue,  1 Jun 2021 07:57:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1622498236;
        bh=6JdKm/y7YGw2JLTKdlhkSnBOoth0OxzC7+YPxdgCZAg=;
        h=Date:From:To:Cc:Subject:From;
        b=elUY5TnwTQvqrLU5mXOudZR6jYWElcTyUQOwC2ig4+urOQxxdyEwsKHWATc8dLdZ4
         tvaiSa87CKCJj9B3ftkqXO86pP99j6NkxmXXPka1+ZNebMBKbqxohmHuqh/x63CwsN
         gnCWRr9dusgNjRaMGz6fhVSttQe8S2LxDOPMXXl0CrtCZWFH+wVMybkj4u+xWcbhAK
         2NryPf0mQjCU/KvqBrRQo+4zRdNOiGtY6wlGZ9hq1sMR1etKm2TyUXaPlJcW0ykEWM
         p9ATJoC9A3/24x7QGXEPDSO2jDEKq6xTwOe6HFn71839el6qNkMDB4ZYQ8DESV6c7z
         IwN64phwzxbwA==
Date:   Tue, 1 Jun 2021 07:57:13 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the risc-v-fixes
 tree
Message-ID: <20210601075713.6cffe979@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/re.ShItbnm08reIvCuXBAT8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/re.ShItbnm08reIvCuXBAT8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  345f7d3d5e58 ("riscv: mm: Fix W+X mappings at boot")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/re.ShItbnm08reIvCuXBAT8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmC1W7kACgkQAVBC80lX
0Gwz0wf+Mlk5eOliCxp7SMAYQJIp9cS+by/bZh98pNu7GdP71y0X5bNQVV3Foz2y
PraXiNMLpLQl4E60QVPgtgQQ86GmT/gp1MGUn79Q9tLyp8sx5jJOnm/SF5UUcgws
/mUGRyfXWsHd7vL2kQVV6Df+EubwR3bdqZA85ae0DtUhGXSPjR5AJL1iW5hcm4Es
BoGcAGyr5hcLWLLupFqX58Wn0lJyx+NKeVRMzbOgMajnmlgbUyNfrKml6BgLHFuw
RdvUA03fz7Sbm1reg0QXMmOVnpN7XNaBh3WVQvcA7wUUFKVdWYGcknMeEdZBMwsp
vdQfu3n260U7xzvZQTU7fUFDoyEgjw==
=T8ic
-----END PGP SIGNATURE-----

--Sig_/re.ShItbnm08reIvCuXBAT8--
