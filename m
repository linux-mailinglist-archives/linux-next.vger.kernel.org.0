Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26F1D19A02E
	for <lists+linux-next@lfdr.de>; Tue, 31 Mar 2020 22:52:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728091AbgCaUwz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 31 Mar 2020 16:52:55 -0400
Received: from ozlabs.org ([203.11.71.1]:50781 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727852AbgCaUwz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 31 Mar 2020 16:52:55 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48sM3P2lPRz9sT1;
        Wed,  1 Apr 2020 07:52:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585687972;
        bh=KxLJRvf4bVUY+FiRNp9NEpkLuKAQT/ZYeY+uJnlfMlg=;
        h=Date:From:To:Cc:Subject:From;
        b=mlWMhlHdDr5jPyHvYy2oJO8Gu8sUf6dpy8sKhhVPLZ3kpB+QOgpV1izM/2LlfwJQP
         B2TeMeNCSSnIPXAjf5uiIPfd1l3cXTzqkLlAmjSFlcknuWeQJyBE6gIPjhhetGnDsE
         7Gx05CqykHyzTea3bgBgiGhpNsXvLfFOXeZJUATdTq290iSD+mfK8V7egndu/nXfjT
         70QczQVmsWtm2PHDacwheGhELxRRr5lO1ppbnhIExoqp3Vx6q7HEiTSQwDWDKn7h8u
         FF4X/cbIQs4wIzRqReCepUGu+MxNi7c3JtUOx3SkoeE0uZIuvmMi2HVuB2G2xqu7VN
         VxcOzrUSX+Vbg==
Date:   Wed, 1 Apr 2020 07:52:48 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the risc-v tree
Message-ID: <20200401075248.367dd167@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kTc87RU.y5.p6jmMCwc8gJQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/kTc87RU.y5.p6jmMCwc8gJQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  f1e58583b9c7 ("RISC-V: Support cpu hotplug")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/kTc87RU.y5.p6jmMCwc8gJQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6DraAACgkQAVBC80lX
0GzHBQf/ZzULjhMKPXc5vvzLnDDdVrD1RluhynKTy0c/h0yXQWf0D7eZaT71OoZx
Q8ircgmulcmYoqrdhDxm3DH684OV5zyzMkIRyuZsAO/KaNMbFYzq48PqM06WZ4oA
7tcPz16HRtmCEDGhw9RTQ1tCaqMFZnLkMElJo36cmu3Rd/vFtVnk/RdJZHpOdKCB
NUV5UKAfqhsR8UIROJmdtr2CGJ3QLoGwMTvAuE5cWD/RKDrf3LF4116aMMkrBvcg
nBNWFwB8mqkyl+5Txm73jTvdUzRVBUeOv1YITRJnpWyOLuy+a3DqtmBlhT64A7+Q
vQwaZnNmxBD6uW1gPaXNb4qplbH5Lg==
=dfTk
-----END PGP SIGNATURE-----

--Sig_/kTc87RU.y5.p6jmMCwc8gJQ--
