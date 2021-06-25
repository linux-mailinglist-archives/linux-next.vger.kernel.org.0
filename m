Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 910863B4119
	for <lists+linux-next@lfdr.de>; Fri, 25 Jun 2021 12:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231139AbhFYKHn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 25 Jun 2021 06:07:43 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:35885 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230082AbhFYKHn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 25 Jun 2021 06:07:43 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GBCL91t4xz9sWw;
        Fri, 25 Jun 2021 20:05:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624615521;
        bh=a32Hta40b36XJ2G0RXr/aodzpv3RbFBTBavk+K8FXRs=;
        h=Date:From:To:Cc:Subject:From;
        b=VSCBa2sdHXRymz1jkZ6jQnkHnSBjG/Sbu+gYv2Ghi+wAOgfVjhu8O2cMaerZnK1l0
         /yXmuMEqiNO15cUiM9IsKrXW3sl4TXOBu6j9fWxeX0Im94PJzVS4wjXddjhyL0oX1W
         Ha+Ott4UigBKtllMTjJQq/Hb6Pu0OljiOWCiWFRyz21QDHt0TDAfo0e1q5s2TBflZf
         DsPV2LoF3pfrmW3z3ufC0qBYWN/7k1UL21/oTYKxLFXpBb3jT1cMgaP94hagWqE6K7
         ntFTg1w/7pB7SQ7G3lCgr0DJiStBACR+nBCeiwVefO/kizuJ74lASl2S4PiHll4VjQ
         UzmYq5h3EtKRw==
Date:   Fri, 25 Jun 2021 20:05:20 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Shuah Khan <skhan@linuxfoundation.org>,
        Brendan Higgins <brendanhiggins@google.com>
Cc:     David Gow <davidgow@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the kunit-fixes tree
Message-ID: <20210625200520.7e44f38e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HXgcK5qwpLsG7yyWUgFQbpW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/HXgcK5qwpLsG7yyWUgFQbpW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kunit-fixes tree, today's linux-next build (powerpc
allyesconfig) failed like this:

In file included from drivers/thunderbolt/test.c:9:
drivers/thunderbolt/test.c: In function 'tb_test_path_single_hop_walk':
drivers/thunderbolt/test.c:455:25: error: 'typeof' applied to a bit-field
  455 |   KUNIT_EXPECT_EQ(test, p->config.type, test_data[i].type);
      |                         ^
include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY=
_ASSERTION'
  804 |  typeof(left) __left =3D (left);            \
      |         ^~~~
include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_=
ASSERTION'
  918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MS=
G_ASSERTION'
  928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_A=
SSERTION'
 1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/thunderbolt/test.c:455:3: note: in expansion of macro 'KUNIT_EXPECT=
_EQ'
  455 |   KUNIT_EXPECT_EQ(test, p->config.type, test_data[i].type);
      |   ^~~~~~~~~~~~~~~
drivers/thunderbolt/test.c:466:25: error: 'typeof' applied to a bit-field
  466 |   KUNIT_EXPECT_EQ(test, p->config.type, test_data[i].type);
      |                         ^
include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY=
_ASSERTION'
  804 |  typeof(left) __left =3D (left);            \
      |         ^~~~
include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_=
ASSERTION'
  918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MS=
G_ASSERTION'
  928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_A=
SSERTION'
 1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/thunderbolt/test.c:466:3: note: in expansion of macro 'KUNIT_EXPECT=
_EQ'
  466 |   KUNIT_EXPECT_EQ(test, p->config.type, test_data[i].type);
      |   ^~~~~~~~~~~~~~~
drivers/thunderbolt/test.c: In function 'tb_test_path_daisy_chain_walk':
drivers/thunderbolt/test.c:512:25: error: 'typeof' applied to a bit-field
  512 |   KUNIT_EXPECT_EQ(test, p->config.type, test_data[i].type);
      |                         ^
include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY=
_ASSERTION'
  804 |  typeof(left) __left =3D (left);            \
      |         ^~~~
include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_=
ASSERTION'
  918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MS=
G_ASSERTION'
  928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_A=
