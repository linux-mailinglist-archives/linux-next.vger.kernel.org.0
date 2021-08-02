Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA35F3DDCE5
	for <lists+linux-next@lfdr.de>; Mon,  2 Aug 2021 17:55:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235102AbhHBPz6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Aug 2021 11:55:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:55134 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233995AbhHBPz5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Aug 2021 11:55:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AFD9761104;
        Mon,  2 Aug 2021 15:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627919748;
        bh=thnSZxs/p04MwS238J0tVQbrY3rHb/YAtIfWKjb6kvU=;
        h=Date:From:To:Cc:Subject:From;
        b=LMqJlmWNfqQ9/tT4rBq/h6Vxex4HHir2Q+FQFym84OtIfv0XI70JbzMTWjquHNiCu
         KHZCpHSF5LclmPfUa7ON3NOs2pOw6zwCYdzYqg+HGnG5nau8e7pOrN9LI4KS9PAvz7
         4oB1+7N82MZ+/J3SfgMK4kM4jh6JQWlvJPdiDxHDfXB6UqZBwhT48cs3uiCbc4I2wu
         bHUUC8QhARFPlV5BRwCYsC13OZCpenPY0mcttyyAZUEpiN7Loz6W9RZeGVYeyfLcXO
         EEkSCycHTzWmbsORhi7kvuUfrVaxaNacG98i0DsdAWmOmXhwAbgiExvfKdWbKQLo6a
         K7WEEkZaPbOXQ==
Date:   Mon, 2 Aug 2021 16:55:34 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Eric Huang <JinhuiEric.Huang@amd.com>
Subject: linux-next: Build failure after merge of the amdgpu tree
Message-ID: <20210802155534.GH4668@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pfTAc8Cvt8L6I27a"
Content-Disposition: inline
X-Cookie: There's only one everything.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--pfTAc8Cvt8L6I27a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Today's linux-next merge of the amdgpu tree failed to build an x86
allmodconfig due to:

/tmp/next/build/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c: In function 'amdgpu_amdkfd_gpuvm_map_memory_to_gpu':
/tmp/next/build/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:1723:6: error: 'table_freed' undeclared (first use in this function); did you mean 'HPG_freed'?
  if (table_freed && (adev->asic_type != CHIP_ALDEBARAN))
      ^~~~~~~~~~~
      HPG_freed

Probably due to f451e2cab940791c1 (Revert "Revert "drm/amdkfd: Only
apply TLB flush optimization on ALdebaran"").

I will use the amdgpu tree from Friday instead.

--pfTAc8Cvt8L6I27a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEIFXUACgkQJNaLcl1U
h9Bu7gf+J+KcUTES8Ye4Sx57RDV6GRCSiytAxmaMQ8jYe/7HTWXBsOW+y7Px2IwN
svIWRjzk+nxpvnBuXSEhjh1d3i5qONU0oQ9n1/3r4BSLYOvxF8pgdv1uvgQkChkY
0EJvbvUrBQHuT67/lLD0XxLH9Nb92Dhua9XjxGR+CPUktTImd8YbeHyFhDXIo7Hh
Q0b8o0h9XIySev3q7iV6+MInYg+uIHWrmE1UDWxfYub1lhxqzTYyoikJfy8m8aHI
1/B5bPbnk8M6SThr7anOivdVtczLL2B/XoBYoJRqEJwOKSCeEAXT3cEBjgcwJU4a
2wnLsSLMMScagu7+drQ4I+SuGezTOQ==
=PkxI
-----END PGP SIGNATURE-----

--pfTAc8Cvt8L6I27a--
