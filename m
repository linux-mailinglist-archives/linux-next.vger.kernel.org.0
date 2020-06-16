Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6DED1FA4FF
	for <lists+linux-next@lfdr.de>; Tue, 16 Jun 2020 02:21:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbgFPAVt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 15 Jun 2020 20:21:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725960AbgFPAVt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 15 Jun 2020 20:21:49 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 050C9C061A0E;
        Mon, 15 Jun 2020 17:21:48 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49m85P4GkHz9s1x;
        Tue, 16 Jun 2020 10:21:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1592266905;
        bh=8dDLOgyEC7GgskVCrXp+M92UrgQnty9Ym1LyTH3JOKs=;
        h=Date:From:To:Cc:Subject:From;
        b=omRl2NiWjGGwgoSLsi89qr7QjSh6oHUoIXBZ6ya/fK8Ruzqv97+wYhR465efCgGwE
         ljvEiWEFn2PlJrU6cm4ow7jrKov2YCs09gkAM1T4rASjhaP0Ax4aaEu48gluGDx1A/
         81TR1EqjWtxpJ8ASFiAmj1uHgWQwAZTNC6lHbYavosHdg1XxysCgRiZb96ktgTt0sd
         R84ku8trBW7A3NYGluxARRTem9R3+KzoHumOlYklGjbQGHJ+krEveQXz2AajU0E3iJ
         W1j79zb+XfNP5v3FzO8iFPrIXLlhDO22W9nj6+NYJZ9jGwCkV+kv9xNKMn35uxTIsJ
         0mVheuNNN3C7Q==
Date:   Tue, 16 Jun 2020 10:21:44 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>
Subject: linux-next: build warning after merge of the vfs tree
Message-ID: <20200616102144.48daa1bc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZfwXJuG1..8g=GsiiSJPOF6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ZfwXJuG1..8g=GsiiSJPOF6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

In file included from include/linux/compat.h:15,
                 from arch/powerpc/kernel/asm-offsets.c:14:
include/linux/socket.h:419:38: warning: 'struct file' declared inside param=
eter list will not be visible outside of this definition or declaration
  419 | extern int __sys_accept4_file(struct file *file, unsigned file_flag=
s,
      |                                      ^~~~
include/linux/socket.h:427:38: warning: 'struct file' declared inside param=
eter list will not be visible outside of this definition or declaration
  427 | extern int __sys_connect_file(struct file *file, struct sockaddr_st=
orage *addr,
      |                                      ^~~~

And many more :-(

Introduced by commit

  f0187db056dc ("iov_iter: Move unnecessary inclusion of crypto/hash.h")

Tidying up include files is tricky :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/ZfwXJuG1..8g=GsiiSJPOF6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7oEJgACgkQAVBC80lX
0GwvZAf/fkKP5rzR85VmjLp/Neb5b938qDGuyFAlCqO/6Al/QFviVT/NXEcGWe1+
8Y2w0nZLO6LWYNff34ImKhk/4FN1xEATQsm44M/lzkuIhB8kcEckBXn5l20mSdNi
6hQRBoVctfuRqso7qle9CSI2UKhdPK8M1n5KKDBE2IM4HBkqi5jhLq2UhzPL2A8l
s/dPSEiEZUL88i4v/qo92gXVY8a6pSTX36WmiJ0Uv9GLbYlpvMShbIhRBivAhTnW
t1taqQr8UTWk0BOWcuG6lznmO/wttN43GLj1lDSuS0BkVg3kwRbafhjy0xHMAWfQ
edH1Vtot+NTJwH3z6WvVpuOmhhNiuw==
=zOIb
-----END PGP SIGNATURE-----

--Sig_/ZfwXJuG1..8g=GsiiSJPOF6--
