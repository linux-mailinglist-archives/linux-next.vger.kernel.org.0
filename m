Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0E8CB7D0B
	for <lists+linux-next@lfdr.de>; Thu, 19 Sep 2019 16:39:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732646AbfISOjj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Sep 2019 10:39:39 -0400
Received: from sonic316-33.consmr.mail.gq1.yahoo.com ([98.137.69.57]:45534
        "EHLO sonic316-33.consmr.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732644AbfISOji (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 19 Sep 2019 10:39:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1568903977; bh=qvpy+ovGR6FPZ93+sFuofMU46weY7iNTSQ/65dQcwh8=; h=Date:From:To:Cc:Subject:References:In-Reply-To:From:Subject; b=LvX3/OFcaWf4dhDrxzcfuhMtlF0Qo+blYbSSSVTPlPTy7J3jKHx+k53vQtNS/a/8/6Sd0cff/tLL924P14sKy88NrNdEp44uM8urzvCaDzS0kth+eUMTLslcjUaXRZNAvj8lb0/2H7wGLSV+yreldr9HVq33MDKC0vm+BhbjezZNlp0cH/1UyXGkUANrwUwdpXQ1zV/QuZVm3cb2uQPVwRFZE3HMqReJ4/eBhzCezdr3Kp0NhMBvjGjRuVqfP+gz/SqRrU2ce2z3zYYdfkQFNSok8/i+jbUazzuodo0hJuaZsNc8GJU6qsFyAQ6cGvGPfLPPQChsIgImNob41KZgaA==
X-YMail-OSG: N_6BpMEVRDvd.miR6A7lED5GPdAEx7ojsA--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic316.consmr.mail.gq1.yahoo.com with HTTP; Thu, 19 Sep 2019 14:39:37 +0000
Received: by smtp405.mail.ir2.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID 50f03e35e4d03b35efeb76c0a57e355e;
          Thu, 19 Sep 2019 14:37:35 +0000 (UTC)
Date:   Thu, 19 Sep 2019 22:37:22 +0800
From:   Gao Xiang <hsiangkao@aol.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-erofs@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-next@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Miao Xie <miaoxie@huawei.com>,
        Gao Xiang <gaoxiang25@huawei.com>
Subject: Re: erofs -next tree inclusion request
Message-ID: <20190919143722.GA5363@hsiangkao-HP-ZHAN-66-Pro-G1>
References: <20190919120110.GA48697@architecture4>
 <20190919121739.GG3642@sirena.co.uk>
 <20190919122328.GA82662@architecture4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190919122328.GA82662@architecture4>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailer: WebService/1.1.14303 hermes Apache-HttpAsyncClient/4.1.4 (Java/1.8.0_181)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Mark,

On Thu, Sep 19, 2019 at 08:23:28PM +0800, Gao Xiang wrote:
> Hi Mark,
> 
> On Thu, Sep 19, 2019 at 01:17:39PM +0100, Mark Brown wrote:
> > On Thu, Sep 19, 2019 at 08:01:10PM +0800, Gao Xiang wrote:
> > 
> > > Could you kindly help add the erofs -next tree to linux-next?
> > 
> > > git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev
> > 
> > > This can test all erofs patches with the latest linux-next tree
> > > and make erofs better...
> > 
> > That seems like a good idea however since we're in the merge window and 
> > the only things that should be being added to -next right now are fixes
> > I'll hold off on doing this myself.  Stephen will be back on the 30th
> > (just after merge window closes), I'm sure he'll be happy to add the
> > tree but in case this gets lost in all the mail from the time he's been
> > travelling you might want to remind him after that.
> > 
> > If you have a separate fixes branch I'd be happy to add that right now.
> 
> Thanks for the -fixes information and detailed reminder (I didn't notice
> that, sorry...)
> 
> I will do a -fix only branch later for urgent and trivial fixes.

The fixes only -fixes branch is
git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git fixes

Thanks for taking time on this stuff...

Thanks,
Gao Xiang

> 
> For -next, it's okay to wait for Stephen of course :) ...
> 
> Thanks,
> Gao Xiang
> 
