Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE8ED11DBB4
	for <lists+linux-next@lfdr.de>; Fri, 13 Dec 2019 02:31:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731481AbfLMBbz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Dec 2019 20:31:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:44872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727070AbfLMBby (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 12 Dec 2019 20:31:54 -0500
Received: from paulmck-ThinkPad-P72.home (unknown [199.201.64.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4EF69206B7;
        Fri, 13 Dec 2019 01:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576200714;
        bh=34CASTniCaPDj4mjipOQZOhdbDU3h+A6sqXdrXBKDI4=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=PF1MW1H5Me7IakC/MvwcYTzIHaT57QDN4NhNImZAYC9nKSrLZ12Li+wd01ka66pmV
         7TvCT8L4DIXxkfApdfxFETMp+ms3vEBWHJn4lcC/ypScxGtC07WTdOfu5Pmk9Yo8d7
         stBuP2wUxEq3DaFompzeH887tu8CWQIwnCL7rdRQ=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id E82AD35227E8; Thu, 12 Dec 2019 17:31:53 -0800 (PST)
Date:   Thu, 12 Dec 2019 17:31:53 -0800
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Eric Dumazet <edumazet@google.com>
Subject: Re: linux-next: build warning after merge of the rcu tree
Message-ID: <20191213013153.GF2889@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20191212160622.021517d3@canb.auug.org.au>
 <20191212060200.GW2889@paulmck-ThinkPad-P72>
 <20191212224050.3ef73e82@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191212224050.3ef73e82@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Dec 12, 2019 at 10:40:50PM +1100, Stephen Rothwell wrote:
> Hi Paul,
> 
> On Wed, 11 Dec 2019 22:02:00 -0800 "Paul E. McKenney" <paulmck@kernel.org> wrote:
> >
> > On Thu, Dec 12, 2019 at 04:06:22PM +1100, Stephen Rothwell wrote:
> > > 
> > > x86_64-linux-gnu-gcc (Debian 9.2.1-21) 9.2.1 20191130  
> > 
> > I don't see this warning with gcc version 7.4.0.  Just out of curiosity,
> > what are you running, Stephen?
> 
> See above (9.2.1). ;-)

Color me blind.  :-/

							Thanx, Paul
