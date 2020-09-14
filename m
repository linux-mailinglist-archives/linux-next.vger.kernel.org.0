Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 422D826853F
	for <lists+linux-next@lfdr.de>; Mon, 14 Sep 2020 09:01:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbgINHB1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Sep 2020 03:01:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726042AbgINHA6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Sep 2020 03:00:58 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9673CC06174A;
        Mon, 14 Sep 2020 00:00:57 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BqchR6YYYz9ryj;
        Mon, 14 Sep 2020 17:00:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600066856;
        bh=ICDhwkBYOZdaGKLT7o+YZA8ex9YcfcWpdqbW1i6hdA4=;
        h=Date:From:To:Cc:Subject:From;
        b=LrZgBBKTOpAOo9Ucha5gGcOSJ7mBBqGYPVWUaT+fH6VDCMYI5YCigdfIoy5FYfQR3
         pvjw2reOJwmAzlmKxiI/2Me4T+pfsb5qubzO6rMRPGhfVZpeGVbM342c7qwAXXFQs2
         Nd/S3Udoc6Il1ywrevyEkiX2aP2zgqIupTRP90W/l5q1ZPXQrQgZVpmoUoatEdRixU
         TI1t0WGLY8DNVBZaKSoO31v8NXQPvk2ramJq+gxKmIMerBSmMsTjmMOZVGg6wzKaqb
         Kz1TkGad+Iq4zsRT0aN0vnUrFbFst02rcW6S3tvZw9TV6DhAXZUGsbqMxlnUDGcXbl
         1MMh+t2hhRUPQ==
Date:   Mon, 14 Sep 2020 17:00:55 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Patricia Alfonso <trishalfonso@google.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Gow <davidgow@google.com>
Subject: linux-next: build warning after merge of the akpm-current tree
Message-ID: <20200914170055.45a02b55@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/s9W4y/JvljleMS/0+ojh80Q";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/s9W4y/JvljleMS/0+ojh80Q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

In file included from lib/test_kasan_module.c:16:
lib/../mm/kasan/kasan.h:232:6: warning: conflicting types for built-in func=
tion '__asan_register_globals'; expected 'void(void *, long int)' [-Wbuilti=
n-declaration-mismatch]
  232 | void __asan_register_globals(struct kasan_global *globals, size_t s=
ize);
      |      ^~~~~~~~~~~~~~~~~~~~~~~
lib/../mm/kasan/kasan.h:233:6: warning: conflicting types for built-in func=
tion '__asan_unregister_globals'; expected 'void(void *, long int)' [-Wbuil=
tin-declaration-mismatch]
  233 | void __asan_unregister_globals(struct kasan_global *globals, size_t=
 size);
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~
lib/../mm/kasan/kasan.h:235:6: warning: conflicting types for built-in func=
tion '__asan_alloca_poison'; expected 'void(void *, long int)' [-Wbuiltin-d=
eclaration-mismatch]
  235 | void __asan_alloca_poison(unsigned long addr, size_t size);
      |      ^~~~~~~~~~~~~~~~~~~~
lib/../mm/kasan/kasan.h:236:6: warning: conflicting types for built-in func=
tion '__asan_allocas_unpoison'; expected 'void(void *, long int)' [-Wbuilti=
n-declaration-mismatch]
  236 | void __asan_allocas_unpoison(const void *stack_top, const void *sta=
ck_bottom);
      |      ^~~~~~~~~~~~~~~~~~~~~~~
lib/../mm/kasan/kasan.h:238:6: warning: conflicting types for built-in func=
tion '__asan_load1'; expected 'void(void *)' [-Wbuiltin-declaration-mismatc=
h]
  238 | void __asan_load1(unsigned long addr);
      |      ^~~~~~~~~~~~
lib/../mm/kasan/kasan.h:239:6: warning: conflicting types for built-in func=
tion '__asan_store1'; expected 'void(void *)' [-Wbuiltin-declaration-mismat=
ch]
  239 | void __asan_store1(unsigned long addr);
      |      ^~~~~~~~~~~~~
