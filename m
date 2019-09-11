Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F8B7B0277
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2019 19:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729314AbfIKRR4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Sep 2019 13:17:56 -0400
Received: from cloudserver094114.home.pl ([79.96.170.134]:62683 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728937AbfIKRR4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 11 Sep 2019 13:17:56 -0400
Received: from 38.85.69.148.rev.vodafone.pt (148.69.85.38) (HELO kreacher.localnet)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.292)
 id 8c4416ec4a1609a8; Wed, 11 Sep 2019 19:17:54 +0200
From:   "Rafael J. Wysocki" <rjw@rjwysocki.net>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the pm tree
Date:   Wed, 11 Sep 2019 19:17:52 +0200
Message-ID: <3207595.z7mfiUyZYE@kreacher>
In-Reply-To: <20190911072741.GA981@kuha.fi.intel.com>
References: <20190911003306.74ca7251@canb.auug.org.au> <20190911072741.GA981@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wednesday, September 11, 2019 9:27:41 AM CEST Heikki Krogerus wrote:
> On Wed, Sep 11, 2019 at 12:33:06AM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > In commit
> > 
> >   fd3f7275826f ("software node: Initialize the return value in software_node_find_by_name()")
> > 
> > Fixes tag
> > 
> >   Fixes: 1666faedb567 ("software node: Add software_node_get_reference_args()")
> > 
> > has these problem(s):
> > 
> >   - Subject does not match target commit subject
> >     Just use
> > 	git log -1 --format='Fixes: %h ("%s")'
> > 
> > Did you mean
> > 
> > Fixes: 1666faedb567 ("software node: Add software_node_find_by_name()")
> > 
> > or
> > 
> > Fixes: b06184acf751 ("software node: Add software_node_get_reference_args()")
> 
> Rafael, it seems you have rebased your branch.

No, I haven't.

Actually, the commit ID is correct, but the name isn't.

You'd have been unlikely to get a valid commit ID matching anything with
"software node" in the subject had it been rebased. :-)

> Do you want me to resend those fixes, or can you fix the tags in them
> yourself?

I fixed that tag up.

Thanks,
Rafael