SSERTION'
 1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/thunderbolt/test.c:512:3: note: in expansion of macro 'KUNIT_EXPECT=
_EQ'
  512 |   KUNIT_EXPECT_EQ(test, p->config.type, test_data[i].type);
      |   ^~~~~~~~~~~~~~~
drivers/thunderbolt/test.c:523:25: error: 'typeof' applied to a bit-field
  523 |   KUNIT_EXPECT_EQ(test, p->config.type, test_data[i].type);
      |                         ^
include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY=
_ASSERTION'
  804 |  typeof(left) __left =3D (left);            \
      |         ^~~~
include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_=
ASSERTION'
  918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MS=
G_ASSERTION'
  928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_A=
SSERTION'
 1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/thunderbolt/test.c:523:3: note: in expansion of macro 'KUNIT_EXPECT=
_EQ'
  523 |   KUNIT_EXPECT_EQ(test, p->config.type, test_data[i].type);
      |   ^~~~~~~~~~~~~~~
drivers/thunderbolt/test.c: In function 'tb_test_path_simple_tree_walk':
drivers/thunderbolt/test.c:573:25: error: 'typeof' applied to a bit-field
  573 |   KUNIT_EXPECT_EQ(test, p->config.type, test_data[i].type);
      |                         ^
include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY=
_ASSERTION'
  804 |  typeof(left) __left =3D (left);            \
      |         ^~~~
include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_=
ASSERTION'
  918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MS=
G_ASSERTION'
  928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_A=
SSERTION'
 1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/thunderbolt/test.c:573:3: note: in expansion of macro 'KUNIT_EXPECT=
_EQ'
  573 |   KUNIT_EXPECT_EQ(test, p->config.type, test_data[i].type);
      |   ^~~~~~~~~~~~~~~
drivers/thunderbolt/test.c:584:25: error: 'typeof' applied to a bit-field
  584 |   KUNIT_EXPECT_EQ(test, p->config.type, test_data[i].type);
      |                         ^
include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY=
_ASSERTION'
  804 |  typeof(left) __left =3D (left);            \
      |         ^~~~
include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_=
ASSERTION'
  918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MS=
G_ASSERTION'
  928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_A=
SSERTION'
 1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/thunderbolt/test.c:584:3: note: in expansion of macro 'KUNIT_EXPECT=
_EQ'
  584 |   KUNIT_EXPECT_EQ(test, p->config.type, test_data[i].type);
      |   ^~~~~~~~~~~~~~~
drivers/thunderbolt/test.c: In function 'tb_test_path_complex_tree_walk':
drivers/thunderbolt/test.c:655:25: error: 'typeof' applied to a bit-field
  655 |   KUNIT_EXPECT_EQ(test, p->config.type, test_data[i].type);
      |                         ^
include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY=
_ASSERTION'
  804 |  typeof(left) __left =3D (left);            \
      |         ^~~~
include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_=
ASSERTION'
  918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MS=
G_ASSERTION'
  928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_A=
SSERTION'
 1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/thunderbolt/test.c:655:3: note: in expansion of macro 'KUNIT_EXPECT=
_EQ'
  655 |   KUNIT_EXPECT_EQ(test, p->config.type, test_data[i].type);
      |   ^~~~~~~~~~~~~~~
drivers/thunderbolt/test.c:666:25: error: 'typeof' applied to a bit-field
  666 |   KUNIT_EXPECT_EQ(test, p->config.type, test_data[i].type);
      |                         ^
include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY=
_ASSERTION'
  804 |  typeof(left) __left =3D (left);            \
      |         ^~~~
include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_=
ASSERTION'
  918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MS=
G_ASSERTION'
  928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_A=
SSERTION'
 1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/thunderbolt/test.c:666:3: note: in expansion of macro 'KUNIT_EXPECT=
_EQ'
  666 |   KUNIT_EXPECT_EQ(test, p->config.type, test_data[i].type);
      |   ^~~~~~~~~~~~~~~