lib/../mm/kasan/kasan.h:240:6: warning: conflicting types for built-in func=
tion '__asan_load2'; expected 'void(void *)' [-Wbuiltin-declaration-mismatc=
h]
  240 | void __asan_load2(unsigned long addr);
      |      ^~~~~~~~~~~~
lib/../mm/kasan/kasan.h:241:6: warning: conflicting types for built-in func=
tion '__asan_store2'; expected 'void(void *)' [-Wbuiltin-declaration-mismat=
ch]
  241 | void __asan_store2(unsigned long addr);
      |      ^~~~~~~~~~~~~
lib/../mm/kasan/kasan.h:242:6: warning: conflicting types for built-in func=
tion '__asan_load4'; expected 'void(void *)' [-Wbuiltin-declaration-mismatc=
h]
  242 | void __asan_load4(unsigned long addr);
      |      ^~~~~~~~~~~~
lib/../mm/kasan/kasan.h:243:6: warning: conflicting types for built-in func=
tion '__asan_store4'; expected 'void(void *)' [-Wbuiltin-declaration-mismat=
ch]
  243 | void __asan_store4(unsigned long addr);
      |      ^~~~~~~~~~~~~
lib/../mm/kasan/kasan.h:244:6: warning: conflicting types for built-in func=
tion '__asan_load8'; expected 'void(void *)' [-Wbuiltin-declaration-mismatc=
h]
  244 | void __asan_load8(unsigned long addr);
      |      ^~~~~~~~~~~~
lib/../mm/kasan/kasan.h:245:6: warning: conflicting types for built-in func=
tion '__asan_store8'; expected 'void(void *)' [-Wbuiltin-declaration-mismat=
ch]
  245 | void __asan_store8(unsigned long addr);
      |      ^~~~~~~~~~~~~
lib/../mm/kasan/kasan.h:246:6: warning: conflicting types for built-in func=
tion '__asan_load16'; expected 'void(void *)' [-Wbuiltin-declaration-mismat=
ch]
  246 | void __asan_load16(unsigned long addr);
      |      ^~~~~~~~~~~~~
lib/../mm/kasan/kasan.h:247:6: warning: conflicting types for built-in func=
tion '__asan_store16'; expected 'void(void *)' [-Wbuiltin-declaration-misma=
tch]
  247 | void __asan_store16(unsigned long addr);
      |      ^~~~~~~~~~~~~~
lib/../mm/kasan/kasan.h:248:6: warning: conflicting types for built-in func=
tion '__asan_loadN'; expected 'void(void *, long int)' [-Wbuiltin-declarati=
on-mismatch]
  248 | void __asan_loadN(unsigned long addr, size_t size);
      |      ^~~~~~~~~~~~
lib/../mm/kasan/kasan.h:249:6: warning: conflicting types for built-in func=
tion '__asan_storeN'; expected 'void(void *, long int)' [-Wbuiltin-declarat=
ion-mismatch]
  249 | void __asan_storeN(unsigned long addr, size_t size);
      |      ^~~~~~~~~~~~~
lib/../mm/kasan/kasan.h:251:6: warning: conflicting types for built-in func=
tion '__asan_load1_noabort'; expected 'void(void *)' [-Wbuiltin-declaration=
-mismatch]
  251 | void __asan_load1_noabort(unsigned long addr);
      |      ^~~~~~~~~~~~~~~~~~~~
lib/../mm/kasan/kasan.h:252:6: warning: conflicting types for built-in func=
tion '__asan_store1_noabort'; expected 'void(void *)' [-Wbuiltin-declaratio=
n-mismatch]
  252 | void __asan_store1_noabort(unsigned long addr);
      |      ^~~~~~~~~~~~~~~~~~~~~
lib/../mm/kasan/kasan.h:253:6: warning: conflicting types for built-in func=
tion '__asan_load2_noabort'; expected 'void(void *)' [-Wbuiltin-declaration=
-mismatch]
  253 | void __asan_load2_noabort(unsigned long addr);
      |      ^~~~~~~~~~~~~~~~~~~~
