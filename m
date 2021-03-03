Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 567EE32BB73
	for <lists+linux-next@lfdr.de>; Wed,  3 Mar 2021 22:23:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237380AbhCCM3N (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Mar 2021 07:29:13 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:38495 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1451173AbhCCGBJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 3 Mar 2021 01:01:09 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dr3JB4RBdz9sVw;
        Wed,  3 Mar 2021 17:00:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614751226;
        bh=qW8vGKyd5T839NehRIAht2CQ/S7bvUVh6Hf/pxA0q88=;
        h=Date:From:To:Cc:Subject:From;
        b=mtjNSovJvuRATmfWrgTUCGizfQUI+9lCASmKymvVtflD+3YPJuIRKXfz3GkTdNYI5
         FGTyZDvUy8mcwxjT1fEhI67Bo4DoWTleo9GyCDFktXxRnOOFBNsGTvXHFXz5focP5x
         6BoClvzztTaBS2zrpolTUUDeyHvRez/ruC+DMQ+o9Z9Y6yyr7il6IN/3/qkk00FOsu
         PmVoEbT6pTQ5JXw4f7mUWAYgak8hzgFVNKKRYTazmmSbIhwI7lRFPKVfB9daccj3mn
         gjjkRT2J6pJtheLGGACOdD1JjqUdVc/BmwRlDPpXBTeSR6mHVA6i4p5iSVM9tSQpma
         LZDSXZTvXVZrw==
Date:   Wed, 3 Mar 2021 17:00:24 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Xiaogang Chen <xiaogang.chen@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20210303170024.6930a278@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LvZ2oGlerbMwEw3G4fUNfBO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/LvZ2oGlerbMwEw3G4fUNfBO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c:86: warning: Function=
 parameter or member 'work' not described in 'amdgpu_dm_irq_handler_data'

Introduced by commit

  b6f91fc183f7 ("drm/amdgpu/display: buffer INTERRUPT_LOW_IRQ_CONTEXT inter=
rupt work")

--=20
Cheers,
Stephen Rothwell

--Sig_/LvZ2oGlerbMwEw3G4fUNfBO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA/JfgACgkQAVBC80lX
0GzzlQf/Y6cQ5i+CIylCd0J/XdMb2hsbV6rIhUfyrqjFFo/KLnvcqqTRm5DXdT+B
x7Nm2nFi2iRLurd4r5RWYmgfnYXnPyaOVq3F7Dn9L3QthGWQ2HAnKlSQuKw8e1nC
ElgOFXOyWI6IKINvP+jakGGkEsb9M6AblCKBHvO6KzB6EDHrHdONYWkrQzSn9x0D
P5EflX5JYz2mJjseMmRsUQMEOrs5yBVl/DN4LZxGkVm+SMBs0R5AIKqi64gjKWPr
/LprwaX9fxetUXStr0XS4ZWxnasQALC1cugHYtg8zr9MK374/BPU7pps4tF2jEWY
6BkvWxm2wlxOaUfx/zrm0X76FymioA==
=SODx
-----END PGP SIGNATURE-----

--Sig_/LvZ2oGlerbMwEw3G4fUNfBO--
