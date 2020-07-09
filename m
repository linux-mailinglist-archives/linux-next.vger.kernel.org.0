Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E22A0219715
	for <lists+linux-next@lfdr.de>; Thu,  9 Jul 2020 06:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbgGIEK7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 9 Jul 2020 00:10:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726064AbgGIEK6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 9 Jul 2020 00:10:58 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51900C061A0B;
        Wed,  8 Jul 2020 21:10:58 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B2N5C0pPZz9sSt;
        Thu,  9 Jul 2020 14:10:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594267855;
        bh=uv4JilNsxh9y2T6w87lzTYRRg5eVqB9fLa64u7SGRu8=;
        h=Date:From:To:Cc:Subject:From;
        b=rvh2OYGdB6InOgKUkhn0LDHWYXDj5JRynEz77BCpp0EtkUJJmVlVk03bJyc5wifaL
         VzNz8UOOVLXOBqydCxFOKbz2mm0Zczz3XIKutJAsOZd3aacKjXVOmAN1mDLCTkaPHF
         UnPIj1vosCknBZ0rQkhzGLQA7MkgpI4vDNsyoboquhYVjgHKlvLJhtgrHzBNldz5a2
         uWCmV/30dtnlMqcRj77PhqUZ10fOwD4wV5q6zuuCgqND3P++J1UQRKh0VyPkDVHEQo
         +flElEA6Z9R9sdbfIMqVoP5qRIlMIrj7uHQGMlaKd+CFVWVSqNxMQOm1cmKEuGwDeE
         m0qnRM3ahascg==
Date:   Thu, 9 Jul 2020 14:10:54 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peng Fan <fanpeng@loongson.cn>
Subject: linux-next: build warning after merge of the spi tree
Message-ID: <20200709141054.1b65be9d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CeOHfdGiTZk65KNzzWIkKPP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/CeOHfdGiTZk65KNzzWIkKPP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the spi tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/spi/spi-atmel.c: In function 'atmel_spi_probe':
drivers/spi/spi-atmel.c:1680:1: warning: label 'out_free' defined but not u=
sed [-Wunused-label]
 1680 | out_free:
      | ^~~~~~~~

Introduced by commit

  2d9a744685bc ("spi: atmel: No need to call spi_master_put() if spi_alloc_=
master() failed")

--=20
Cheers,
Stephen Rothwell

--Sig_/CeOHfdGiTZk65KNzzWIkKPP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8GmM4ACgkQAVBC80lX
0GzpEggAmj6NQaO/eilPzVXPR9QsXytLeHQjIWIkoNhnPwX6duq/VK3XSliH6KKH
ZGT9w8reN+vBa6SojbOxM4UEcqgylNLAsBP0G5GaP3/ieYvDs1lMRoZZ7NaJz3kj
mUCwJmlQTktExN0UkNSgpI/4DZ1jSq+6k1WaMebxBRbqXINLNldcTrNGSPcFCI2M
8sFKm/r+cRvyNEQOCEH4b5PrgpwG9NQUCp8A4DvAv0JTFPo+pneBa4Te5JZXyIy1
6/Wo3cY2hhTeM/Wax7HXlH83/WPkwHUqQD0vHoOJuhKYPffiA4ZUqlyfDKT0/0u8
8i6VGk6k96GwM0xxo1KVBTbNJz4y1g==
=I033
-----END PGP SIGNATURE-----

--Sig_/CeOHfdGiTZk65KNzzWIkKPP--