lib/../mm/kasan/kasan.h:254:6: warning: conflicting types for built-in func=
tion '__asan_store2_noabort'; expected 'void(void *)' [-Wbuiltin-declaratio=
n-mismatch]
  254 | void __asan_store2_noabort(unsigned long addr);
      |      ^~~~~~~~~~~~~~~~~~~~~
lib/../mm/kasan/kasan.h:255:6: warning: conflicting types for built-in func=
tion '__asan_load4_noabort'; expected 'void(void *)' [-Wbuiltin-declaration=
-mismatch]
  255 | void __asan_load4_noabort(unsigned long addr);
      |      ^~~~~~~~~~~~~~~~~~~~
lib/../mm/kasan/kasan.h:256:6: warning: conflicting types for built-in func=
tion '__asan_store4_noabort'; expected 'void(void *)' [-Wbuiltin-declaratio=
n-mismatch]
  256 | void __asan_store4_noabort(unsigned long addr);
      |      ^~~~~~~~~~~~~~~~~~~~~
lib/../mm/kasan/kasan.h:257:6: warning: conflicting types for built-in func=
tion '__asan_load8_noabort'; expected 'void(void *)' [-Wbuiltin-declaration=
-mismatch]
  257 | void __asan_load8_noabort(unsigned long addr);
      |      ^~~~~~~~~~~~~~~~~~~~
lib/../mm/kasan/kasan.h:258:6: warning: conflicting types for built-in func=
tion '__asan_store8_noabort'; expected 'void(void *)' [-Wbuiltin-declaratio=
n-mismatch]
  258 | void __asan_store8_noabort(unsigned long addr);
      |      ^~~~~~~~~~~~~~~~~~~~~
lib/../mm/kasan/kasan.h:259:6: warning: conflicting types for built-in func=
tion '__asan_load16_noabort'; expected 'void(void *)' [-Wbuiltin-declaratio=
n-mismatch]
  259 | void __asan_load16_noabort(unsigned long addr);
      |      ^~~~~~~~~~~~~~~~~~~~~
lib/../mm/kasan/kasan.h:260:6: warning: conflicting types for built-in func=
tion '__asan_store16_noabort'; expected 'void(void *)' [-Wbuiltin-declarati=
on-mismatch]
  260 | void __asan_store16_noabort(unsigned long addr);
      |      ^~~~~~~~~~~~~~~~~~~~~~
lib/../mm/kasan/kasan.h:261:6: warning: conflicting types for built-in func=
tion '__asan_loadN_noabort'; expected 'void(void *, long int)' [-Wbuiltin-d=
eclaration-mismatch]
  261 | void __asan_loadN_noabort(unsigned long addr, size_t size);
      |      ^~~~~~~~~~~~~~~~~~~~
lib/../mm/kasan/kasan.h:262:6: warning: conflicting types for built-in func=
tion '__asan_storeN_noabort'; expected 'void(void *, long int)' [-Wbuiltin-=
declaration-mismatch]
  262 | void __asan_storeN_noabort(unsigned long addr, size_t size);
      |      ^~~~~~~~~~~~~~~~~~~~~
