Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B0962422CD
	for <lists+linux-next@lfdr.de>; Wed, 12 Aug 2020 01:21:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726235AbgHKXVZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 11 Aug 2020 19:21:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbgHKXVY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 11 Aug 2020 19:21:24 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9428C06174A;
        Tue, 11 Aug 2020 16:21:24 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BR83N6h2Xz9sTF;
        Wed, 12 Aug 2020 09:21:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1597188081;
        bh=Y2vW2Epp8nTTxxe83f4Ui3It8Mqs0UxYWMCHKIcXLJk=;
        h=Date:From:To:Cc:Subject:From;
        b=Serdodq7YpCGYgosG96NAHtfdDy1lsToeReIeHp/XtAcU/5fh5lgFZHAKKP8cFC5t
         ib0k2cw8oBXLs7aG7JWCaNu4iZ/K3DOSwWmAsWXy3ZaWJauFnnWoqHQ4hpjwjHhSGK
         mblgiR0S4DCl1CFAWGzDowXTJyPQYTDws8cuZKoh8nCUVwYF2U4X4huJlNiMxtYYL9
         sSIWoG7wABhqMdMsDPQPL3uLeJ7W8K0blihWvB98kxGKlhfhXeanq6Em+QyJ716dtc
         ZqW2DCqaL+gfgQKuQUtSNUQAyQW6pIRIn9f9q9OdaVPLw2qt/Cd9AfmoMTgnGSnN50
         JWONHJxs1L6wQ==
Date:   Wed, 12 Aug 2020 09:21:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hui Wang <hui.wang@canonical.com>
Subject: linux-next: build warning after merge of the sound-current tree
Message-ID: <20200812092119.710d92ec@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/N8rC=SW9_Z70GIOlKuDN2Pz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/N8rC=SW9_Z70GIOlKuDN2Pz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-current tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

sound/pci/hda/patch_realtek.c: In function 'alc285_fixup_hp_gpio_led':
sound/pci/hda/patch_realtek.c:4163:19: warning: unused variable 'spec' [-Wu=
nused-variable]
 4163 |  struct alc_spec *spec =3D codec->spec;
      |                   ^~~~

Introduced by commit

  404690649e6a ("ALSA: hda - reverse the setting value in the micmute_led_s=
et")

--=20
Cheers,
Stephen Rothwell

--Sig_/N8rC=SW9_Z70GIOlKuDN2Pz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8zJ/AACgkQAVBC80lX
0Gw6FQf/XlUYJEIXpWSeKfVYd/oIa6KCjtEQw7DyvvBDI7FYzdENg7Kbohkghsgp
UMTru+QX84d6Z7gzjiKC6djaa6DL1Be/g8Ycjw0J6KQSDWm2kUaUA1RDN0+6I+of
prJzmDe7N+sULAX2gZAC5GC8vTTsFTGXOBPHwWlYhtlT0zDWgG6r70/rt6SdnTfJ
W/aqwRwATt5Hk39sN0zBMjuBAxEZ6XcFNGZTdRNAwhpdy/wTfiHMM/SF5oodUrDk
x1WFCnWitNJhMUq/dlCeCsyBkYVecLnyrvBpvvPP6YIzvJAlmzhVOTs6nwoVM45V
FT59gSxCHyyq2sz1fB9sRhMR4F6GVQ==
=/88z
-----END PGP SIGNATURE-----

--Sig_/N8rC=SW9_Z70GIOlKuDN2Pz--
