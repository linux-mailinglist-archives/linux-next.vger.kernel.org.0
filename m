Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43D1428FC45
	for <lists+linux-next@lfdr.de>; Fri, 16 Oct 2020 03:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389513AbgJPBst (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Oct 2020 21:48:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389331AbgJPBst (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 15 Oct 2020 21:48:49 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F7FEC061755;
        Thu, 15 Oct 2020 18:48:44 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CC8FP0zkjz9sTK;
        Fri, 16 Oct 2020 12:48:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602812921;
        bh=Bv8mW/Z5DDg0FU5ThZnGc9FK3ffvxVVTHJa3v2eHyYA=;
        h=Date:From:To:Cc:Subject:From;
        b=nlXlQP4bEQIFVveP2R4zhVUl+XH/Bh+QLW3vFMUNd7uOycEVyJBijG8UABRpEmfgt
         DbWbqlcLPSuYWylsOTi3yfWWj5J0zVEvdclLDEGBea0PbZTD2lyPp0B2mszjNARFRf
         S2e8lfxCSUmW9ccE+q4pR6Z5sFfDX4g9QBhOuD+oAKPloKHKlLUm7GJjSPn6pnWpPa
         xysmhIqRk/owH96XvUlL9ASzRFSNjLhbb9LNijScZ8Oa7ZBMhuEPDpRzngwCYqdCBN
         yYsJ4CWqqDtD/5harpPH3hcVWPP3d/7eZSgE/kpm8WfZVwLdLe60aUj+DYRnR8aDE0
         OdjXmAAaj2Lsg==
Date:   Fri, 16 Oct 2020 12:48:38 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Evan Quan <evan.quan@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the amdgpu tree with Linus' tree
Message-ID: <20201016124838.4ff60cc0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LPfLcBmW6cQ0Etf_uyl.eNi";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/LPfLcBmW6cQ0Etf_uyl.eNi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c

between commit:

  3cb9d2416ccd ("drm/amd/pm: setup APU dpm clock table in SMU HW initializa=
tion")

from Linus' tree and commit:

  44d6e160f60a ("drm/amd/pm: setup APU dpm clock table in SMU HW initializa=
tion")

from the amdgpu tree.

So this is one of the things that can go wrong when you have the same
patch obn both sides of a merge ... due to the context not verying
very much, the chunk of code that is moved into smu_smc_hw_setup()
by these identical patches was inserted twice by the automatic git
mrege resolution.

I fixed it up (I removed the second copy of the code) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/LPfLcBmW6cQ0Etf_uyl.eNi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+I+/YACgkQAVBC80lX
0GwRxAf/b6gRvc7Fn6uxOaNiccloYNgx8JoYEp67S+87fjYdaf8LeR6anQ4slBHY
sTNInM8ipazcVx+w6RheGCwpq1fx8atGiHVxQ0vGiIaK+4i9YdUUamKwUinAz31B
ngh7Expln5/KAPhNOqdimp10hqeHxzTL26NuqmGx1338jrwfaveKbB3tpqaNcl/U
jZATCNIJbPGf6cHmDI+3Rk3JKZBtH/Dg1uvtQadFnp8/BNHupNlo+ye+WC1/FjJ4
Bks0qTFj6hKDj5Wxx4JQSk0njkKILhVH0yeWOV04uK+/jldupiCNo75L9RPf6BH1
sQ+dbSA+AYKapoCiWFN3ZeVaGgi4KQ==
=T7Z1
-----END PGP SIGNATURE-----

--Sig_/LPfLcBmW6cQ0Etf_uyl.eNi--
