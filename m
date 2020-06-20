Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 775562026F2
	for <lists+linux-next@lfdr.de>; Sat, 20 Jun 2020 23:46:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729036AbgFTVqO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 20 Jun 2020 17:46:14 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:46357 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729032AbgFTVqN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 20 Jun 2020 17:46:13 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49q8PX0Qkdz9sPF;
        Sun, 21 Jun 2020 07:46:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1592689568;
        bh=X/taPUHeWLJVM/kaYKd+Q++rYLyDJOF4tONvDzXN5fk=;
        h=Date:From:To:Cc:Subject:From;
        b=YcNarYwdcyjziu4II/2Dj6TWcZ5IrcyjBvFHT3Y6tM7a2yH+Y2hHqUI0gaiQLsck9
         EnbQvAS1vrYH7tmE6hUMowJgO6OFSSWKpK6Op924ej+uL6vxmgMt4LJgmnf2FHFiW/
         o4xvDEi4FvD+966h0/Dv/ETpmHf/SAP/LMvm/Av3toEwn86C3HOoPrh0Tos7k1HURG
         Xy/aTfFs42Hcsgk8bE5HzAAEVIo4fPU2Lvw2a4/uQ3kTBtKlq92PtZUiEfoKOq8RKY
         aoYLh9Hj6zw5BuUk9LAAT2KhisvyA8oIxbHv7UGcciQJSenupTL9zBBipJIa25/haJ
         9q+Ym5CSP4GVA==
Date:   Sun, 21 Jun 2020 07:46:07 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Rientjes <rientjes@google.com>
Subject: linux-next: Fixes tag needs some work in the dma-mapping tree
Message-ID: <20200621074607.4a2fcc68@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vXlAKtn2aFCi6ysqN7e4Kio";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vXlAKtn2aFCi6ysqN7e4Kio
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  8cbe23e1c79f ("dma-direct: add missing set_memory_decrypted() for coheren=
t mapping")

Fixes tag

  Fixes: 3acac065508f ("dma-mapping: merge the generic remapping helpers

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/vXlAKtn2aFCi6ysqN7e4Kio
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7ug58ACgkQAVBC80lX
0GweDgf/RLXq9iRoBRoavQWVjsVpnAxVyzIlOxkluZOpPwOnTdq8SDcfz3iZDBAZ
iKxelWXGtmUBKJeLHRl2Pdfx4n8kW6acI9egrty/vtZOGVcitU7ScAigYakoIVwf
8migMrOg2YpewNV9xxwrpSHVo8MuZQtsI927bdnWJq9u865Fjmb66tiSodE5G6nf
L+x24W1jgV/APp4G79NHkriAt4EbWdvhNxikaZwHiOYro1CmKvJLHY/9rDo2rt0m
/Ys2YT16TQRQPW3/cN1kZHo3qsIMtn9cSy9JmnH1DY+o2OJHF2aFjBn1R/+TrwGG
ARG7HA7Od0U8/bbroz9ZD7PC8YcY3g==
=YpX2
-----END PGP SIGNATURE-----

--Sig_/vXlAKtn2aFCi6ysqN7e4Kio--
