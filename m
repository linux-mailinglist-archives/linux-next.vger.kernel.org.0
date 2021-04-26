Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ABE436B34A
	for <lists+linux-next@lfdr.de>; Mon, 26 Apr 2021 14:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233428AbhDZMlR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Apr 2021 08:41:17 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:36543 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233426AbhDZMlR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Apr 2021 08:41:17 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FTPcv06FXz9sWH;
        Mon, 26 Apr 2021 22:40:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1619440831;
        bh=srHTDLaE6/Ax1kqLp1QD3/Nh8xnjaKoB07fux3jx/qU=;
        h=Date:From:To:Cc:Subject:From;
        b=rarFuZHTCg0UBSNl1vtQgW/AFfjAtFil/lPbROchDj8mwyN+0ddxbLQnnSPXysC2F
         QTv5o1YocK6vzh3WR3DuabViU3rNpcvnyGm3IZqr5Iy0IEwTv5i8Xk8s9/WlpZ9HFD
         IgsywdMqmk4am8VtNtD8Psu4cV4lJWdVB9seaJafM/5PpDSqY6CZzMf+I7zWcTxEwB
         FdQDiTnmlAmdDDa6d9sLCgPOz43kWm/Zg4lqujM1ufVxhF0OVRBSQizwuD2sbchQOk
         z7CEtlGbfSRed8l2HEUIEYXLhnLNlg4GUi5EWllK8OvZ2dSRlrVL0K06roj5mvpLUh
         XNvMBoKrddHNQ==
Date:   Mon, 26 Apr 2021 22:40:30 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Nirmoy Das <nirmoy.das@amd.com>, Dave Airlie <airlied@linux.ie>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20210426224030.38cc5597@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/64QnA8A9i5OXeIl/i.JV95s";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/64QnA8A9i5OXeIl/i.JV95s
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2808: warning: Excess function param=
eter 'vm_context' description in 'amdgpu_vm_init'

Introduced by commit

  a35455d065c5 ("drm/amdgpu: cleanup amdgpu_vm_init()")

--=20
Cheers,
Stephen Rothwell

--Sig_/64QnA8A9i5OXeIl/i.JV95s
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCGtL4ACgkQAVBC80lX
0Gw47Af+OwAda/DiGGP/iwUPDOXVAqfSO03ntNgfE8mzEv6D/VcOMx8M2J0xq9WJ
0qd/zpgPDhDw7cA9+qSDBMD82RmJ0OW3/tYPSa9Pw+eMpOFoG4hgS5TefyDk1VmQ
M8+ie+ZXlKjSsyKKE1tX8P7CbaHePMN5LkqlmxCvf822LL2X85vkt5sWnyvDHdEa
aSMCzQYIZsPj9P/PRwj3mdRtZuDxTkW/TY8yTS5py4NPlgyb/O32xrUn8XgHBHBK
189wjAYbROJLh7GmLcy5qSWMvOkXShRxVMZbC9zQcxiTcYb0nMqjfmmc4AK4+Chk
blEaPYyp34VnEWuCfW7Etv8IGmSLUA==
=KJgL
-----END PGP SIGNATURE-----

--Sig_/64QnA8A9i5OXeIl/i.JV95s--
