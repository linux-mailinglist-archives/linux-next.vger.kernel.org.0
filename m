Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 046C72FB2BD
	for <lists+linux-next@lfdr.de>; Tue, 19 Jan 2021 08:19:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726985AbhASHS7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Jan 2021 02:18:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728012AbhASHS3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Jan 2021 02:18:29 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E16BC061575;
        Mon, 18 Jan 2021 23:16:25 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DKg1g36gLz9sSs;
        Tue, 19 Jan 2021 18:16:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611040583;
        bh=WKkdjV/ft3DAYhjarpX7H1vxGTvxkc5ReQpjqLIK9kI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Tb5vmvw1JONzi3ecdADOMHYKMqiPX7xw98ghPmTgqXVSW+mYH0YmjsyVkDgcJj6FI
         uS0T0r4dj2kl/oJrhTW+aPLh11ft83FkRJHr9Z+Kuqz6T5WwIkA8MWGDcO7HYkIo3z
         C5rGuaGUMVhtS/MFo3VcHmDEKoIJDHQs1zUOAp/RAcuGEBJpe+0bg4pUCovxd//D7j
         G7m1l3uTdmCohGITRiv4gMmdUKJYv0E/hMpf/26bXe0QMgp/qLX3zVE4CW9IZCA67i
         z2X5sL9Q7v8dH6vsdTKQWPRckw63pZB2wUeXK31J+kN0gClJ3tCRCbn5KLJALAjqXs
         jtUiH8pbOwyrA==
Date:   Tue, 19 Jan 2021 18:16:22 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the jc_docs tree
Message-ID: <20210119181622.15ed82fe@canb.auug.org.au>
In-Reply-To: <20210119171303.6be1bb1f@canb.auug.org.au>
References: <20210119171303.6be1bb1f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/31zvJXxmV2vo8_toHVssu8S";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/31zvJXxmV2vo8_toHVssu8S
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 19 Jan 2021 17:13:03 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> After merging the jc_docs tree, today's linux-next build (KCONFIG_NAME)
> produced these warnings:
>=20

Also, these:

tools/testing/selftests/kselftest_harness.h:82: warning: wrong kernel-doc i=
dentifier on line:
 * TH_LOG(fmt, ...)
tools/testing/selftests/kselftest_harness.h:116: warning: wrong kernel-doc =
identifier on line:
 * SKIP(statement, fmt, ...)
tools/testing/selftests/kselftest_harness.h:139: warning: wrong kernel-doc =
identifier on line:
 * TEST(test_name) - Defines the test function and creates the registration
tools/testing/selftests/kselftest_harness.h:158: warning: wrong kernel-doc =
identifier on line:
 * TEST_SIGNAL(test_name, signal)
tools/testing/selftests/kselftest_harness.h:198: warning: wrong kernel-doc =
identifier on line:
 * FIXTURE_DATA(datatype_name) - Wraps the struct name so we have one less
tools/testing/selftests/kselftest_harness.h:215: warning: wrong kernel-doc =
identifier on line:
 * FIXTURE(fixture_name) - Called once per fixture to setup the data and
tools/testing/selftests/kselftest_harness.h:242: warning: wrong kernel-doc =
identifier on line:
 * FIXTURE_SETUP(fixture_name) - Prepares the setup function for the fixtur=
e.
tools/testing/selftests/kselftest_harness.h:268: warning: wrong kernel-doc =
identifier on line:
 * FIXTURE_TEARDOWN(fixture_name)
tools/testing/selftests/kselftest_harness.h:289: warning: wrong kernel-doc =
identifier on line:
 * FIXTURE_VARIANT(fixture_name) - Optionally called once per fixture
tools/testing/selftests/kselftest_harness.h:308: warning: wrong kernel-doc =
identifier on line:
 * FIXTURE_VARIANT_ADD(fixture_name, variant_name) - Called once per fixture
tools/testing/selftests/kselftest_harness.h:342: warning: wrong kernel-doc =
identifier on line:
 * TEST_F(fixture_name, test_name) - Emits test registration and helpers for
include/linux/seqlock.h:829: warning: wrong kernel-doc identifier on line:
 * DEFINE_SEQLOCK(sl) - Define a statically allocated seqlock_t
tools/testing/selftests/kselftest_harness.h:82: warning: wrong kernel-doc i=
dentifier on line:
 * TH_LOG(fmt, ...)
tools/testing/selftests/kselftest_harness.h:116: warning: wrong kernel-doc =
identifier on line:
 * SKIP(statement, fmt, ...)
tools/testing/selftests/kselftest_harness.h:139: warning: wrong kernel-doc =
identifier on line:
 * TEST(test_name) - Defines the test function and creates the registration
tools/testing/selftests/kselftest_harness.h:158: warning: wrong kernel-doc =
identifier on line:
 * TEST_SIGNAL(test_name, signal)
tools/testing/selftests/kselftest_harness.h:198: warning: wrong kernel-doc =
identifier on line:
 * FIXTURE_DATA(datatype_name) - Wraps the struct name so we have one less
tools/testing/selftests/kselftest_harness.h:215: warning: wrong kernel-doc =
identifier on line:
 * FIXTURE(fixture_name) - Called once per fixture to setup the data and
tools/testing/selftests/kselftest_harness.h:242: warning: wrong kernel-doc =
identifier on line:
 * FIXTURE_SETUP(fixture_name) - Prepares the setup function for the fixtur=
e.
tools/testing/selftests/kselftest_harness.h:268: warning: wrong kernel-doc =
identifier on line:
 * FIXTURE_TEARDOWN(fixture_name)
tools/testing/selftests/kselftest_harness.h:289: warning: wrong kernel-doc =
identifier on line:
 * FIXTURE_VARIANT(fixture_name) - Optionally called once per fixture
