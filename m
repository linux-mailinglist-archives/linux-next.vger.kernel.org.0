Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF55C422200
	for <lists+linux-next@lfdr.de>; Tue,  5 Oct 2021 11:18:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233449AbhJEJUp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Oct 2021 05:20:45 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:60929 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232773AbhJEJUp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Oct 2021 05:20:45 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HNsTS4MNgz4xb7;
        Tue,  5 Oct 2021 20:18:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633425532;
        bh=TxU2TxIV/a3SqR/wQxMj9enTwZkNIY3qAgN9xbCvWNo=;
        h=Date:From:To:Cc:Subject:From;
        b=G9xS+7OHaW4H59/RFt5xqQfV811BqIWC7qCT4bBiBwEQYLk75x+0tFVvHOg8SwWdG
         GP9vlKuV5NjILrOIxeenQEA4rmII7uIODHCahitrmr6/XU0YFwe2FqLVDg08NKfdT5
         zZdDlUWA8+NY54fc3Um/taKWxJR6dXxzwmjkKci+cm0YSJEVbUKP1kJZ1xnCRhcYrU
         NbRuG3Vy0aNDhBa1hDM/3tZbOv67WOKan5tsLaOFwykciydDtgeoOASdz7EzyVq0W9
         NFBADfCObyoKO9ACuSHXIvwT7tjJlXhmi3pWPEYrrBucdAlQwMBrZB2cnn9CDv5d2G
         lQGULmc+97IsA==
Date:   Tue, 5 Oct 2021 20:18:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jeff Layton <jlayton@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of Linus' tree
Message-ID: <20211005201851.38832f67@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7p_1Qf6Q8Sem.puLqpe=RPC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7p_1Qf6Q8Sem.puLqpe=RPC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In Linus' tree, today's linux-next build (htmldocs) produced this warning:

Documentation/filesystems/index.rst:18: WARNING: toctree contains reference=
 to nonexisting document 'filesystems/mandatory-locking'

Introduced by commit

  f7e33bdbd6d1 ("fs: remove mandatory file locking support")

--=20
Cheers,
Stephen Rothwell

--Sig_/7p_1Qf6Q8Sem.puLqpe=RPC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFcGHsACgkQAVBC80lX
0GwreQf/XuOibdl41QeTYbdQGSqsh/TFUQeTBzOw/x3XZIo3RgR1jT2Qx6XCkeMr
C6gBUM9MOXxl+j8WClaGAwVsmjlmIjomSB0kvd/jZzAZLT+763XJ7qEX8ZJ7tgTu
jnLOlHYb+D+PRaT5aLyKOZcMoaTi9m/Gbwwx0dTSEi0D8P1B9zQTX7j7wnpxYSuJ
Bax/HnWRXGifSGcCc9mmCtov9vOOY3FnOGNPo1cWBSeqXJXNYvI65gj2f45g11SH
duxlex0zZB/KqKT65N7K6oO0tNyMAL42SFdM63qu7SG+1NIhGbnsch8Tmiss3uEW
jbIN7OxISNVMiLR4XMb3GbeZCwezvA==
=h3W7
-----END PGP SIGNATURE-----

--Sig_/7p_1Qf6Q8Sem.puLqpe=RPC--
