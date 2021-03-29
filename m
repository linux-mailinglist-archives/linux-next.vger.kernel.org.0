Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C358F34CCA1
	for <lists+linux-next@lfdr.de>; Mon, 29 Mar 2021 11:07:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234080AbhC2JEz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 29 Mar 2021 05:04:55 -0400
Received: from ozlabs.org ([203.11.71.1]:48089 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237499AbhC2JEM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 29 Mar 2021 05:04:12 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F868B6F3rz9rx6;
        Mon, 29 Mar 2021 20:04:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617008651;
        bh=3qlcorbKE/WPrfj99cXC8R6wsLqCHbeOJ6lOtj+arhw=;
        h=Date:From:To:Cc:Subject:From;
        b=mE8j05+qrhwDTkLAvsxl4voEy4Eryd2e46TrnjQFERVVQyfKDAx8UclxNIOWCQXQ/
         1n5T+44CiGGMeRKLtRhE+Qs20nyFmzPsBuUffnrPkFeYWSlk5TNOUqUR8bv+GZP9T4
         nhUUob1PJpOR9QysnGFGynmmWHDBFyaweiXFbFPR9Fn7hUmft/HrCUFMhkG+P/8gli
         kHA1rxm8eYEJIDyBfgT9Ju5DANT6AexzJx42olk4vhWwPNHz3o0bDc4PIBG1o4zsQ1
         sHMy4/Z2rf+Lq8pybMtUFiYUrQFEA40pQBuN0Sa2Bh13Ktjh96dpwDnFAZP54uJ9qq
         E9YBNdR1FLCwQ==
Date:   Mon, 29 Mar 2021 20:04:10 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grant Likely <grant.likely@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of Linus' tree
Message-ID: <20210329200348.24a9a8be@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//vAhXD8SJIwHkVn8dXqsR7c";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//vAhXD8SJIwHkVn8dXqsR7c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging Linus' tree, today's linux-next build (htmldocs) produced
these warnings:

include/linux/of.h:1211: warning: Function parameter or member 'output' not=
 described in 'of_property_read_string_index'
include/linux/of.h:1211: warning: Excess function parameter 'out_string' de=
scription in 'of_property_read_string_index'

Introduced by commit

  a87fa1d81a9f ("of: Fix overflow bug in string property parsing functions")

include/linux/of.h:1480: warning: cannot understand function prototype: 'en=
um of_overlay_notify_action '

Introduced by commit

  39a842e22c1b ("of/overlay: add of overlay notifications")

I assume that these warnings have turned up now due to better(?) tooling.

--=20
Cheers,
Stephen Rothwell

--Sig_//vAhXD8SJIwHkVn8dXqsR7c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBhmAoACgkQAVBC80lX
0GzcmggAgaAHsihegR6B/BLamV8sUI1bQFHJ4idRs3WGWmkkxWVUW1NfRbfk0U2U
JkQ+YBWFRIkeLbr/j6J+Kt2onaYLRBZIW7jBSqt8Of9LOnDqqVvgVN9Pk3/aPsp3
WtxziOeUpMaDkHGoEidtD+TeNsIYFLD05imzm3fo66VnSs7p/xjcyvOxTGPW3nVb
raC0REvIN6dC7vD7s+w3tFS/X6O/cn9Zsj7jn1g6caIk7AXC/kvrgpTbYF61bWyU
zYJys4LQuUnKvLyr4LdmvjzCuNy590DZyghEYxtk0/npSVb5uTviwLZvBvuF/Aji
srcogS3AdUag44WTNrCQKshl0Jv3Ew==
=NvnD
-----END PGP SIGNATURE-----

--Sig_//vAhXD8SJIwHkVn8dXqsR7c--
