Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9541231777
	for <lists+linux-next@lfdr.de>; Wed, 29 Jul 2020 03:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730631AbgG2B4u (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Jul 2020 21:56:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730328AbgG2B4u (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 28 Jul 2020 21:56:50 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12296C061794;
        Tue, 28 Jul 2020 18:56:50 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BGc9D35WTz9sSy;
        Wed, 29 Jul 2020 11:56:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595987808;
        bh=6O0uzyfc3uiPTTiR9UpsYgIH56RYos6QRR4MAVcQikA=;
        h=Date:From:To:Cc:Subject:From;
        b=ir7mhZsoMKW0G8nw3S0vK6JTE0R13FwVVAZDxrjEKivdZ7eJuGj96sT7HfUD5jY0r
         fziPolLQvQqqxnyJqaa5FRbTnnCyWG3ylu/agBQdQdnMRPbQhePivqifOk7EaAZHf/
         C41KuYb+QKZtctMzoVuqwj6kJ0B99q3lbciOwZFyaZ/onuN50/4fWq863H0O6HoPtH
         TwzjAvI2o4Mxli51TR2pdhK/RE+EY1aInNuCdIUOcN+AJmF2XXGne+WnoRzL+6AjY9
         EhUcnQPkoQNXDAAJHp8zf7kBcha7K5rDxnQDkRhYfc4k9gg7FmpGdMc8bRRorAqbcx
         cVKX1ozEaOF2w==
Date:   Wed, 29 Jul 2020 11:56:45 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>
Subject: linux-next: build failure after merge of the vfs tree
Message-ID: <20200729115645.3fe3beec@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ExN=r8j4_P/Kc+HG1hQ.HyR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ExN=r8j4_P/Kc+HG1hQ.HyR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

In file included from <command-line>:
In function 'signal_compat_build_tests',
    inlined from 'sigaction_compat_abi' at arch/x86/kernel/signal_compat.c:=
166:2:
include/linux/compiler_types.h:313:38: error: call to '__compiletime_assert=
_980' declared with attribute error: BUILD_BUG_ON failed: sizeof(compat_sig=
info_t) !=3D 128
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |                                      ^
include/linux/compiler_types.h:294:4: note: in definition of macro '__compi=
letime_assert'
  294 |    prefix ## suffix();    \
      |    ^~~~~~
include/linux/compiler_types.h:313:2: note: in expansion of macro '_compile=
time_assert'
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |  ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_a=
ssert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_M=
SG'
   50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
      |  ^~~~~~~~~~~~~~~~
arch/x86/kernel/signal_compat.c:37:2: note: in expansion of macro 'BUILD_BU=
G_ON'
   37 |  BUILD_BUG_ON(sizeof(compat_siginfo_t) !=3D 128);
      |  ^~~~~~~~~~~~
include/linux/compiler_types.h:313:38: error: call to '__compiletime_assert=
_981' declared with attribute error: BUILD_BUG_ON failed: offsetof(compat_s=
iginfo_t, _sifields) !=3D 3 * sizeof(int)
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |                                      ^
include/linux/compiler_types.h:294:4: note: in definition of macro '__compi=
letime_assert'
  294 |    prefix ## suffix();    \
      |    ^~~~~~
include/linux/compiler_types.h:313:2: note: in expansion of macro '_compile=
time_assert'
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |  ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_a=
ssert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_M=
SG'
   50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
      |  ^~~~~~~~~~~~~~~~
arch/x86/kernel/signal_compat.c:43:2: note: in expansion of macro 'BUILD_BU=
G_ON'
   43 |  BUILD_BUG_ON(offsetof(compat_siginfo_t, _sifields) !=3D 3 * sizeof=
(int));
      |  ^~~~~~~~~~~~
include/linux/compiler_types.h:313:38: error: call to '__compiletime_assert=
_993' declared with attribute error: BUILD_BUG_ON failed: offsetof(compat_s=
iginfo_t, si_pid) !=3D 0xC
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |                                      ^
include/linux/compiler_types.h:294:4: note: in definition of macro '__compi=
letime_assert'
  294 |    prefix ## suffix();    \
      |    ^~~~~~
