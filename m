Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21B703044EB
	for <lists+linux-next@lfdr.de>; Tue, 26 Jan 2021 18:18:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390370AbhAZRSc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Jan 2021 12:18:32 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:59533 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390663AbhAZI7G (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 Jan 2021 03:59:06 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DQ0xs4kd3z9sCD;
        Tue, 26 Jan 2021 19:58:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611651489;
        bh=TBpZeftSzKSn8HpL/hx97ig1oEsAGu1xl/QL1rnKROU=;
        h=Date:From:To:Cc:Subject:From;
        b=T2V2WN9UbiHShKhdc0MazIppoH9JqzBHmVv70R4K0mbz3Nej1UyAlW70Kvkeg2Uo1
         RV5oJa0R0xwaUD/b38NPv55iHAk2Wf9/bLrEzrG31IZRMNPyJErsovaX974UXEf1Mg
         JQKmgMkgSgwJ/II79xkg2CLVlCmwx0A2XWN8lpYxTCg4VVYqc7Cfm6pIGM9GTtZYoL
         3U+kTDFrJMmzijmEfMj/aeyofhi54z8efokPS6sgvqJPwllIQoXlfnMMCRch5gmgJd
         qMr1gU1bh0wmGOevCKGdkBBWeH+2Og1mgFqU72T4XAPJLBNRntvog+FA8gATy2J15T
         9fOC11JOBQ87A==
Date:   Tue, 26 Jan 2021 19:58:07 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the amdgpu tree
Message-ID: <20210126195807.668bdcef@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YcQgAf.64RqVBy72W9Tayh8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/YcQgAf.64RqVBy72W9Tayh8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  289970f0be61 ("drm/amd/display: Fix unused variable warning")

Fixes tag

  Fixes: e177af8a43da ("drm/amd/display: Fix deadlock during gpu reset v3")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 98ab5f3513f9 ("drm/amd/display: Fix deadlock during gpu reset v3")

--=20
Cheers,
Stephen Rothwell

--Sig_/YcQgAf.64RqVBy72W9Tayh8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAP2Z8ACgkQAVBC80lX
0Gw0dAf7Bbz5boTMU/5m+LKYTMhbC2lLTlKsk9BIoaHDt6HYhes4zH0MsfqUnG5H
nTcZk8MLKkz3MB/EjvKdYdZNNmWGjTSlydk4l67CvbS9fpDr1mbrqoxxsLnReIjL
s7+A3aclHkR23eDDe1wvIUXmkiXi91lOdbVUlo9R8dvp0f0ElKmiVTYefXV5i2Gl
+mq/JxlsfpxGLjluyzoBBihc07xgGFegiOSx8aHao0xx73O1b2fUH7yLdAEoNsGQ
/xEBXvmybbCppf1mU6VO9kB8zudvjWEAgoiDH9MGjuS9X4x7Gog2LXDilhphbmfR
XgtlArBmUrBgoPgzqyCWkYnQgx9lyQ==
=Sdka
-----END PGP SIGNATURE-----

--Sig_/YcQgAf.64RqVBy72W9Tayh8--
