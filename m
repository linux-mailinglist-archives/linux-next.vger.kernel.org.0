Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43FFE2B58E9
	for <lists+linux-next@lfdr.de>; Tue, 17 Nov 2020 05:45:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726311AbgKQEpS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Nov 2020 23:45:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbgKQEpS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Nov 2020 23:45:18 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 290A4C0613CF;
        Mon, 16 Nov 2020 20:45:18 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CZtfM3Z68z9sPB;
        Tue, 17 Nov 2020 15:45:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605588315;
        bh=eYWGhwlPZccCa6gBZDA0mcFJx0YpnKv1wZwH/dLfeVM=;
        h=Date:From:To:Cc:Subject:From;
        b=K8k1XpKuSDNTFiNy+uodh23SkPwdCff4RjXJL17w+x/CBijKbHu3xCqI11jT+k+eB
         xijIUNLTf1MkOzkEwsLfZtJUe+ZAjpjYo83VWu5yJ4mn+US2neRpMKDO2/dBPO7x15
         4pM8RBB+Cn7KcTNa2pwLK3i+X6XyhRfqmhRda211sumX2apUCmJN+wmSBb0cqC5KeL
         Ct7GEz5u0ag29WamWosyrP1h6Beel8Ygj0LN0KY890wW2N2Ej3eylw7UXQBXYWkIaq
         FDhmXwOu5GEPO1vNFGNrvsKf5fdSs1/CN1RKYCPmf3QfqT0pZMLaoqUijdzl4VYkFr
         o4w601WUxDFEg==
Date:   Tue, 17 Nov 2020 15:45:14 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Wayne Lin <Wayne.Lin@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20201117154514.2c378d99@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/D+UdLs2kHH0gg3.Q5wkt/KI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/D+UdLs2kHH0gg3.Q5wkt/KI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:353: warning: Function pa=
rameter or member 'crc_win_x_start_property' not described in 'amdgpu_displ=
ay_manager'
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:353: warning: Function pa=
rameter or member 'crc_win_y_start_property' not described in 'amdgpu_displ=
ay_manager'
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:353: warning: Function pa=
rameter or member 'crc_win_x_end_property' not described in 'amdgpu_display=
_manager'
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:353: warning: Function pa=
rameter or member 'crc_win_y_end_property' not described in 'amdgpu_display=
_manager'

Introduced by commit

  c920888c604d ("drm/amd/display: Expose new CRC window property")

--=20
Cheers,
Stephen Rothwell

--Sig_/D+UdLs2kHH0gg3.Q5wkt/KI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+zVVoACgkQAVBC80lX
0GyQ9Af/ag/G+ckQAku+hGi1f/iYR6j7enjQSjHXD3oEOYOSOEr4xs2x42Ab0tiv
pE0UAFlOoEzNIHptaiMBG2CQEFrMgsLrMWIIZH+uDMjNXIK95s5YLlCRi3i7u7hS
13go/8BmhHrVCcxgV1RzNO3/k0ScB62wryB1cKESNJgF3+6ZJ35kVMLQ2Oul5zcI
JaUeSoAOVdG56Q0sWL0Ckg/OcdKJjoQIwN8Pe7MiWrxxkKowklD0X4+bi0koDJlq
YOTBMSdLEsmOmcBEy7FHkJOeBj69mqLhDZGujnOarh5PTdQb20HoPSa1mEbyBkU3
gFuh17+hkIFixa9pGXYXNaKs45Qz/Q==
=bAKy
-----END PGP SIGNATURE-----

--Sig_/D+UdLs2kHH0gg3.Q5wkt/KI--