include/linux/compiler_types.h:313:2: note: in expansion of macro '_compile=
time_assert'
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |  ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_a=
ssert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_M=
SG'
   50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
      |  ^~~~~~~~~~~~~~~~
arch/x86/kernel/signal_compat.c:75:2: note: in expansion of macro 'BUILD_BU=
G_ON'
   75 |  BUILD_BUG_ON(offsetof(compat_siginfo_t, si_pid) !=3D 0xC);
      |  ^~~~~~~~~~~~
include/linux/compiler_types.h:313:38: error: call to '__compiletime_assert=
_994' declared with attribute error: BUILD_BUG_ON failed: offsetof(compat_s=
iginfo_t, si_uid) !=3D 0x10
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |                                      ^
include/linux/compiler_types.h:294:4: note: in definition of macro '__compi=
letime_assert'
  294 |    prefix ## suffix();    \
      |    ^~~~~~
include/linux/compiler_types.h:313:2: note: in expansion of macro '_compile=
time_assert'
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |  ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_a=
ssert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_M=
SG'
   50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
      |  ^~~~~~~~~~~~~~~~
arch/x86/kernel/signal_compat.c:76:2: note: in expansion of macro 'BUILD_BU=
G_ON'
   76 |  BUILD_BUG_ON(offsetof(compat_siginfo_t, si_uid) !=3D 0x10);
      |  ^~~~~~~~~~~~
include/linux/compiler_types.h:313:38: error: call to '__compiletime_assert=
_1001' declared with attribute error: BUILD_BUG_ON failed: offsetof(compat_=
siginfo_t, si_tid) !=3D 0x0C
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |                                      ^
include/linux/compiler_types.h:294:4: note: in definition of macro '__compi=
letime_assert'
  294 |    prefix ## suffix();    \
      |    ^~~~~~
include/linux/compiler_types.h:313:2: note: in expansion of macro '_compile=
time_assert'
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |  ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_a=
ssert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_M=
SG'
   50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
      |  ^~~~~~~~~~~~~~~~
arch/x86/kernel/signal_compat.c:85:2: note: in expansion of macro 'BUILD_BU=
G_ON'
   85 |  BUILD_BUG_ON(offsetof(compat_siginfo_t, si_tid)     !=3D 0x0C);
      |  ^~~~~~~~~~~~
include/linux/compiler_types.h:313:38: error: call to '__compiletime_assert=
_1002' declared with attribute error: BUILD_BUG_ON failed: offsetof(compat_=
siginfo_t, si_overrun) !=3D 0x10
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |                                      ^
include/linux/compiler_types.h:294:4: note: in definition of macro '__compi=
letime_assert'
  294 |    prefix ## suffix();    \
      |    ^~~~~~
include/linux/compiler_types.h:313:2: note: in expansion of macro '_compile=
time_assert'
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |  ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_a=
ssert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_M=
SG'
   50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
      |  ^~~~~~~~~~~~~~~~
arch/x86/kernel/signal_compat.c:86:2: note: in expansion of macro 'BUILD_BU=
G_ON'
   86 |  BUILD_BUG_ON(offsetof(compat_siginfo_t, si_overrun) !=3D 0x10);
      |  ^~~~~~~~~~~~
include/linux/compiler_types.h:313:38: error: call to '__compiletime_assert=
_1003' declared with attribute error: BUILD_BUG_ON failed: offsetof(compat_=
siginfo_t, si_value) !=3D 0x14
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |                                      ^
include/linux/compiler_types.h:294:4: note: in definition of macro '__compi=
letime_assert'
  294 |    prefix ## suffix();    \
      |    ^~~~~~
include/linux/compiler_types.h:313:2: note: in expansion of macro '_compile=
time_assert'
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |  ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_a=
ssert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_M=
SG'
   50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
      |  ^~~~~~~~~~~~~~~~
arch/x86/kernel/signal_compat.c:87:2: note: in expansion of macro 'BUILD_BU=
G_ON'
   87 |  BUILD_BUG_ON(offsetof(compat_siginfo_t, si_value)   !=3D 0x14);
      |  ^~~~~~~~~~~~
