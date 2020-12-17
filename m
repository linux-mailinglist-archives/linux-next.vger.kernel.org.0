Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEC3F2DCF10
	for <lists+linux-next@lfdr.de>; Thu, 17 Dec 2020 11:06:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725988AbgLQKGH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Dec 2020 05:06:07 -0500
Received: from ozlabs.org ([203.11.71.1]:55355 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725930AbgLQKGH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 17 Dec 2020 05:06:07 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CxSKw0JtFz9sW8;
        Thu, 17 Dec 2020 21:05:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1608199525;
        bh=EhIPW7LDiAsjOPqUZv5kDSn2gMRRVOFcdbHc40kyzy8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=SyQuWv4q1BQPRFPTDafmbbwUuZCtcIZuZDxfd13xdOQg4MHUTzFhxFU8S3ClJMinq
         0KhbgzHPvOZMZ4sp37q6qeNcFOPso7Vlfle+ZcARbV+hvrLc0dR7jbA1jZbZZ4BlSh
         xZkJlv8rsCcDpV4tY2dMXsuRtFEe1mCu6LEmO2QCPPv0lVqwWYulCi12eezS/rVx0+
         zsegNrjiTm2GTsd44mjBiLpXt/HGlIeC86Dro6mgxHwQajd8pS4rREWJVPSOLroCeV
         v5CoReB7qeH4grZh2ASSbvBp7cCNOu6zvhLomZIzsuHgwpbohMr4nw+pjG5fN8yHwG
         j81r4s1O+oSvA==
Date:   Thu, 17 Dec 2020 21:05:22 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul@pwsan.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 risc-v tree
Message-ID: <20201217210522.76217bb5@canb.auug.org.au>
In-Reply-To: <CAHp75VdVDZx_YzD5mwUqs=ezuy=Mt1s8UmWB3mg+MgMj5yqEkQ@mail.gmail.com>
References: <20201214202107.66932c18@canb.auug.org.au>
        <20201217122521.23a6d7f2@canb.auug.org.au>
        <CAHp75VdVDZx_YzD5mwUqs=ezuy=Mt1s8UmWB3mg+MgMj5yqEkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mAgtQU7ULb4.x3jdQP5TQIh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/mAgtQU7ULb4.x3jdQP5TQIh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Thu, 17 Dec 2020 11:40:51 +0200 Andy Shevchenko <andy.shevchenko@gmail.c=
om> wrote:
>
> Yeah, and it's slightly different. Perhaps RISC-V tree can handle this
> by moving Makefile entry somewhere else in the file.

Or just let Linus take care of it ...

--=20
Cheers,
Stephen Rothwell

--Sig_/mAgtQU7ULb4.x3jdQP5TQIh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/bLWIACgkQAVBC80lX
0GyT2gf+JXKwSjH+Ka5IeAQKH1FBISFs1W4PGc/5+zEKfkBLRdf29kiGWtlnkmCf
79Enaj656Kfik7nhoq2pduvqws9hz3VfrZro/Sj4yYR6L/nV6Qqn9tExyj/zCVl0
40En4xYs6nqWPGeJwVEIhN2IR4JtAyhJmwEfQR2iBKiN4dwFvQq1guNYYX2G0VFG
wtw7n92hIW1AEEAs0Yah6VkF3I2ZIeOQZS1u2cy6s4lDzjJzuJeRQyTvIZo3uJl8
/F9WZkru7y4BGzwmTjzmZ3NKnkB5oLa91xaU6o9ekleCv2WtxMHzjI50L+NeKndt
Om7sxUKZVbdxSOkUIEm06+YmQHn4Zg==
=o43o
-----END PGP SIGNATURE-----

--Sig_/mAgtQU7ULb4.x3jdQP5TQIh--
