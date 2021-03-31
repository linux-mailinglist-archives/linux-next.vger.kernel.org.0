Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AEBE350876
	for <lists+linux-next@lfdr.de>; Wed, 31 Mar 2021 22:45:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236829AbhCaUpJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 31 Mar 2021 16:45:09 -0400
Received: from ozlabs.org ([203.11.71.1]:42943 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236664AbhCaUon (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 31 Mar 2021 16:44:43 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F9dbT5DcXz9sj1;
        Thu,  1 Apr 2021 07:44:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617223478;
        bh=EkoeE5LDAlffLagNaa0rX8srRwRwJ2NHLLW+7RAoNAg=;
        h=Date:From:To:Cc:Subject:From;
        b=GkvliVKIRNrauZxsKohYNUKVSO1u11jZvmzgEZRrs1FfTHx+h8niZZw83XnYnH6LW
         Gdy88vfgTBHrGaVSkiANcu+3vTCCWnywMtPBFMmWiZlh6eOtdmBw89IlhbV6MAq5dy
         B8m4nMTeMq+NlPq9zpK4pSlZ83UDf1qokQz569yU0IbHFpX2cXQLTjShq8RoZlQuLr
         7gFrz+JRFKy9k6+ShBvfO04gnGGnA2Il6mJBypzILPw/y5vL19+4dXMXJsIUPqygax
         MVZPpWrULkd7S9yEiCIVv31kIdnF6vervZ+BaPeH5x8JjU7vXReZZbmkMrf7rAN4lt
         gznaj4ELoxiYQ==
Date:   Thu, 1 Apr 2021 07:44:34 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Chuck Lever <chuck.lever@oracle.com>
Cc:     Olga Kornievskaia <kolga@netapp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the cel tree
Message-ID: <20210401074434.6bfc6f11@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zrfEWOJgkhmrcF4C1tkaOvW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/zrfEWOJgkhmrcF4C1tkaOvW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  427ce3afe3da ("NFSv4.2: fix copy stateid copying for the async copy")

Fixes tag

  Fixes: e0639dc5805a: "NFSD introduce async copy feature"

has these problem(s):

  - unexpected format

Please just use

  git log -1 --format=3D'Fixes: %h ("%s")' <commit>

so

Fixes: e0639dc5805a ("NFSD introduce async copy feature")

--=20
Cheers,
Stephen Rothwell

--Sig_/zrfEWOJgkhmrcF4C1tkaOvW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBk3zIACgkQAVBC80lX
0GxqVwgAmqhr5NuSL4z5PNlZevrRVuQaoLhsu9Q3QfHP1FXA8zN5sGjdXgt0WZkU
E9NeC+fFC+8Wj+vVx9ABRoFsQt/8dJAOF1ZK1uZKq9HUGa5dR16ZtC7W1sDzmYHd
SgSjkotL0+YbXl9rtKaoTA5kiz+9obI+zqQI1zVkYNUxRT5PrbPnJZZWVMTTGSlR
vEiuI2mw7BChG4NQ0ztlPYZCPTtxF8Z9O3SJoO+zQ/N1cCIH/bOOXBFlFB29447X
h3eKPKT9mOlsnHG3As9cYNOyiT+I582OgT7s+0LDVw1C3RmuQV866oir7u36bU2V
3b15peazHW23UdreGFLddXYM8+6ZbA==
=2WE0
-----END PGP SIGNATURE-----

--Sig_/zrfEWOJgkhmrcF4C1tkaOvW--