include/linux/compiler_types.h:313:38: error: call to '__compiletime_assert=
_1010' declared with attribute error: BUILD_BUG_ON failed: offsetof(compat_=
siginfo_t, si_pid) !=3D 0x0C
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |                                      ^
include/linux/compiler_types.h:294:4: note: in definition of macro '__compi=
letime_assert'
  294 |    prefix ## suffix();    \
      |    ^~~~~~
include/linux/compiler_types.h:313:2: note: in expansion of macro '_compile=
time_assert'
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |  ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_a=
ssert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_M=
SG'
   50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
      |  ^~~~~~~~~~~~~~~~
arch/x86/kernel/signal_compat.c:96:2: note: in expansion of macro 'BUILD_BU=
G_ON'
   96 |  BUILD_BUG_ON(offsetof(compat_siginfo_t, si_pid)   !=3D 0x0C);
      |  ^~~~~~~~~~~~
include/linux/compiler_types.h:313:38: error: call to '__compiletime_assert=
_1011' declared with attribute error: BUILD_BUG_ON failed: offsetof(compat_=
siginfo_t, si_uid) !=3D 0x10
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |                                      ^
include/linux/compiler_types.h:294:4: note: in definition of macro '__compi=
letime_assert'
  294 |    prefix ## suffix();    \
      |    ^~~~~~
include/linux/compiler_types.h:313:2: note: in expansion of macro '_compile=
time_assert'
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |  ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_a=
ssert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_M=
SG'
   50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
      |  ^~~~~~~~~~~~~~~~
arch/x86/kernel/signal_compat.c:97:2: note: in expansion of macro 'BUILD_BU=
G_ON'
   97 |  BUILD_BUG_ON(offsetof(compat_siginfo_t, si_uid)   !=3D 0x10);
      |  ^~~~~~~~~~~~
include/linux/compiler_types.h:313:38: error: call to '__compiletime_assert=
_1012' declared with attribute error: BUILD_BUG_ON failed: offsetof(compat_=
siginfo_t, si_value) !=3D 0x14
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |                                      ^
include/linux/compiler_types.h:294:4: note: in definition of macro '__compi=
letime_assert'
  294 |    prefix ## suffix();    \
      |    ^~~~~~
include/linux/compiler_types.h:313:2: note: in expansion of macro '_compile=
time_assert'
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |  ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_a=
ssert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_M=
SG'
   50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
      |  ^~~~~~~~~~~~~~~~
arch/x86/kernel/signal_compat.c:98:2: note: in expansion of macro 'BUILD_BU=
G_ON'
   98 |  BUILD_BUG_ON(offsetof(compat_siginfo_t, si_value) !=3D 0x14);
      |  ^~~~~~~~~~~~
include/linux/compiler_types.h:313:38: error: call to '__compiletime_assert=
_1021' declared with attribute error: BUILD_BUG_ON failed: offsetof(compat_=
siginfo_t, si_pid) !=3D 0x0C
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |                                      ^
include/linux/compiler_types.h:294:4: note: in definition of macro '__compi=
letime_assert'
  294 |    prefix ## suffix();    \
      |    ^~~~~~
include/linux/compiler_types.h:313:2: note: in expansion of macro '_compile=
time_assert'
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |  ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_a=
ssert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_M=
SG'
   50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
      |  ^~~~~~~~~~~~~~~~
arch/x86/kernel/signal_compat.c:109:2: note: in expansion of macro 'BUILD_B=
UG_ON'
  109 |  BUILD_BUG_ON(offsetof(compat_siginfo_t, si_pid)    !=3D 0x0C);
      |  ^~~~~~~~~~~~
include/linux/compiler_types.h:313:38: error: call to '__compiletime_assert=
_1022' declared with attribute error: BUILD_BUG_ON failed: offsetof(compat_=
siginfo_t, si_uid) !=3D 0x10
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |                                      ^
include/linux/compiler_types.h:294:4: note: in definition of macro '__compi=
letime_assert'
  294 |    prefix ## suffix();    \
      |    ^~~~~~
include/linux/compiler_types.h:313:2: note: in expansion of macro '_compile=
time_assert'
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |  ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_a=
ssert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_M=
SG'
   50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
      |  ^~~~~~~~~~~~~~~~
arch/x86/kernel/signal_compat.c:110:2: note: in expansion of macro 'BUILD_B=
UG_ON'
  110 |  BUILD_BUG_ON(offsetof(compat_siginfo_t, si_uid)    !=3D 0x10);
      |  ^~~~~~~~~~~~
