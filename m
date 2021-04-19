Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F33963639C7
	for <lists+linux-next@lfdr.de>; Mon, 19 Apr 2021 05:41:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233064AbhDSDlt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 18 Apr 2021 23:41:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232317AbhDSDls (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 18 Apr 2021 23:41:48 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF9F2C06174A;
        Sun, 18 Apr 2021 20:41:18 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FNszv0V9jz9vFN;
        Mon, 19 Apr 2021 13:41:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1618803675;
        bh=cAVLM2BXqsAmR3+ki1xqKH9yvBe+hvjmgZlGfsQXMsk=;
        h=Date:From:To:Cc:Subject:From;
        b=cv2Q6u0MAAQzTRttrCYQqpU56hZlFjihbh4UFMmzei4ixQBNCZuww5wmI6XYUSgiy
         V4LQ546KXymkhLHNulXXutAgg6Qvnc3w7j15C06YCCaqmMwNt8Ul0Oqaoc/WVe7Dvu
         LQZriEp9lDt/z2WN/UxLK49ASuQ84txox0RFegHDiM/OGFkLHrvdNJFC3Hntxi1RpV
         RXIJ1atOoH1PKSyHYr4jlhdgUXdOaO4NV5xeiKaug2NiR5EHjW1+vpjajqxwqIP+DC
         +9cPuC89mBITKkDJzuiYZEQDlej8Zy9zSotBsyOXg5BIJmmX9pkZtYmXvw3/LUtQd9
         DpSsHDqCX0E2w==
Date:   Mon, 19 Apr 2021 13:41:13 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Thierry Reding <treding@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the sound-asoc tree
Message-ID: <20210419134113.710e79a0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kw3/=F0jD=1y2Tu=wP=sPZY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/kw3/=F0jD=1y2Tu=wP=sPZY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

sound/soc/generic/simple-card.c: In function 'simple_parse_of':
sound/soc/generic/simple-card.c:478:1: warning: the frame size of 1552 byte=
s is larger than 1024 bytes [-Wframe-larger-than=3D]
  478 | }
      | ^
sound/soc/generic/simple-card.c: In function 'asoc_simple_probe':
sound/soc/generic/simple-card.c:706:1: warning: the frame size of 1552 byte=
s is larger than 1024 bytes [-Wframe-larger-than=3D]
  706 | }
      | ^
sound/soc/generic/audio-graph-card.c: In function 'audio_graph_parse_of':
sound/soc/generic/audio-graph-card.c:612:1: warning: the frame size of 1552=
 bytes is larger than 1024 bytes [-Wframe-larger-than=3D]
  612 | }
      | ^

Presumably introduced by commit

  343e55e71877 ("ASoC: simple-card-utils: Increase maximum number of links =
to 128")

--=20
Cheers,
Stephen Rothwell

--Sig_/kw3/=F0jD=1y2Tu=wP=sPZY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmB8+9kACgkQAVBC80lX
0GxhHQf/Y/SIhweMQB8GDqQhoGvxry5etFz/G6vpCb8aL6PA7UCLyzUWdP/rfIVO
mw67MoOGsqKhLdzSWETSY3uUkFRsvwzDRCZYopSxcBQaXq6t4HI9dOuDZrAbNKar
U+i1VqEsC29E37+bN2rAJogLiijUPu1J4/ZCiJ8w3fU1oEyYE30I82JnmXpEeB3J
zbIREM8OUuwpaslYi2ytRzGiRgVt8ORiBZkyD26hB+1PDfdVeddKH0i3KR7R7cmz
v1lo3yF6ybiII7FAc1WBlXUZ5IekcurkKVJcxuf68LFmRpjxG3RaOMnKShgfLrEP
LvmLGlJIBl/r1q6bb8yyG66/oJyTfg==
=72Qy
-----END PGP SIGNATURE-----

--Sig_/kw3/=F0jD=1y2Tu=wP=sPZY--
