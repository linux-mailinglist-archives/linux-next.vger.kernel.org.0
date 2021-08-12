Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 438D33EA4B3
	for <lists+linux-next@lfdr.de>; Thu, 12 Aug 2021 14:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236349AbhHLMak (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Aug 2021 08:30:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235913AbhHLMak (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 12 Aug 2021 08:30:40 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02E74C061765;
        Thu, 12 Aug 2021 05:30:14 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GlmH45fDKz9sRN;
        Thu, 12 Aug 2021 22:30:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628771410;
        bh=zqEbvwdlwDD/eaDwXJ2i6n8QNKo+UY+GXEC6FU5uTGw=;
        h=Date:From:To:Cc:Subject:From;
        b=B9gFpG6Cm1Bf7XQalAmqa5RgDxPLz0qTbkOFE2yAqzJTY0Efq+ZIjFkj29JIApcX0
         /TKTHX9hBg/8tNNnbqYC5FrVKxdlOLiYygeKDZ0YUt/jJrmaAd/SOtYxrafdjwXscp
         bQOJCV60q7JCRSPXlKCKhj9dEHcjCNFFdpU07wJTvziER39AW3zlV0K/ImZCxpXkvv
         2k2/hM1EoE0sLwnN5KNjwcGlEl6uuRz+TPPg56qjY1ywVvbuCq6sMyrR4vt2sAcLkz
         0ZQv/djF4mdrqBI5YEHyWF4p163u56IR5j6009saCwIOE0e26XAIMg19lWWyE98F7G
         9orwS85wwPBzg==
Date:   Thu, 12 Aug 2021 22:30:06 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>
Cc:     Changbin Du <changbin.du@gmail.com>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tags needs some work in the risc-v-fixes tree
Message-ID: <20210812223006.642bb3a3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kWDYIZ+FiuFwchISJs+dedY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/kWDYIZ+FiuFwchISJs+dedY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  007666bcc606 ("riscv: Fix comment regarding kernel mapping overlapping wi=
th IS_ERR_VALUE")

Fixes tag

  Fixes: db6b84a368b4 ("riscv: Make sure the kernel mapping does not

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.

In commit

  589be135381f ("riscv: kexec: do not add '-mno-relax' flag if compiler doe=
sn't support it")

Fixes tag

  Fixes: fba8a8674f ("RISC-V: Add kexec support")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/kWDYIZ+FiuFwchISJs+dedY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEVFE4ACgkQAVBC80lX
0Gz7jgf/cg2rvZhijVA80tndFsnoDUVPBJNlZCUN9FXGIxxA3L/H4mkDMdXkyVMU
fn/CNDyjFEIYjQ3OS8bE+FibBWC5d80kxqQA4BK2nDhqxyP9xnlbPuRmC/M8vev+
FMC3+t+6Agm3FNVXIaemBIozM7+IUCLlki6nzfbJwQQXL8fbyCgoIKnPWxF9C+Hm
nRs0nCfymwu2L92sHJVdNz2UsInfIbYHbVeUYf8CZ5cySaffnWT4jtCOgfye00x+
ssbx3h0o7RWO0WbDXq13lgKpp92LU0GghaV9+uFKmooNeoAzj/Jb+px/4mWghNG+
sdGoFPmmzEy1f+klLZg/Smx3X1cvPw==
=xNg6
-----END PGP SIGNATURE-----

--Sig_/kWDYIZ+FiuFwchISJs+dedY--