include/linux/compiler_types.h:313:38: error: call to '__compiletime_assert=
_1023' declared with attribute error: BUILD_BUG_ON failed: offsetof(compat_=
siginfo_t, si_status) !=3D 0x14
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |                                      ^
include/linux/compiler_types.h:294:4: note: in definition of macro '__compi=
letime_assert'
  294 |    prefix ## suffix();    \
      |    ^~~~~~
include/linux/compiler_types.h:313:2: note: in expansion of macro '_compile=
time_assert'
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |  ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_a=
ssert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_M=
SG'
   50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
      |  ^~~~~~~~~~~~~~~~
arch/x86/kernel/signal_compat.c:111:2: note: in expansion of macro 'BUILD_B=
UG_ON'
  111 |  BUILD_BUG_ON(offsetof(compat_siginfo_t, si_status) !=3D 0x14);
      |  ^~~~~~~~~~~~
include/linux/compiler_types.h:313:38: error: call to '__compiletime_assert=
_1024' declared with attribute error: BUILD_BUG_ON failed: offsetof(compat_=
siginfo_t, si_utime) !=3D 0x18
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |                                      ^
include/linux/compiler_types.h:294:4: note: in definition of macro '__compi=
letime_assert'
  294 |    prefix ## suffix();    \
      |    ^~~~~~
include/linux/compiler_types.h:313:2: note: in expansion of macro '_compile=
time_assert'
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |  ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_a=
ssert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_M=
SG'
   50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
      |  ^~~~~~~~~~~~~~~~
arch/x86/kernel/signal_compat.c:112:2: note: in expansion of macro 'BUILD_B=
UG_ON'
  112 |  BUILD_BUG_ON(offsetof(compat_siginfo_t, si_utime)  !=3D 0x18);
      |  ^~~~~~~~~~~~
include/linux/compiler_types.h:313:38: error: call to '__compiletime_assert=
_1025' declared with attribute error: BUILD_BUG_ON failed: offsetof(compat_=
siginfo_t, si_stime) !=3D 0x1C
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |                                      ^
include/linux/compiler_types.h:294:4: note: in definition of macro '__compi=
letime_assert'
  294 |    prefix ## suffix();    \
      |    ^~~~~~
include/linux/compiler_types.h:313:2: note: in expansion of macro '_compile=
time_assert'
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |  ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_a=
ssert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_M=
SG'
   50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
      |  ^~~~~~~~~~~~~~~~
arch/x86/kernel/signal_compat.c:113:2: note: in expansion of macro 'BUILD_B=
UG_ON'
  113 |  BUILD_BUG_ON(offsetof(compat_siginfo_t, si_stime)  !=3D 0x1C);
      |  ^~~~~~~~~~~~
include/linux/compiler_types.h:313:38: error: call to '__compiletime_assert=
_1027' declared with attribute error: BUILD_BUG_ON failed: 7*sizeof(int) !=
=3D sizeof(((compat_siginfo_t *)0)->_sifields._sigchld_x32)
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |                                      ^
include/linux/compiler_types.h:294:4: note: in definition of macro '__compi=
letime_assert'
  294 |    prefix ## suffix();    \
      |    ^~~~~~
include/linux/compiler_types.h:313:2: note: in expansion of macro '_compile=
time_assert'
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |  ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_a=
ssert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_M=
SG'
   50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
      |  ^~~~~~~~~~~~~~~~
arch/x86/kernel/signal_compat.c:66:36: note: in expansion of macro 'BUILD_B=
UG_ON'
   66 | #define CHECK_CSI_SIZE(name, size) BUILD_BUG_ON(size !=3D sizeof(((=
compat_siginfo_t *)0)->_sifields.name))
      |                                    ^~~~~~~~~~~~
arch/x86/kernel/signal_compat.c:117:2: note: in expansion of macro 'CHECK_C=
SI_SIZE'
  117 |  CHECK_CSI_SIZE  (_sigchld_x32, 7*sizeof(int));
      |  ^~~~~~~~~~~~~~
