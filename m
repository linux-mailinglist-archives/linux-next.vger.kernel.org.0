Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCE5229A1CB
	for <lists+linux-next@lfdr.de>; Tue, 27 Oct 2020 01:49:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409216AbgJ0AoD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Oct 2020 20:44:03 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:47957 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2442566AbgJ0Aem (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Oct 2020 20:34:42 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CKt4v2kZvz9sSG;
        Tue, 27 Oct 2020 11:34:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1603758880;
        bh=SRySHku4bay8aCqf4SMpVi84fnl72EAVPJmYnNBY3KQ=;
        h=Date:From:To:Cc:Subject:From;
        b=jpCDUsq64lC0G2rZoqvcUJB0m20qdFzfn0CGbCnUPPaODwgtDd54DxoGMj5rpzDPf
         R4yCF2UTor1AJuf3kKBI1viQBCuMf5LpCFuguH6G88Ay1RDf6vom9HeHhaIeDH8Nxm
         lAnKTqsnFLYfC1A5RUo84LpQ+vkK2JX2bHPP8I2aBcz9qC2RWPcaDWy+MCzXoTZrJb
         bJ5FfBXy5XucGZELryRZsKbgsDTZriUvEFT4ZXXS2z5nv15/jXMmBwcS+/KQytTGOV
         geSPjsHpaWbc84JewxVVNdAqyHtha4kodShxy/74KRYYsxj88UZSGS/9cmIE/j5Fl4
         7hsUQsTbCEckQ==
Date:   Tue, 27 Oct 2020 11:34:37 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     Bernard Zhao <bernard@vivo.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the thermal tree
Message-ID: <20201027113437.76d3fe13@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/O5hGGn8xF_ACoz0Qm=9YUt.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/O5hGGn8xF_ACoz0Qm=9YUt.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the thermal tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/thermal/gov_power_allocator.c: In function 'power_allocator_unbind':
drivers/thermal/gov_power_allocator.c:587:33: warning: unused variable 'par=
ams' [-Wunused-variable]
  587 |  struct power_allocator_params *params =3D tz->governor_data;
      |                                 ^~~~~~

Introduced by commit

  ee7e92c62370 ("drivers/thermal: Remove unnecessary structure members allo=
cated_tzp")

--=20
Cheers,
Stephen Rothwell

--Sig_/O5hGGn8xF_ACoz0Qm=9YUt.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+Xax4ACgkQAVBC80lX
0GxbEAf/S7kZZamTQDN52XayZnrBvijAeOHo8am8t++ND+skIzyezGLZYid9lgQz
AVlJvOt5l5uNK5lOVmsaZPEg21N0FVjZTAZOMve3AbjUqR5J5rOi/ZFZtSyTOOfL
p8WwYxOmu13QAsDeMHs3hcMDTze+2ddelXa6sUvUIgEabfwmwAH2dbvp/TVgeBE1
UVWoT0kz37eh+zDEyy+/6P7vOLwNv3BoZWGaFTBxCapxCmvX4oIWQ7KxAGv0Bciz
uT94BxO4AtzPm/goPgUzLC9lT6lca/lQAwYe9qLpAZFndc6YTbLlEB2h3qx4zLDo
L9aX3CvT9YIet5moDl97Hjezx4fyKw==
=Ltqu
-----END PGP SIGNATURE-----

--Sig_/O5hGGn8xF_ACoz0Qm=9YUt.--
