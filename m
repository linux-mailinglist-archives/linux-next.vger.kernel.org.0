Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E81AF179B25
	for <lists+linux-next@lfdr.de>; Wed,  4 Mar 2020 22:41:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729936AbgCDVkl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 Mar 2020 16:40:41 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51386 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729144AbgCDVkl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 4 Mar 2020 16:40:41 -0500
Received: by mail-wm1-f67.google.com with SMTP id a132so3913812wme.1;
        Wed, 04 Mar 2020 13:40:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=H3ncs9nO2IlApypaRLZN3MRuR8Yx19Iov1PiV/hFiX4=;
        b=WxkMTByeqF9D1HOhUZFWQJuT3vqbJchTdyAkVhgRWopDlhcP8Ym3iHyPj3Q5Jnr5Ts
         K0w9Vk7BuHQmsfhEbssBnWSsDo+V4k72hwj+WqH+mb5kDHEVl6CQxkd3Z+5HnQ/AlZvW
         bfI2cb/qT2eZiKeZOk8KXZQUDW9w1vlf5cjcR1IoENKWVs2yhg4hLc4WdKfymKYOFuq+
         V5IGEI4DFi7OYm8lbtQpyASdyXFk1T8oSuDAVwAD7X9I72CvByBC9x7zLXET8yaDlQuw
         oacW4gO2XTxFeHkPQ4UFalIv4ZR11T3IyE7dT5mewz4upiPI1jJ7DMQHcTz2+LgRah7C
         1QXQ==
X-Gm-Message-State: ANhLgQ13mBjlfURxfSns9t0pXDJJUEwuMlHVEaS9BCanyOFKYhrV1UMy
        QHcqPBkjwINSWfjBfkHAL0Y=
X-Google-Smtp-Source: ADFU+vtg8FbEfDH8P+JEnYUFDqaoNtghmxgx0Ln5CqyZNcDlr2FJrr7OL+rMxq3gclaYyR+2FSPG5Q==
X-Received: by 2002:a7b:cc14:: with SMTP id f20mr5068049wmh.132.1583358039520;
        Wed, 04 Mar 2020 13:40:39 -0800 (PST)
Received: from debian (41.142.6.51.dyn.plus.net. [51.6.142.41])
        by smtp.gmail.com with ESMTPSA id t133sm6641193wmf.31.2020.03.04.13.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 13:40:38 -0800 (PST)
Date:   Wed, 4 Mar 2020 21:40:36 +0000
From:   Wei Liu <wei.liu@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Sasha Levin <sashal@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wei Liu <wei.liu@kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the hyperv tree
Message-ID: <20200304214036.qbzk3vkwds7apbkd@debian>
References: <20200305080328.6057e006@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200305080328.6057e006@canb.auug.org.au>
User-Agent: NeoMutt/20180716
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Mar 05, 2020 at 08:03:28AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>   40d1d2d6e89e ("HID: hyperv: NULL check before some freeing functions is not needed.")
>   1ff9f3ae8459 ("Hyper-V: Drop Sasha Levin from the Hyper-V maintainers")
> 
> are missing a Signed-off-by from their committer.

I'm still figuring things out at this stage. Thanks for pointing this out.
I will fix those commits.

Sasha suggested those patches be sent as fixes for the next -rc. I plan
to do that tomorrow. Please drop hyperv-next for today's merge.

> 
> BTW: Should I have a different differetn contact for the hyperv tree, now?

Yes. Please direct hyperv tree issues to me in the future.

Wei.

> 
> -- 
> Cheers,
> Stephen Rothwell


