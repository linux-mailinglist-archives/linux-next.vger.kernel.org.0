Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79BD2283312
	for <lists+linux-next@lfdr.de>; Mon,  5 Oct 2020 11:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725936AbgJEJVF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 5 Oct 2020 05:21:05 -0400
Received: from ozlabs.org ([203.11.71.1]:43965 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725901AbgJEJVF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 5 Oct 2020 05:21:05 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C4ZpQ18fzz9sSn;
        Mon,  5 Oct 2020 20:21:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601889662;
        bh=3PHcn43i0jDwjG5jhANc9EF29PMDBBwDuhn8e96Nn84=;
        h=Date:From:To:Cc:Subject:From;
        b=B3JuW0zzzT9FYceWHj/OdXXvuim/ff2F+PN8hL1OAZXXD6BtWkAww7s8KfZViZ0ed
         S4+AsRQ5vJR8StlqUVXilZLFi9LOrkTLMJ+vaHzpa/kXBEUwlzLz8UP8aFTg3nwu31
         Y0cimZqikmE31mpjOgvWeG1J7xtZEDnBGSxfHhO2tY44zOwjU3o8QZlWfG3dSs9mpo
         nfZybe9WfuNT0c0tAaN6K+3uEGOXpHMet5Niq0Dm7o6/79SCdtElqal6v4tUXm6riB
         y89gJi7w3H0C86l17fpHj2s5mQF42osyH88uTOT1ONlaA5VOlOmJHotKMJNZLh9zWT
         zFBnlZwW7hvTw==
Date:   Mon, 5 Oct 2020 20:21:01 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Amit Singh Tomar <amittomer25@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the arm-soc tree
Message-ID: <20201005202101.5fe325e8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gOrsduny5mQo=d=x3gO.emc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gOrsduny5mQo=d=x3gO.emc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  4bb1eb3cd4bd ("arm64: dts: actions: limit address range for pinctrl node")

Fixes tag

  Fixes: 7cdf8446ed1d ("arm64: dts: actions: Add pinctrl node for Actions

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line. Also keep all
the commit message tags together at the end fo te commit message.

--=20
Cheers,
Stephen Rothwell

--Sig_/gOrsduny5mQo=d=x3gO.emc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl965X0ACgkQAVBC80lX
0Gwuagf/fD6AvgS60o+eoj1pOigAX1puFxV+C/CsUStKv+4OItiVQZRi73Dbdeyp
tkTEvpGZ4Mpdh8kiCDRmMj3H05tMbk7EEUyi/OZFZOfKal4a8Gz7WFa1NPJkLUnN
1WzgrSuj0Y0aCReWA9IquSlX8BPy1aV3tkQtX5EP3hwHUpXdtXpIx+zsho/xLRie
4el+SraKbdM48SHlBo3DSL+13eWO7JSv8+gabPxobJbKunGcNhWjNXdDmq2kMZ06
qGcu3AdqfzTtdqG2dv9WPYh8o5Lrj4TMCJTP7R4KLkQFjBOXPDJ9jMGCmTBw7aFq
+fNTKAZluzvDhy3USRTYvSgyKHCCGg==
=YhDj
-----END PGP SIGNATURE-----

--Sig_/gOrsduny5mQo=d=x3gO.emc--
