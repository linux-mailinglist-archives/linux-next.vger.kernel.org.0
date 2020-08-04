Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD59B23B34A
	for <lists+linux-next@lfdr.de>; Tue,  4 Aug 2020 05:36:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728622AbgHDDgY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 3 Aug 2020 23:36:24 -0400
Received: from namei.org ([65.99.196.166]:57314 "EHLO namei.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728516AbgHDDgY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 3 Aug 2020 23:36:24 -0400
Received: from localhost (localhost [127.0.0.1])
        by namei.org (8.14.4/8.14.4) with ESMTP id 0743aEdX007291;
        Tue, 4 Aug 2020 03:36:14 GMT
Date:   Tue, 4 Aug 2020 13:36:14 +1000 (AEST)
From:   James Morris <jmorris@namei.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the security tree
In-Reply-To: <20200730125904.4d20b4e6@canb.auug.org.au>
Message-ID: <alpine.LRH.2.21.2008041336090.6615@namei.org>
References: <20200708140034.546298ff@canb.auug.org.au> <20200713120419.33cf7a87@canb.auug.org.au> <20200730093500.334c56cb@canb.auug.org.au> <alpine.LRH.2.21.2007301233210.3625@namei.org> <20200730125904.4d20b4e6@canb.auug.org.au>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 30 Jul 2020, Stephen Rothwell wrote:

> Hi James,
> 
> On Thu, 30 Jul 2020 12:35:03 +1000 (AEST) James Morris <jmorris@namei.org> wrote:
> >
> > On Thu, 30 Jul 2020, Stephen Rothwell wrote:
> > 
> > > > I am still applying the above patch ...  
> > > 
> > > The merge window is coming up fast ... is anything happening about this
> > > failure?  
> > 
> > A new patch is coming, but I'm not sure this code has had enough review 
> > from the core VFS folk.
> > 
> > Please drop secure_uffd_v5.9 for the time being.
> 
> You just need to remove/revert it from your security tree
> (git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/linux-security.git#next-testing).

Done.

-- 
James Morris
<jmorris@namei.org>

