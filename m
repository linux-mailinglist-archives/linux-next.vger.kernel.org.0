Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD7953CF5BF
	for <lists+linux-next@lfdr.de>; Tue, 20 Jul 2021 10:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232294AbhGTH1m (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Jul 2021 03:27:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232249AbhGTH13 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 20 Jul 2021 03:27:29 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E26AC061574;
        Tue, 20 Jul 2021 01:08:08 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GTWYL1JPXz9sWX;
        Tue, 20 Jul 2021 18:08:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626768486;
        bh=T1GnYFQVjkMA5xYpU+3ytUl0tJIBJK55G7FhdKOT7eE=;
        h=Date:From:To:Cc:Subject:From;
        b=kient5TSA2SDf7NBKGvnekHFByWrAOPU36qXbwRtXLy5gQeq3g2w+FQl+5oVwFJNX
         1HjBwH++OJGi50z9hVcYZSvsIlSaPlw8OyiWieWb2/hmEExnxNVZq5rdNpD9XjHkbU
         47NOFUCtNd6AE6oe4JQvme7LrrI2FaeuAaipn5/0yd0r78B/lO7ir+sMHPFUBQw9EC
         nNExSM4ZOYEbIs28JyTg+mXgBULdfgRlfHOd6ed7BfAAzmF0q5ct/iNRzyIKsViGNq
         d7SFmMe9JLnDH/hCroKy9YLamaNnkoJHrPQlA6nfqVWRHa5Xw8bzFgdSUHL8zj46/+
         MzHbl1Ln2uoTw==
Date:   Tue, 20 Jul 2021 18:08:05 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-tegra tree
Message-ID: <20210720180805.57baa5c7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NT02V4nJ.dvgeElgK/k4Rzi";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/NT02V4nJ.dvgeElgK/k4Rzi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-tegra tree, today's linux-next build (arm64
randconfig) failed like this:

ERROR: modpost: "sync_file_create" [drivers/gpu/host1x/host1x.ko] undefined!

Caused by commit

  ad0529424def ("gpu: host1x: Add DMA fence implementation")

This build has

# CONFIG_SYNC_FILE is not set
CONFIG_TEGRA_HOST1X=3Dm

--=20
Cheers,
Stephen Rothwell

--Sig_/NT02V4nJ.dvgeElgK/k4Rzi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmD2hGUACgkQAVBC80lX
0GwsxAf+Kqmxmfi4ccOUI/z7vSs5q50Vuzs9Nh9+wFr5auPGkfvor8ROVaIglyf0
KNRi1Gx8s09SlNTQ7G81ySnSStyZba105WWXhQij3JEnVBzA7MZivP9gL7DcdNxA
c7u3zZ/MICGsBRx0W4YuKT4tVkl3jo8idHdQe4yhTI9qALnGeHEzl04QMwWsHeIR
fkWpZR1phX2N1LwKLXa/hUGecPyNPOovL/fdZVQRg982CiH8Cz8yJP7kU7Xmp6qm
fSfvlhb80aFfLLZnbc3WLvcCiOjWlQhoP5fSsyTTOTQoMGB4tXneQVA1oEYLxQlB
eh898uiYnCo3Dw4TweOKcxogCEBhHw==
=d7SQ
-----END PGP SIGNATURE-----

--Sig_/NT02V4nJ.dvgeElgK/k4Rzi--
