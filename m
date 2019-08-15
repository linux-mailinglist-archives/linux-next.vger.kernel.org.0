Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37AF08F78D
	for <lists+linux-next@lfdr.de>; Fri, 16 Aug 2019 01:23:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387712AbfHOXX5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Aug 2019 19:23:57 -0400
Received: from ozlabs.org ([203.11.71.1]:59781 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731476AbfHOXX5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Aug 2019 19:23:57 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 468jFQ4x00z9sDB;
        Fri, 16 Aug 2019 09:23:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565911435;
        bh=kks2UrOgD/eep7ZxAVkInH+kO1NgToNJBllyhwrLo4s=;
        h=Date:From:To:Cc:Subject:From;
        b=FZR9lfPSSyw5DZVXfhI5bxPAeKEsaiJZt3w7SFFA1S5D06IDbUuT6KusRKbzZTmq/
         fYGlWBYQFd5N3HlGYoxfa/bzzoXc6+eCjlLuAmER25tqJLI+3PFW/USn2OBrK6Xx28
         K5kB6kcPRBmsWhWJ0z9c/DyU/cQUFHRJO7izRUKFabD/0Oc8JJgvejjoiqBc/kvUNZ
         fjKKwE73T6eMBN0Li39DC4xmyZYkzl03EhFt5K1upmht/90Dgyow5KLaG5QG1iYUhy
         WIhUe6EKUPBDbTqroipCXeu/NJj+rYL42uF2i8otCPa2TAVGsNrGDT4nckOw3s9R/2
         V23iGaVpnQXug==
Date:   Fri, 16 Aug 2019 09:23:41 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the arm-soc tree
Message-ID: <20190816092341.06899516@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OoFaWTzmhYPTaAT95jsTflI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/OoFaWTzmhYPTaAT95jsTflI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the arm-soc tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

In file included from include/linux/kernel.h:15,
                 from include/linux/list.h:9,
                 from include/linux/module.h:9,
                 from drivers/dma/iop-adma.c:13:
drivers/dma/iop-adma.c: In function '__iop_adma_slot_cleanup':
drivers/dma/iop-adma.c:118:12: warning: format '%x' expects argument of typ=
e 'unsigned int', but argument 6 has type 'dma_addr_t' {aka 'long long unsi=
gned int'} [-Wformat=3D]
   pr_debug("\tcookie: %d slot: %d busy: %d "
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/printk.h:288:21: note: in definition of macro 'pr_fmt'
 #define pr_fmt(fmt) fmt
                     ^~~
include/linux/dynamic_debug.h:143:2: note: in expansion of macro '__dynamic=
_func_call'
  __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
  ^~~~~~~~~~~~~~~~~~~
include/linux/dynamic_debug.h:153:2: note: in expansion of macro '_dynamic_=
func_call'
  _dynamic_func_call(fmt, __dynamic_pr_debug,  \
  ^~~~~~~~~~~~~~~~~~
include/linux/printk.h:336:2: note: in expansion of macro 'dynamic_pr_debug'
  dynamic_pr_debug(fmt, ##__VA_ARGS__)
  ^~~~~~~~~~~~~~~~
drivers/dma/iop-adma.c:118:3: note: in expansion of macro 'pr_debug'
   pr_debug("\tcookie: %d slot: %d busy: %d "
   ^~~~~~~~
drivers/dma/iop-adma.c:119:18: note: format string is defined here
    "this_desc: %#x next_desc: %#llx ack: %d\n",
                ~~^
                %#llx

Introduced (or exposed?) by commit

  00c9755524fb ("dmaengine: iop-adma: use correct printk format strings")

--=20
Cheers,
Stephen Rothwell

--Sig_/OoFaWTzmhYPTaAT95jsTflI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1V6X0ACgkQAVBC80lX
0GwpOAf9H72e03ULtColpkz7dumUbcWHXgwX0b8iR5caWpy0CsiEISXuvI0eHnYW
aIu1KZ68rlWww/31dBIuFBzu7rF5mENS7RcoJTgLWy6UfeJCHD8o/kycgW33GoaE
Sc0VWEq8UiW0oFgIlcY8ubQ/ntDx2GlWn3ekNxuzngMyj+GsQvLNSfy+ttww9DYI
Z+XvOTvtLmc5Qp+laSFGWZi5nL1buCHyLPW1529ynqQFSm12N4h+zbJJP5RrIXpU
vMCJ0Qv1KcaUG4cBzFJxN1NdDAxHtolLjNpn03iOH/jxUrPLh9EjECX2XKQMrZ4S
OjqlAx/HATz7uOARvEtPiG3P4IUbew==
=DzRo
-----END PGP SIGNATURE-----

--Sig_/OoFaWTzmhYPTaAT95jsTflI--
