Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E76988F7F3
	for <lists+linux-next@lfdr.de>; Fri, 16 Aug 2019 02:21:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725983AbfHPAVm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Aug 2019 20:21:42 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:47641 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725937AbfHPAVm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Aug 2019 20:21:42 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 468kX34YPBz9sML;
        Fri, 16 Aug 2019 10:21:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565914899;
        bh=4DOm0G0Mg88K0ab888PcmA2NrhNxtmRtln8z+EWFgkQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=oPlNFAIEohOsfIhNkVID91PTUNGEGElNKy2WjokDrMJZKG/DL4hGmxLZiQsIyjAmV
         LVxCbRlDOxkgvTGoOaalsDiN+Y+sRTczQA48lHNwzC+O9wrG6SVL5VG1bU+0I48bbb
         RCXpX2ElAJvWHWlVFHF/dmFnOkF4I2XO4+/ak3cPuWj41Px4ctVhf/oXj301jNOW4F
         GXyXDX+EShQwJ/HGQN8IFiCUF+n2B7Ia2I6CvtWJMNDftOkeK5pZDyOQTx2NpoYH8I
         elY/15RdKwEe9WRpuZbnTZW+qCnLfh18w+D89dtTxRiRhrY1724XenVXL/lE/b/NEF
         rTIGYjNsuKiVA==
Date:   Fri, 16 Aug 2019 10:21:39 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     "Huang, Ray" <Ray.Huang@amd.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Liu, Aaron" <Aaron.Liu@amd.com>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
Message-ID: <20190816102139.701937c8@canb.auug.org.au>
In-Reply-To: <CADnq5_MA-9pT=cZJYCZ62VXjwNtxaCLH2kb5ig5TLFKx4wsmjA@mail.gmail.com>
References: <20190813181038.2c6aafb9@canb.auug.org.au>
        <MN2PR12MB3309141545B644DCA7F144B7ECD20@MN2PR12MB3309.namprd12.prod.outlook.com>
        <CADnq5_MA-9pT=cZJYCZ62VXjwNtxaCLH2kb5ig5TLFKx4wsmjA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lfCnzTdB41fd8X.H6v_em7l";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/lfCnzTdB41fd8X.H6v_em7l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Alex,

On Tue, 13 Aug 2019 10:01:07 -0400 Alex Deucher <alexdeucher@gmail.com> wro=
te:
>
> Applied.  thanks!

But not pushed out?

--=20
Cheers,
Stephen Rothwell

--Sig_/lfCnzTdB41fd8X.H6v_em7l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1V9xMACgkQAVBC80lX
0Gw7hwf/Szf71hIJ6rp6OUK8ECFdstHR+6VUwtiC05uWRvOuDsI7tGr3577OIJ30
7N0ftgFXnKWQgYEJRVqbsSBZrqSxgN/eJsxCwOXoeDZtio5+KWjJgtJZ1E7ZyeRf
TzqqgIg/UbniWM/i8w5AiP4rVbMdYb9wP8xoQEvpbTIotZdNf3SrPD1WNmrzKv/K
nhcdj1ALbkQbDPFt6nssiaT62Kb8JXElGj7GCVKAnjJVn3mDikPNSYQiTJITO1j9
T1z4/RgGG//TTe5PzoFe7nJNoRf+OB49JOIUi+jTtg3qCjQZiE2ihOOySdUkalZI
eJklmeoCcqJJXeRcQaC98/WmCY2llg==
=V8z8
-----END PGP SIGNATURE-----

--Sig_/lfCnzTdB41fd8X.H6v_em7l--
