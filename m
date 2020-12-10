Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84EB32D5428
	for <lists+linux-next@lfdr.de>; Thu, 10 Dec 2020 07:51:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387607AbgLJGsv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Dec 2020 01:48:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730820AbgLJGsu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Dec 2020 01:48:50 -0500
Received: from nautica.notk.org (ipv6.notk.org [IPv6:2001:41d0:1:7a93::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 221EFC0613CF
        for <linux-next@vger.kernel.org>; Wed,  9 Dec 2020 22:48:10 -0800 (PST)
Received: by nautica.notk.org (Postfix, from userid 1001)
        id 2C95AC009; Thu, 10 Dec 2020 07:47:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org; s=2;
        t=1607582846; bh=CeXoCUKMON5YU5rHxPI+L+5A1EbCCf8M0F43PjWAz8Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X3TWBjHK4dE4RDjYtxHWJ/3/LGEiPaX+nS+SahytVl312G2LMxkMZQ+ygTusu21EI
         IIDfhBOvFIz96VMlBOg3anlHGl+N5JVK3XpRL3a51NggI8LcBk1hIQIOz8zCjd2Mlf
         1dbVGh8QTr6rm+gylBELiIJyt3MkmzNf6fAaP/XOj97SslE/fs9lwChh3yo4a0tjRz
         IWRF9SUv7vlJaGShz9xmI7j5oJBnm6FKx62usvLpvuEhJz3HqVjrbSUav4dhTTLhHa
         Gq7kohW4ar5Xqn0XrnzYOFyxTJG9Qpp5ZdlRvzE7FrfZy1uzDI0EGvcYh2N76IEqY+
         B06UjBBnAEFKw==
Date:   Thu, 10 Dec 2020 07:47:11 +0100
From:   Dominique Martinet <asmadeus@codewreck.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the kbuild tree
Message-ID: <20201210064711.GA10169@nautica>
References: <20201209203029.7f2a8db2@canb.auug.org.au>
 <20201209130130.GA15469@nautica>
 <20201210075645.234a735d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201210075645.234a735d@canb.auug.org.au>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell wrote on Thu, Dec 10, 2020:
> On Wed, 9 Dec 2020 14:01:30 +0100 Dominique Martinet <asmadeus@codewreck.org> wrote:
> >
> > I guess it's possible to make kbuild check both sbin and PATH, would
> > that be acceptable?
> 
> I guess so.  But, have you actually found any setup where depmod is not
> /sbin/depmod?  i.e. what problem are you trying to solve.  As far as I
> can see all this change does is (ever so slightly) slow down the build
> for no gain.

On nixos, depmod is in /run/current-system/sw/bin/depmod (as a link to
/nix/store/r3r39rzsrikdsv68rvswn3hhank706gj-kmod-27/bin/depmod or
wherever the current version wants to be).
developers on guix probably face the same problem.

There is no sbin, the only things in /bin is sh, and in /usr/bin env as
I think is mandated by posix.

For their official builds they just modify the build scripts in place
before starting the build, but for dev as I keep rebasing it's annoying
to keep a couple of local patches just for this.
I could obviously manually create a link from /sbin/depmod to the
current system's but that doesn't solve the problem for all other nixos
users.

I'll send an updated patch later today..
-- 
Dominique
