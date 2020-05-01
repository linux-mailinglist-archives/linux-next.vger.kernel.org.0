Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4C111C0D05
	for <lists+linux-next@lfdr.de>; Fri,  1 May 2020 06:03:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728083AbgEAED2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 1 May 2020 00:03:28 -0400
Received: from ozlabs.org ([203.11.71.1]:51459 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725791AbgEAED2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 1 May 2020 00:03:28 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49CzBP5V3sz9sTH;
        Fri,  1 May 2020 14:03:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588305805;
        bh=tp5oK7Ntv2EqDe/q9runiSGnstVf9JGLroQUIvu05S0=;
        h=Date:From:To:Cc:Subject:From;
        b=NW7IFsEuaqGOhigbNFnxcB7hbIoKSpZ2dbvfB8irbsfz8gDPevi+oop0ML1o3r1C0
         x1EnnH2kg5FgJb2P4gLuiayjWAe4dYnOwKFi/UAfUtyFOdyRjf4onQJSfbmVsTFbf0
         Mt2m0TJXxgqkk+7OI+Y7MlmQIdnBUu0LWrhdwJRmUr5JTWyBhu6lwOTkIKXlBUA2sN
         B2zIlruhUhTdrEGiuJPmYsPGlef17pQIF7GIdtBQ5JuRmJTHkawiYVakJnflATH9Al
         m9piE59tWFbWcKcUaMatHtcEGGb3tr0rN+P3/JD7pu05NMxmHYbh2csOwYrbtCEiZD
         senhQ/8iGZgLw==
Date:   Fri, 1 May 2020 14:03:23 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: linux-next: build warning after merge of the sound tree
Message-ID: <20200501140323.0e0f4a9d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7RCqhyNlwLXx79jhI4G+C4J";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7RCqhyNlwLXx79jhI4G+C4J
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

sound/pci/hda/patch_realtek.c: In function 'alc_fixup_hp_gpio_led':
sound/pci/hda/patch_realtek.c:4134:6: warning: unused variable 'err' [-Wunu=
sed-variable]
 4134 |  int err;
      |      ^~~

Introduced by commit

  87dc36482cab ("ALSA: hda/realtek - Add LED class support for micmute LED")

--=20
Cheers,
Stephen Rothwell

--Sig_/7RCqhyNlwLXx79jhI4G+C4J
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6rn4sACgkQAVBC80lX
0Gw2uwgApBzmuUVjagQdtQ3J5Kt07r8axkbGaDXHXc5LHIzOgx4++jR+qPQ1lI4b
gk/GLsLjMZcr2vmc/cGVSu6TNmqiMmqpj5re+pUJ3IH4Tj977rCSQsPYZjmZCLb4
0XNeW+IP/tJf1vF0CnOzQmpjF+ueJAwD31lG48bIWm2BjF4/RJ3XR6lG6yLrRp6L
VACsNQwZsqLjo4+N2CRSFnJIdgyXJhhH6wilGgZS2TFjx2+/RAAmmAS5ieJHoP16
1qwP72hHgmbJo3UuIBHvtH7vX23HaLEzSr2i5shaodKUF1cVBUUi6Kvi2nHqxewv
GzBRFHTVAPEYSL17oUp6p0d4pBIYog==
=4YBx
-----END PGP SIGNATURE-----

--Sig_/7RCqhyNlwLXx79jhI4G+C4J--
