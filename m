Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF807193F21
	for <lists+linux-next@lfdr.de>; Thu, 26 Mar 2020 13:45:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728179AbgCZMpg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Mar 2020 08:45:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:47038 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728134AbgCZMpg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 26 Mar 2020 08:45:36 -0400
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net [50.39.105.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3E7162073E;
        Thu, 26 Mar 2020 12:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585226736;
        bh=T3njjh52p6b6vwMAGsltE6JPsOJ6iFn2pTAXPMFbFEw=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=IDMlgWG3lnFabwznCUlcO2222T84eZfQ55i9628ivHdbWvYs5fR4PMwFgxMcH+RTH
         yU1tye/btJBuBjCdB101qzNnawm3KfDT7eFw2vb5Wuw/GE9+EdMsybiXeOsQ0CJSmb
         M4HdWwL0V0x+dgo2CmPVUSKJhr/qMf4X78UEOKiA=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 0CDBB35226C6; Thu, 26 Mar 2020 05:45:36 -0700 (PDT)
Date:   Thu, 26 Mar 2020 05:45:36 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Greg KH <greg@kroah.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: linux-next: manual merge of the rcu tree with the spdx tree
Message-ID: <20200326124535.GK19865@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20200326141235.718118af@canb.auug.org.au>
 <20200326075550.GB957772@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200326075550.GB957772@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Mar 26, 2020 at 08:55:50AM +0100, Greg KH wrote:
> On Thu, Mar 26, 2020 at 02:12:35PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the rcu tree got a conflict in:
> > 
> >   tools/memory-model/litmus-tests/.gitignore
> > 
> > between commit:
> > 
> >   d198b34f3855 (".gitignore: add SPDX License Identifier")
> > 
> > from the spdx tree and commits:
> > 
> >   5381fb2b70e9 ("tools/memory-model: Move from .AArch64.litmus.out to .litmus.AArch.out")
> >   dafa02882066 ("tools/memory-model: Keep assembly-language litmus tests")
> > 
> > from the rcu tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> 
> Looks good, thanks.

Works for me as well!

							Thanx, Paul