include/linux/compiler_types.h:313:38: error: call to '__compiletime_assert=
_1028' declared with attribute error: BUILD_BUG_ON failed: offsetof(compat_=
siginfo_t, _sifields._sigchld_x32._utime) !=3D 0x18
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |                                      ^
include/linux/compiler_types.h:294:4: note: in definition of macro '__compi=
letime_assert'
  294 |    prefix ## suffix();    \
      |    ^~~~~~
include/linux/compiler_types.h:313:2: note: in expansion of macro '_compile=
time_assert'
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |  ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_a=
ssert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_M=
SG'
   50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
      |  ^~~~~~~~~~~~~~~~
arch/x86/kernel/signal_compat.c:119:2: note: in expansion of macro 'BUILD_B=
UG_ON'
  119 |  BUILD_BUG_ON(offsetof(compat_siginfo_t, _sifields._sigchld_x32._ut=
ime)  !=3D 0x18);
      |  ^~~~~~~~~~~~
include/linux/compiler_types.h:313:38: error: call to '__compiletime_assert=
_1029' declared with attribute error: BUILD_BUG_ON failed: offsetof(compat_=
siginfo_t, _sifields._sigchld_x32._stime) !=3D 0x20
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |                                      ^
include/linux/compiler_types.h:294:4: note: in definition of macro '__compi=
letime_assert'
  294 |    prefix ## suffix();    \
      |    ^~~~~~
include/linux/compiler_types.h:313:2: note: in expansion of macro '_compile=
time_assert'
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |  ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_a=
ssert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_M=
SG'
   50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
      |  ^~~~~~~~~~~~~~~~
arch/x86/kernel/signal_compat.c:120:2: note: in expansion of macro 'BUILD_B=
UG_ON'
  120 |  BUILD_BUG_ON(offsetof(compat_siginfo_t, _sifields._sigchld_x32._st=
ime)  !=3D 0x20);
      |  ^~~~~~~~~~~~
include/linux/compiler_types.h:313:38: error: call to '__compiletime_assert=
_1034' declared with attribute error: BUILD_BUG_ON failed: offsetof(compat_=
siginfo_t, si_addr) !=3D 0x0C
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |                                      ^
include/linux/compiler_types.h:294:4: note: in definition of macro '__compi=
letime_assert'
  294 |    prefix ## suffix();    \
      |    ^~~~~~
include/linux/compiler_types.h:313:2: note: in expansion of macro '_compile=
time_assert'
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |  ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_a=
ssert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_M=
SG'
   50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
      |  ^~~~~~~~~~~~~~~~
arch/x86/kernel/signal_compat.c:128:2: note: in expansion of macro 'BUILD_B=
UG_ON'
  128 |  BUILD_BUG_ON(offsetof(compat_siginfo_t, si_addr) !=3D 0x0C);
      |  ^~~~~~~~~~~~
include/linux/compiler_types.h:313:38: error: call to '__compiletime_assert=
_1036' declared with attribute error: BUILD_BUG_ON failed: offsetof(compat_=
siginfo_t, si_addr_lsb) !=3D 0x10
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |                                      ^
include/linux/compiler_types.h:294:4: note: in definition of macro '__compi=
letime_assert'
  294 |    prefix ## suffix();    \
      |    ^~~~~~
include/linux/compiler_types.h:313:2: note: in expansion of macro '_compile=
time_assert'
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |  ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_a=
ssert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_M=
SG'
   50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
      |  ^~~~~~~~~~~~~~~~
arch/x86/kernel/signal_compat.c:131:2: note: in expansion of macro 'BUILD_B=
UG_ON'
  131 |  BUILD_BUG_ON(offsetof(compat_siginfo_t, si_addr_lsb) !=3D 0x10);
      |  ^~~~~~~~~~~~
include/linux/compiler_types.h:313:38: error: call to '__compiletime_assert=
_1039' declared with attribute error: BUILD_BUG_ON failed: offsetof(compat_=
siginfo_t, si_lower) !=3D 0x14
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |                                      ^
include/linux/compiler_types.h:294:4: note: in definition of macro '__compi=
letime_assert'
  294 |    prefix ## suffix();    \
      |    ^~~~~~
include/linux/compiler_types.h:313:2: note: in expansion of macro '_compile=
time_assert'
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |  ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_a=
ssert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_M=
SG'
   50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
      |  ^~~~~~~~~~~~~~~~
