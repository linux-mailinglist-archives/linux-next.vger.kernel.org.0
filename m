Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54EE236A447
	for <lists+linux-next@lfdr.de>; Sun, 25 Apr 2021 04:57:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230452AbhDYC60 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 24 Apr 2021 22:58:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbhDYC6Z (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 24 Apr 2021 22:58:25 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12897C061574;
        Sat, 24 Apr 2021 19:57:46 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FSXks1s9Pz9sTD;
        Sun, 25 Apr 2021 12:57:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1619319461;
        bh=IlDw152+VnNwvGFbT7+RKXa6YNLAwp+EGmgw5nY/LP8=;
        h=Date:From:To:Cc:Subject:From;
        b=DZruapsxt2uqHUJwhZs4FAQmx2PRJdGmMs7qbjSrHW/uaLeR0mPIzxFPIBIGipc7N
         WjNdGRYa6E6LDQQVptVGxn/BCFLBZpqdZGlsKHNINbNDGAyaMZS2ts+i/6Lb4fFZ1Y
         W3xDRQfw1X2xCQYk+KHXHWsdClWOquZloxjdYCSQonqVbTsZE3OEPVcraQmg378gk8
         j5kgSqfp7heaAMc/bD2edk9BqNp9FwiNVK6U0f7oYUIkHPuJLOrHKfQ/dU2yacsXwm
         rcTS1Q/T3KicReCfiga+507Cxo2qV2tr6RTQhY0qL/cWY/R43D5MXVRw3GIkgHzmiT
         8XeIsKSl0uWEg==
Date:   Sun, 25 Apr 2021 12:57:39 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Claire Chang <tientzu@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the dma-mapping-fixes tree
Message-ID: <20210425125739.1b93e0f0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gfSsXbXPzN+IeowCvpcVS6D";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gfSsXbXPzN+IeowCvpcVS6D
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  49702360af50 ("swiotlb: fix the type of index")

Fixes tag

  Fixes: 0774983bc923 ("swiotlb: refactor swiotlb_tbl_map_single")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 26a7e094783d ("swiotlb: refactor swiotlb_tbl_map_single")

--=20
Cheers,
Stephen Rothwell

--Sig_/gfSsXbXPzN+IeowCvpcVS6D
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCE2qMACgkQAVBC80lX
0Gw2XAf/bXA7hX+USDh5170BCa9UDfWKXa44a1r22HHDxZ9YfQLO5vWU4sGpT/IK
3YcwzTwDhjVEWS7N/p19aSTE+zbhr8+sfBjbntUBgJGnO1qYGsSJxRi3rvfFG51J
+v05CtoVnSH3HTcHSt/8Ui/sjrVY6OXHXnnWCii4TreX6JspKLiw/0xXJOcVXwx8
qJaxsASQiYhEPAL2cDX5F4+SYAHFNxOqx3hgoMN02xymtnEQIdKV+qae6Bwze3er
pSc3yEJKoGSreP0l8Kv5WGcGxx+UNNcAiCN+FHCvN762KlknVNWQ46jO76gF0vvi
drX+M6Imasn57i89+O1BnmEImyVDQA==
=N8PY
-----END PGP SIGNATURE-----

--Sig_/gfSsXbXPzN+IeowCvpcVS6D--
