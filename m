Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 199911005D0
	for <lists+linux-next@lfdr.de>; Mon, 18 Nov 2019 13:45:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbfKRMpb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Nov 2019 07:45:31 -0500
Received: from mga18.intel.com ([134.134.136.126]:20616 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726506AbfKRMpb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 Nov 2019 07:45:31 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Nov 2019 04:45:30 -0800
X-IronPort-AV: E=Sophos;i="5.68,320,1569308400"; 
   d="scan'208";a="196116167"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Nov 2019 04:45:28 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 4127C20731; Mon, 18 Nov 2019 14:45:26 +0200 (EET)
Date:   Mon, 18 Nov 2019 14:45:26 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Petr Mladek <pmladek@suse.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Subject: Re: linux-next: manual merge of the pm tree with the printk tree
Message-ID: <20191118124526.GD5391@paasikivi.fi.intel.com>
References: <20191115110500.2bad45b2@canb.auug.org.au>
 <2126744.rv85diC2z5@kreacher>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2126744.rv85diC2z5@kreacher>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Nov 15, 2019 at 11:46:53AM +0100, Rafael J. Wysocki wrote:
> On Friday, November 15, 2019 1:05:00 AM CET Stephen Rothwell wrote:
> > 
> > --Sig_/8dHD0qGh0F9UnYxbYqUlngQ
> > Content-Type: text/plain; charset=US-ASCII
> > Content-Transfer-Encoding: quoted-printable
> > 
> > Hi all,
> > 
> > Today's linux-next merge of the pm tree got a conflict in:
> > 
> >   scripts/checkpatch.pl
> > 
> > between commit:
> > 
> >   1d28122131b2 ("checkpatch: don't warn about new vsprintf pointer extensio=
> > n '%pe'")
> > 
> > from the printk tree and commit:
> > 
> >   3bd32d6a2ee6 ("lib/vsprintf: Add %pfw conversion specifier for printing f=
> > wnode names")
> > 
> > from the pm tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary.
> 
> Thanks, and it looks good to me.

The change seems fine to me as well.

Thanks.

-- 
Sakari Ailus
