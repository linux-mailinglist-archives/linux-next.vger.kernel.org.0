Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EE231ED820
	for <lists+linux-next@lfdr.de>; Wed,  3 Jun 2020 23:35:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726397AbgFCVft (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Jun 2020 17:35:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725961AbgFCVfs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Jun 2020 17:35:48 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D65EC08C5C0;
        Wed,  3 Jun 2020 14:35:48 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49chzP0yzWz9sSJ;
        Thu,  4 Jun 2020 07:35:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591220145;
        bh=smjuTbzXd6BvqaUqEYmjtqmDBBc6noS8vZURIsvhtX4=;
        h=Date:From:To:Cc:Subject:From;
        b=eUyvNAOaVsYDxUrHrJZ7OzkpEU4vIIH+w3VsTYIN08zVjMEngEIu/R11SciPTVhn7
         cmdD9irjW7y7o0IwhyTLs9iO7xEPurK9zmHvczgV0joLTB665lY3RA93B3qANMjdbu
         zNLzvRVpoLcIaUoJ3Zkstn1v5+8wVxbTUdWK5NDftDj2fpd7zZHMSA08UhwsWjQjaH
         0Rg4lKr2O+K89VUn60kxRCLP69zILrTYkVYdkHJXd4izuDU08xPsTvai4fdto9h+RQ
         6DX9m68zMA/qo4i3Dvlcjz/+f0vSktUjwytD1XvLLfVYp390d53aJGPWzCW/3N5+SB
         9imOpsQUXEzxw==
Date:   Thu, 4 Jun 2020 07:35:44 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the amdgpu tree
Message-ID: <20200604073544.1ef1e38a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ljOty.cDXnnjyWaoYNnoYta";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ljOty.cDXnnjyWaoYNnoYta
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  2967442ac479 ("drm/amd/display: Add DCN3 to Kconfig")
  4e7406acd3e6 ("drm/amd/display: Add DCN3 blocks to Makefile")
  b8163750954c ("drm/amd/display: fix and simplify pipe split logic for DCN=
3")
  a6a7b1845598 ("drm/amdgpu: Enable DM block for DCN3")
  5aa25fb310d5 ("drm/amd/display: Remove Unused Registers")
  ea05812d2d55 ("drm/amd/display: Handle RGBE_ALPHA Pixel Format")
  b663d733cbe1 ("drm/amd/display: Init function tables for DCN3")
  19e1ceaeaadf ("drm/amd/display: Add DCN3 VPG")
  889bc1fa55f5 ("drm/amd/display: Add DCN3 AFMT")
  0e5cf8885f67 ("drm/amd/display: Add DCN3 Command Table Helpers")
  3086e21408a6 ("drm/amd/display: Add DCN3 Resource")
  3fbd2731be3e ("drm/amd/display: Add DCN3 Support in DM (v2)")
  581b9589487e ("drm/amd/display: Add DCN3 HWSEQ")
  ca2e97c317ad ("drm/amd/display: Add DCN3 DMUB")
  c8728a921074 ("drm/amd/display: Add DCN3 GPIO")
  e51d66e1d338 ("drm/amd/display: Add DCN3 IRQ")
  3ab489724031 ("drm/amd/display: Add DCN3 DML")
  202ad3f23604 ("drm/amd/display: Add DCN3 DWB")
  8905a0576034 ("drm/amd/display: Add DCN3 MMHUBHUB")
  481beb130dec ("drm/amd/display: Add DCN3 HUBP")
  ee52a594ac12 ("drm/amd/display: Add DCN3 HUBHUB")
  7dcc0bbf90d9 ("drm/amd/display: Add DCN3 DPP")
  c37075e358b6 ("drm/amd/display: Add DCN3 MPC")
  5629c57da234 ("drm/amd/display: Add DCN3 OPP header")
  86f1f7c7bc4f ("drm/amd/display: Add DCN3 OPTC")
  f0d3ced5769c ("drm/amd/display: Add DCN3 DCCG")
  bce3430d79d4 ("drm/amd/display: Add DCN3 CLK_MGR")
  ca1404079b72 ("drm/amd/display: Add DCN3 DIO")
  639f7ee6f6d3 ("drm/amd/display: Add DCN3 chip ids")
  5fa689e66bf4 ("drm/amdgpu/powerplay: add smu block for sienna_cichlid")

are missing a Signed-off-by from their committer.

Is all this new stuff really destined for v5.8?
--=20
Cheers,
Stephen Rothwell

--Sig_/ljOty.cDXnnjyWaoYNnoYta
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7YF7AACgkQAVBC80lX
0Gzm7AgAmbC5AU94Aepy+ubqqqR/SXExw8bcELuaeSpwSP4KnGRfwBcc6xwYlH7H
eFvIUmetiK9iKTMhVeCuxhKYTY7VkmxVXjMXP6GmmXn0aeT4eX+Ts86ulnxv90+2
zdLdpaVuvI/nk3X9nhWk3QvW98NFN6XhDPxbnkiCBBlQdkfbuygSLktHAVHH6Hdt
YrrJdXWS9Ni7UJLyWpY5U3whlrBuWDSywnB2oxytKyTZEWhw+n2kmXjSdklEEbvs
sWa56VVLiBaXKk46JOxgNC0rOHmqi+P9XcNa4FV2YPrZ653It1d8wgYdKQEHgQ23
aloX0PX383s6AZzh1JVU2aGydLpwGQ==
=zJjQ
-----END PGP SIGNATURE-----

--Sig_/ljOty.cDXnnjyWaoYNnoYta--
