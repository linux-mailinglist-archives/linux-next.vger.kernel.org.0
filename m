Return-Path: <linux-next+bounces-253-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E9337806FCF
	for <lists+linux-next@lfdr.de>; Wed,  6 Dec 2023 13:33:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 815D4B20D98
	for <lists+linux-next@lfdr.de>; Wed,  6 Dec 2023 12:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B4C936AE4;
	Wed,  6 Dec 2023 12:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H4zM4TYq"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80ECD36AE8
	for <linux-next@vger.kernel.org>; Wed,  6 Dec 2023 12:33:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBAACC433C7;
	Wed,  6 Dec 2023 12:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701866027;
	bh=jP8oTQYcoTQ/+jzJe9HomCjknj3ke/BfjtCVDvJLPxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H4zM4TYqeShLinEyDI2UvMarRD2zz4PARkf24a/dah9LQ2qAKA1kf7TE9gYro6Q/y
	 EIk2Wspbx28eTBl7OpsnqTnjI6PMO8jAm1B37+h2Bhjr9XkiFdK8xZD5z/DMu5nUN0
	 2e2o6j1GeAqsEQlQWjDNsNakPJx1WtGYcwF1JmHdC9W7GgvYdaIZf7orH491B/nMA1
	 L0NJz/hDAniZrFKP3JmVxS2tHyxUjH7Ed2aj29Pf6j+XB5CdaKYKrREI54JnfHEnrT
	 SlONgRaXybAXNEavCZ76hjpWExGaZ0x3MjyHOVeq5WaZaygoaP/EEd90beryR2VIFc
	 v7vOW7Rp2aL0A==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 71025403EF; Wed,  6 Dec 2023 09:33:45 -0300 (-03)
Date: Wed, 6 Dec 2023 09:33:45 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the perf tree
Message-ID: <ZXBqKaGRF8y/2K9b@kernel.org>
References: <20231206091433.68f59ba1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231206091433.68f59ba1@canb.auug.org.au>
X-Url: http://acmel.wordpress.com

Em Wed, Dec 06, 2023 at 09:14:33AM +1100, Stephen Rothwell escreveu:
> Commit
 
>   08b953508560 ("perf evsel: Fallback to "task-clock" when not system wide")
 
> is missing a Signed-off-by from its author.

Thanks for the report, fixed, the issue was that Ian's S-o-B was after a

--- line and thus git-am chopped it up :-\

===============================================================================

When the cycles event isn't available evsel will fallback to the
cpu-clock software event. task-clock is similar to cpu-clock but only
runs when the process is running. Falling back to cpu-clock when not
system wide leads to confusion, by falling back to task-clock it is
hoped the confusion is less.

Pass the target to determine if task-clock is more appropriate. Update
a nearby comment and debug string for the change.

---
v2. Use target__has_cpu as suggested by Namhyung.
https://lpc.events/event/17/contributions/1556/

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-record.c |  2 +-
 tools/perf/builtin-stat.c   |  2 +-
 tools/perf/builtin-top.c    |  2 +-
 tools/perf/util/evsel.c     | 18 ++++++++++--------
 tools/perf/util/evsel.h     |  3 ++-
 5 files changed, 15 insertions(+), 12 deletions(-

--
===============================================================================

I'll check my pre-commit hooks to see why this didn't get flagged...

- Arnaldo

