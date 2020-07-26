Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE2322E2C6
	for <lists+linux-next@lfdr.de>; Sun, 26 Jul 2020 23:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgGZVjQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 26 Jul 2020 17:39:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726522AbgGZVjP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 26 Jul 2020 17:39:15 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEC2FC0619D2;
        Sun, 26 Jul 2020 14:39:15 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BFGXx4W2zz9sRR;
        Mon, 27 Jul 2020 07:39:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595799554;
        bh=ApcFR71qrvKz8PioBoSbgRamVmbBxjSOU4Y5stNUvfE=;
        h=Date:From:To:Cc:Subject:From;
        b=G8Ur0KqcCo0vCUJKVUVFLwgXHE2nJOX0ddeFv2ugY2rpPs+3p7WidQIdyBlpLrbZn
         Y6YAGYUB3UwreFnIW12SB/kXHtDskfCA6zzXI2qjQMNu+uZIPicKJLECWjovecf+GE
         bRSLI/yqkupd3e+OHnHvRI0ibyEh1zk6lmJCpwvm1h9pwIZY10D7tdHgTWRYxtdinZ
         Kg7Vhv3uDryqTWh+4vnoz5m8ookGA3syecW4ImiLVeUu14WLus5yhQzJIfdVzwDlHR
         e7BqSu9c9icj98K2imlU+XrMFAWtPg4mB6B/akc+vYeRP75lN7EHY+fugrXKUqs0/h
         C4RdP4iQsatAQ==
Date:   Mon, 27 Jul 2020 07:39:12 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Helge Deller <deller@gmx.de>,
        Parisc List <linux-parisc@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the parisc-hd tree
Message-ID: <20200727073912.688c802c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BL4u6oDW_dp5CQnureH_gCr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/BL4u6oDW_dp5CQnureH_gCr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  41fbb820b797 ("PARISC: elf.h: delete a duplicated word")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/BL4u6oDW_dp5CQnureH_gCr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8d+AAACgkQAVBC80lX
0GzsrAf/cvb/eY37GetAVDcjr0384JEGyaMOiMe7WdQpfUChTKe4m5FLxSqT4mZZ
r3G0+Ls4BdRA9+qZjqn4eRqu5d1vorNLsnbizl9YKlIyH+u3P88HV0y0/fmA2oAm
GVNqsvKhtBnye4/VImBConJ+XrV7BwDEgqaZguw4Xz3doNWBFIoPs8nRMJ1xW9wR
+pM4+WXCQ+Iqe1CZXXoN1GY94OpI8F0jJtQqxSqV9H8Ftjoz7sArv1TeIuHgz2cM
rLVeplLpj3BbLVWUlYez/5TUdt7jUo0g28TeC7if/DWbzjS4n+IWwg2l8R+tefwF
m0IqxlteH5uo9Qb6dkSLxnWOvE+Ouw==
=e5Ty
-----END PGP SIGNATURE-----

--Sig_/BL4u6oDW_dp5CQnureH_gCr--