tools/testing/selftests/kselftest_harness.h:308: warning: wrong kernel-doc =
identifier on line:
 * FIXTURE_VARIANT_ADD(fixture_name, variant_name) - Called once per fixture
tools/testing/selftests/kselftest_harness.h:342: warning: wrong kernel-doc =
identifier on line:
 * TEST_F(fixture_name, test_name) - Emits test registration and helpers for
tools/testing/selftests/kselftest_harness.h:82: warning: wrong kernel-doc i=
dentifier on line:
 * TH_LOG(fmt, ...)
tools/testing/selftests/kselftest_harness.h:116: warning: wrong kernel-doc =
identifier on line:
 * SKIP(statement, fmt, ...)
tools/testing/selftests/kselftest_harness.h:139: warning: wrong kernel-doc =
identifier on line:
 * TEST(test_name) - Defines the test function and creates the registration
tools/testing/selftests/kselftest_harness.h:158: warning: wrong kernel-doc =
identifier on line:
 * TEST_SIGNAL(test_name, signal)
tools/testing/selftests/kselftest_harness.h:198: warning: wrong kernel-doc =
identifier on line:
 * FIXTURE_DATA(datatype_name) - Wraps the struct name so we have one less
tools/testing/selftests/kselftest_harness.h:215: warning: wrong kernel-doc =
identifier on line:
 * FIXTURE(fixture_name) - Called once per fixture to setup the data and
tools/testing/selftests/kselftest_harness.h:242: warning: wrong kernel-doc =
identifier on line:
 * FIXTURE_SETUP(fixture_name) - Prepares the setup function for the fixtur=
e.
tools/testing/selftests/kselftest_harness.h:268: warning: wrong kernel-doc =
identifier on line:
 * FIXTURE_TEARDOWN(fixture_name)
tools/testing/selftests/kselftest_harness.h:289: warning: wrong kernel-doc =
identifier on line:
 * FIXTURE_VARIANT(fixture_name) - Optionally called once per fixture
tools/testing/selftests/kselftest_harness.h:308: warning: wrong kernel-doc =
identifier on line:
 * FIXTURE_VARIANT_ADD(fixture_name, variant_name) - Called once per fixture
tools/testing/selftests/kselftest_harness.h:342: warning: wrong kernel-doc =
identifier on line:
 * TEST_F(fixture_name, test_name) - Emits test registration and helpers for
tools/testing/selftests/kselftest_harness.h:82: warning: wrong kernel-doc i=
dentifier on line:
 * TH_LOG(fmt, ...)
tools/testing/selftests/kselftest_harness.h:116: warning: wrong kernel-doc =
identifier on line:
 * SKIP(statement, fmt, ...)
tools/testing/selftests/kselftest_harness.h:139: warning: wrong kernel-doc =
identifier on line:
 * TEST(test_name) - Defines the test function and creates the registration
tools/testing/selftests/kselftest_harness.h:158: warning: wrong kernel-doc =
identifier on line:
 * TEST_SIGNAL(test_name, signal)
tools/testing/selftests/kselftest_harness.h:198: warning: wrong kernel-doc =
identifier on line:
 * FIXTURE_DATA(datatype_name) - Wraps the struct name so we have one less
tools/testing/selftests/kselftest_harness.h:215: warning: wrong kernel-doc =
identifier on line:
 * FIXTURE(fixture_name) - Called once per fixture to setup the data and
tools/testing/selftests/kselftest_harness.h:242: warning: wrong kernel-doc =
identifier on line:
 * FIXTURE_SETUP(fixture_name) - Prepares the setup function for the fixtur=
e.
tools/testing/selftests/kselftest_harness.h:268: warning: wrong kernel-doc =
identifier on line:
 * FIXTURE_TEARDOWN(fixture_name)
tools/testing/selftests/kselftest_harness.h:289: warning: wrong kernel-doc =
identifier on line:
 * FIXTURE_VARIANT(fixture_name) - Optionally called once per fixture
tools/testing/selftests/kselftest_harness.h:308: warning: wrong kernel-doc =
identifier on line:
 * FIXTURE_VARIANT_ADD(fixture_name, variant_name) - Called once per fixture
tools/testing/selftests/kselftest_harness.h:342: warning: wrong kernel-doc =
identifier on line:
 * TEST_F(fixture_name, test_name) - Emits test registration and helpers for
fs/seq_file.c:672: warning: wrong kernel-doc identifier on line:
 * A helper routine for putting decimal numbers without rich format of prin=
tf().
lib/crc7.c:1: warning: no structured comments found

--=20
Cheers,
Stephen Rothwell

--Sig_/31zvJXxmV2vo8_toHVssu8S
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAGh0YACgkQAVBC80lX
0GzPNQf/TVUEWrvQ2jdOsXWCQEpJugIGET42R+MUtpJfjP2VGob1CxzpK+RjlOHk
xkOMYpZFxgaejTTovBddd0Stb/mK/+XMQepXLmAJZbIijCAu0cEQzNoLgdzq6v13
PodMnEUiovy5cPT6g9Qo47ppprHL/J4htx9Ib6D7oCHkbIoNFrBiY0CViiXC3CxJ
P4BBXaeVivpsDzWV/wQpfiOdx/rSew/XuP1hlDlnRp9R8ePmZ+yYvIQJ+gtRYvgu
UVHgBZCONPtZBn46qOW7yPVcVKXwWO/lKSWgpZQWDl8sK/Gyl+rl0gtfQ3qSTZae
u286lf+g2uyuM3p6GkVK2Zg+sqgQhw==
=Kof9
-----END PGP SIGNATURE-----

--Sig_/31zvJXxmV2vo8_toHVssu8S--
