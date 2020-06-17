Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD101FC2A5
	for <lists+linux-next@lfdr.de>; Wed, 17 Jun 2020 02:26:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725964AbgFQA0g (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Jun 2020 20:26:36 -0400
Received: from ozlabs.org ([203.11.71.1]:49349 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725894AbgFQA0g (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 16 Jun 2020 20:26:36 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49mm8T3s1vz9sR4;
        Wed, 17 Jun 2020 10:26:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1592353594;
        bh=7929sf0Q6b0KFfPiRdQySR72V3aR4DJe8b2tX4csIeE=;
        h=Date:From:To:Cc:Subject:From;
        b=LCi6bg6/IT4pv+LY4xI5t6AHRotho9c8Jk2LFlxTKz2NChXx7vmBcY7YAadhRFYPf
         WChXqzwaqTJt3qpOR0cOeAStB7PeITuTB5+1Ts4ZAy8VnBqhJkI0BYt+WCmhElygR9
         OCa+blt1piL4UIVDbgMQYzeLBVrbSmAZLt26hEfN1D+Boi8xWPH3vKRYnnHag94xwc
         jx7Eu2P8bfPtg4rUUC6eSuxwoFPCvg481oQgu+BJj1PNElyw+IDet0XxRGzAER9FKd
         RZHwZIY+3TgDUJaeG26N7UiHG0QPJg3mv0V39DU1Raq8udm1DLrLYtHsBxg5tbQkrh
         42JmS1e69obww==
Date:   Wed, 17 Jun 2020 10:26:31 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lewis Huang <Lewis.Huang@amd.com>, Aric Cyr <Aric.Cyr@amd.com>,
        Qingqing Zhuo <qingqing.zhuo@amd.com>
Subject: linux-next: build failure after merge of the amdgpu tree
Message-ID: <20200617102631.2e47c92a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/t=slCX5rlVqvHsyZWgpB1+1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/t=slCX5rlVqvHsyZWgpB1+1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: modpost: "mod_color_is_table_init" [drivers/gpu/drm/amd/amdgpu/amdgp=
u.ko] undefined!
ERROR: modpost: "mod_color_get_table" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko=
] undefined!
ERROR: modpost: "mod_color_set_table_init_state" [drivers/gpu/drm/amd/amdgp=
u/amdgpu.ko] undefined!

Caused by commit

  4a9025f397c6 ("drm/amd/display: change global buffer to local buffer")

I have used the amdgpu tree from next-20200616 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/t=slCX5rlVqvHsyZWgpB1+1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7pYzcACgkQAVBC80lX
0GxAgggAmSzuaXGP8+1oRpb+5coEs6HwVWwer0IYOAEMoOyIVmArNJ0h0m1N8Ukv
a5lvfwPACU6pCrHXoj39EEdpCVJhzkItqGLTmbPru/i1Gg11ovec0ssdmOJOHAb0
+quk1z531QQ7L3+JgDKpwh7pT8u0teF/vHVwzojR0PHh9sDs7HmcedDe0zj3bC6B
3dU3hIlsowDql7HJkf/5EnAwjDsT8kaybP9Q5ZNfTsFnU06oWSQUuYbmkZFj7+fA
u7Kb5HWdPEjUkq3uhpVj/gLiwcfQo8hG7hwQnVOyGY0Fo+au2cVzE77J9GRLbkBg
7UJJwqUmoiiN/HwSHY86f9TYU4nmmw==
=VM/S
-----END PGP SIGNATURE-----

--Sig_/t=slCX5rlVqvHsyZWgpB1+1--