arch/x86/kernel/signal_compat.c:135:2: note: in expansion of macro 'BUILD_B=
UG_ON'
  135 |  BUILD_BUG_ON(offsetof(compat_siginfo_t, si_lower) !=3D 0x14);
      |  ^~~~~~~~~~~~
include/linux/compiler_types.h:313:38: error: call to '__compiletime_assert=
_1040' declared with attribute error: BUILD_BUG_ON failed: offsetof(compat_=
siginfo_t, si_upper) !=3D 0x18
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |                                      ^
include/linux/compiler_types.h:294:4: note: in definition of macro '__compi=
letime_assert'
  294 |    prefix ## suffix();    \
      |    ^~~~~~
include/linux/compiler_types.h:313:2: note: in expansion of macro '_compile=
time_assert'
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |  ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_a=
ssert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_M=
SG'
   50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
      |  ^~~~~~~~~~~~~~~~
arch/x86/kernel/signal_compat.c:136:2: note: in expansion of macro 'BUILD_B=
UG_ON'
  136 |  BUILD_BUG_ON(offsetof(compat_siginfo_t, si_upper) !=3D 0x18);
      |  ^~~~~~~~~~~~
include/linux/compiler_types.h:313:38: error: call to '__compiletime_assert=
_1042' declared with attribute error: BUILD_BUG_ON failed: offsetof(compat_=
siginfo_t, si_pkey) !=3D 0x14
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |                                      ^
include/linux/compiler_types.h:294:4: note: in definition of macro '__compi=
letime_assert'
  294 |    prefix ## suffix();    \
      |    ^~~~~~
include/linux/compiler_types.h:313:2: note: in expansion of macro '_compile=
time_assert'
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |  ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_a=
ssert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_M=
SG'
   50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
      |  ^~~~~~~~~~~~~~~~
arch/x86/kernel/signal_compat.c:139:2: note: in expansion of macro 'BUILD_B=
UG_ON'
  139 |  BUILD_BUG_ON(offsetof(compat_siginfo_t, si_pkey) !=3D 0x14);
      |  ^~~~~~~~~~~~
include/linux/compiler_types.h:313:38: error: call to '__compiletime_assert=
_1048' declared with attribute error: BUILD_BUG_ON failed: offsetof(compat_=
siginfo_t, si_band) !=3D 0x0C
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |                                      ^
include/linux/compiler_types.h:294:4: note: in definition of macro '__compi=
letime_assert'
  294 |    prefix ## suffix();    \
      |    ^~~~~~
include/linux/compiler_types.h:313:2: note: in expansion of macro '_compile=
time_assert'
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |  ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_a=
ssert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_M=
SG'
   50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
      |  ^~~~~~~~~~~~~~~~
arch/x86/kernel/signal_compat.c:147:2: note: in expansion of macro 'BUILD_B=
UG_ON'
  147 |  BUILD_BUG_ON(offsetof(compat_siginfo_t, si_band) !=3D 0x0C);
      |  ^~~~~~~~~~~~
include/linux/compiler_types.h:313:38: error: call to '__compiletime_assert=
_1049' declared with attribute error: BUILD_BUG_ON failed: offsetof(compat_=
siginfo_t, si_fd) !=3D 0x10
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |                                      ^
include/linux/compiler_types.h:294:4: note: in definition of macro '__compi=
letime_assert'
  294 |    prefix ## suffix();    \
      |    ^~~~~~
include/linux/compiler_types.h:313:2: note: in expansion of macro '_compile=
time_assert'
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |  ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_a=
ssert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_M=
SG'
   50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
      |  ^~~~~~~~~~~~~~~~
arch/x86/kernel/signal_compat.c:148:2: note: in expansion of macro 'BUILD_B=
UG_ON'
  148 |  BUILD_BUG_ON(offsetof(compat_siginfo_t, si_fd)   !=3D 0x10);
      |  ^~~~~~~~~~~~
include/linux/compiler_types.h:313:38: error: call to '__compiletime_assert=
_1056' declared with attribute error: BUILD_BUG_ON failed: offsetof(compat_=
siginfo_t, si_call_addr) !=3D 0x0C
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |                                      ^
include/linux/compiler_types.h:294:4: note: in definition of macro '__compi=
letime_assert'
  294 |    prefix ## suffix();    \
      |    ^~~~~~
