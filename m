Return-Path: <linux-next+bounces-262-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F00A807F31
	for <lists+linux-next@lfdr.de>; Thu,  7 Dec 2023 04:38:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34C971C20AB7
	for <lists+linux-next@lfdr.de>; Thu,  7 Dec 2023 03:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D994C7D;
	Thu,  7 Dec 2023 03:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZD/Ov0lc"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7D30D6D;
	Wed,  6 Dec 2023 19:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701920288;
	bh=cg7C4OJMgJ7KcLBzNrAiGG2aMnf+ML4HlAn+5fbR3vs=;
	h=Date:From:To:Cc:Subject:From;
	b=ZD/Ov0lcV4iw7cnXMaRTF2eSU2LHfScR4D/0GiQeaMAr9SRquQC0LPrt8THdwiOBS
	 OVstKB24w5HTTxNegnbXP3hMyvtiteZvZIQPbYEtfza25Ew7SFkc149jtBSi87DlIo
	 knyY7Hel2Wd7omk+0uFVDdLwW/ETaPE+W/WWfEedPtaHUB50CR5MLcmMeZCV1Zy3S1
	 Fgrx+J53REf3dFp979j1ptOQtrzCPhAZKIGp5FbyyefxTEUobIBRIsSAmGXVL63L18
	 hSPCyo7Eq5CLReMMq6qq1dtSzxcjXTGJtjLvPr2tEu8QV/5YD6UXORLR6yoDpOgD2d
	 zYdsa/pnB7lHA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sm0NJ3v8Lz4wbQ;
	Thu,  7 Dec 2023 14:38:08 +1100 (AEDT)
Date: Thu, 7 Dec 2023 14:38:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Tejun Heo <tj@kernel.org>
Cc: Waiman Long <longman@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the cgroup tree
Message-ID: <20231207143806.114e0a74@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/u3Hr9hsUmQ9M8eg+MLNaR2m";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/u3Hr9hsUmQ9M8eg+MLNaR2m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the cgroup tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from <command-line>:
kernel/cgroup/cgroup.c: In function 'cgroup_free_root':
include/linux/compiler_types.h:435:45: error: call to '__compiletime_assert=
_1792' declared with attribute error: BUILD_BUG_ON failed: !__is_kvfree_rcu=
_offset(offsetof(typeof(*(root)), rcu))
  435 |         _compiletime_assert(condition, msg, __compiletime_assert_, =
__COUNTER__)
      |                                             ^
include/linux/compiler_types.h:416:25: note: in definition of macro '__comp=
iletime_assert'
  416 |                         prefix ## suffix();                        =
     \
      |                         ^~~~~~
include/linux/compiler_types.h:435:9: note: in expansion of macro '_compile=
time_assert'
  435 |         _compiletime_assert(condition, msg, __compiletime_assert_, =
__COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_a=
ssert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_M=
SG'
   50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condit=
ion)
      |         ^~~~~~~~~~~~~~~~
include/linux/rcupdate.h:985:17: note: in expansion of macro 'BUILD_BUG_ON'
  985 |                 BUILD_BUG_ON(!__is_kvfree_rcu_offset(offsetof(typeo=
f(*(ptr)), rhf)));   \
      |                 ^~~~~~~~~~~~
include/linux/rcupdate.h:957:29: note: in expansion of macro 'kvfree_rcu_ar=
g_2'
  957 | #define kfree_rcu(ptr, rhf) kvfree_rcu_arg_2(ptr, rhf)
      |                             ^~~~~~~~~~~~~~~~
kernel/cgroup/cgroup.c:1318:9: note: in expansion of macro 'kfree_rcu'
 1318 |         kfree_rcu(root, rcu);
      |         ^~~~~~~~~
In function 'cgroup_free_root',
    inlined from 'cgroup_destroy_root' at kernel/cgroup/cgroup.c:1363:2:
include/linux/compiler_types.h:435:45: error: call to '__compiletime_assert=
_1792' declared with attribute error: BUILD_BUG_ON failed: !__is_kvfree_rcu=
_offset(offsetof(typeof(*(root)), rcu))
  435 |         _compiletime_assert(condition, msg, __compiletime_assert_, =
__COUNTER__)
      |                                             ^
include/linux/compiler_types.h:416:25: note: in definition of macro '__comp=
iletime_assert'
  416 |                         prefix ## suffix();                        =
     \
      |                         ^~~~~~
include/linux/compiler_types.h:435:9: note: in expansion of macro '_compile=
time_assert'
  435 |         _compiletime_assert(condition, msg, __compiletime_assert_, =
__COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_a=
ssert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_M=
SG'
   50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condit=
ion)
      |         ^~~~~~~~~~~~~~~~
include/linux/rcupdate.h:985:17: note: in expansion of macro 'BUILD_BUG_ON'
  985 |                 BUILD_BUG_ON(!__is_kvfree_rcu_offset(offsetof(typeo=
f(*(ptr)), rhf)));   \
      |                 ^~~~~~~~~~~~
include/linux/rcupdate.h:957:29: note: in expansion of macro 'kvfree_rcu_ar=
g_2'
  957 | #define kfree_rcu(ptr, rhf) kvfree_rcu_arg_2(ptr, rhf)
      |                             ^~~~~~~~~~~~~~~~
kernel/cgroup/cgroup.c:1318:9: note: in expansion of macro 'kfree_rcu'
 1318 |         kfree_rcu(root, rcu);
      |         ^~~~~~~~~

Possibly caused by commit

  77070eeb8821 ("cgroup: Avoid false cacheline sharing of read mostly rstat=
_cpu")

I have used the cgroup tree from next-20231206 for today.



--=20
Cheers,
Stephen Rothwell

--Sig_/u3Hr9hsUmQ9M8eg+MLNaR2m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVxPh4ACgkQAVBC80lX
0GyQUggAj0rtK1Y3Canq6G7S+7XcR0Fh3IefUS+yUVVSd+FxroNJp5/aC2AHWMMJ
5Q7Gua0PoK0F8RNskC0TqxESt44CjsA/1Y9yfHdeWI8kTCqhWPqxDJSz2S2hqyGO
gEa3dre+l6FnwVrSFimhAFBiIXIwwkOQMVGU/XWyKwP2JyBYAHd0w8CWfczx16Mn
nsMuQ1EYC0jTNnm4bt4t6DqMOh0xPF5QXulyJSx3fpQ3rGrf5rv12OIEFP7KAx00
tIo1+/AlOhp9q6Ptivab/McOg+7SbD8KwClL2GnLwSofYhlyWASHec2HzlNuI+kO
b7UKBiYVD6LL4TCX5m7gJ89XJtj4+Q==
=u5W6
-----END PGP SIGNATURE-----

--Sig_/u3Hr9hsUmQ9M8eg+MLNaR2m--

