Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41C7D159C8A
	for <lists+linux-next@lfdr.de>; Tue, 11 Feb 2020 23:48:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727569AbgBKWsm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 11 Feb 2020 17:48:42 -0500
Received: from ozlabs.org ([203.11.71.1]:58805 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727330AbgBKWsm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 11 Feb 2020 17:48:42 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48HHxg0XwKz9sP7;
        Wed, 12 Feb 2020 09:48:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1581461319;
        bh=R9xv6Pys0PNbzt3d2ihx44UNetT12TeT50cxg4Vktfo=;
        h=Date:From:To:Cc:Subject:From;
        b=uLZ5+G6mVv/p8CY4R49L7Bv1NqP1rkwYhiJpoRHHjV14yHpQYL6rPMg8cERH6IeXt
         1Rp6syIh+ymBUxn8i0b5HwV52THRlTPwGk41N/53MMZB89r6g/dsIW9ocid01gZhFg
         nY8Lvuo/Ir0TDK02p8S/gGlNdnNV35vGlAsl7282HbNj5MwW/BdXfokLX4JVdt5gYL
         +GtgL7BwtGKZsx5gLPQsvvlM1cA+D93YomQ2vYXexSYaGusRfDAG87nwvAAtvaG0TT
         BmIwrTJB+EKAnGkvhsR93u3B8R+ISMdtK8FC/OgWo1u/NUZpf/C4kLWpQmVaqK+CpR
         tMWIgsmfMTgrA==
Date:   Wed, 12 Feb 2020 09:48:38 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
        Eric Yang <eric.yang2@amd.com>,
        Michael Strauss <Michael.Strauss@amd.com>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: linux-next: build failure after merge of the amdgpu tree
Message-ID: <20200212094838.4465f954@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LR=5Kstqi9lQOU5R_HTr5Z/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/LR=5Kstqi9lQOU5R_HTr5Z/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: "get_num_odm_splits" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefine=
d!

Presumably caused by commit

  5bf24270d1cc ("drm/amd/display: add odm split logic to scaling calculatio=
ns")

I used the amdgpu tree from next-20200211 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/LR=5Kstqi9lQOU5R_HTr5Z/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5DL0YACgkQAVBC80lX
0Gypigf9G6wEimkUpzfY+L7Geys21RHs3cARo5QAWvCT+27B40w5tuNXzhcjDMNc
9TgpIAeArv+9pMUmhUzKSSmBobHqqRJk3jlVZEhyE/vUePWSpIjDMafvnDp9yqhr
oBys3NBmCtejDI/CDT9LlHky4dDx3TCf/nRcq9Yees94NbD6sD3mDizmSxbV3Bce
tQePJznBarpYNTS9+T4oqDEGKNeJ71u0VLmDE/IqfvvV6X4PY9pqc7wvthL2O1uq
jApFQv0jAndHyL47QIgokgtyFMvgWMfTnA3jGCzvwEE1MzlYtQIYqAufmrzfKP1W
Ekc15jv6v/5dBbpKL7uBzwNnPglEmw==
=4HZY
-----END PGP SIGNATURE-----

--Sig_/LR=5Kstqi9lQOU5R_HTr5Z/--
