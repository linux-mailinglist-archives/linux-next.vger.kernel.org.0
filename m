Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFC7BDA343
	for <lists+linux-next@lfdr.de>; Thu, 17 Oct 2019 03:40:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391358AbfJQBkJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Oct 2019 21:40:09 -0400
Received: from mga18.intel.com ([134.134.136.126]:45592 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725818AbfJQBkJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 16 Oct 2019 21:40:09 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Oct 2019 18:40:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,305,1566889200"; 
   d="scan'208";a="397363375"
Received: from yihuaxu1-mobl.ccr.corp.intel.com ([10.249.174.21])
  by fmsmga006.fm.intel.com with ESMTP; 16 Oct 2019 18:40:07 -0700
Message-ID: <17dd6a545ebb23497647a14e8574effe1a0f674b.camel@intel.com>
Subject: Re: Adding thermal group git tree
From:   Zhang Rui <rui.zhang@intel.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        Eduardo Valentin <edubezval@gmail.com>
Date:   Thu, 17 Oct 2019 09:40:06 +0800
In-Reply-To: <53defc08-9f67-ecdd-eb77-c0f34fecf05a@linaro.org>
References: <540b4561-8920-f4fc-1b90-b013f20c8e25@linaro.org>
         <20191015075154.4858a256@canb.auug.org.au>
         <53defc08-9f67-ecdd-eb77-c0f34fecf05a@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 2019-10-16 at 10:48 +0200, Daniel Lezcano wrote:
> Hi Stephen,
> 
> thanks for adding the branch. I'll let Eduardo and Rui tell if they
> want
> to be cc'ed.

Hi, Stephen,

Thanks for adding the branch, and yes, please CC Eduardo and me. Thanks
a lot!

-rui
> 
> 
> On 14/10/2019 22:51, Stephen Rothwell wrote:
> > Hi Daniel,
> > 
> > On Fri, 11 Oct 2019 20:30:33 +0200 Daniel Lezcano <
> > daniel.lezcano@linaro.org> wrote:
> > > 
> > > we decided to consolidate the thermal tree into a group which
> > > becomes
> > > the reference for the thermal subsystem.
> > > 
> > > Patches are reviewed and tested with kernelci in a bleeding edge
> > > branch
> > > and then merged to the linux-next branch.
> > > 
> > > Is it possible to add the thermal/linux-next branch to the linux-
> > > tree?
> > > 
> > > git://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git
> > > thermal/linux-next
> > 
> > OK, I have added this from today.  I renamed the previous thermal
> > tree
> > to be thermal-zhang.  Currently you are the only contact for this
> > new
> > thermal tree, let me know if you want any others added.
> 
> 
> 
> > Thanks for adding your subsystem tree as a participant of linux-
> > next.  As
> > you may know, this is not a judgement of your code.  The purpose of
> > linux-next is for integration testing and to lower the impact of
> > conflicts between subsystems in the next merge window. 
> > 
> > You will need to ensure that the patches/commits in your
> > tree/series have
> > been:
> >      * submitted under GPL v2 (or later) and include the
> > Contributor's
> >         Signed-off-by,
> >      * posted to the relevant mailing list,
> >      * reviewed by you (or another maintainer of your subsystem
> > tree),
> >      * successfully unit tested, and 
> >      * destined for the current or next Linux merge window.
> > 
> > Basically, this should be just what you would send to Linus (or ask
> > him
> > to fetch).  It is allowed to be rebased if you deem it necessary.
> > 
> 
> 

