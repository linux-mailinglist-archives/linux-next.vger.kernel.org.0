Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F04D1257A4
	for <lists+linux-next@lfdr.de>; Thu, 19 Dec 2019 00:19:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbfLRXSx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Dec 2019 18:18:53 -0500
Received: from ozlabs.org ([203.11.71.1]:49777 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726463AbfLRXSv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Dec 2019 18:18:51 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47dWCr2Bbhz9sPK;
        Thu, 19 Dec 2019 10:18:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1576711129;
        bh=335DNnRhqc+iXDJ2mDhBXpBQvrI/NoVQnWZRDgJP+xA=;
        h=Date:From:To:Cc:Subject:From;
        b=NJXDCSGkF1D5oXwRWdq8nccPpg+ZRqKEn5uH8OB0nun8AfGi4L81zgbTkzk9tysrm
         rPxki0f8eLV/wONZ0F5R3Us6Vh8viKLDiMENXWxo4qtpi7dvbpzL1aOssZaEnayek1
         LYcEhQJXchG84ieLVCh1rAc6Onkm9vbcGl2KYMbd9x0Z//zpkqKR5PhEAzveIiAcBN
         ZyqpJz+zRWdyxiJtA7WG9YKxU2orA95Bri6Hhq1+h+1JjvM00yTdt45iaL5r2mYYru
         feagtCYEc7hoq1foVlK5MBQmt/yWITLOTy9whWWA8Zc6xHQVdWuqk6m+5qC546gjh7
         KEBPyirceBQGg==
Date:   Thu, 19 Dec 2019 10:18:47 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jane Jian <Jane.Jian@amd.com>, Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20191219101847.77d1619b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4HkbfY3ObCQ=w_pX/QLPfpn";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4HkbfY3ObCQ=w_pX/QLPfpn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c: In function 'vcn_v2_5_hw_init':
drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c:288:5: warning: 'r' may be used unini=
tialized in this function [-Wmaybe-uninitialized]
  288 |  if (!r)
      |     ^

Introduced by commit

  99bcbf833e6a ("drm/amdgpu: enable VCN0 and VCN1 sriov instances support f=
or Arcturus")

--=20
Cheers,
Stephen Rothwell

--Sig_/4HkbfY3ObCQ=w_pX/QLPfpn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl36s9cACgkQAVBC80lX
0GxSuAgAnso3T3r847dNMwRcQwRdE2hc8Ohl+WgDy16QG808/S/0vkiduIu8jSXX
yUq4hRulVvfUvE6/hzr0FK4aE+J6G2jaVJql3R0bx4vjS6CZv5L/XL9c6ylmKzvA
ZUvFXtyQGmqtV2dDa1SZhSH0yDhJ5uYs1MWsmx404L6vaMdslcg8C1rZqW9B8jcz
OCDO97C2R3DOutI121KDkNR9R8DltuAsXcM7bTsnmT/WNuRL5xcqmF5oA81Y4etC
uMuo3N6T6Vd/Kjhw2kPCkBL1cmFM6T5HasXVdenF2bFQ6On5+BLBMYJBZs0Eg5Zy
OrvkmdKK1939pqMJWsmsvMdku2pX3g==
=p7Ly
-----END PGP SIGNATURE-----

--Sig_/4HkbfY3ObCQ=w_pX/QLPfpn--
