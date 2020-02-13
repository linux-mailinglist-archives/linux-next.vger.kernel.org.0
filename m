Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E9E515BCEA
	for <lists+linux-next@lfdr.de>; Thu, 13 Feb 2020 11:35:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729494AbgBMKfl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 13 Feb 2020 05:35:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:34840 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729428AbgBMKfl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 13 Feb 2020 05:35:41 -0500
Received: from paulmck-ThinkPad-P72.home (unknown [193.85.242.128])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 787CD218AC;
        Thu, 13 Feb 2020 10:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581590140;
        bh=NIljgsYqVdaDxPgwZoKkDL5vFfJ8VuJH1KorovtlNRc=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=j1BhQ6p7gagtWdPoZEcA0Z8+IXZ87QOy5pb01g6eyi0IHP9kkYk1U+tAr81Lqj7Qb
         Us0fzY8wysZZSVMchl7y6hCjAB2jx/2XNTVVsTDZKShDSYWhwxWcFXL8zlSXOpaNGW
         MVA12yUKZofn52wZUDlWDICtg0IcVv2RSjsXvJZ0=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 0608535226E8; Thu, 13 Feb 2020 02:35:38 -0800 (PST)
Date:   Thu, 13 Feb 2020 02:35:38 -0800
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the rcu tree
Message-ID: <20200213103537.GX2935@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20200213092613.1b66d1f5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200213092613.1b66d1f5@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Feb 13, 2020 at 09:26:13AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   71901ffaf70d ("locktorture: Print ratio of acquisitions, not failures")
> 
> Fixes tag
> 
>   Fixes: 0af3fe1e ("locktorture: Add a lock-torture kernel module")
> 
> has these problem(s):
> 
>   - SHA1 should be at least 12 digits long
>     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>     or later) just making sure it is not set (or set to "auto").

Good catch, will fix, thank you!

							Thanx, Paul
