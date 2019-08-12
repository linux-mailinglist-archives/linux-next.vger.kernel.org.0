Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37F2589685
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2019 06:57:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725838AbfHLE5g (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Aug 2019 00:57:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:40722 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725822AbfHLE5g (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Aug 2019 00:57:36 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D326620842;
        Mon, 12 Aug 2019 04:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565585855;
        bh=KG4ZmdjX9K6T7CBGRwekyId1/FvEn4buIVypXsfvxdE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=n50q2x3WqPNsP3y+eR2IEK1COQjwzMeY8yNE/vtjj+nHM1icxAslvBs7ZGZX7pa3p
         yXFgkk/WgFrgD+DnRJxj1C4EayNHeR5PB06HV/OnfEKDhqUZOnCmlqZwAPn5uHK6e4
         v8CelaQMMZQkr3z35NMIn0zNuEJeH0+k+vw3eTNo=
Date:   Mon, 12 Aug 2019 06:57:31 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Add SPDX kernel tree to linux-next
Message-ID: <20190812045731.GA5834@kroah.com>
References: <20190810115533.GA6302@kroah.com>
 <20190812072659.606b2107@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812072659.606b2107@canb.auug.org.au>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Aug 12, 2019 at 07:26:59AM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> On Sat, 10 Aug 2019 13:55:33 +0200 Greg KH <gregkh@linuxfoundation.org> wrote:
> > 
> > I realized that I've been sending patches to Linus from my "SPDX" kernel
> > tree for a few releases now, and it's not included in linux-next, which
> > is not good.
> > 
> > So, could you please add the kernel tree / branch at:
> > 	git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/spdx.git spdx-linus
> > 
> > to linux-next?
> 
> Added from today.  One question: is this meant to be a -next tree or a
> -fixes tree?

A "-fixes" tree, it should be sent to Linus for the latest release.

thanks,

greg k-h
