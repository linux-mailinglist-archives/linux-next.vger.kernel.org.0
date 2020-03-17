Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69F7118793F
	for <lists+linux-next@lfdr.de>; Tue, 17 Mar 2020 06:30:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725769AbgCQFaj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Mar 2020 01:30:39 -0400
Received: from ozlabs.org ([203.11.71.1]:33709 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725468AbgCQFaj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Mar 2020 01:30:39 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48hMFm3r6yz9sPF;
        Tue, 17 Mar 2020 16:30:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584423037;
        bh=0QSdFBmo3Jxw2FG6/tNSmnGRL3dfpOUfxQFPx7YyZUo=;
        h=Date:From:To:Cc:Subject:From;
        b=hBWJ+yn37axtoRhG3ePM41DkqPfLUhmVavBu+E3mYavCGm+NM+L59/SLp+gE7lLjR
         7URkN+5eYupb7hkKFm5i7PCsWSEmuYQNGWA8fVfF0VCFqtO0tWOOKiuxP0YCzwiDo/
         3DFX9I0igbJoXxnSomLIQEtmKRzUUcY0F0B0Qto53UcTfNUCxuvyOQZUt7f2+op/a8
         OUXSEA949SWxMly+4alTIRAUxIhU2/kIqV7GNsV7a6eGJ0EsMOubfjE9/uG92LlL4a
         b6h0ZJ21tCp9PNA/g73EmKZ2n3T+40s1gaINPdyAwKLvmR22YUsM/Boag8j4YTAl/u
         DkHBxLmnmQn4g==
Date:   Tue, 17 Mar 2020 16:30:34 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ran Bi <ran.bi@mediatek.com>
Subject: linux-next: build warning after merge of the rtc tree
Message-ID: <20200317163034.2921155e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4G6dYCPbVjrmEI7zzrRXetQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4G6dYCPbVjrmEI7zzrRXetQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rtc tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

drivers/rtc/rtc-mt2712.c: In function 'mt2712_rtc_set_alarm':
drivers/rtc/rtc-mt2712.c:235:6: warning: unused variable 'irqen' [-Wunused-=
variable]
  235 |  u16 irqen;
      |      ^~~~~

Introduced by commit

  4037b7df1026 ("rtc: add support for the MediaTek MT2712 RTC")

--=20
Cheers,
Stephen Rothwell

--Sig_/4G6dYCPbVjrmEI7zzrRXetQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5wYHoACgkQAVBC80lX
0GxEmAf8DijSiVIFOx1Ha5q0MO3eQgN9odfkjEIAHHroswHqZ3bGk3vTjW52QlGw
l8Lu+3fZdwsuYl68GtzBKARYku/5tH+RZfpryCFO3oSW4oj8jtbb+UxUrlZElwMS
q/zUc80jaQDwYZwVfBrDbWIvBAjiTbSZPXJ9jC6h7DpnkSRMBX1Nj72VxKK3fE2D
QBteAJioDQtGEHd9ABES7cvSnqPoP3Wnkf7hF5W2T9F0OUQzKVPZFObYGRn8ByzY
kR8YwOy001Wae+1ts6bgxisfhiP+y/jLgqzPqUMDuzb4bgAz2VwHEmcRWajo/39j
MCv2IK9HuQgC+T3aJ1clXvvW+HX+MA==
=kmhU
-----END PGP SIGNATURE-----

--Sig_/4G6dYCPbVjrmEI7zzrRXetQ--
