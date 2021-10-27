Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93BA943BEBF
	for <lists+linux-next@lfdr.de>; Wed, 27 Oct 2021 03:05:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236301AbhJ0BIH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 21:08:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231916AbhJ0BIG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Oct 2021 21:08:06 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F480C061570;
        Tue, 26 Oct 2021 18:05:42 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hf9VC32cdz4xZ1;
        Wed, 27 Oct 2021 12:05:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635296739;
        bh=CCY1wV509qQFuRHJrOFAfSQZUkfQ1ZtYO8PioZA0GbA=;
        h=Date:From:To:Cc:Subject:From;
        b=K4XBk/SAltBPTyrrhypP4IfhTic46fyZE/kizSLDU33Fv93cFOuv+H11FtUpDjNd3
         bEE9+KcYerKDbNroCpIx2QAd6omGPzcSIvID6593eotTcPiuQLkNakI+jVeGDmXD/f
         IH0hGgqgSbkVobhlKZVSfAgQtABynCRMAETCcx2rY6earXZk2lhfsNi2f6T2B97bek
         PqvF63y6k+Rc1t4E7IlrAV7+dcEQuede3K6Zdzbyllad8gmOkWwcVYhTscoDxTsFV7
         J2EztQB4yQxKM1j7F6O9+0Xc5lLZ7Xqms3LFki/BFSrGVrRIOjoTciU0GiSIsuJ72Z
         zQgShGA6ZZbpg==
Date:   Wed, 27 Oct 2021 12:05:38 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Jude Shih <shenshih@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
        Fangzhi Zuo <Jerry.Zuo@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
        Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Subject: linux-next: build failures after merge of the amdgpu tree
Message-ID: <20211027120538.3cb76465@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/98ETBO7.+81Wr3AtYHa7lpL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/98ETBO7.+81Wr3AtYHa7lpL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'd=
m_dmub_hw_init':
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:1111:38: error:=
 'struct dc_debug_options' has no member named 'dpia_debug'
 1111 |    hw_params.disable_dpia =3D dc->debug.dpia_debug.bits.disable_dpi=
a;
      |                                      ^
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'a=
mdgpu_dm_atomic_check':
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:10728:34: error=
: unused variable 'mgr' [-Werror=3Dunused-variable]
10728 |  struct drm_dp_mst_topology_mgr *mgr;
      |                                  ^~~
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:10727:36: error=
: unused variable 'mst_state' [-Werror=3Dunused-variable]
10727 |  struct drm_dp_mst_topology_state *mst_state;
      |                                    ^~~~~~~~~
cc1: all warnings being treated as errors

Caused by commits

  df91b2adc24a ("drm/amd/display: Add DP 2.0 MST DM Support")
  707021dc0e16 ("drm/amd/display: Enable dpia in dmub only for DCN31 B0")

CONFIG_DRM_AMD_DC_DCN is not set for this build.

I have used the amdgpu tree frm next-20211026 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/98ETBO7.+81Wr3AtYHa7lpL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF4peIACgkQAVBC80lX
0GyZowf/WME9hXOdhAJmYF+P8NfejK4lf40+cxLAlm9L1BK9G34m8i/YceTFMvpM
/XzPgTDspTQysQkLR8WUCPdnHZkK+LJ2Bw5vm7E905DNBrY5GN0OK4XTOWY3AGcm
HVANvT7nyV66oT1jSuhBtx3aTizC/V7uzfETkRLcVr9RjYiBZKrtqurQCDiNpcJd
D1zOPspIHrO2G0saViYytT2jDNyeLXk73RM1IKTlpDxfHx3rew7kqNTNWKTWveV/
tiZ/RmfX1q/dKrd6GjFebfMFexNrK7e9WXtzoiqfy06aDS/K7qgH5JDBGmFwYlwo
GsLsiCDbMWhxsuPl5TVTSQHCNB6Tzw==
=Wg2M
-----END PGP SIGNATURE-----

--Sig_/98ETBO7.+81Wr3AtYHa7lpL--
