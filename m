Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BA50BB55F
	for <lists+linux-next@lfdr.de>; Mon, 23 Sep 2019 15:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437114AbfIWNd4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Sep 2019 09:33:56 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:50220 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437100AbfIWNd4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 23 Sep 2019 09:33:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=4oYYvhMZLswDD/qjuPlU5roe59xl0+W+kHzpJNuHTkk=; b=iXobH4vLyUWuAatRn/YNyFm19
        67BChJmm/usupfpf5trKfdtTguX18shVRtaIa+IWb8JHFn8kYVpArMI9JI2gsBLooElnoYb8QsjDv
        /SOLDcq/e1CR2vJoDEiyOkAfmRULtqvsRN8nq1fHSDNkMvoowJpVt4rwMIgmAc9q9SQqAP/IWRaFd
        glori5/UnJ96kIUmcf943s1uwe+F8pO4OWZ1ip4FoOA0Hpnkl7H0jxI+vZrmZrSGsjuVCc6jPcvZH
        ydG/ABzBv6/ax5R3ZrJ46l5lMBiojuJ7bOJp7HKyWS3bLljJpydZY9f9F0dRZxOfPTMFRW98NyIqe
        KWihAqQ3w==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iCOTS-0005b5-Iy; Mon, 23 Sep 2019 13:33:54 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E33F3303DFD;
        Mon, 23 Sep 2019 15:33:06 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 1843020D80D42; Mon, 23 Sep 2019 15:33:52 +0200 (CEST)
Date:   Mon, 23 Sep 2019 15:33:52 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Mark Brown <broonie@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Sep 18 (objtool)
Message-ID: <20190923133352.GI2332@hirez.programming.kicks-ass.net>
References: <20190918221053.GV2596@sirena.co.uk>
 <be0fb087-5fb4-a790-90dd-cc2af62419e7@infradead.org>
 <20190923092024.GI2349@hirez.programming.kicks-ass.net>
 <20190923124901.3ayejcis5ijrsvbx@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190923124901.3ayejcis5ijrsvbx@treble>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 23, 2019 at 07:49:01AM -0500, Josh Poimboeuf wrote:
> On Mon, Sep 23, 2019 at 11:20:24AM +0200, Peter Zijlstra wrote:
> > On Wed, Sep 18, 2019 at 09:04:21PM -0700, Randy Dunlap wrote:
> > > On 9/18/19 3:10 PM, Mark Brown wrote:
> > > > Hi all,
> > > > 
> > > > Changes since 20190917:
> > > > 
> > > 
> > > on x86_64:
> > > 
> > > drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: i915_gem_execbuffer2_ioctl()+0x2fb: call to gen8_canonical_addr() with UACCESS enabled
> > 
> > I'm thinking that comes from:
> > 
> > 				offset = gen8_canonical_addr(offset & ~UPDATE);
> > 				if (unlikely(__put_user(offset, &urelocs[r-stack].presumed_offset))) {
> > 
> > however, per commit 6ae865615fc4 (and 2a418cf3f5f1) the compiler really
> > should not be sticking gen8_canonical_addr() after __uaccess_begin().
> > 
> > /me puzzled...
> 
> I think you're looking at the wrong code.  It has user_access_begin/end
> around it:
> 
> 		if (!user_access_begin(user_exec_list, count * sizeof(*user_exec_list)))
> 			goto end;
> 
> 		for (i = 0; i < args->buffer_count; i++) {
> 			if (!(exec2_list[i].offset & UPDATE))
> 				continue;
> 
> 			exec2_list[i].offset =
> 				gen8_canonical_addr(exec2_list[i].offset & PIN_OFFSET_MASK);
> 			unsafe_put_user(exec2_list[i].offset,
> 					&user_exec_list[i].offset,
> 					end_user);
> 		}
> end_user:
> 		user_access_end();
> 

Oh, Duh... Yeah, so the alternative to your solution is to do 2 loops.
Not sure which would be better.
