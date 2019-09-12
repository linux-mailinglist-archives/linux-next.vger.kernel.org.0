Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95557B0997
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2019 09:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbfILHkl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Sep 2019 03:40:41 -0400
Received: from mga05.intel.com ([192.55.52.43]:34025 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725940AbfILHkl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 12 Sep 2019 03:40:41 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Sep 2019 00:40:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,495,1559545200"; 
   d="scan'208";a="200692094"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 12 Sep 2019 00:40:38 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 12 Sep 2019 10:40:38 +0300
Date:   Thu, 12 Sep 2019 10:40:38 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the pm tree
Message-ID: <20190912074038.GA26647@kuha.fi.intel.com>
References: <20190911003306.74ca7251@canb.auug.org.au>
 <20190911072741.GA981@kuha.fi.intel.com>
 <3207595.z7mfiUyZYE@kreacher>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3207595.z7mfiUyZYE@kreacher>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 11, 2019 at 07:17:52PM +0200, Rafael J. Wysocki wrote:
> On Wednesday, September 11, 2019 9:27:41 AM CEST Heikki Krogerus wrote:
> > On Wed, Sep 11, 2019 at 12:33:06AM +1000, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > In commit
> > > 
> > >   fd3f7275826f ("software node: Initialize the return value in software_node_find_by_name()")
> > > 
> > > Fixes tag
> > > 
> > >   Fixes: 1666faedb567 ("software node: Add software_node_get_reference_args()")
> > > 
> > > has these problem(s):
> > > 
> > >   - Subject does not match target commit subject
> > >     Just use
> > > 	git log -1 --format='Fixes: %h ("%s")'
> > > 
> > > Did you mean
> > > 
> > > Fixes: 1666faedb567 ("software node: Add software_node_find_by_name()")
> > > 
> > > or
> > > 
> > > Fixes: b06184acf751 ("software node: Add software_node_get_reference_args()")
> > 
> > Rafael, it seems you have rebased your branch.
> 
> No, I haven't.
> 
> Actually, the commit ID is correct, but the name isn't.
> 
> You'd have been unlikely to get a valid commit ID matching anything with
> "software node" in the subject had it been rebased. :-)

Ah. I've added the tag line manually (for some reason). I'm sorry
about that. I usually use this:

        % git show -s --abbrev-commit --abbrev=12 --pretty=format:"%h (\"%s\")%n"

> > Do you want me to resend those fixes, or can you fix the tags in them
> > yourself?
> 
> I fixed that tag up.

Thanks Rafael!

-- 
heikki