include/linux/compiler_types.h:313:2: note: in expansion of macro '_compile=
time_assert'
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |  ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_a=
ssert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_M=
SG'
   50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
      |  ^~~~~~~~~~~~~~~~
arch/x86/kernel/signal_compat.c:157:2: note: in expansion of macro 'BUILD_B=
UG_ON'
  157 |  BUILD_BUG_ON(offsetof(compat_siginfo_t, si_call_addr) !=3D 0x0C);
      |  ^~~~~~~~~~~~
include/linux/compiler_types.h:313:38: error: call to '__compiletime_assert=
_1057' declared with attribute error: BUILD_BUG_ON failed: offsetof(compat_=
siginfo_t, si_syscall) !=3D 0x10
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |                                      ^
include/linux/compiler_types.h:294:4: note: in definition of macro '__compi=
letime_assert'
  294 |    prefix ## suffix();    \
      |    ^~~~~~
include/linux/compiler_types.h:313:2: note: in expansion of macro '_compile=
time_assert'
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |  ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_a=
ssert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_M=
SG'
   50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
      |  ^~~~~~~~~~~~~~~~
arch/x86/kernel/signal_compat.c:158:2: note: in expansion of macro 'BUILD_B=
UG_ON'
  158 |  BUILD_BUG_ON(offsetof(compat_siginfo_t, si_syscall)   !=3D 0x10);
      |  ^~~~~~~~~~~~
include/linux/compiler_types.h:313:38: error: call to '__compiletime_assert=
_1058' declared with attribute error: BUILD_BUG_ON failed: offsetof(compat_=
siginfo_t, si_arch) !=3D 0x14
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |                                      ^
include/linux/compiler_types.h:294:4: note: in definition of macro '__compi=
letime_assert'
  294 |    prefix ## suffix();    \
      |    ^~~~~~
include/linux/compiler_types.h:313:2: note: in expansion of macro '_compile=
time_assert'
  313 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |  ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_a=
ssert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_M=
SG'
   50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
      |  ^~~~~~~~~~~~~~~~
arch/x86/kernel/signal_compat.c:159:2: note: in expansion of macro 'BUILD_B=
UG_ON'
  159 |  BUILD_BUG_ON(offsetof(compat_siginfo_t, si_arch)      !=3D 0x14);
      |  ^~~~~~~~~~~~
kernel/trace/blktrace.c: In function 'blk_trace_ioctl':
kernel/trace/blktrace.c:741:2: error: duplicate case value
  741 |  case BLKTRACESETUP32:
      |  ^~~~
kernel/trace/blktrace.c:736:2: note: previously used here
  736 |  case BLKTRACESETUP:
      |  ^~~~

Caused by commit

  1ef5f0ad8784 ("compat: lift compat_s64 and compat_u64 to <linux/compat.h>=
")

Missing CONFIG_ prefix on COMPAT_FOR_U64_ALIGNMENT in include/linux/compat.=
h.

I have used the vfs tree from next-20200728 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/ExN=r8j4_P/Kc+HG1hQ.HyR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8g110ACgkQAVBC80lX
0GzL5Qf/WdTxflvIixzFxUkk6rbJ4qaF485HpmlQyZ8WzDqHpDicFrjriyVxDOd3
4LW13QpPva0Mbik+Ql5WX9lKQV67BIfTYafs3OwCzWO/sDHfCFx1HmfiL35OrEeA
f+zFf32kBczSARSNvcpn05N2Din1ztejqTFLi0zd3OeCxkwVvA37QUpvI+7l3kJK
5j92jikP7CsqYZ07vp3X3g38gTBlCD9nwF3xul7RJw8Gy4rLtlno0/0e7EoGS8oG
MTbYMj+NULmVD88A4PRAGIp+5i1rvuqAQl8xmARISk+r6MypF/2cmq3sY7Mn4ovT
O8TOeuKSTHvo6dsD335BQE+a37tqww==
=sYzG
-----END PGP SIGNATURE-----

--Sig_/ExN=r8j4_P/Kc+HG1hQ.HyR--