drivers/thunderbolt/test.c: In function 'tb_test_path_max_length_walk':
drivers/thunderbolt/test.c:756:25: error: 'typeof' applied to a bit-field
  756 |   KUNIT_EXPECT_EQ(test, p->config.type, test_data[i].type);
      |                         ^
include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY=
_ASSERTION'
  804 |  typeof(left) __left =3D (left);            \
      |         ^~~~
include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_=
ASSERTION'
  918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MS=
G_ASSERTION'
  928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_A=
SSERTION'
 1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/thunderbolt/test.c:756:3: note: in expansion of macro 'KUNIT_EXPECT=
_EQ'
  756 |   KUNIT_EXPECT_EQ(test, p->config.type, test_data[i].type);
      |   ^~~~~~~~~~~~~~~
drivers/thunderbolt/test.c:767:25: error: 'typeof' applied to a bit-field
  767 |   KUNIT_EXPECT_EQ(test, p->config.type, test_data[i].type);
      |                         ^
include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY=
_ASSERTION'
  804 |  typeof(left) __left =3D (left);            \
      |         ^~~~
include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_=
ASSERTION'
  918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MS=
G_ASSERTION'
  928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_A=
SSERTION'
 1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/thunderbolt/test.c:767:3: note: in expansion of macro 'KUNIT_EXPECT=
_EQ'
  767 |   KUNIT_EXPECT_EQ(test, p->config.type, test_data[i].type);
      |   ^~~~~~~~~~~~~~~
drivers/thunderbolt/test.c: In function 'tb_test_path_not_bonded_lane0':
drivers/thunderbolt/test.c:850:25: error: 'typeof' applied to a bit-field
  850 |   KUNIT_EXPECT_EQ(test, in_port->config.type, test_data[i].in_type);
      |                         ^~~~~~~
include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY=
_ASSERTION'
  804 |  typeof(left) __left =3D (left);            \
      |         ^~~~
include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_=
ASSERTION'
  918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MS=
G_ASSERTION'
  928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_A=
SSERTION'
 1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/thunderbolt/test.c:850:3: note: in expansion of macro 'KUNIT_EXPECT=
_EQ'
  850 |   KUNIT_EXPECT_EQ(test, in_port->config.type, test_data[i].in_type);
      |   ^~~~~~~~~~~~~~~
drivers/thunderbolt/test.c:853:25: error: 'typeof' applied to a bit-field
  853 |   KUNIT_EXPECT_EQ(test, out_port->config.type, test_data[i].out_typ=
e);
      |                         ^~~~~~~~
include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY=
_ASSERTION'
  804 |  typeof(left) __left =3D (left);            \
      |         ^~~~
include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_=
ASSERTION'
  918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MS=
G_ASSERTION'
  928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_A=
SSERTION'
 1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/thunderbolt/test.c:853:3: note: in expansion of macro 'KUNIT_EXPECT=
_EQ'
  853 |   KUNIT_EXPECT_EQ(test, out_port->config.type, test_data[i].out_typ=
e);
      |   ^~~~~~~~~~~~~~~
drivers/thunderbolt/test.c: In function 'tb_test_path_not_bonded_lane1':
drivers/thunderbolt/test.c:910:25: error: 'typeof' applied to a bit-field
  910 |   KUNIT_EXPECT_EQ(test, in_port->config.type, test_data[i].in_type);
      |                         ^~~~~~~
include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY=
_ASSERTION'
  804 |  typeof(left) __left =3D (left);            \
      |         ^~~~
include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_=
ASSERTION'
  918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MS=
G_ASSERTION'
  928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_A=
SSERTION'
 1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/thunderbolt/test.c:910:3: note: in expansion of macro 'KUNIT_EXPECT=
_EQ'
  910 |   KUNIT_EXPECT_EQ(test, in_port->config.type, test_data[i].in_type);
      |   ^~~~~~~~~~~~~~~
drivers/thunderbolt/test.c:913:25: error: 'typeof' applied to a bit-field
  913 |   KUNIT_EXPECT_EQ(test, out_port->config.type, test_data[i].out_typ=
e);
      |                         ^~~~~~~~
include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY=
_ASSERTION'
  804 |  typeof(left) __left =3D (left);            \
      |         ^~~~
