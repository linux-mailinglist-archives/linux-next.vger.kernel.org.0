Return-Path: <linux-next+bounces-6055-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95258A74409
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 07:40:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BD26189A684
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 06:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BCF319ABAC;
	Fri, 28 Mar 2025 06:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iprBUj+Q"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9422BB15;
	Fri, 28 Mar 2025 06:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743144020; cv=none; b=FILIuwxCUWfI+d3xNU06PimLqEsz3Kpr9BcZcgsFYWNTLHLEjmBfkwcHLpOXZzCKM4LyNG201LK6wGk2kUOPYmztebhT7DhWfB/6cB842IgHZmnvMR74MDUEUov03f2w0MzRf3+CxvBZ/0iamZmJ9dRFbjIfM4x2ng09LedlQ7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743144020; c=relaxed/simple;
	bh=fXblTMTNl+XXtgndGLjOqUB3hBj8J/x153D/KMVlfvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jASfaioJLrw99ZAMX0yjXONHWE9toU1AvULXV/TR2A6h3yO1WGx+pDt+XPmAFPNROvyBnec8JWp/6esEVrDYLz112+t2Sr6UGWNU/UP6IQt2KrfSpfLqifAg0LOMbcOHS6wmKb0Pgn5nsc+cT66WHLODEMWwdUDQOXsnY2Pgsls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iprBUj+Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF741C4CEE4;
	Fri, 28 Mar 2025 06:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743144019;
	bh=fXblTMTNl+XXtgndGLjOqUB3hBj8J/x153D/KMVlfvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iprBUj+QthpOYpnJJ4Hoz8sWtvxOz9SoqD9GtdainCmS39lsBe1iqH0ZB+dYe5DOf
	 WH1ajtOwX8DBAsPm1zNHytoLy7n7+2HbTzAvJRXodv5LQEL+SigBHoKp76eCZ8AAve
	 U6fREz/4/VHLFd1H6RzlGlET443kW2tDCrfmV7hESAq9M4oc/oTwdwPETXcMRHbuZb
	 cN6yt20qhf89nqHOluG7UNL6zUewTiJf3CJkrRDDXPLLGAAmLSFdNvngoAcpjkZ2hv
	 6CNgS7qL5BG6npw4Gta2Uy6LtWGyzZEIdLvUwEtrichkqPoN+ESM1Tck1Emi6P3WnY
	 MGB3mm7kHFixw==
Date: Thu, 27 Mar 2025 23:40:18 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the perf tree
Message-ID: <Z-ZEUtZJPZ4BwA5r@google.com>
References: <20250327102234.50ad6e84@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250327102234.50ad6e84@canb.auug.org.au>

Hello,

On Thu, Mar 27, 2025 at 10:22:34AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the perf tree, today's linux-next build (native ppc perf)
> failed like this:
> 
> perf/util/bpf-filter-flex.c:2245:1: error: unterminated comment
>  2245 | /** Pushes the new state onto the stack. The new state becomes
>       | ^
> perf/util/bpf-filter-flex.c:20:31: error: 'perf_bpf_filter_ensure_buffer_stack' used but never defined [-Werror]
>    20 | #define yyensure_buffer_stack perf_bpf_filter_ensure_buffer_stack
>       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> perf/util/bpf-filter-flex.c:550:13: note: in expansion of macro 'yyensure_buffer_stack'
>   550 | static void yyensure_buffer_stack ( void );
>       |             ^~~~~~~~~~~~~~~~~~~~~
> perf/util/bpf-filter-flex.c:606:24: error: 'yy_fatal_error' used but never defined [-Werror]
>   606 | static void yynoreturn yy_fatal_error ( const char* msg  );
>       |                        ^~~~~~~~~~~~~~
> perf/util/bpf-filter-flex.c:510:15: error: 'yy_buffer_stack_max' defined but not used [-Werror=unused-variable]
>   510 | static size_t yy_buffer_stack_max = 0; /**< capacity of stack. */
>       |               ^~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> 
> I don't know what caused this, but simply rebuilding worked.  So maybe
> some dependency is missing in the make files?

Strange, but it seems so.  I'll take a look if I missed something.
Thanks for the report and your hard work!

Namhyung


