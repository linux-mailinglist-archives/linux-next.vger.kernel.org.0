Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F29E40BA36
	for <lists+linux-next@lfdr.de>; Tue, 14 Sep 2021 23:24:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231536AbhINV0J (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Sep 2021 17:26:09 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:57503 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231472AbhINV0J (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Sep 2021 17:26:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1631654689;
        bh=GqhpUesFiiwJ4pGqUGcTeqGjq65zn8hwrtbRJR69JlY=;
        h=Date:From:To:Cc:Subject:From;
        b=apUPwctEcoSa8DY5P+i+egCn3vH9eV/GrqJNldGweuvGKQ8wfy6YV8NVjelWrFNZk
         f4suewZWZn/JFhhiv6l0Uht1fjp8eEbJTXDsObqABb+udCB3tnrj280PWk2dCYIQsr
         BNqKIJoKkGMN3T8ppl47qJ8zpvkWRSB4vNg/+Z+5FbAKCj7tdlg5huoKnJlHhJm3Vc
         ZO90rhjYqe6SikUqgI+IrgCWz4HqavYZiRBGJG6pgvhvMWUIgFdaBBiAVef2z4Fpx3
         mWtK8arEqtIiGEImzryLv1Y6ApFz9+FlxO87rtuItvfgS42Hs0H0G1Z2SmuU8BOour
         vM9apJcyU9UKw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H8GZn5W7hz9sRN;
        Wed, 15 Sep 2021 07:24:49 +1000 (AEST)
Date:   Wed, 15 Sep 2021 07:24:49 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the vhost tree
Message-ID: <20210915072449.797e15d2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/i/RL8mDqC28Q_JcRZp0AnYL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/i/RL8mDqC28Q_JcRZp0AnYL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  71a6465aadf4 ("virtio: don't fail on !of_device_is_compatible")

Fixes tag

  Fixes: 694a1116b405 (&quot;virtio: Bind virtio device to device-tree node=
&quot;)<br>

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

Something weird happened here - the tags seem to be partly repeasted and
"html-ized".

--=20
Cheers,
Stephen Rothwell

--Sig_/i/RL8mDqC28Q_JcRZp0AnYL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFBEyEACgkQAVBC80lX
0Gxx5wf/aPShYs/Ip/sl/jhGmUmFxgTh4CfkWaJg0PAZTofjqIWHlmwEEUvM2MEs
i3Nw3ZxTICk7TtMjbARUY524S7x3d/8xTHC00c7d5qIkgeibKjffFv0lkMTCON/d
Bp90Qt7b/dclBRD26DWWrjZdMZPByX/VN5OjAjKpGBNDcPItoSY+Y6JjfBzObQ/p
+YXmySLlINoVks85iy4c95FOm9hH6ujN7R0lyrhJQHGY8LT8u/gxmq6htNkk3T0v
B8raoAIKrnIbEU4IqUa03fn9teCxBNEJKsefkvB+1wQO6KeSF2Ls508LPPSQ/3Xq
XOfZF0jdAfbC4synsmtfZ6qUCq6cQA==
=P2V3
-----END PGP SIGNATURE-----

--Sig_/i/RL8mDqC28Q_JcRZp0AnYL--
