Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B464D2A7A47
	for <lists+linux-next@lfdr.de>; Thu,  5 Nov 2020 10:17:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbgKEJRj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Nov 2020 04:17:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:55400 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726152AbgKEJRi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 5 Nov 2020 04:17:38 -0500
Received: from kernel.org (unknown [2.55.183.164])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E99BE2071A;
        Thu,  5 Nov 2020 09:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604567858;
        bh=I573k6QlJy3XTSysKWkuF7joOCnf6HO0CmWainydeUg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hMLbUMcAdOyKwfGgZ3j2w1dq9FPs5VB17aZTFuL1Y0mJvEnw+TMQnmjhAR64FQnui
         fR4lcIgNbkhOoqdkOu8msn8aFRMkIy9CbGSVNvVbshDYjZc7GqbwFLIMNxSD71Tjhv
         9BmRx3FMbBs3kzvclkWpIdNeBBSHfHoXssGP7qCs=
Date:   Thu, 5 Nov 2020 11:17:30 +0200
From:   Mike Rapoport <rppt@kernel.org>
To:     "Anand K. Mistry" <amistry@google.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Message-ID: <20201105091730.GW4879@kernel.org>
References: <20201105174549.614c2de4@canb.auug.org.au>
 <20201105070311.GU4879@kernel.org>
 <CAATStaMD=w+onf==L-=MQ7suJf6EaNoup5o8yW-TEbfajkbdaQ@mail.gmail.com>
 <CAATStaMEn_CSfvc=JTawGhL8yt3L0cci8XK9ru+F6RGzRcYJ7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAATStaMEn_CSfvc=JTawGhL8yt3L0cci8XK9ru+F6RGzRcYJ7A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Nov 05, 2020 at 06:45:04PM +1100, Anand K. Mistry wrote:
> SNIPPED
> 
> > >
> > > Looks like left column became too wide, so rather than shift the right
> > > column to the right, I'd suggest to drop underscores in Speculation*.
> >
> > Hm. That makes it inconsistent with Speculation_Store_Bypass. I guess
> > it's the lesser of two evils.
> 
> Oh, do you mean renaming the existing Speculation_Store_Bypass? I
> thought that was a big no-no for the kernel?

Right, renaming is not an option :)

I thought Speculation_Store_Bypass was also introduced by the same
patch, sorry about the confusion. 

-- 
Sincerely yours,
Mike.
