Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98C3D460BB8
	for <lists+linux-next@lfdr.de>; Mon, 29 Nov 2021 01:38:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376322AbhK2AlQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 28 Nov 2021 19:41:16 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:32993 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229863AbhK2AjQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 28 Nov 2021 19:39:16 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4J2RGj1455z4xQv;
        Mon, 29 Nov 2021 11:35:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1638146158;
        bh=sl6OkVyTmBzFAo4K/CcdtQ9gOUad16E4lv7Ukbhq9ts=;
        h=Date:From:To:Cc:Subject:From;
        b=ltCpX/M0x7NsPu4seKcI/oDgs/grUhKS42ik3HoDOg9m/XsZ/RZq9KR46nb8IF9sm
         tQVxfBi/FHlRFy7c8V3nrulY8FLyMyEqR42jDZQF/XmQt3s1u9OPeYRYxrrLfDm17u
         YUaijkv+9wDg3jDrzTitutXhuzAK0dqbyC0Xdbm+YJ3y3ClcssHgE3rToH1NLheuE9
         jnXbKd/4cJ18xHzCtHxwb1ooWlcXVO2hiueuxkcgPGZ0udkU+CqG4pw84MsVrfKuys
         Bpu8V1WNtWPpMDdyKTcBcgjrOz53QIXalT/GtpRpZMORKuo6/OPNL7ed3a4JjIc4UU
         FZfofeHLE0cpQ==
Date:   Mon, 29 Nov 2021 11:35:54 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.de>
Cc:     Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: linux-next: manual merge of the sound-asoc tree with the
 sound-current tree
Message-ID: <20211129113554.59416109@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SvKsVSNlUPT52W9WQh_cqp0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/SvKsVSNlUPT52W9WQh_cqp0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sound-asoc tree got a conflict in:

  sound/soc/sof/intel/hda.c

between commit:

  86f74ba3fef5 ("ASoC: SOF: hda: reset DAI widget before reconfiguring it")

from the sound-current tree and commit:

  a0f84dfb3f6d ("ASoC: SOF: IPC: dai: Expand DAI_CONFIG IPC flags")

from the sound-asoc tree.

I fixed it up (I just used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/SvKsVSNlUPT52W9WQh_cqp0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGkIGoACgkQAVBC80lX
0GwNSAf+J2qDyq+mS1R35JbvYe1Qawjt7g03hJLkgtKFKafI+BQcKo6kDknymXfo
fkx0H6RwZksJJjVeP1sE2Tddmn2tQiJcv1aqQWaR4CbMOfSMZ8HvcWyKPylAnYlh
vb0JMU1cMkv7QOFghYNqUp4TP8gcwCof71qhqNGWeaAosD7dewVpz3Pk21jn9yDI
3gIh5FCVKn3VXVKfNFb6cHHd9SaZW3+IRVJ0nfCkrAsZv2zQLE1ZU7IcoZVzG+BS
GzUTXdbnGgz2yRIzTqVSwGNwvFcVv1bUdIqSwh20h9Idx0WahNcaKKhom/It+oUB
mpzcE5/isUWjQ7tMxo1nTC/H8ZgXQQ==
=E5O7
-----END PGP SIGNATURE-----

--Sig_/SvKsVSNlUPT52W9WQh_cqp0--