include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_=
ASSERTION'
  918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MS=
G_ASSERTION'
  928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_A=
SSERTION'
 1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/thunderbolt/test.c:913:3: note: in expansion of macro 'KUNIT_EXPECT=
_EQ'
  913 |   KUNIT_EXPECT_EQ(test, out_port->config.type, test_data[i].out_typ=
e);
      |   ^~~~~~~~~~~~~~~
drivers/thunderbolt/test.c: In function 'tb_test_path_not_bonded_lane1_chai=
n':
drivers/thunderbolt/test.c:988:25: error: 'typeof' applied to a bit-field
  988 |   KUNIT_EXPECT_EQ(test, in_port->config.type, test_data[i].in_type);
      |                         ^~~~~~~
include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY=
_ASSERTION'
  804 |  typeof(left) __left =3D (left);            \
      |         ^~~~
include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_=
ASSERTION'
  918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MS=
G_ASSERTION'
  928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_A=
SSERTION'
 1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/thunderbolt/test.c:988:3: note: in expansion of macro 'KUNIT_EXPECT=
_EQ'
  988 |   KUNIT_EXPECT_EQ(test, in_port->config.type, test_data[i].in_type);
      |   ^~~~~~~~~~~~~~~
drivers/thunderbolt/test.c:991:25: error: 'typeof' applied to a bit-field
  991 |   KUNIT_EXPECT_EQ(test, out_port->config.type, test_data[i].out_typ=
e);
      |                         ^~~~~~~~
include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY=
_ASSERTION'
  804 |  typeof(left) __left =3D (left);            \
      |         ^~~~
include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_=
ASSERTION'
  918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MS=
G_ASSERTION'
  928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_A=
SSERTION'
 1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/thunderbolt/test.c:991:3: note: in expansion of macro 'KUNIT_EXPECT=
_EQ'
  991 |   KUNIT_EXPECT_EQ(test, out_port->config.type, test_data[i].out_typ=
e);
      |   ^~~~~~~~~~~~~~~
drivers/thunderbolt/test.c: In function 'tb_test_path_not_bonded_lane1_chai=
n_reverse':
drivers/thunderbolt/test.c:1066:25: error: 'typeof' applied to a bit-field
 1066 |   KUNIT_EXPECT_EQ(test, in_port->config.type, test_data[i].in_type);
      |                         ^~~~~~~
include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY=
_ASSERTION'
  804 |  typeof(left) __left =3D (left);            \
      |         ^~~~
include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_=
ASSERTION'
  918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MS=
G_ASSERTION'
  928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_A=
SSERTION'
 1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/thunderbolt/test.c:1066:3: note: in expansion of macro 'KUNIT_EXPEC=
T_EQ'
 1066 |   KUNIT_EXPECT_EQ(test, in_port->config.type, test_data[i].in_type);
      |   ^~~~~~~~~~~~~~~
drivers/thunderbolt/test.c:1069:25: error: 'typeof' applied to a bit-field
 1069 |   KUNIT_EXPECT_EQ(test, out_port->config.type, test_data[i].out_typ=
e);
      |                         ^~~~~~~~
include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY=
_ASSERTION'
  804 |  typeof(left) __left =3D (left);            \
      |         ^~~~
include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_=
ASSERTION'
  918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MS=
G_ASSERTION'
  928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_A=
SSERTION'
 1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/thunderbolt/test.c:1069:3: note: in expansion of macro 'KUNIT_EXPEC=
T_EQ'
 1069 |   KUNIT_EXPECT_EQ(test, out_port->config.type, test_data[i].out_typ=
e);
      |   ^~~~~~~~~~~~~~~
drivers/thunderbolt/test.c: In function 'tb_test_path_mixed_chain':
drivers/thunderbolt/test.c:1156:25: error: 'typeof' applied to a bit-field
 1156 |   KUNIT_EXPECT_EQ(test, in_port->config.type, test_data[i].in_type);
      |                         ^~~~~~~
include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY=
_ASSERTION'
  804 |  typeof(left) __left =3D (left);            \
      |         ^~~~
