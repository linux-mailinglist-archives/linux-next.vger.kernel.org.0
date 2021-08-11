Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30A8D3E9162
	for <lists+linux-next@lfdr.de>; Wed, 11 Aug 2021 14:32:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbhHKMcw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Aug 2021 08:32:52 -0400
Received: from ozlabs.org ([203.11.71.1]:48503 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229576AbhHKMci (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Aug 2021 08:32:38 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gl8Mv6T3kz9t4b;
        Wed, 11 Aug 2021 22:32:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628685132;
        bh=mhfcVNXgc/0h5v6pYrwHF5DvzDi1bz16dnsFeCrBswA=;
        h=Date:From:To:Cc:Subject:From;
        b=gh4AVYzWFi/xJyU2lZVn42moYQV4DKDtQFV322+31kzvWJt31DwdDSZwV+qS6kCm3
         PN+sVr8jXQ5XrTpEQRAI/VT75kIiMT+r8R0PsMQDWmtIdoIY3w5RFZyks07B7yCjRf
         ivp8Q0gmEV3Zhs1eBPmovCqJWs+OCOBYZN4ZsrMnJjSkebVnYU9oCLecHm9YPXwHeK
         5A7exmn8SBYM9EkWo8oOz6dScTtOQ5UyMqZ1vdAmvwhaa+1zjv8udeb5+63L0ZyojE
         oMR6+2PwJ3tG0soV7hhPJVlZinI+nFjibF4sqW3Iz9k7Nuv52CclaL0cdegkAjN96c
         nJod4DTEp2PnA==
Date:   Wed, 11 Aug 2021 22:32:10 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoffer Dall <cdall@cs.columbia.edu>,
        Marc Zyngier <maz@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the kvm-arm tree
Message-ID: <20210811223210.19067d99@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/g6GHqUEyAD/ArJorHQTVGnJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/g6GHqUEyAD/ArJorHQTVGnJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  676ffd34807e ("KVM: arm64: perf: Replace '0xf' instances with ID_AA64DFR0=
_PMUVER_IMP_DEF")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/g6GHqUEyAD/ArJorHQTVGnJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmETw0oACgkQAVBC80lX
0GzyYQgAmIknOVPopsjY4BdV9iTuqL1Uq/XCqaFPbL1K4Kog3p+BY0EBvqk37dNK
qXtvMlWrKxn/qITcqy5ZWE4ACOawK/TyqRoCvWfp7095dDdYTblccz0VTnMtJJ/V
pyRGDpJ2JQ0dvWco2x8GxU0dspeUL2kkN5Bh+jiNnUUY2HcttEBnfhg5Nh2DrwUd
cwJrE7E2cryqZTuYnoziQj/b2xU1eAcJHBP/65aDbR8255YFsbKyHwq6Je7u3wCf
h9Vc8nnwnEfJUnOoWCbEjg8bZbhh77CX6UCHlB/ue98b8Q7rOJ/eQEHWqiIV52/w
0wjLPQaVpnro5fphycmVeGNsT+9clg==
=O74f
-----END PGP SIGNATURE-----

--Sig_/g6GHqUEyAD/ArJorHQTVGnJ--
