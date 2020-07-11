Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8619921C6BE
	for <lists+linux-next@lfdr.de>; Sun, 12 Jul 2020 01:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbgGKXfa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 11 Jul 2020 19:35:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726939AbgGKXfa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 11 Jul 2020 19:35:30 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFF53C08C5DD;
        Sat, 11 Jul 2020 16:35:29 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B45qy5rkSz9sRN;
        Sun, 12 Jul 2020 09:35:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594510527;
        bh=fiQmHM987DAmtt5nIvsg2T0RG0TiG4tCM6QP09yl7n0=;
        h=Date:From:To:Cc:Subject:From;
        b=T7ZBUk4WeEe90jBWuS6WWiXuUbwmto9DFfS0iEAkn5bbojWgX9I2/Xj+vbNQTWUSG
         iX2TxsvX6p7H4gyDPbnWcyNmHY0o1W2lePSPrSXI7Jjx+yS9hVBXvPImTMoQ2l6fU+
         Ahs0Qxsy5PRNGwjP+BMuWKz6OcYKlyZhim0dhWImZ90p3lfkFnZ6pINOT0vR1j0Kz8
         X+x3GnSvwpeqtFpzD8hkjibXQI9Pzw/cfzGlJ9VFyQ653+6Hzg1jjC7xpMAaW7GB5N
         E8jloJNuyrce6J5Y97BeckS8n7f1I7celrf/cWyVKlKsIdEh8e4fUNtR3qltvL2GSq
         ucgyij0Whs20w==
Date:   Sun, 12 Jul 2020 09:35:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the risc-v tree
Message-ID: <20200712093519.4a3fd9b5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qx68+YcImgCM0qMARJRFs=T";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qx68+YcImgCM0qMARJRFs=T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  95ce6c73da3b ("riscv: Enable context tracking")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/qx68+YcImgCM0qMARJRFs=T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8KTLcACgkQAVBC80lX
0GxmeQf+OS0n/Lh3C1Owt+JgUK/9cj6Q8n3gZ7b5YkdN5g8VHKoPEwHHsPYGYMlG
owckSQXl4ZvhsX8bAyf+NSDtzLZpYRVbAjN+x3lzx9OHtCvxrWUtnJsrSY0z9ECP
G3OoB/SyefpWhF9Bulm/yDsYflLkLMCgzJduvRvSiLePWkeN+PG/xfQ6QbeeEUHM
X1opFem1eVMy3jtOjBR3dQTV0DjcGSjAhML8irRG8IWMDIE3Y0NgMGwrMoDrJgFY
h/rCi178N5qFv/NyLbtnOJJZUWV51fG5roJnNAH4OwZ1sfwda435Q3I6onSKef9l
0d/j6QXRcPotCYig5ykLqBwet3BO+g==
=iG+Q
-----END PGP SIGNATURE-----

--Sig_/qx68+YcImgCM0qMARJRFs=T--
