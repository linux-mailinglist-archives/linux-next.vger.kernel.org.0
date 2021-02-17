Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66A4031E33D
	for <lists+linux-next@lfdr.de>; Thu, 18 Feb 2021 00:51:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231335AbhBQXuz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Feb 2021 18:50:55 -0500
Received: from mga02.intel.com ([134.134.136.20]:16547 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230315AbhBQXuz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 17 Feb 2021 18:50:55 -0500
IronPort-SDR: LmO99QqTF0XDZgq0SRZ0PdJUh7nDZV1VIkahR+nF8JWdsSWDwkhZZ+fGvGbTAutWas3FRXqOGV
 Q9S437fDP2zw==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="170485217"
X-IronPort-AV: E=Sophos;i="5.81,185,1610438400"; 
   d="scan'208";a="170485217"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2021 15:50:13 -0800
IronPort-SDR: txrw0JqgsMLb7ClniKQ98rMV8PS1zNGyREsyUup2MbuQyISeRSANcKGlRk4c2B/5nfFpWIR9VK
 Icq34MmEPhtg==
X-IronPort-AV: E=Sophos;i="5.81,185,1610438400"; 
   d="scan'208";a="400197359"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2021 15:50:13 -0800
Date:   Wed, 17 Feb 2021 15:50:13 -0800
From:   Ira Weiny <ira.weiny@intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     David Sterba <dsterba@suse.cz>,
        David Howells <dhowells@redhat.com>,
        David Sterba <dsterba@suse.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the btrfs tree with the fscache tree
Message-ID: <20210217235013.GV3014244@iweiny-DESK2.sc.intel.com>
References: <20210212103810.170b93e8@canb.auug.org.au>
 <20210212010740.GP3014244@iweiny-DESK2.sc.intel.com>
 <20210212140444.5d72dfcd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210212140444.5d72dfcd@canb.auug.org.au>
User-Agent: Mutt/1.11.1 (2018-12-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Feb 12, 2021 at 02:04:44PM +1100, Stephen Rothwell wrote:
> Hi Ira,
> 
> On Thu, 11 Feb 2021 17:07:41 -0800 Ira Weiny <ira.weiny@intel.com> wrote:
> >
> > On Fri, Feb 12, 2021 at 10:38:10AM +1100, Stephen Rothwell wrote:
> > > from the fscache tree and commit:
> > > 
> > >   325a835476e3 ("iov_iter: Remove memzero_page() in favor of zero_user()")  
> > 
> > I don't seem to have that commit after fetching linux-next?  Should I have it?
> 
> It has not been released yet.  Hopefully it will be available in less than 10 hours :-)

Thanks...  looking at the resulting code it looks good to me.  Thanks for
resolving this!

Ira

> 
> -- 
> Cheers,
> Stephen Rothwell


