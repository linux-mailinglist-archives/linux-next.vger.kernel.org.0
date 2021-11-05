Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD8EF446166
	for <lists+linux-next@lfdr.de>; Fri,  5 Nov 2021 10:34:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232546AbhKEJhV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 5 Nov 2021 05:37:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:46068 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230175AbhKEJhV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 5 Nov 2021 05:37:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C24D46120E;
        Fri,  5 Nov 2021 09:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636104882;
        bh=ryWKPdIthphOv1QYb6csNjfCJLapv+hZN1ZYnQ/shn4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Hung7XssMexOBvIUIadlPg5BQ9vK6i5Oos+9Kn3rIq+u7oTH1B+E6EnSafZctfzDP
         g4U3TCsrNxOFmhOpRq1+FdompopqdvqW/CnzvGj9VXNyxjLkFA243x5g8iMs6MdJTp
         XIPpj8vJzJ6XkFal6LL7AfwVmFv90n/P+qxXrVhmsejEG8qWxtskgkQ12vjH2X1xvU
         GdfX1qDGCnLlCI/B7WFb4CPHVP54tMmNhxHXvTLo/EzET6vYDMaZ/Urs0P17uE+rjh
         /gWwDQI/QrXa0OdOml2FWGvDDShqGXJ1409jOitSug99GEf1Ir5PMvTwe6wyDjYldk
         koZ3W3q19NDgA==
Date:   Fri, 5 Nov 2021 09:34:37 +0000
From:   Will Deacon <will@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Subject: Re: linux-next: manual merge of the arm64 tree with Linus' tree
Message-ID: <20211105093437.GB32036@willie-the-truck>
References: <20211104093208.0380c1f2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211104093208.0380c1f2@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Nov 04, 2021 at 09:32:08AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the arm64 tree got conflicts in:
> 
>   arch/arm64/include/asm/stacktrace.h
>   arch/arm64/kernel/stacktrace.c
> 
> between commit:
> 
>   cd9bc2c92588 ("arm64: Recover kretprobe modified return address in stacktrace")
> 
> from Linus' tree and commit:
> 
>   552e196d88e5 ("arm64: ftrace: use HAVE_FUNCTION_GRAPH_RET_ADDR_PTR")
> 
> from the arm64 tree.

D'oh, having realised this conflict last week, I completely forgot about
it when queuing that fix from Mark. I'll just drop it and wait until -rc1.

Cheers,

Will
