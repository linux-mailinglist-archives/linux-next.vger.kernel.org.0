Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB8B259D41
	for <lists+linux-next@lfdr.de>; Tue,  1 Sep 2020 19:36:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbgIARg3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Sep 2020 13:36:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:55572 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726301AbgIARg2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 1 Sep 2020 13:36:28 -0400
Received: from quaco.ghostprotocols.net (unknown [179.97.37.151])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 57AA52071B;
        Tue,  1 Sep 2020 17:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598981787;
        bh=JdV+6cN4jk9Av19/JkbyWVKBmm6t9dmg8jS26hDhVCs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Nl2Z9NWaY5Cj+fwlV0BAwTPsT0/EG0zhoeGA/Gb8WybGXZ0OQyE9wTG1O7scrbNN5
         f4S6zAhIOYUn42q6O6SOSOZa7DGiewDGvRipMtQiGAWTk1XucujZ3uCydVx+K10Ngc
         UM1cHkGSxlDGHhp/wfR4m+diN/dOsAcKFVBk4Aes=
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
        id 7156040D3D; Tue,  1 Sep 2020 14:36:25 -0300 (-03)
Date:   Tue, 1 Sep 2020 14:36:25 -0300
From:   Arnaldo Carvalho de Melo <acme@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warnings from perf build in Linus' tree
Message-ID: <20200901173625.GA1463758@kernel.org>
References: <20200827083839.276cc0d0@canb.auug.org.au>
 <20200827091009.54789c17@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200827091009.54789c17@canb.auug.org.au>
X-Url:  http://acmel.wordpress.com
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Em Thu, Aug 27, 2020 at 09:10:09AM +1000, Stephen Rothwell escreveu:
> Hi all,
> 
> On Thu, 27 Aug 2020 08:38:39 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > /home/sfr/next/next/tools/perf/util/namespaces.c: In function 'nsinfo__new':
> > /home/sfr/next/next/tools/perf/util/namespaces.c:139:12: note: the layout of aggregates containing vectors with 8-byte alignment has changed in GCC 5
> >   139 |   nsi->pid = pid;
> >       |   ~~~~~~~~~^~~~~
> > 
> > I assume they are because I have changed all my toolcahins to gcc
> > v10 today.
> 
> From gcc v9, so I have no idea what the GGC 5 note is about.

Yeah, strange warning, and I reproduced it here with a container:

[perfbuilder@five x-powerpc64el]$ dm ubuntu:20.04-x-powerpc64el
Tue 01 Sep 2020 02:23:28 PM -03
# export PERF_TARBALL=http://192.168.122.1/perf/perf-5.9.0-rc1.tar.xz
# dm  ubuntu:20.04-x-powerpc64el
   1    37.44 ubuntu:20.04-x-powerpc64el    : Ok   powerpc64le-linux-gnu-gcc (Ubuntu 10-20200411-0ubuntu1) 10.0.1 20200411 (experimental) [master revision bb87d5cc77d:75961caccb7:f883c46b4877f637e0fa5025b4d6b5c9040ec566]
 2 37.4383
[perfbuilder@five x-powerpc64el]$

But then the build goes thru and finishes ok :-\


  CC       /tmp/build/perf/util/perf-hooks.o
  FLEX     /tmp/build/perf/util/parse-events-flex.c
  FLEX     /tmp/build/perf/util/pmu-flex.c
util/synthetic-events.c: In function 'perf_event__synthesize_sample':
util/synthetic-events.c:1441:22: note: the layout of aggregates containing vectors with 8-byte alignment has changed in GCC 5
 1441 |   u.val32[0] = sample->pid;
      |                ~~~~~~^~~~~
  CC       /tmp/build/perf/util/pmu-bison.o
  FLEX     /tmp/build/perf/util/expr-flex.c
  CC       /tmp/build/perf/util/expr-bison.o
  CC       /tmp/build/perf/util/parse-events.o
  CC       /tmp/build/perf/util/parse-events-flex.o
  CC       /tmp/build/perf/util/pmu.o
  CC       /tmp/build/perf/util/pmu-flex.o
  CC       /tmp/build/perf/util/expr-flex.o
  CC       /tmp/build/perf/util/expr.o
util/jitdump.c: In function 'jit_process':
util/jitdump.c:329:23: note: the layout of aggregates containing vectors with 8-byte alignment has changed in GCC 5
  329 |    jr->load.pid       = bswap_32(jr->load.pid);
      |                       ^
util/probe-finder.c: In function 'line_range_search_cb':
util/probe-finder.c:1887:17: note: the layout of aggregates containing vectors with 8-byte alignment has changed in GCC 5
 1887 |   lr->start = lf->lno_s;
      |               ~~^~~~~~~
util/pmu.c: In function '__perf_pmu__new_alias':
util/pmu.c:308:12: note: the layout of aggregates containing vectors with 2-byte alignment has changed in GCC 5
  308 | static int __perf_pmu__new_alias(struct list_head *list, char *dir, char *name,
      |            ^~~~~~~~~~~~~~~~~~~~~
  LD       /tmp/build/perf/util/intel-pt-decoder/perf-in.o
util/parse-events.c: In function 'parse_events__modifier_event':
util/parse-events.c:1892:5: note: the layout of aggregates containing vectors with 8-byte alignment has changed in GCC 5
 1892 | int parse_events__modifier_event(struct list_head *list, char *str, bool add)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
  LD       /tmp/build/perf/util/perf-in.o
  LD       /tmp/build/perf/perf-in.o
  LINK     /tmp/build/perf/perf
make: Leaving directory '/git/linux/tools/perf'
+ set +o xtrace
/rx_and_build.sh: 38: powerpc64le-linux-gnu-clang: not found
[perfbuilder@five x-powerpc64el]$
