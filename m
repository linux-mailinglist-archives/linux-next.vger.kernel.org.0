Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0F5A3F0E6D
	for <lists+linux-next@lfdr.de>; Thu, 19 Aug 2021 00:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232456AbhHRWz0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Aug 2021 18:55:26 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:55329 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230515AbhHRWz0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Aug 2021 18:55:26 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gqjrx70Qpz9sSs;
        Thu, 19 Aug 2021 08:54:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629327282;
        bh=IXeg0veOTz8NqVmFLu65PO69E235ItarSfjI6yHpA9Y=;
        h=Date:From:To:Cc:Subject:From;
        b=LCRozLAUlja+60SrR8h/aBr3Y8pLyo+ExROkXc/jfAOwj6DDWoP8m9gTC/gnKogV7
         EZJWdCIuynjqRiUVXyHureV+DbI0Ztm/mvFofeaUErvapiotnIjXgcMB2j60BzBmbM
         oci1kNMbJojkblsmRHZaFJteSXA0MIFFGE8kpaBiYzQqKyXBTxIOogtCOdlw5M5qYV
         z8Os0CjPopww1Sr52DHmvREyUpKyyL6+NoFpa7VmGtTlWfZzXa0R8s8wcqdcXzJSES
         mXOB+sFH2y4GryEPlZ8IFKijGuN1p9z1msctf0PsBiu0qkz0zmUn/elJXitjXuXze1
         Z0HveF4VofGkw==
Date:   Thu, 19 Aug 2021 08:54:40 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the dma-mapping tree
Message-ID: <20210819085440.0ef51c24@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_qIZvZr7lHIGCrDWYnGA8AV";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/_qIZvZr7lHIGCrDWYnGA8AV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the dma-mapping tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

kernel/dma/coherent.c:325:29: warning: 'dma_reserved_default_memory' define=
d but not used [-Wunused-variable]
  325 | static struct reserved_mem *dma_reserved_default_memory __initdata;
      |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  b7987aff1d0c ("dma-mapping: make the global coherent pool conditional")

--=20
Cheers,
Stephen Rothwell

--Sig_/_qIZvZr7lHIGCrDWYnGA8AV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEdj7AACgkQAVBC80lX
0GyL7gf+L/vV4c1ebXhgDe3eI+SnkAnzWxpLBffP6hV5paWmhoOPWVlgPUnN+KSk
HUMLYHbB2APMb4Wp4wo5lVp7eFGkamH+a22aF24Z6YVplPC9dRWvKnrW3+YG8WM0
o43Ky7odFdPlyGojK82W9JuWFStf2CSE6nUU9NKzzs+5owBjSBZhDYH7KsbBwUFB
WwNkzPQ8kUj5NbhVGPKjo2jRgQRVFx7szWPs/a5TffJzPj1Z49zRtanwEdS70QrZ
IPwDkKy/aRsxtq1fhLE9B/qPb27JmzZbCuCsDWUvmNqpe2okEvz3TEcw1mOgrxbx
XFZjIMirDIrfze9950u8Nti4Bwb8TQ==
=8Sa3
-----END PGP SIGNATURE-----

--Sig_/_qIZvZr7lHIGCrDWYnGA8AV--
