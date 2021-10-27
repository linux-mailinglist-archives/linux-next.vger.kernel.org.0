Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9BA843CA2A
	for <lists+linux-next@lfdr.de>; Wed, 27 Oct 2021 14:55:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231407AbhJ0M5a (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Oct 2021 08:57:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:47642 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242037AbhJ0M5a (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 27 Oct 2021 08:57:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B661A61052;
        Wed, 27 Oct 2021 12:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1635339297;
        bh=S53tmzfO64af4LFeF9wll6hR3ZlFA+BpMaW8MGlR+Cg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R300E1foo1du5sbZ8+MPTKVk5ubTU02dEsSkRBQM7vppokvrWnfCx69aFi6afXX8Q
         dHFt4zJCkSXn7rW7EuKkQbgN3e9qAzuIKv3Md5F6DJr8ipEWxpIea8bxKbZb8IPeBt
         hPqdC/CeR2rA/vG38Q7u+/RT3HkE8Rv52dD/r7z0=
Date:   Wed, 27 Oct 2021 14:54:54 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Xianting Tian <xianting.tian@linux.alibaba.com>,
        Shile Zhang <shile.zhang@linux.alibaba.com>
Subject: Re: linux-next: Tree for Oct 25
Message-ID: <YXlMHoxvj1Mn26H4@kroah.com>
References: <20211025204921.73cb3011@canb.auug.org.au>
 <20211027224231.1634cc6c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211027224231.1634cc6c@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Oct 27, 2021 at 10:42:31PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 25 Oct 2021 20:49:21 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > There seems to be something amiss with cnosole output in today's release
> > (at least on my ppc qemu boot tests).
> 
> The console output seems to be back today.  I assume its repair had
> something to do with commit
> 
>   60f41e848492 ("Revert "tty: hvc: pass DMA capable memory to put_chars()"")

Probably, sorry about that, don't have ppc hardware to test this mess
on.  I would have thought that the patch authors would have done so...

thanks,

greg k-h
