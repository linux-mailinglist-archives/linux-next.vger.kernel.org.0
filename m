Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4871D1D8A6F
	for <lists+linux-next@lfdr.de>; Tue, 19 May 2020 00:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728039AbgERWKj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 May 2020 18:10:39 -0400
Received: from ozlabs.org ([203.11.71.1]:49571 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727819AbgERWKj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 May 2020 18:10:39 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49QtVz5Cx4z9sT6;
        Tue, 19 May 2020 08:10:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589839836;
        bh=cd1yGsFVS8n9QhPGW0WRX8GQrlmNy12viz0GdmV8aqI=;
        h=Date:From:To:Cc:Subject:From;
        b=W1W1PdZe/Sj6JW2qArWDQwLnSeCxVWd/modVm4A5NILCgVQewDw3ExoiqsKE+H1+E
         fZQNM1WLWZ+xUoFvbRt8e3/NJxPHnR+XOxcTa5SI63UKFahxvUR79/WtC1SlNqN79w
         RWeKNIPmMgJS/pkxmQTdzbo7ypLXvpXtX0/oJXvQYQ7nrzU/twcXdhwrOf+/UO1wQf
         +HuEEnYHbt/ed9n244dre5+5UG5XCscDUIg0onJNv8/WeZCxnFZxtDaGcTsLLjB+vx
         nXtct3GMexDLCOAH0rqIiXL+Hje6jQcErZGE9cBbUa6J5CFqTLpRgvgBKN5GVhYXsw
         LXi5a+t9JSRMg==
Date:   Tue, 19 May 2020 08:10:34 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: linux-next: Fixes tag needs some work in the v4l-dvb tree
Message-ID: <20200519081034.6413aeb8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/V/=8/HlN/lKObGpiWpoND89";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/V/=8/HlN/lKObGpiWpoND89
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  70d4a9efee9c ("media: entity: Pass entity to get_fwnode_pad operation")

Fixes tag

  Fixes: ae45cd5efc120 ("[media] media: entity: Add get_fwnode_pad entity

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than 1 line.  The second part
of this one has also been moved in the commit message.

--=20
Cheers,
Stephen Rothwell

--Sig_/V/=8/HlN/lKObGpiWpoND89
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7DB9oACgkQAVBC80lX
0GyZXAf/cDZjwE/Sfyr6IqNYbqR8PXociJd87fnrbum/Teib3H2D+IePjl9ECxYV
v4HT+cqtiB2t3HbuXuUhzOAj/B8Hm93QH2nDf6SOAl38vrKDuxAvhQtQ/PkoqV/A
a9XcPb9bFzw3kL1GZdXEmBn7LuR64kOZaj7hZmmWrEki2/t8cL1p9779r8+WOWuT
U65bzuM/zbr7vtt90MOpdxeDf2oY5BAglc79KOK9FL5Rh75GlqSvqhzinpImXej2
fDFAoR+hl3AP+wKTdGMOpcafoTfK1lrhCMGga2AfVAdfb+XPY30Sm/QVwsPwp2+F
IXSBIbY7I6HIOzR0Oq2Zjka4ToUk0A==
=HG+n
-----END PGP SIGNATURE-----

--Sig_/V/=8/HlN/lKObGpiWpoND89--
