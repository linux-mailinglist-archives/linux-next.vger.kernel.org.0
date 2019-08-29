Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85149A100E
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2019 05:51:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbfH2Dvz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Aug 2019 23:51:55 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:37017 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726128AbfH2Dvy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Aug 2019 23:51:54 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46JpZb2VDyz9sBp;
        Thu, 29 Aug 2019 13:51:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567050711;
        bh=ItfZEpr8AudVc2Ied8pd8iQSW4sPgc6Ag8MqymgcLIw=;
        h=Date:From:To:Cc:Subject:From;
        b=U1F8iaX+PHzeE8GBn+MKgB2cPh+jidQBNRI9b8kuyAWyIxJVFCUcdz2EVcf7SQwlL
         o+7JH91EIlZnWcXht2QublQ9veKKmLsKXSz5xh6q9QiTVAg9eOs8rCpi85ZjBv364t
         doehR03PoBpbHHyIF/crOc1VZemRiGzCYStTC79jJOlUo3GN1OHjFjHwsKLv17dAk2
         gPd2a8orA4sk06FfaH4cO1o32T97GGj7oSnX4kTvmhLdWZwTAYfLmmJRE1zSQ+2Fe5
         qsnVrflw3PFT7t3JgN9NMzKaKZXgGZ8wDm3nTChYoArVmAEZyNvqI4E4BZRnJmBKqn
         z9WZIssuuu/tw==
Date:   Thu, 29 Aug 2019 13:51:50 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tejun Heo <tj@kernel.org>
Subject: linux-next: build warning after merge of the block tree
Message-ID: <20190829135150.4f0e533a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/97As8R_jcmeI=dho6YOw6EC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/97As8R_jcmeI=dho6YOw6EC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

In file included from include/trace/events/iocost.h:8,
                 from <command-line>:
include/trace/events/iocost.h:12:57: warning: 'struct ioc_now' declared ins=
ide parameter list will not be visible outside of this definition or declar=
ation
  TP_PROTO(struct ioc_gq *iocg, const char *path, struct ioc_now *now,
                                                         ^~~~~~~
include/linux/tracepoint.h:233:34: note: in definition of macro '__DECLARE_=
TRACE'
  static inline void trace_##name(proto)    \
                                  ^~~~~
include/linux/tracepoint.h:396:24: note: in expansion of macro 'PARAMS'
  __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),  \
                        ^~~~~~
include/linux/tracepoint.h:532:2: note: in expansion of macro 'DECLARE_TRAC=
E'
  DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
  ^~~~~~~~~~~~~
include/linux/tracepoint.h:532:22: note: in expansion of macro 'PARAMS'
  DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
                      ^~~~~~
include/trace/events/iocost.h:10:1: note: in expansion of macro 'TRACE_EVEN=
T'
 TRACE_EVENT(iocost_iocg_activate,
 ^~~~~~~~~~~
include/trace/events/iocost.h:12:2: note: in expansion of macro 'TP_PROTO'
  TP_PROTO(struct ioc_gq *iocg, const char *path, struct ioc_now *now,
  ^~~~~~~~
include/trace/events/iocost.h:12:18: warning: 'struct ioc_gq' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
  TP_PROTO(struct ioc_gq *iocg, const char *path, struct ioc_now *now,
                  ^~~~~~
include/linux/tracepoint.h:233:34: note: in definition of macro '__DECLARE_=
TRACE'
  static inline void trace_##name(proto)    \
                                  ^~~~~
include/linux/tracepoint.h:396:24: note: in expansion of macro 'PARAMS'
  __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),  \
                        ^~~~~~
include/linux/tracepoint.h:532:2: note: in expansion of macro 'DECLARE_TRAC=
E'
  DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
  ^~~~~~~~~~~~~
include/linux/tracepoint.h:532:22: note: in expansion of macro 'PARAMS'
  DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
                      ^~~~~~
include/trace/events/iocost.h:10:1: note: in expansion of macro 'TRACE_EVEN=
T'
 TRACE_EVENT(iocost_iocg_activate,
 ^~~~~~~~~~~
include/trace/events/iocost.h:12:2: note: in expansion of macro 'TP_PROTO'
  TP_PROTO(struct ioc_gq *iocg, const char *path, struct ioc_now *now,
  ^~~~~~~~

(and many more)

Introduced by commit

  7caa47151ab2 ("blkcg: implement blk-iocost")

To get these warnings you need to build with CONFIG_HEADER_TEST and
CONFIG_KERNEL_HEADER_TEST (and maybe CONFIG_UAPI_HEADER_TEST).
allmodconfig does that.

--=20
Cheers,
Stephen Rothwell

--Sig_/97As8R_jcmeI=dho6YOw6EC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1nS9YACgkQAVBC80lX
0GwK7gf/YM/7oFlFRJibwrxG2N7GlO2Qh7OkEHrb7moXSk8K/eNq68jtih5oNu8B
a7X0DC2v60ayx3Pnw4GkCBuaMRypCmtE8Y2wWfNCe30ijyV/1NF+20FOt2RipSPA
4Awyaqn/Hh9LdNQcKt8Xg3VEvpAnQqVdjGRhcxQ9NltGQWbjspFkjBy+bW5Okckc
sy47QcnvxCAV2KfT6/X3kL7gXUkQa/GlgpDd0B+u4XEIZS/0RSgY/9GqxtXsRwKW
pf7X1aAgz2sbwRp2SmfjRAjoUt0wIwxfwqSuASxIUbcNcQLEjA+uz+jaip9Lr44y
ypYHYb8UKzgjMSC3Mz084zUT190SsQ==
=xHPJ
-----END PGP SIGNATURE-----

--Sig_/97As8R_jcmeI=dho6YOw6EC--
