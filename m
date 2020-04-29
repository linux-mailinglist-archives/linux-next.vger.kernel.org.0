Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D64EF1BD187
	for <lists+linux-next@lfdr.de>; Wed, 29 Apr 2020 03:09:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726377AbgD2BJ3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Apr 2020 21:09:29 -0400
Received: from ozlabs.org ([203.11.71.1]:49585 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726363AbgD2BJ1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Apr 2020 21:09:27 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49BgQX1NKtz9sSb;
        Wed, 29 Apr 2020 11:09:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588122566;
        bh=T/M4Oy/7NAhFLjToJqEfFVjU0k/0ztT/epAq2hzZM8k=;
        h=Date:From:To:Cc:Subject:From;
        b=akO/usM0Q40P98gJKYvtsh/7bZ3sRhXgxMcvNGO6L4k0l7qncoCPJ/PRFql2kHFhG
         GdrWW6LNq0OCJXxI7/RNSdDt4vT380ejOmcC4yPzUGZJN2l6q2z3dtdxWItI6MfSpk
         Cpi2CiBGaMpNiTl0pb4/hWNoX84F+XYFgtduQFO9u8b7dIsHihL5Yk41ZWHkDffda4
         ScrDZSDSlEaYq0GmQSvseWM0cYyP7vYLWlOMjGXsLAL/NNJMnjzq5HoQ/beDT7w/ov
         woesaOTamGUk+YfApOoIX2t+HzyFDgMKZpBWq17WwF9r2/uUStU5tGxc/lzZf0wRV+
         2brgy/QMuMY/Q==
Date:   Wed, 29 Apr 2020 11:09:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: linux-next: manual merge of the jc_docs tree with the arm64 tree
Message-ID: <20200429110919.6ec33b4b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=F=gNooNUiRO0BwEQ.DmsgX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=F=gNooNUiRO0BwEQ.DmsgX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the jc_docs tree got a conflict in:

  Documentation/arm64/booting.rst

between commit:

  e24e03aa00f0 ("arm64: docs: Mandate that the I-cache doesn't hold stale k=
ernel text")

from the arm64 tree and commit:

  877a37d31e0f ("docs: arm64: booting.rst: get rid of some warnings")

from the jc_docs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/arm64/booting.rst
index d063c05d5fb0,e50186092948..000000000000
--- a/Documentation/arm64/booting.rst
+++ b/Documentation/arm64/booting.rst
@@@ -173,8 -173,9 +173,10 @@@ Before jumping into the kernel, the fol
  - Caches, MMUs
 =20
    The MMU must be off.
+=20
 -  Instruction cache may be on or off.
 +  The instruction cache may be on or off, and must not hold any stale
 +  entries corresponding to the loaded kernel image.
+=20
    The address range corresponding to the loaded kernel image must be
    cleaned to the PoC. In the presence of a system cache or other
    coherent masters with caches enabled, this will typically require

--Sig_/=F=gNooNUiRO0BwEQ.DmsgX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6o078ACgkQAVBC80lX
0Gw0NAgAhtDudp4OEppDb4/XLXaSBgbWQ00nGsi8nPeKOxgvTR+lICy5fhjielv9
TnFVFLJlWORXdEnASuIK9AXY4aqrB7nOM+Marc3MB3GkKn96nkHEGT3CyaFFEdrZ
+Ifg3bMIoCMkEjVF/MfHgWOMJaGpNHrOv7V2i/2SRGOuiVMi2MbupHXPFO2uO+zg
23/ViholOaHnx+T/l+kMtwAAOC5JazXaEQnNoFDmyAQns/TKhfgk85SG2fjicsEU
7F6eW7bL+adprJLaMibZkhUK/gMIZ3O0u9BTL4Q4+yFPUj6KpqoNijsPyiwMXGT0
IyljIgLOJnn7ljBn4/X2MoSXOb/Rng==
=lvAG
-----END PGP SIGNATURE-----

--Sig_/=F=gNooNUiRO0BwEQ.DmsgX--
