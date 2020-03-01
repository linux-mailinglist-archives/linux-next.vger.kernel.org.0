Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16117175116
	for <lists+linux-next@lfdr.de>; Mon,  2 Mar 2020 00:57:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbgCAX5c (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 1 Mar 2020 18:57:32 -0500
Received: from ozlabs.org ([203.11.71.1]:44113 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726525AbgCAX5c (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 1 Mar 2020 18:57:32 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48W0ZK0pGmz9sST;
        Mon,  2 Mar 2020 10:57:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583107049;
        bh=DuSLnUr35DXODwI4DBeSVJxBwE18+GqQqRr8hQzRGuY=;
        h=Date:From:To:Cc:Subject:From;
        b=T5fnJdoU45AE6Us1fC+X5MpU2zT7cPESYEcgnKZtO4qC92+FCXRILy0f5fke8ZXfA
         zsoMx0D6YC4/E8ZJEwAYIBBUqRjD/YkIV7a3vekc7p/QHhUUKMBZV+lMvJSlO5/lW2
         +0R3df8SzuqOpdLMiesWs7eUR7oXKj/Qz2FD6lpf42pFiJCDxnYw5G04b6XSv9re5f
         XdLl0E+Unxzj/Nwu7WhnuFAh6lXf9sDOyLvwmu05B9CgmkZOW8UIBhkQJQxTs2YJbv
         lg/T+D3ayayJsBUyrcXpjTq5PSA+XKSd2IMEoZ6vh5seeJthJy+65z4nXjufwr3VG1
         SF30B32pPPcrg==
Date:   Mon, 2 Mar 2020 10:57:28 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jack Yu <jack.yu@realtek.com>
Subject: linux-next: build warning after merge of the sound-asoc tree
Message-ID: <20200302105728.47220741@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/b9v=zbieo6M1zJ1nqxaotch";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/b9v=zbieo6M1zJ1nqxaotch
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

sound/soc/codecs/rt1015.c:844:31: warning: 'rt1015_aif_dai_ops' defined but=
 not used [-Wunused-variable]
  844 | static struct snd_soc_dai_ops rt1015_aif_dai_ops =3D {
      |                               ^~~~~~~~~~~~~~~~~~

Exposed by commit

  4a88b7dec331 ("ASoC: rt1015: modify some structure to be static.")

--=20
Cheers,
Stephen Rothwell

--Sig_/b9v=zbieo6M1zJ1nqxaotch
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5cS+gACgkQAVBC80lX
0GxgYgf9EUU6zQadwDIhmL5Mfe2jwNlnYqOh+Pr775vhPIjn9CmtYA2BFZr/wKDW
/MPdpi16UrA9Z0AqNScXYzd7NvXijBnVEw9DhDEyO5/RCzxxUXw4KBTtaJNXdTVa
MGbBVSmo2qAdPz1tQ9iwtOrS0pCpsRONTFlTmryxfwHLIJVIMr8fY7SOVal0pPiZ
u8X2KD0828LQjAbfE7QZXNQdQ3M4BHlgTmqdJjauSyALveUuneCgssTVnczRivMO
EntbIERZK2P3uDs6/PMSfB4XNdTssL83sbKcwvo2i2aBihemIc8qSw9qWAjUnCTz
To8LVMDS6sUzx/3NOnIqM79WSE/0og==
=zvYj
-----END PGP SIGNATURE-----

--Sig_/b9v=zbieo6M1zJ1nqxaotch--