lib/../mm/kasan/kasan.h:264:6: warning: conflicting types for built-in func=
tion '__asan_report_load1_noabort'; expected 'void(void *)' [-Wbuiltin-decl=
aration-mismatch]
  264 | void __asan_report_load1_noabort(unsigned long addr);
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
lib/../mm/kasan/kasan.h:265:6: warning: conflicting types for built-in func=
tion '__asan_report_store1_noabort'; expected 'void(void *)' [-Wbuiltin-dec=
laration-mismatch]
  265 | void __asan_report_store1_noabort(unsigned long addr);
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
lib/../mm/kasan/kasan.h:266:6: warning: conflicting types for built-in func=
tion '__asan_report_load2_noabort'; expected 'void(void *)' [-Wbuiltin-decl=
aration-mismatch]
  266 | void __asan_report_load2_noabort(unsigned long addr);
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
lib/../mm/kasan/kasan.h:267:6: warning: conflicting types for built-in func=
tion '__asan_report_store2_noabort'; expected 'void(void *)' [-Wbuiltin-dec=
laration-mismatch]
  267 | void __asan_report_store2_noabort(unsigned long addr);
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
lib/../mm/kasan/kasan.h:268:6: warning: conflicting types for built-in func=
tion '__asan_report_load4_noabort'; expected 'void(void *)' [-Wbuiltin-decl=
aration-mismatch]
  268 | void __asan_report_load4_noabort(unsigned long addr);
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
lib/../mm/kasan/kasan.h:269:6: warning: conflicting types for built-in func=
tion '__asan_report_store4_noabort'; expected 'void(void *)' [-Wbuiltin-dec=
laration-mismatch]
  269 | void __asan_report_store4_noabort(unsigned long addr);
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
lib/../mm/kasan/kasan.h:270:6: warning: conflicting types for built-in func=
tion '__asan_report_load8_noabort'; expected 'void(void *)' [-Wbuiltin-decl=
aration-mismatch]
  270 | void __asan_report_load8_noabort(unsigned long addr);
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
lib/../mm/kasan/kasan.h:271:6: warning: conflicting types for built-in func=
tion '__asan_report_store8_noabort'; expected 'void(void *)' [-Wbuiltin-dec=
laration-mismatch]
  271 | void __asan_report_store8_noabort(unsigned long addr);
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
lib/../mm/kasan/kasan.h:272:6: warning: conflicting types for built-in func=
tion '__asan_report_load16_noabort'; expected 'void(void *)' [-Wbuiltin-dec=
laration-mismatch]
  272 | void __asan_report_load16_noabort(unsigned long addr);
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
lib/../mm/kasan/kasan.h:273:6: warning: conflicting types for built-in func=
tion '__asan_report_store16_noabort'; expected 'void(void *)' [-Wbuiltin-de=
claration-mismatch]
  273 | void __asan_report_store16_noabort(unsigned long addr);
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
lib/../mm/kasan/kasan.h:274:6: warning: conflicting types for built-in func=
tion '__asan_report_load_n_noabort'; expected 'void(void *, long int)' [-Wb=
uiltin-declaration-mismatch]
  274 | void __asan_report_load_n_noabort(unsigned long addr, size_t size);
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
lib/../mm/kasan/kasan.h:275:6: warning: conflicting types for built-in func=
tion '__asan_report_store_n_noabort'; expected 'void(void *, long int)' [-W=
builtin-declaration-mismatch]
  275 | void __asan_report_store_n_noabort(unsigned long addr, size_t size);
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c: In function 'common_nfc_set_geo=
metry':
drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c:514:3: warning: initialization d=
iscards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
  514 |   nanddev_get_ecc_requirements(&chip->base);
      |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  77e7d1c8c356 ("KASAN: Port KASAN Tests to KUnit")

--=20
Cheers,
Stephen Rothwell

--Sig_/s9W4y/JvljleMS/0+ojh80Q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9fFScACgkQAVBC80lX
0GyIIAf/bz3L1l80LtykY4ZcHwzB4pHZbD4UQ80qFVaR47dEvLvbP7rqWqb+pKP/
jhU/mHMqyQuDckYyZelVS+iZWYoeaslV9iPffks/VYtr91cmZn+QOO6VXpBz48Vo
b6kNGzJ4kX4T1dSMDxQkoCJP5Bq0GKjgQBk4wB+AKL+aOH3wk6c7UN5CbMz6Pfi9
LOyKHK3kRuRgB6PPgfBPNg0IO1k9qih0PpCC7pANcjbYRlxs1HuKzSuP7S7loVDh
erz+fh/FfqKlR+C5lX1Cd4v7pvcNDtmTlleI5JrCrHvysMIa6MskJ4HDw9jBYe1r
uV8YKCZBihDgqLW6347ut5qdSb8jUw==
=vwNl
-----END PGP SIGNATURE-----

--Sig_/s9W4y/JvljleMS/0+ojh80Q--
