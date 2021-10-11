Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD8304287A7
	for <lists+linux-next@lfdr.de>; Mon, 11 Oct 2021 09:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233605AbhJKHds (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Oct 2021 03:33:48 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:48701 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231974AbhJKHdr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Oct 2021 03:33:47 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HSVq65xhmz4xb7;
        Mon, 11 Oct 2021 18:31:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633937507;
        bh=SCPyOZEtiteoQfDJSQr511Ncjg8b28+HnVZHpvs35qo=;
        h=Date:From:To:Cc:Subject:From;
        b=dyx66GylUUJLC01nHRx9cBSDWiTWGJ6hz4B7Zni/vO5ciqebqrOoS60cOHB2X9+JM
         htnj4F1FTOxwrwOAjaxQbQTIHQuBz/z5AfaBcIO2pFy2naSJT29SmXas95UQYjnXE1
         85ZaRNEUiMngSPzoMM+vBJcTJQd9DdPW6xxwz1yHAoQSJc/R+Zt6PfV8r6WW2PA7aj
         766lgERiYu2+8lNYaT7ABS59vNLNFFGZrER//sMu47XsMv+j9+q89JGluTsxsKfEhr
         fPMvGzj/vttqEY8ZLxjF+U3nJlmRfreYLjwVEhJO30cBfOI7P9I7GpulwsKIxtXIVs
         ZuwzDO1Gu7Bwg==
Date:   Mon, 11 Oct 2021 18:31:45 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Daniel Micay <danielmicay@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the akpm-current tree
Message-ID: <20211011183145.6ac3bef3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/b1XoT7P7Bmi/XTKG6E0Rx7Z";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/b1XoT7P7Bmi/XTKG6E0Rx7Z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (htmldocs)
produced these warnings:

include/linux/slab.h:577: warning: Function parameter or member '1' not des=
cribed in '__alloc_size'
include/linux/slab.h:577: warning: expecting prototype for kmalloc(). Proto=
type was for __alloc_size() instead
include/linux/slab.h:623: warning: Function parameter or member '1' not des=
cribed in '__alloc_size'
include/linux/slab.h:623: warning: Function parameter or member '2' not des=
cribed in '__alloc_size'
include/linux/slab.h:623: warning: expecting prototype for kmalloc_array().=
 Prototype was for __alloc_size() instead
include/linux/slab.h:644: warning: Function parameter or member '2' not des=
cribed in '__alloc_size'
include/linux/slab.h:644: warning: Function parameter or member '3' not des=
cribed in '__alloc_size'
include/linux/slab.h:644: warning: expecting prototype for krealloc_array()=
. Prototype was for __alloc_size() instead
include/linux/slab.h:660: warning: Function parameter or member '1' not des=
cribed in '__alloc_size'
include/linux/slab.h:660: warning: Function parameter or member '2' not des=
cribed in '__alloc_size'
include/linux/slab.h:660: warning: expecting prototype for kcalloc(). Proto=
type was for __alloc_size() instead
include/linux/slab.h:723: warning: Function parameter or member '1' not des=
cribed in '__alloc_size'
include/linux/slab.h:723: warning: expecting prototype for kzalloc(). Proto=
type was for __alloc_size() instead
include/linux/slab.h:734: warning: Function parameter or member '1' not des=
cribed in '__alloc_size'
include/linux/slab.h:734: warning: expecting prototype for kzalloc_node(). =
Prototype was for __alloc_size() instead
include/linux/slab.h:1: warning: no structured comments found

Introduced by commit

  04ba82afbbf3 ("slab: add __alloc_size attributes for better bounds checki=
ng")

--=20
Cheers,
Stephen Rothwell

--Sig_/b1XoT7P7Bmi/XTKG6E0Rx7Z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFj6GEACgkQAVBC80lX
0GxzYwgAnPMBM6zTtQPsn0fbvJVknX2DXmNZVGntJZpoC1VbRMB1R97BygYbDVze
iqOqyqOzd5X0ekxMLMnX7qjriyHb6dWVcAXx+gwjBb4q0xB41GlG8NBqfatAbTG9
NDYqak4sbPr+CzHKI9PmqnMMNb0upEnsdbBelWUeJ9eSi3AeXsuN9Ua8PnTAXEFK
yNjGPX5V37hO8Q5eFUZd0Y43QbVy+PA7bDgqN0jgjiF3M9o6/Cdh8P0sp39obHh+
KNmrGC0R8y3Xo/Q5vXPGgc/zPfvMotKv8KLj/CQIQeukVamkfTzEH665iV1pg4ac
VOZZTJqZXWbAzFvjWW+7xLqNe5AsJg==
=OPyt
-----END PGP SIGNATURE-----

--Sig_/b1XoT7P7Bmi/XTKG6E0Rx7Z--
