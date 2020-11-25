Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48FBF2C495B
	for <lists+linux-next@lfdr.de>; Wed, 25 Nov 2020 21:52:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730788AbgKYUwz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 25 Nov 2020 15:52:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730178AbgKYUwz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 25 Nov 2020 15:52:55 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1832C0613D4;
        Wed, 25 Nov 2020 12:52:54 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4ChCl720DLz9sRR;
        Thu, 26 Nov 2020 07:52:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606337571;
        bh=4Qm+vRgNkmq9CpW5qw9fjsP0f8xaia43H2fH/EqR+BY=;
        h=Date:From:To:Cc:Subject:From;
        b=DTUAsWE8+kz/fXxof6omKYREOLVgF/8FFPACdymK9ttb0/lLoppmU2nftq4O5GSfX
         de1+LwHMWnBiwkI4qOMiOzuO5MDy0rbpy3SIALPuXSjiB+1lxjvwMVbSVWW3/mRbkR
         g0L4FhyKyfLvaSQMTf7kXEl8++GtG3yC6wYcGA9yAr0zpjNfAN+44EgWuC6TbM6KCQ
         D2uqVRTIGYD1vU7FStn5vZItSqftp72WetXPt7Ymsf19u6thoLAEL4M2K3S/xj/YjC
         7WQjzI6XjP0q6GCh/sZBraHy4OCpbyeIiB5coyJFHWl3MqG/PTCkwZwLyr3nBgy6GL
         BstVD0TwFS4CA==
Date:   Thu, 26 Nov 2020 07:52:50 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Tejun Heo <tj@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the cgroup tree
Message-ID: <20201126075250.7686fc8a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//2dLdylUKkuWH=j_zTDyalw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//2dLdylUKkuWH=j_zTDyalw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  73bdc818634e ("kernel: cgroup: Mundane spelling fixes throughout the file=
")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_//2dLdylUKkuWH=j_zTDyalw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl++xCIACgkQAVBC80lX
0GyJoAgAlHFQ3NDC6KBiTHNdUPz1+swupViarFxZNJekoXtFkhDPOA6FXEN6oJ6d
vkpoxaZhXsoHO23iSkkC6YyWUx3PLAuss0Y4QSwIVdPvtsOHk7CA1iTuu63fdJMU
t9e5976OeATwd39+K0uRKE+bLbskg3ToSUA29Mrhea+3cUcxi+wLwtAnCcAtB2iH
ojcQ7xjv3heA7YXFTzA/4No/4zTt8uq+AweAE6PYVuZ9M0FadeLfbjEuqCY6eQQ/
V088PJmLPxF2E1XvxCT1opH4vUHVSS+5F2KIg44FLIQrrCyiie+cTHgdEKzHSpoC
6MYgzQ0MXYcMyA0a9hNquBH+9pkv8A==
=Hvte
-----END PGP SIGNATURE-----

--Sig_//2dLdylUKkuWH=j_zTDyalw--
