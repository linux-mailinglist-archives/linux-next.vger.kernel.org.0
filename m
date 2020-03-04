Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAACB17881D
	for <lists+linux-next@lfdr.de>; Wed,  4 Mar 2020 03:17:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387482AbgCDCR7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Mar 2020 21:17:59 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:33589 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387480AbgCDCR7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 3 Mar 2020 21:17:59 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48XHbT2VjPz9sNg;
        Wed,  4 Mar 2020 13:17:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583288277;
        bh=hpgJ2oNDHzFVZ1UIs/SBXcgrzbH4pnZJKFb2uK6CM7A=;
        h=Date:From:To:Cc:Subject:From;
        b=vFs+lrp7xK5y2ur+m9MY4atDzgE5ieV40Uw3dVW9WZqhd54ijh/zXtmrndUdWOAOU
         oM4dvjjo9Bn/iPp0ajdfhrirJ4ee1KxmrwTSuYfvRvUan5O3dUZ7B4rEpfWEz4xk6W
         quFLfY8ONwxCqK7UCucEOu5g4Ix5cyVDXLonyqM2+gQ9+HZF8wvQ5VoEUFxinWhHhW
         bos80cb3EC2lEi3ylJ/hF6VaXR/cjzrYqKTUkTbs5piVPXQ8Tho5U9WJTESKoZ1Q2g
         BM4YDcipW0VUUZLf22AKZbdA7uZrnDQAHMCXzIgINWtmGIxf1Nzb1aiEjTJLL5+Rz6
         K1MBwoJbpSlcQ==
Date:   Wed, 4 Mar 2020 13:17:50 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pavel Begunkov <asml.silence@gmail.com>
Subject: linux-next: build warning after merge of the block tree
Message-ID: <20200304131750.55d84beb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2g3lSYciyAYKzTKo8jSMg23";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2g3lSYciyAYKzTKo8jSMg23
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

fs/io_uring.c: In function 'io_close':
fs/io_uring.c:3415:3: warning: ignoring return value of 'refcount_inc_not_z=
ero', declared with attribute warn_unused_result [-Wunused-result]
 3415 |   refcount_inc_not_zero(&req->refs);
      |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  62e0c6b73a2c ("io_uring: make submission ref putting consistent")

--=20
Cheers,
Stephen Rothwell

--Sig_/2g3lSYciyAYKzTKo8jSMg23
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5fD84ACgkQAVBC80lX
0GyMSAf/ZS/X9mvmvslQ9O0FV3yMqMnxIaKXZmyRqKQlCooOxb8U9tMHfHe6F4K8
nIMrMx8nwXV6OjJd7GFs6IDSjLw8EUHSd9Abw07p1J7kscWy65k2UJ/W13TdEvJV
j72yz1TQ8EG/AGAs8y/pWYVyH3uYOifRGZKM2qOCkIPmh5jGn8QP26IIqjXJDEQx
0Wl3lZJCkIIzpXt8oxEM3QUFf8flMgzedzPnu6Kv7rv5JIbZmNJGUt0ZSR5Zx1Nr
b307BPZC3F9lv3ZEiO1L36nqPiBEmAmU/0HjmD1zf47+4Cj2vS5pmro4qr56uU47
ffLDtVOzbXWD6glevVD4Kl75UV2qag==
=Kpwx
-----END PGP SIGNATURE-----

--Sig_/2g3lSYciyAYKzTKo8jSMg23--
