Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08B9E346F94
	for <lists+linux-next@lfdr.de>; Wed, 24 Mar 2021 03:34:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232210AbhCXCdn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Mar 2021 22:33:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232108AbhCXCdW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Mar 2021 22:33:22 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6D73C061763;
        Tue, 23 Mar 2021 19:33:19 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F4sjS492fz9sWF;
        Wed, 24 Mar 2021 13:33:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616553196;
        bh=oSckkBS9r5RHgEoXuCoGzHtGVZfKm7ENddww9pnAJVg=;
        h=Date:From:To:Cc:Subject:From;
        b=cCcszVZCR511n8AQYxarqZaNCWVgvkdEx1m4LMfRj52zo+OGhyenkKD1rYWLL6sOb
         ByPN2SpUze4cKE2nAs0ReOAVHWZwn17H/bP08l1RXjy0lgdtXhyp09Po3lakRIfLqK
         YmrNHaw9pkF6wLPTcQnIB23tps1ItQAmI0bzSGbURkbPy41vWPKwwG7pbp4hC73qIn
         TJogh2EyawmimZHeGNrpe+3bE5cuNQuMNrTJPKCNffyznbkWlmKZQaMxyPbBjt3Nbt
         eIFLSeHYbmpfD7VV5XjC7z3Ooo6UV6zX//LtQrCog0kuZaEz0pvD8ijkgHEQ2NY0fZ
         bEOvKDFeFhKYw==
Date:   Wed, 24 Mar 2021 13:33:14 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     "Leo (Hanghong) Ma" <hanghong.ma@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20210324133314.545fd4e3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jx4CO.QrpIIr9bR0/eRHn+c";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/jx4CO.QrpIIr9bR0/eRHn+c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:926:13: warning=
: 'dm_dmub_trace_high_irq' defined but not used [-Wunused-function]
  926 | static void dm_dmub_trace_high_irq(void *interrupt_params)
      |             ^~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  44a76bac327c ("drm/amd/display: Log DMCUB trace buffer events")

--=20
Cheers,
Stephen Rothwell

--Sig_/jx4CO.QrpIIr9bR0/eRHn+c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBapOoACgkQAVBC80lX
0GxtjAf8D1S7iT5s7QSFJXWXJblaMMnIJ9pX6K82QAtVDjCY0QlkK3ISmG7naB1P
BGer1w2zStp9zt29FhZMVlbNG71Kaklxag8wIm5k3Mfyf2F/hIjvRXTXpuKLuprX
dfYuE/Fka3Wd5qSV9wg2vmkEO2efRS4bz245bvgO84kxaWGOjMaog6WyEKWk0iAH
0Ophl2S525O9YGGRfRKZAGSUPaXbqmWbTh7avIzpvzLsA5a8g24Ltowo06Olh9QJ
nlj9cIbssEYW1bceeqgad+hXD8PuF70hOsOFXVdoDcoG3Tma4KvtQJ2C5A9XIRxz
7uSG3FlCfafEL5Df583TzXqD4OM+Eg==
=rnPD
-----END PGP SIGNATURE-----

--Sig_/jx4CO.QrpIIr9bR0/eRHn+c--
