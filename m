Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50B30133531
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2020 22:48:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727459AbgAGVsE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Jan 2020 16:48:04 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:55209 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727139AbgAGVsE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 7 Jan 2020 16:48:04 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47smFr3lV0z9sNx;
        Wed,  8 Jan 2020 08:48:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578433680;
        bh=q0xVmy0Do29JZS4ejsunMLhnJ7zXk+irrscMW2EMAL4=;
        h=Date:From:To:Cc:Subject:From;
        b=IgYzQbYQzrxDr0GAegOLUuyp3CPQkoCk7KTaPtmuQwEKOtAZbHJTgHqfukQUMOK7Z
         ov+zV5hUxqEaRdybaphdPk6GES3otHi0f+JjXBgN4VmU23Q5lVnCFqogqsa4RGaDKV
         a/6ozpvkYRHGqM7CxRrKxqh7nwNjD9CYMOT0+7RjpdgpzRzLYv1pfN93h0tWSGtvUC
         sdXnWTsvdqR7a9zSL64q4As5Z+zPuUQl1sCHINf+DBKOJUwjzaOx06ED/744Fp336+
         G85e9gVdai8wq3kX5rnU2JuAoeItGmf74utL1yQgKtTgBYayk+spqIbF3VuzZqDODe
         JRge5pzWQjJxw==
Date:   Wed, 8 Jan 2020 08:47:54 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the clk tree
Message-ID: <20200108084754.3ec25383@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2Nv9u8W5hZ+maBKEQCH=ejW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2Nv9u8W5hZ+maBKEQCH=ejW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the clk tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

ERROR: "__clk_hw_register_divider" [drivers/iio/adc/aspeed_adc.ko] undefine=
d!
ERROR: "__clk_hw_register_divider" [drivers/gpu/drm/msm/msm.ko] undefined!

Caused by commit

  a43d909b71d3 ("clk: divider: Add support for specifying parents via DT/po=
inters")

I used the clk tree from next-20200107 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/2Nv9u8W5hZ+maBKEQCH=ejW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4U/IoACgkQAVBC80lX
0GwAlwf+IJdo0yr85U65By9aGeBefJWd4j+wbuiQbdIi8OIS2/cvCqPl+kKlTOY9
Gw9qcHtI5ZV95savDJlVuPsyRRbRwef8FyjY0A7W55FvKPmink6UXLTijYKmmgC6
xNbjGGLaCQEDsExKsRPBHcqnKW0okQ+fibE9QlYNCUCw23mrWQO6VpZgTP05DZ8a
/BgJONI6ZIA0W7FW2/1QqYOO2H9LHcQ6NOD0rpqUPLQvmAN9mq0whmuKM0NXLqvK
UbjtNE34WGNh4SiEe0jxPfSEn8XPuszMKwEPy4+pkHtqP8/yAENjUM/amhTc1bzT
yjfqdhgJTD4+2B17etX9buP86z8EXw==
=3cOQ
-----END PGP SIGNATURE-----

--Sig_/2Nv9u8W5hZ+maBKEQCH=ejW--
