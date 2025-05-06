Return-Path: <linux-next+bounces-6551-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E623AACB01
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 18:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94C651BC505B
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 16:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFF3B284B21;
	Tue,  6 May 2025 16:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dg1gnr+K"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC09327BF8D
	for <linux-next@vger.kernel.org>; Tue,  6 May 2025 16:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746548977; cv=none; b=A4aTMd6TrD1sgoE5gm1ObZwuUoYfwa4Ss+LHZFV9I8gDMeKQUnem+wBraJ3SYyS8y++sxY8cB0HR6ra+9tLUkLstg4/SE4kl5/56OwDUzu1seGRnCkE/x8K5+emPWVOqSMQjtA1hpC9x+Kk0yVod8pVwAtfjeaSyTa02XeUk1/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746548977; c=relaxed/simple;
	bh=7R3zVpyXS5fgKY6xCyXq5lr4YHcqbAFg1ZerIx8Ypdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=djESfoKGroXLxG6q3m39laMlqD/crmFh6olnpsbi4JHH5wUbYpV6oaTK/BW89MpoZnMjtnlHA11TwoEkbK575sbgOTVWIkC1H3ad0Jf41TaveSqRnoUDdn9n0/0zWAgIa9qCvje0ehx22o4IG09YmzgV343jLuuHED5ScSZMe6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dg1gnr+K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30701C4CEE4;
	Tue,  6 May 2025 16:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746548977;
	bh=7R3zVpyXS5fgKY6xCyXq5lr4YHcqbAFg1ZerIx8Ypdw=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Dg1gnr+KYRv0ul8CQeKblsvc1B3KnJUtzAPL/uE7pNGpfyxkbAjqXWIItUrNBhw9F
	 zOaSeNPoCdw9IfJ3uwBhGJNs8C53IOnvNlvzFmdKubnqcbKY/5pBkOunrebn4RVNOu
	 han/GNZU4u3u7rWisj2Fn+246kbpzyEXrAytPBCxxCD09hqXUBIN2PUHf2AE2DXotv
	 v9kIMYTk0XCZVCJC5U1nqecr/eSY5zKb7id5HG2vTnc/vUd80OMUOw8JT0duvmp/74
	 pszuHRhjAhIJ/0SPhFwAWH6boTW+pLe4oRKf8Qrv3cts7+FeeLWnQq6Q6rxcc7vc1l
	 IoecUTK7T5/Ng==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id CE36ACE1FCA; Tue,  6 May 2025 09:29:36 -0700 (PDT)
Date: Tue, 6 May 2025 09:29:36 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Junxian Huang <huangjunxian6@hisilicon.com>
Cc: Leon Romanovsky <leon@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Subject: Re: [BUG] allmodconfig build failure in hns_roce_trace.h
Message-ID: <b7dd4dda-37d8-47e4-8d78-b6585be21cfd@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <0ea657ca-71cb-498d-a5d5-43300f30523d@paulmck-laptop>
 <ac171cd6-82a8-e3b6-addc-c1c515470c9f@hisilicon.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac171cd6-82a8-e3b6-addc-c1c515470c9f@hisilicon.com>

On Tue, May 06, 2025 at 02:04:34PM +0800, Junxian Huang wrote:
> 
> 
> On 2025/5/6 5:50, Paul E. McKenney wrote:
> > Hello!
> > 
> > I ran into an allmodconfig build error in next-20250505 and a few of
> > its predecessors on x86.  The patch shown below makes it build without
> > errors, and might even be a proper patch.
> > 
> > An alternative fix might be to use the "-I" compiler command-line argument
> > to inform it of this additional place to look for include files.
> > 
> > 							Thanx, Paul
> > 
> > ------------------------------------------------------------------------
> > 
> > hns: Fix hns_roce_trace.h allmodconfig build failure
> > 
> > When doing an allmodconfig build next-20250505 and a few of its predecessors on x86, I
> > get the following build error:
> > 
> > In file included from drivers/infiniband/hw/hns/hns_roce_trace.h:213,
> >                  from drivers/infiniband/hw/hns/hns_roce_hw_v2.c:53:
> > ./include/trace/define_trace.h:110:42: fatal error: ./hns_roce_trace.h: No such file or directory
> >   110 | #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
> >       |                                          ^
> > compilation terminated.
> > 
> > This appears to have been introduced by this commit:
> > 
> > 02007e3ddc07 ("RDMA/hns: Add trace for flush CQE")
> > 
> > Fix (or at least suppress) this by adding the path needed to find the
> > include file.
> > 
> > Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > 
> > ---
> > 
> > diff --git a/drivers/infiniband/hw/hns/hns_roce_trace.h b/drivers/infiniband/hw/hns/hns_roce_trace.h
> > index 23cbdbaeffaa4..bec69b6dca5da 100644
> > --- a/drivers/infiniband/hw/hns/hns_roce_trace.h
> > +++ b/drivers/infiniband/hw/hns/hns_roce_trace.h
> > @@ -207,7 +207,7 @@ DEFINE_EVENT(cmdq, hns_cmdq_resp,
> >  #endif /* __HNS_ROCE_TRACE_H */
> >  
> >  #undef TRACE_INCLUDE_FILE
> > -#define TRACE_INCLUDE_FILE hns_roce_trace
> > +#define TRACE_INCLUDE_FILE ../../../drivers/infiniband/hw/hns/hns_roce_trace
> 
> Hi Paul, thanks for the report.
> 
> I'd prefer not to change this part as it is the standard definition of
> trace headers. Can you please test the patch below?

Looks better to me as well, and even better yet, it works.  ;-)

Tested-by: Paul E. McKenney <paulmck@kernel.org>

> diff --git a/drivers/infiniband/hw/hns/Makefile b/drivers/infiniband/hw/hns/Makefile
> index 7917af8e6380..baf592e6f21b 100644
> --- a/drivers/infiniband/hw/hns/Makefile
> +++ b/drivers/infiniband/hw/hns/Makefile
> @@ -4,6 +4,7 @@
>  #
> 
>  ccflags-y :=  -I $(srctree)/drivers/net/ethernet/hisilicon/hns3
> +ccflags-y +=  -I $(src)
> 
>  hns-roce-hw-v2-objs := hns_roce_main.o hns_roce_cmd.o hns_roce_pd.o \
>         hns_roce_ah.o hns_roce_hem.o hns_roce_mr.o hns_roce_qp.o \
> 
> 
> >  #undef TRACE_INCLUDE_PATH
> >  #define TRACE_INCLUDE_PATH .
> >  #include <trace/define_trace.h>

