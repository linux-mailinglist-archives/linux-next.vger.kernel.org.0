Return-Path: <linux-next+bounces-2576-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DAD90C26A
	for <lists+linux-next@lfdr.de>; Tue, 18 Jun 2024 05:21:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C7711F252B1
	for <lists+linux-next@lfdr.de>; Tue, 18 Jun 2024 03:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E75F92B9A6;
	Tue, 18 Jun 2024 03:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uJN8n/5G"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8D415E9B;
	Tue, 18 Jun 2024 03:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718680893; cv=none; b=HjAYdrCcICJMSyg3xY3uO7clXr1i5WtBhsoIBhNb79ZSae5sdxckA7XpUuZI5GmvuwYPtWSATRnFrZunPqRRvKORVNFLeAxyABalfqJNAXHeGi6gKxK4OErpjAJCI3CqMWuUPtiaWyiOathlARpogDZLabjw4sYQ28laioTJk4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718680893; c=relaxed/simple;
	bh=6jZ0QYW1JZqG9kTxATKeu5rFdbazOeVGNKmFDr/+BdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N2VH1EXSkQX2zQKxH1jU69ScVE+xYwpFZdG1/SjnwyVbWXWX8eJ1S7Fo1rY40xzKsyyLHGbBgCC1iEPIaqrDnPm1PsVbRR649y4+/i1MizLv8TF40DZhC+FnjUmPkMs/672MIw+BEO47fXi6t1mpZ3aEgKmLYlrIean1WS6MQMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uJN8n/5G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9955AC2BD10;
	Tue, 18 Jun 2024 03:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718680893;
	bh=6jZ0QYW1JZqG9kTxATKeu5rFdbazOeVGNKmFDr/+BdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uJN8n/5GM/vex8EvzTTPE0aKukJjIbxt+ZbYo/DQp7nT23U9nkg/tnqKuAIZdochy
	 yzRiVMs0re6Cjt1PYttZWCxmeD8gKj/PD+qFaTOsXowwIS3SV4apP/iHWaHM7pRP+0
	 f++kYduBgzalR4Gr+LB9pXCYDHu+Yw1dPmFUxo6Lh6tu5jtGoxChJB0KEkjfhEx7xo
	 kfcvYfTyYwoc2hamrhPfiSQBq3CDa4N9MG2Hf1AQkYWEuZWHo/zc1C486b1uXYZfuh
	 xFGeQpPOyGGRrcKYvn9UYr3bSnnjjW0/v8dghL2nCpG4cWHyYj103IFPPf8CKabmAz
	 PgqRJN2i8SEJw==
Date: Mon, 17 Jun 2024 20:21:30 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Ian Rogers <irogers@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the perf tree with the origin tree
Message-ID: <ZnD9OvU3pKceZsax@google.com>
References: <ZnBi5u4CdumbMzcB@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZnBi5u4CdumbMzcB@sirena.org.uk>

Hello,

On Mon, Jun 17, 2024 at 05:23:02PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the perf tree got a conflict in:
> 
>   tools/perf/builtin-record.c
> 
> between commit:
> 
>   5b3cde198878b ("Revert "perf record: Reduce memory for recording PERF_RECORD_LOST_SAMPLES event"")
> 
> from the origin tree and commit:
> 
>   6c1785cd75ef5 ("perf record: Ensure space for lost samples")
> 
> from the perf tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks for doing this!  The resolution looks good.  I plan to merge
the revert and other fixes in the v6.10 tree into perf-tools-next
before v6.11 window open.

Thanks,
Namhyung

> 
> diff --git a/tools/perf/builtin-record.c b/tools/perf/builtin-record.c
> index 0a8ba1323d64b..019305b94e5fc 100644
> --- a/tools/perf/builtin-record.c
> +++ b/tools/perf/builtin-record.c
> @@ -1926,7 +1926,7 @@ static void __record__save_lost_samples(struct record *rec, struct evsel *evsel,
>  static void record__read_lost_samples(struct record *rec)
>  {
>  	struct perf_session *session = rec->session;
> -	struct perf_record_lost_samples *lost = NULL;
> +	struct perf_record_lost_samples_and_ids lost;
>  	struct evsel *evsel;
>  
>  	/* there was an error during record__open */
> @@ -1951,19 +1951,13 @@ static void record__read_lost_samples(struct record *rec)
>  
>  				if (perf_evsel__read(&evsel->core, x, y, &count) < 0) {
>  					pr_debug("read LOST count failed\n");
> -					goto out;
> +					return;
>  				}
>  
>  				if (count.lost) {
> -					if (!lost) {
> -						lost = zalloc(PERF_SAMPLE_MAX_SIZE);
> -						if (!lost) {
> -							pr_debug("Memory allocation failed\n");
> -							return;
> -						}
> -						lost->header.type = PERF_RECORD_LOST_SAMPLES;
> -					}
> -					__record__save_lost_samples(rec, evsel, lost,
> +					memset(&lost.lost, 0, sizeof(lost));
> +					lost.lost.header.type = PERF_RECORD_LOST_SAMPLES;
> +					__record__save_lost_samples(rec, evsel, &lost.lost,
>  								    x, y, count.lost, 0);
>  				}
>  			}
> @@ -1971,20 +1965,12 @@ static void record__read_lost_samples(struct record *rec)
>  
>  		lost_count = perf_bpf_filter__lost_count(evsel);
>  		if (lost_count) {
> -			if (!lost) {
> -				lost = zalloc(PERF_SAMPLE_MAX_SIZE);
> -				if (!lost) {
> -					pr_debug("Memory allocation failed\n");
> -					return;
> -				}
> -				lost->header.type = PERF_RECORD_LOST_SAMPLES;
> -			}
> -			__record__save_lost_samples(rec, evsel, lost, 0, 0, lost_count,
> +			memset(&lost.lost, 0, sizeof(lost));
> +			lost.lost.header.type = PERF_RECORD_LOST_SAMPLES;
> +			__record__save_lost_samples(rec, evsel, &lost.lost, 0, 0, lost_count,
>  						    PERF_RECORD_MISC_LOST_SAMPLES_BPF);
>  		}
>  	}
> -out:
> -	free(lost);
>  }
>  
>  static volatile sig_atomic_t workload_exec_errno;
> @@ -3196,7 +3182,7 @@ static int switch_output_setup(struct record *rec)
>  	unsigned long val;
>  
>  	/*
> -	 * If we're using --switch-output-events, then we imply its 
> +	 * If we're using --switch-output-events, then we imply its
>  	 * --switch-output=signal, as we'll send a SIGUSR2 from the side band
>  	 *  thread to its parent.
>  	 */