include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_=
ASSERTION'
  918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MS=
G_ASSERTION'
  928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_A=
SSERTION'
 1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/thunderbolt/test.c:1156:3: note: in expansion of macro 'KUNIT_EXPEC=
T_EQ'
 1156 |   KUNIT_EXPECT_EQ(test, in_port->config.type, test_data[i].in_type);
      |   ^~~~~~~~~~~~~~~
drivers/thunderbolt/test.c:1159:25: error: 'typeof' applied to a bit-field
 1159 |   KUNIT_EXPECT_EQ(test, out_port->config.type, test_data[i].out_typ=
e);
      |                         ^~~~~~~~
include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY=
_ASSERTION'
  804 |  typeof(left) __left =3D (left);            \
      |         ^~~~
include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_=
ASSERTION'
  918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MS=
G_ASSERTION'
  928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_A=
SSERTION'
 1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/thunderbolt/test.c:1159:3: note: in expansion of macro 'KUNIT_EXPEC=
T_EQ'
 1159 |   KUNIT_EXPECT_EQ(test, out_port->config.type, test_data[i].out_typ=
e);
      |   ^~~~~~~~~~~~~~~
drivers/thunderbolt/test.c: In function 'tb_test_path_mixed_chain_reverse':
drivers/thunderbolt/test.c:1246:25: error: 'typeof' applied to a bit-field
 1246 |   KUNIT_EXPECT_EQ(test, in_port->config.type, test_data[i].in_type);
      |                         ^~~~~~~
include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY=
_ASSERTION'
  804 |  typeof(left) __left =3D (left);            \
      |         ^~~~
include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_=
ASSERTION'
  918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MS=
G_ASSERTION'
  928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_A=
SSERTION'
 1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/thunderbolt/test.c:1246:3: note: in expansion of macro 'KUNIT_EXPEC=
T_EQ'
 1246 |   KUNIT_EXPECT_EQ(test, in_port->config.type, test_data[i].in_type);
      |   ^~~~~~~~~~~~~~~
drivers/thunderbolt/test.c:1249:25: error: 'typeof' applied to a bit-field
 1249 |   KUNIT_EXPECT_EQ(test, out_port->config.type, test_data[i].out_typ=
e);
      |                         ^~~~~~~~
include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY=
_ASSERTION'
  804 |  typeof(left) __left =3D (left);            \
      |         ^~~~
include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_=
ASSERTION'
  918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MS=
G_ASSERTION'
  928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_A=
SSERTION'
 1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/thunderbolt/test.c:1249:3: note: in expansion of macro 'KUNIT_EXPEC=
T_EQ'
 1249 |   KUNIT_EXPECT_EQ(test, out_port->config.type, test_data[i].out_typ=
e);
      |   ^~~~~~~~~~~~~~~

Caused by commit

  8f0877c26e4b ("thunderbolt: test: Remove some casts which are no longer r=
equired")

--=20
Cheers,
Stephen Rothwell

--Sig_/HXgcK5qwpLsG7yyWUgFQbpW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDVqmAACgkQAVBC80lX
0GwgKgf8Co1BajrWFo5xzMFGpwgRHOX8I2V5mAKFXkW3k3eb2N9/xxlaNcy0WXZn
RYQ5ccS/n7T+A06bGQk1DQ6dqKAm3h4dieLQvYx02l9IAevewiV8rLG2LboQ0+lb
EjpHkFX2B2ewpYRS+VjoE0e3Y1jnAGbr5pVsorhsW4CpQop2awGPweM+D+6e/v2Y
6DnCK6AtuP08OekKkgwSfWtJC4upgNEmJqD+f9PxsVi/JJ3h614FJuVdRYaMJBoU
VTu14/RmP2LDr2Z8psLjll4+rfMdF9EWQRIi7meM98HQDtpRBJc2moc2W0enSUWu
z/kDTbK7TJnb1fwTJanXtqU9aUAcVQ==
=gQn+
-----END PGP SIGNATURE-----

--Sig_/HXgcK5qwpLsG7yyWUgFQbpW--
