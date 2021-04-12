Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4725D35C673
	for <lists+linux-next@lfdr.de>; Mon, 12 Apr 2021 14:41:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240984AbhDLMlZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Apr 2021 08:41:25 -0400
Received: from mga02.intel.com ([134.134.136.20]:61701 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238587AbhDLMlZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Apr 2021 08:41:25 -0400
IronPort-SDR: 6UzKYUIJhXWLzmLWeE1H5LrEnou4hYfQu+LM/HJYrJpy1zIuRRMhDXNhyHQ16BTPf12ThDVTGj
 M8OcOR1wPmRA==
X-IronPort-AV: E=McAfee;i="6000,8403,9952"; a="181304130"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="181304130"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 05:41:06 -0700
IronPort-SDR: KUdyBN42O6vDNYNhS4kpcrulY+1eKnyCgPkZ5ZI/O/50WIA6gWvlX2dd2wd4rIIQp6/8gQ+QJT
 Fel5FIyGPkCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="521168519"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 12 Apr 2021 05:41:04 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 12 Apr 2021 15:41:03 +0300
Date:   Mon, 12 Apr 2021 15:41:03 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg KH <greg@kroah.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the usb tree
Message-ID: <YHQ/37TDNUy5JfV4@kuha.fi.intel.com>
References: <20210412213655.3776e15e@canb.auug.org.au>
 <YHQ+oMm7sKKQuWGJ@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHQ+oMm7sKKQuWGJ@kroah.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Apr 12, 2021 at 02:35:44PM +0200, Greg KH wrote:
> On Mon, Apr 12, 2021 at 09:36:55PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the usb tree, today's linux-next build (x86_64 almodconfig
> > modules_install) failed like this:
> > 
> > depmod: ERROR: Cycle detected: usbcore -> typec -> usbcore
> > depmod: ERROR: Found 2 modules in dependency cycles!
> > 
> > Caused by commit
> > 
> >   63cd78617350 ("usb: Link the ports to the connectors they are attached to")
> > 
> > I have reverted that commit for today.
> 
> Ugh, good catch, odd that 0-day didn't catch that :(
> 
> I'll go revert it in my tree as well.  Heikki, can you send a fixed up
> version when you get a chance?

Sure thing.

thanks,

-- 
heikki
