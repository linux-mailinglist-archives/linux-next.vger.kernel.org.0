Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35E982CB508
	for <lists+linux-next@lfdr.de>; Wed,  2 Dec 2020 07:30:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725984AbgLBGaf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Dec 2020 01:30:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbgLBGaf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Dec 2020 01:30:35 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18FBAC0613CF;
        Tue,  1 Dec 2020 22:29:55 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cm8G74J2kz9sRK;
        Wed,  2 Dec 2020 17:29:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606890591;
        bh=QEzqJct+gvjJxU3fGmeZfsHLVO0Oxv9gwEHb+PbIu7c=;
        h=Date:From:To:Cc:Subject:From;
        b=lufMqhYX0xjyycCxQFpZ9ErOYu3nkcv6K5lt9lmN7Hl11r4hY7ocecjP7ZseI1y5L
         5JEZ1zIAsw5ZFpgPV4iwBGO1CULw89tdgf6lC8vSFPdNMaaBCLZZnh5TsCIYWklTuN
         hMr1IowUPZ0F/24RxwmAg4hSIM0rxLZU1jVLZbp8zwrABkO+IU5cvGbIsYna4jpfgN
         PkZQ3JmFZGAlCvqVnZWmQbkB4/7mVkZrcFSulwp8moR5TZD2iQb1pPa7dOtejczjCo
         uqbC6kJS6rfVJxRRLixYaX9b1s6Tl3pfH6HL+IX6cVj7JgQM9OsCku6byH20bvEJEK
         vVaNYLt5HNU3w==
Date:   Wed, 2 Dec 2020 17:29:49 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: no release today
Message-ID: <20201202172949.7c99f30a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kI/eis3gkQxG3shFm8pCUzQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/kI/eis3gkQxG3shFm8pCUzQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

There will be no linux-next release today as I have just run out of
time to finish it.  Normal service will hopefully return tomorrow.

--=20
Cheers,
Stephen Rothwell

--Sig_/kI/eis3gkQxG3shFm8pCUzQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/HNF0ACgkQAVBC80lX
0GxN8wf/TXihRvUvA/2OkHGlUwdrpnp5fbgKHBbj0E+xK23UEpfKWXauBv30IUbi
PE2Z04dYMCxOCkNxV9G+nesFCW4EPhrZf5meLvHQS3vz22D9DTz95WJt1Sx1Rf4l
Wb9nrOLE5cyhW8bORSAMvHU/v8fVQHnS5UtExezq+6LfYQohpIB5Yn4G3HQ5mbbK
PSTfh6M1Lt+lO1fSCiDwI3NQKta+xT7E8RUaI3isDmeHeJ6UI3CGCvaT6U5Ca42g
RE7z6Xl6xlUjuSb1BL9n0yysxhGO/MS8MmaODyvx1WrNCXqJquBsNZOqmSgI9E4p
Jvhq+Xq+pU+5H1S/otrA1tkWVdtKpw==
=7L7+
-----END PGP SIGNATURE-----

--Sig_/kI/eis3gkQxG3shFm8pCUzQ--
