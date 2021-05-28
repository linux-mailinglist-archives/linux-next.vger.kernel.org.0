Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7765393B35
	for <lists+linux-next@lfdr.de>; Fri, 28 May 2021 03:50:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234740AbhE1BwJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 May 2021 21:52:09 -0400
Received: from ozlabs.org ([203.11.71.1]:50201 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235568AbhE1BwI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 27 May 2021 21:52:08 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Frnh75tLMz9sCD;
        Fri, 28 May 2021 11:50:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1622166632;
        bh=GGQS53vYR6Zo95bRIvedG+HcoFM7LxlbKduhVDCjgHg=;
        h=Date:From:To:Cc:Subject:From;
        b=RH/16Pqtwgt+KDMMQbGDo0yenowBVRVfWb21jOw051aKw4VUxzpkJeRue66zrb1qQ
         voxpCuMpASFoZDKrESy5U7sXb+0u0tZZytU6GAF93hyOZEUENA7g35OKOxDRSAa/qz
         ljxqRSE3vRjeLWgkiiUIqXBAdwJvrOGRQ38rBXHm8C8hxhF64kDvRIdUz/qgT3hnib
         XogLXoTnYXxCOKHb7KFTgeXOAAOb8VBiMwEgpsVp3lqIFXVzv+FebLMxuZ9lfxFb9+
         jlBMCE71vY0Cxjd6K12KfsNQ7RmYquFydgjNINUkj4FUz/4zT/JtfpB+za4e0x+NDu
         raxOjCIfcAPzw==
Date:   Fri, 28 May 2021 11:50:21 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Fangzhi Zuo <Jerry.Zuo@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20210528115021.12d93459@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dGoK4zZ1E+Zg5hglORsA13x";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/dGoK4zZ1E+Zg5hglORsA13x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'a=
pply_dsc_policy_for_stream':
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5576:24: warnin=
g: unused variable 'drm_connector' [-Wunused-variable]
 5576 |  struct drm_connector *drm_connector =3D &aconnector->base;
      |                        ^~~~~~~~~~~~~
At top level:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5572:13: warnin=
g: 'apply_dsc_policy_for_stream' defined but not used [-Wunused-function]
 5572 | static void apply_dsc_policy_for_stream(struct amdgpu_dm_connector =
*aconnector,
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5556:13: warnin=
g: 'update_dsc_caps' defined but not used [-Wunused-function]
 5556 | static void update_dsc_caps(struct amdgpu_dm_connector *aconnector,
      |             ^~~~~~~~~~~~~~~

Introduced by commit

  998b7ad2efd4 ("drm/amd/display: Refactor SST DSC Determination Policy")

--=20
Cheers,
Stephen Rothwell

--Sig_/dGoK4zZ1E+Zg5hglORsA13x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCwTF0ACgkQAVBC80lX
0GzqCwf/RuLcxcl6wZ5hOlotDmTdSxf3G0jUEMMeMTCPyu6bBLgWJIVM+aTbL3cE
LNYsGQjIOfkh+GgLTxgm6pA3eNNSd1sEjiuMDu05U+I6KMc9FSqf1Nn6c9wOdAxJ
fNqK/+Sg1qG2rhPmoGBHg/W8LoG1gOKZ0CVxyc8ULIoKAGG9ZbIZS7w272ckQTo6
GnoGpUC6fE3aPzFM+H964wscxb/o6J7oQAcQcOgwTN0u7Wf1zcEo90g4UEQnsRwM
1pgSYDzwd3HTudLNdpWmHnkTjeYaEk+6GEDE0dT6t131H4dJ6S8Ejmyhd1clPWWj
lMVNYZY0uevAOnwd+zG3YR+J7ISWZA==
=GSz2
-----END PGP SIGNATURE-----

--Sig_/dGoK4zZ1E+Zg5hglORsA13x--
