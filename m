Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 620BE25BF47
	for <lists+linux-next@lfdr.de>; Thu,  3 Sep 2020 12:45:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728372AbgICKo4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Sep 2020 06:44:56 -0400
Received: from elvis.franken.de ([193.175.24.41]:50761 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726292AbgICKos (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 3 Sep 2020 06:44:48 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kDmjV-0001dG-00; Thu, 03 Sep 2020 12:44:45 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 08CEBC0E88; Thu,  3 Sep 2020 12:01:19 +0200 (CEST)
Date:   Thu, 3 Sep 2020 12:01:19 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Huang Pei <huangpei@loongson.cn>
Subject: Re: linux-next: Fixes tag needs some work in the mips-fixes tree
Message-ID: <20200903100118.GA9038@alpha.franken.de>
References: <20200903184259.74a4f24f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903184259.74a4f24f@canb.auug.org.au>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Sep 03, 2020 at 06:42:59PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   f8a005e1632c ("MIPS: add missing MSACSR and upper MSA initialization")
> 
> Fixes tag
> 
>   Fixes: cc97ab235f ("MIPS: Simplify FP context initialization")
> 
> has these problem(s):
> 
>   - SHA1 should be at least 12 digits long
>     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>     or later) just making sure it is not set (or set to "auto").

it's fixed now.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
