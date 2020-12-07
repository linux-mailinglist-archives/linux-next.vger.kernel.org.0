Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F18E2D0B5B
	for <lists+linux-next@lfdr.de>; Mon,  7 Dec 2020 08:54:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726226AbgLGHxm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Dec 2020 02:53:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbgLGHxl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Dec 2020 02:53:41 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63EECC0613D1;
        Sun,  6 Dec 2020 23:53:01 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CqFsl0stqz9sVl;
        Mon,  7 Dec 2020 18:52:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607327579;
        bh=q89fWh/FOitTh3UK25AzHFQqwxsrGqKMFz1b8owihjQ=;
        h=Date:From:To:Cc:Subject:From;
        b=Azdr+l6xHKbUPWwy9fiRDfiztCO9MQr0bl9KSSKzHJ0YqHsw7himsWVIH1KdTNt78
         Kol2z+Cb8ZRJwODmvrtKELdkjlrxFE7UsxmmgrggS4I34GRbNOvDK9FJDB5GenM4LW
         aucXzChzzA2sGyk8yITFAxk0NbKkSdmyOS3EqvI17wE7t3fSSPF79bqSIMgH6qtcEV
         LReXllZWruHw5SJTt6wf5B005Vf/cyXMKfpi9tP18IsFKKLJyCYsx2LsNC6SaZo0ZN
         Uej9OPXidADakx80hhpjXgCD1hKm7IfyvEtQu0t5w71xSEXMwFuOtvqoHTIBasrf77
         4YYK3Jx7N1q2w==
Date:   Mon, 7 Dec 2020 18:52:57 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the jc_docs tree
Message-ID: <20201207185257.1198e407@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bBTZThPUXl+rEzR/8iIUick";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/bBTZThPUXl+rEzR/8iIUick
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the jc_docs tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/nios2/index.rst:7: WARNING: toctree contains reference to non=
existing document 'nios2/features'

Introduced by commit

  ed13a92d0fde ("docs: archis: add a per-architecture features list")

--=20
Cheers,
Stephen Rothwell

--Sig_/bBTZThPUXl+rEzR/8iIUick
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/N31kACgkQAVBC80lX
0GwpvAgAlp9hftxHBqgOZYYp8m3KdkhET5ex8eRWnRMlLE/ZYvnceXfbEx/EXAWD
+2Z9+fQSCRsUDrvNjxR1nTgdWdJlxwr7tgVGqCCvpHBJSwmXXnHMBYGesOrMJpsi
90XKWbNZZA2Xr2DYabAF8ONSqrnjpQymm34Nd6NkScNMGpLq8Mhlh5e1x/JlCwAo
k93E4xVp3LZouzlj/JKbvn7VzNPHeV83ON6B6M1cMZVe7DRUWnRHdVwewRRCqNE4
eZHCD0OYRIqN1dRM4tf+G87J9Q+QDO5NV9sBAiB/pwaqTnBPIPXZFdtn05qPS4bf
2Wo3snBGbFRFsxle1LgVk9AG4AYnDw==
=yb6L
-----END PGP SIGNATURE-----

--Sig_/bBTZThPUXl+rEzR/8iIUick--
