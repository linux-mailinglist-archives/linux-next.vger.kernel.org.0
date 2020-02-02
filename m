Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6376014FF8C
	for <lists+linux-next@lfdr.de>; Sun,  2 Feb 2020 23:16:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbgBBWQr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 2 Feb 2020 17:16:47 -0500
Received: from ozlabs.org ([203.11.71.1]:59929 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726967AbgBBWQr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 2 Feb 2020 17:16:47 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 489lfv5BHmz9s3x;
        Mon,  3 Feb 2020 09:16:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1580681799;
        bh=oHvPhWPc0sRN3eCrni379EXrxjtZV/ndtEgJ7HMzl1c=;
        h=Date:From:To:Cc:Subject:From;
        b=jEjHG+5vnSz5qN1F0Xxm75Lk5J8UfKo2q0w6GoQitbm23yo/mRyXTBlmd0pv7WBG2
         8v41IhPCsQrRq3wyGeYzARQyOtIf9SvUgG3CYIA0/Wd1YYKk5BNIMr6I99e3SDkKqh
         mv6D1XEZ/uoo3gJzkcyhL/u73Sd3SwKO1QAiPO1J33XIfugtUqX5aDY+iIbFg3BuP6
         NxTGuUPGmSFXkl1KAJsNlv/ibZj2vp06qHIXW7EkkzBYnJGiG8Mpi+rObOBzdlahw9
         SRfPmoW/+ZW+Wk4zQSKwbDnEmo2HZPfiB0fmsNrrWd93u9veed2wgImzYQmRbzQJc/
         /Yo5PSWYeoFrA==
Date:   Mon, 3 Feb 2020 09:16:33 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wen He <wen.he_1@nxp.com>
Subject: linux-next: build warnings after merge of the clk tree
Message-ID: <20200203091633.3265a3f1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/L0mldIO+884yySqIIq9UwHP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/L0mldIO+884yySqIIq9UwHP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the clk tree, today's linux-next build (x86_64 allmodconfig)
produced these warnings:

In file included from include/linux/list.h:9,
                 from include/linux/kobject.h:19,
                 from include/linux/of.h:17,
                 from include/linux/clk-provider.h:9,
                 from drivers/clk/clk-plldig.c:8:
drivers/clk/clk-plldig.c: In function 'plldig_determine_rate':
include/linux/kernel.h:835:29: warning: comparison of distinct pointer type=
s lacks a cast
  835 |   (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
      |                             ^~
include/linux/kernel.h:849:4: note: in expansion of macro '__typecheck'
  849 |   (__typecheck(x, y) && __no_side_effects(x, y))
      |    ^~~~~~~~~~~
include/linux/kernel.h:859:24: note: in expansion of macro '__safe_cmp'
  859 |  __builtin_choose_expr(__safe_cmp(x, y), \
      |                        ^~~~~~~~~~
include/linux/kernel.h:868:19: note: in expansion of macro '__careful_cmp'
  868 | #define min(x, y) __careful_cmp(x, y, <)
      |                   ^~~~~~~~~~~~~
include/linux/kernel.h:912:28: note: in expansion of macro 'min'
  912 | #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
      |                            ^~~
include/linux/kernel.h:849:4: note: in expansion of macro '__typecheck'
  849 |   (__typecheck(x, y) && __no_side_effects(x, y))
      |    ^~~~~~~~~~~
include/linux/kernel.h:859:24: note: in expansion of macro '__safe_cmp'
  859 |  __builtin_choose_expr(__safe_cmp(x, y), \
      |                        ^~~~~~~~~~
include/linux/kernel.h:875:19: note: in expansion of macro '__careful_cmp'
  875 | #define max(x, y) __careful_cmp(x, y, >)
      |                   ^~~~~~~~~~~~~
include/linux/kernel.h:912:45: note: in expansion of macro 'max'
  912 | #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
      |                                             ^~~
drivers/clk/clk-plldig.c:145:14: note: in expansion of macro 'clamp'
  145 |  req->rate =3D clamp(req->rate, PHI1_MIN_FREQ, PHI1_MAX_FREQ);
      |              ^~~~~
include/linux/kernel.h:835:29: warning: comparison of distinct pointer type=
s lacks a cast
  835 |   (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
      |                             ^~
include/linux/kernel.h:849:4: note: in expansion of macro '__typecheck'
  849 |   (__typecheck(x, y) && __no_side_effects(x, y))
      |    ^~~~~~~~~~~
include/linux/kernel.h:859:24: note: in expansion of macro '__safe_cmp'
  859 |  __builtin_choose_expr(__safe_cmp(x, y), \
      |                        ^~~~~~~~~~
include/linux/kernel.h:868:19: note: in expansion of macro '__careful_cmp'
  868 | #define min(x, y) __careful_cmp(x, y, <)
      |                   ^~~~~~~~~~~~~
include/linux/kernel.h:912:28: note: in expansion of macro 'min'
  912 | #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
      |                            ^~~
drivers/clk/clk-plldig.c:145:14: note: in expansion of macro 'clamp'
  145 |  req->rate =3D clamp(req->rate, PHI1_MIN_FREQ, PHI1_MAX_FREQ);
      |              ^~~~~
include/linux/kernel.h:835:29: warning: comparison of distinct pointer type=
s lacks a cast
  835 |   (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
      |                             ^~
include/linux/kernel.h:843:48: note: in definition of macro '__is_constexpr'
  843 |  (sizeof(int) =3D=3D sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int=
 *)8)))
      |                                                ^
include/linux/kernel.h:849:25: note: in expansion of macro '__no_side_effec=
ts'
  849 |   (__typecheck(x, y) && __no_side_effects(x, y))
      |                         ^~~~~~~~~~~~~~~~~
include/linux/kernel.h:859:24: note: in expansion of macro '__safe_cmp'
  859 |  __builtin_choose_expr(__safe_cmp(x, y), \
      |                        ^~~~~~~~~~
include/linux/kernel.h:868:19: note: in expansion of macro '__careful_cmp'
  868 | #define min(x, y) __careful_cmp(x, y, <)
      |                   ^~~~~~~~~~~~~
include/linux/kernel.h:912:28: note: in expansion of macro 'min'
  912 | #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
      |                            ^~~
include/linux/kernel.h:849:4: note: in expansion of macro '__typecheck'
  849 |   (__typecheck(x, y) && __no_side_effects(x, y))
      |    ^~~~~~~~~~~
include/linux/kernel.h:859:24: note: in expansion of macro '__safe_cmp'
  859 |  __builtin_choose_expr(__safe_cmp(x, y), \
      |                        ^~~~~~~~~~
include/linux/kernel.h:875:19: note: in expansion of macro '__careful_cmp'
  875 | #define max(x, y) __careful_cmp(x, y, >)
      |                   ^~~~~~~~~~~~~
include/linux/kernel.h:912:45: note: in expansion of macro 'max'
  912 | #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
      |                                             ^~~
drivers/clk/clk-plldig.c:145:14: note: in expansion of macro 'clamp'
  145 |  req->rate =3D clamp(req->rate, PHI1_MIN_FREQ, PHI1_MAX_FREQ);
      |              ^~~~~
include/linux/kernel.h:835:29: warning: comparison of distinct pointer type=
s lacks a cast
  835 |   (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
      |                             ^~
include/linux/kernel.h:851:27: note: in definition of macro '__cmp'
  851 | #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
      |                           ^
include/linux/kernel.h:868:19: note: in expansion of macro '__careful_cmp'
  868 | #define min(x, y) __careful_cmp(x, y, <)
      |                   ^~~~~~~~~~~~~
include/linux/kernel.h:912:28: note: in expansion of macro 'min'
  912 | #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
      |                            ^~~
include/linux/kernel.h:849:4: note: in expansion of macro '__typecheck'
  849 |   (__typecheck(x, y) && __no_side_effects(x, y))
      |    ^~~~~~~~~~~
include/linux/kernel.h:859:24: note: in expansion of macro '__safe_cmp'
  859 |  __builtin_choose_expr(__safe_cmp(x, y), \
      |                        ^~~~~~~~~~
include/linux/kernel.h:875:19: note: in expansion of macro '__careful_cmp'
  875 | #define max(x, y) __careful_cmp(x, y, >)
      |                   ^~~~~~~~~~~~~
include/linux/kernel.h:912:45: note: in expansion of macro 'max'
  912 | #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
      |                                             ^~~
drivers/clk/clk-plldig.c:145:14: note: in expansion of macro 'clamp'
  145 |  req->rate =3D clamp(req->rate, PHI1_MIN_FREQ, PHI1_MAX_FREQ);
      |              ^~~~~
include/linux/kernel.h:835:29: warning: comparison of distinct pointer type=
s lacks a cast
  835 |   (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
      |                             ^~
include/linux/kernel.h:851:40: note: in definition of macro '__cmp'
  851 | #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
      |                                        ^
include/linux/kernel.h:868:19: note: in expansion of macro '__careful_cmp'
  868 | #define min(x, y) __careful_cmp(x, y, <)
      |                   ^~~~~~~~~~~~~
include/linux/kernel.h:912:28: note: in expansion of macro 'min'
  912 | #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
      |                            ^~~
include/linux/kernel.h:849:4: note: in expansion of macro '__typecheck'
  849 |   (__typecheck(x, y) && __no_side_effects(x, y))
      |    ^~~~~~~~~~~
include/linux/kernel.h:859:24: note: in expansion of macro '__safe_cmp'
  859 |  __builtin_choose_expr(__safe_cmp(x, y), \
      |                        ^~~~~~~~~~
include/linux/kernel.h:875:19: note: in expansion of macro '__careful_cmp'
  875 | #define max(x, y) __careful_cmp(x, y, >)
      |                   ^~~~~~~~~~~~~
include/linux/kernel.h:912:45: note: in expansion of macro 'max'
  912 | #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
      |                                             ^~~
drivers/clk/clk-plldig.c:145:14: note: in expansion of macro 'clamp'
  145 |  req->rate =3D clamp(req->rate, PHI1_MIN_FREQ, PHI1_MAX_FREQ);
      |              ^~~~~
include/linux/kernel.h:835:29: warning: comparison of distinct pointer type=
s lacks a cast
  835 |   (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
      |                             ^~
include/linux/kernel.h:854:10: note: in definition of macro '__cmp_once'
  854 |   typeof(x) unique_x =3D (x);  \
      |          ^
include/linux/kernel.h:868:19: note: in expansion of macro '__careful_cmp'
  868 | #define min(x, y) __careful_cmp(x, y, <)
      |                   ^~~~~~~~~~~~~
include/linux/kernel.h:912:28: note: in expansion of macro 'min'
  912 | #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
      |                            ^~~
include/linux/kernel.h:849:4: note: in expansion of macro '__typecheck'
  849 |   (__typecheck(x, y) && __no_side_effects(x, y))
      |    ^~~~~~~~~~~
include/linux/kernel.h:859:24: note: in expansion of macro '__safe_cmp'
  859 |  __builtin_choose_expr(__safe_cmp(x, y), \
      |                        ^~~~~~~~~~
include/linux/kernel.h:875:19: note: in expansion of macro '__careful_cmp'
  875 | #define max(x, y) __careful_cmp(x, y, >)
      |                   ^~~~~~~~~~~~~
include/linux/kernel.h:912:45: note: in expansion of macro 'max'
  912 | #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
      |                                             ^~~
drivers/clk/clk-plldig.c:145:14: note: in expansion of macro 'clamp'
  145 |  req->rate =3D clamp(req->rate, PHI1_MIN_FREQ, PHI1_MAX_FREQ);
      |              ^~~~~
include/linux/kernel.h:835:29: warning: comparison of distinct pointer type=
s lacks a cast
  835 |   (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
      |                             ^~
include/linux/kernel.h:854:25: note: in definition of macro '__cmp_once'
  854 |   typeof(x) unique_x =3D (x);  \
      |                         ^
include/linux/kernel.h:868:19: note: in expansion of macro '__careful_cmp'
  868 | #define min(x, y) __careful_cmp(x, y, <)
      |                   ^~~~~~~~~~~~~
include/linux/kernel.h:912:28: note: in expansion of macro 'min'
  912 | #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
      |                            ^~~
include/linux/kernel.h:849:4: note: in expansion of macro '__typecheck'
  849 |   (__typecheck(x, y) && __no_side_effects(x, y))
      |    ^~~~~~~~~~~
include/linux/kernel.h:859:24: note: in expansion of macro '__safe_cmp'
  859 |  __builtin_choose_expr(__safe_cmp(x, y), \
      |                        ^~~~~~~~~~
include/linux/kernel.h:875:19: note: in expansion of macro '__careful_cmp'
  875 | #define max(x, y) __careful_cmp(x, y, >)
      |                   ^~~~~~~~~~~~~
include/linux/kernel.h:912:45: note: in expansion of macro 'max'
  912 | #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
      |                                             ^~~
drivers/clk/clk-plldig.c:145:14: note: in expansion of macro 'clamp'
  145 |  req->rate =3D clamp(req->rate, PHI1_MIN_FREQ, PHI1_MAX_FREQ);
      |              ^~~~~
drivers/clk/clk-plldig.c: In function 'plldig_set_rate':
include/linux/kernel.h:835:29: warning: comparison of distinct pointer type=
s lacks a cast
  835 |   (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
      |                             ^~
include/linux/kernel.h:849:4: note: in expansion of macro '__typecheck'
  849 |   (__typecheck(x, y) && __no_side_effects(x, y))
      |    ^~~~~~~~~~~
include/linux/kernel.h:859:24: note: in expansion of macro '__safe_cmp'
  859 |  __builtin_choose_expr(__safe_cmp(x, y), \
      |                        ^~~~~~~~~~
include/linux/kernel.h:868:19: note: in expansion of macro '__careful_cmp'
  868 | #define min(x, y) __careful_cmp(x, y, <)
      |                   ^~~~~~~~~~~~~
include/linux/kernel.h:912:28: note: in expansion of macro 'min'
  912 | #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
      |                            ^~~
include/linux/kernel.h:849:4: note: in expansion of macro '__typecheck'
  849 |   (__typecheck(x, y) && __no_side_effects(x, y))
      |    ^~~~~~~~~~~
include/linux/kernel.h:859:24: note: in expansion of macro '__safe_cmp'
  859 |  __builtin_choose_expr(__safe_cmp(x, y), \
      |                        ^~~~~~~~~~
include/linux/kernel.h:875:19: note: in expansion of macro '__careful_cmp'
  875 | #define max(x, y) __careful_cmp(x, y, >)
      |                   ^~~~~~~~~~~~~
include/linux/kernel.h:912:45: note: in expansion of macro 'max'
  912 | #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
      |                                             ^~~
drivers/clk/clk-plldig.c:159:9: note: in expansion of macro 'clamp'
  159 |  rate =3D clamp(rate, PHI1_MIN_FREQ, PHI1_MAX_FREQ);
      |         ^~~~~
include/linux/kernel.h:835:29: warning: comparison of distinct pointer type=
s lacks a cast
  835 |   (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
      |                             ^~
include/linux/kernel.h:849:4: note: in expansion of macro '__typecheck'
  849 |   (__typecheck(x, y) && __no_side_effects(x, y))
      |    ^~~~~~~~~~~
include/linux/kernel.h:859:24: note: in expansion of macro '__safe_cmp'
  859 |  __builtin_choose_expr(__safe_cmp(x, y), \
      |                        ^~~~~~~~~~
include/linux/kernel.h:868:19: note: in expansion of macro '__careful_cmp'
  868 | #define min(x, y) __careful_cmp(x, y, <)
      |                   ^~~~~~~~~~~~~
include/linux/kernel.h:912:28: note: in expansion of macro 'min'
  912 | #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
      |                            ^~~
drivers/clk/clk-plldig.c:159:9: note: in expansion of macro 'clamp'
  159 |  rate =3D clamp(rate, PHI1_MIN_FREQ, PHI1_MAX_FREQ);
      |         ^~~~~
include/linux/kernel.h:835:29: warning: comparison of distinct pointer type=
s lacks a cast
  835 |   (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
      |                             ^~
include/linux/kernel.h:843:48: note: in definition of macro '__is_constexpr'
  843 |  (sizeof(int) =3D=3D sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int=
 *)8)))
      |                                                ^
include/linux/kernel.h:849:25: note: in expansion of macro '__no_side_effec=
ts'
  849 |   (__typecheck(x, y) && __no_side_effects(x, y))
      |                         ^~~~~~~~~~~~~~~~~
include/linux/kernel.h:859:24: note: in expansion of macro '__safe_cmp'
  859 |  __builtin_choose_expr(__safe_cmp(x, y), \
      |                        ^~~~~~~~~~
include/linux/kernel.h:868:19: note: in expansion of macro '__careful_cmp'
  868 | #define min(x, y) __careful_cmp(x, y, <)
      |                   ^~~~~~~~~~~~~
include/linux/kernel.h:912:28: note: in expansion of macro 'min'
  912 | #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
      |                            ^~~
include/linux/kernel.h:849:4: note: in expansion of macro '__typecheck'
  849 |   (__typecheck(x, y) && __no_side_effects(x, y))
      |    ^~~~~~~~~~~
include/linux/kernel.h:859:24: note: in expansion of macro '__safe_cmp'
  859 |  __builtin_choose_expr(__safe_cmp(x, y), \
      |                        ^~~~~~~~~~
include/linux/kernel.h:875:19: note: in expansion of macro '__careful_cmp'
  875 | #define max(x, y) __careful_cmp(x, y, >)
      |                   ^~~~~~~~~~~~~
include/linux/kernel.h:912:45: note: in expansion of macro 'max'
  912 | #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
      |                                             ^~~
drivers/clk/clk-plldig.c:159:9: note: in expansion of macro 'clamp'
  159 |  rate =3D clamp(rate, PHI1_MIN_FREQ, PHI1_MAX_FREQ);
      |         ^~~~~
include/linux/kernel.h:835:29: warning: comparison of distinct pointer type=
s lacks a cast
  835 |   (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
      |                             ^~
include/linux/kernel.h:851:27: note: in definition of macro '__cmp'
  851 | #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
      |                           ^
include/linux/kernel.h:868:19: note: in expansion of macro '__careful_cmp'
  868 | #define min(x, y) __careful_cmp(x, y, <)
      |                   ^~~~~~~~~~~~~
include/linux/kernel.h:912:28: note: in expansion of macro 'min'
  912 | #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
      |                            ^~~
include/linux/kernel.h:849:4: note: in expansion of macro '__typecheck'
  849 |   (__typecheck(x, y) && __no_side_effects(x, y))
      |    ^~~~~~~~~~~
include/linux/kernel.h:859:24: note: in expansion of macro '__safe_cmp'
  859 |  __builtin_choose_expr(__safe_cmp(x, y), \
      |                        ^~~~~~~~~~
include/linux/kernel.h:875:19: note: in expansion of macro '__careful_cmp'
  875 | #define max(x, y) __careful_cmp(x, y, >)
      |                   ^~~~~~~~~~~~~
include/linux/kernel.h:912:45: note: in expansion of macro 'max'
  912 | #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
      |                                             ^~~
drivers/clk/clk-plldig.c:159:9: note: in expansion of macro 'clamp'
  159 |  rate =3D clamp(rate, PHI1_MIN_FREQ, PHI1_MAX_FREQ);
      |         ^~~~~
include/linux/kernel.h:835:29: warning: comparison of distinct pointer type=
s lacks a cast
  835 |   (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
      |                             ^~
include/linux/kernel.h:851:40: note: in definition of macro '__cmp'
  851 | #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
      |                                        ^
include/linux/kernel.h:868:19: note: in expansion of macro '__careful_cmp'
  868 | #define min(x, y) __careful_cmp(x, y, <)
      |                   ^~~~~~~~~~~~~
include/linux/kernel.h:912:28: note: in expansion of macro 'min'
  912 | #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
      |                            ^~~
include/linux/kernel.h:849:4: note: in expansion of macro '__typecheck'
  849 |   (__typecheck(x, y) && __no_side_effects(x, y))
      |    ^~~~~~~~~~~
include/linux/kernel.h:859:24: note: in expansion of macro '__safe_cmp'
  859 |  __builtin_choose_expr(__safe_cmp(x, y), \
      |                        ^~~~~~~~~~
include/linux/kernel.h:875:19: note: in expansion of macro '__careful_cmp'
  875 | #define max(x, y) __careful_cmp(x, y, >)
      |                   ^~~~~~~~~~~~~
include/linux/kernel.h:912:45: note: in expansion of macro 'max'
  912 | #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
      |                                             ^~~
drivers/clk/clk-plldig.c:159:9: note: in expansion of macro 'clamp'
  159 |  rate =3D clamp(rate, PHI1_MIN_FREQ, PHI1_MAX_FREQ);
      |         ^~~~~
include/linux/kernel.h:835:29: warning: comparison of distinct pointer type=
s lacks a cast
  835 |   (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
      |                             ^~
include/linux/kernel.h:854:10: note: in definition of macro '__cmp_once'
  854 |   typeof(x) unique_x =3D (x);  \
      |          ^
include/linux/kernel.h:868:19: note: in expansion of macro '__careful_cmp'
  868 | #define min(x, y) __careful_cmp(x, y, <)
      |                   ^~~~~~~~~~~~~
include/linux/kernel.h:912:28: note: in expansion of macro 'min'
  912 | #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
      |                            ^~~
include/linux/kernel.h:849:4: note: in expansion of macro '__typecheck'
  849 |   (__typecheck(x, y) && __no_side_effects(x, y))
      |    ^~~~~~~~~~~
include/linux/kernel.h:859:24: note: in expansion of macro '__safe_cmp'
  859 |  __builtin_choose_expr(__safe_cmp(x, y), \
      |                        ^~~~~~~~~~
include/linux/kernel.h:875:19: note: in expansion of macro '__careful_cmp'
  875 | #define max(x, y) __careful_cmp(x, y, >)
      |                   ^~~~~~~~~~~~~
include/linux/kernel.h:912:45: note: in expansion of macro 'max'
  912 | #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
      |                                             ^~~
drivers/clk/clk-plldig.c:159:9: note: in expansion of macro 'clamp'
  159 |  rate =3D clamp(rate, PHI1_MIN_FREQ, PHI1_MAX_FREQ);
      |         ^~~~~
include/linux/kernel.h:835:29: warning: comparison of distinct pointer type=
s lacks a cast
  835 |   (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
      |                             ^~
include/linux/kernel.h:854:25: note: in definition of macro '__cmp_once'
  854 |   typeof(x) unique_x =3D (x);  \
      |                         ^
include/linux/kernel.h:868:19: note: in expansion of macro '__careful_cmp'
  868 | #define min(x, y) __careful_cmp(x, y, <)
      |                   ^~~~~~~~~~~~~
include/linux/kernel.h:912:28: note: in expansion of macro 'min'
  912 | #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
      |                            ^~~
include/linux/kernel.h:849:4: note: in expansion of macro '__typecheck'
  849 |   (__typecheck(x, y) && __no_side_effects(x, y))
      |    ^~~~~~~~~~~
include/linux/kernel.h:859:24: note: in expansion of macro '__safe_cmp'
  859 |  __builtin_choose_expr(__safe_cmp(x, y), \
      |                        ^~~~~~~~~~
include/linux/kernel.h:875:19: note: in expansion of macro '__careful_cmp'
  875 | #define max(x, y) __careful_cmp(x, y, >)
      |                   ^~~~~~~~~~~~~
include/linux/kernel.h:912:45: note: in expansion of macro 'max'
  912 | #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
      |                                             ^~~
drivers/clk/clk-plldig.c:159:9: note: in expansion of macro 'clamp'
  159 |  rate =3D clamp(rate, PHI1_MIN_FREQ, PHI1_MAX_FREQ);
      |         ^~~~~

Introduced by commit

  d37010a3c162 ("clk: ls1028a: Add clock driver for Display output interfac=
e")

--=20
Cheers,
Stephen Rothwell

--Sig_/L0mldIO+884yySqIIq9UwHP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl43SkEACgkQAVBC80lX
0GzjVQf+K37Gfgp1qsF+LMijCcu6AGJWWx/fwizMGz4ed8QRT44bM+sLPd7+yN6J
+F7/8ZFQH1MFNSNtY6TksQM2CnVD68Ty4YVo6CH/t7g+/WA59Ab8LvS0IXXXQQK4
XXP5DIeFYkM2idwJ5ow/8nddd88Sz1MQPGlUv7pzjppndiAjXchffIKNL9+5/JAk
1rDPidU0ANatZeKzEsi1M3nI+vQ0gyvGspRZLHoP9sQpEtc5/YpUsKexj5Ox3FZD
NhWjKPBXdlCW1RzDErXSN8c5lD0H+6zS6euJyn1tASKssQkGxjBsb+piJ36pTR49
lO6v8cgKMt2E2UO+Wcg7sWvUJzQK6g==
=XlMS
-----END PGP SIGNATURE-----

--Sig_/L0mldIO+884yySqIIq9UwHP--
